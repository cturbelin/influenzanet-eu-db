######
# Generate geographic levels and population data files from EuroStat export
# See doc/eurostat.md
#####

# Only keep countries
library(reshape2)
library(plyr)

output.years = c(2011, 2012, 2013)

countries = c("BE", "DK",  "ES", "FR", "IE", "IT", "NL", "PT", "SE", "UK")

exclude.levels = c("Z+$","^FR9")

# Load nuts levels
nuts = read.csv2('data/eurostat/eurostat_nuts2_2010.csv')
names(nuts) <- tolower(names(nuts))

# Keep only levels in expected countries
nuts = nuts[ nuts$country.code %in% countries, ]

cat("Excluding zones\n")
for(p in exclude.levels) {
	i = grepl(p, nuts$nuts.code)
	print(nuts[i,])
	nuts = nuts[!i, ]
}

# Keep level 3 data
nuts2 = nuts[ nuts$nuts.level == 2, c('nuts.code','country.code')]

# Geo levels nuts 3
geo.levels = nuts[ nuts$nuts.level == 3, c('nuts.code','country.code')]
geo.levels = rename(geo.levels, list("nuts.code"="code_nuts3", "country.code"="country"))
geo.levels$code_nuts3 = as.character(geo.levels$code_nuts3)
geo.levels$code_nuts2 = substr(geo.levels$code_nuts3, 1, 4)
geo.levels$code_nuts1 = substr(geo.levels$code_nuts3, 1, 3)

write.csv(geo.levels, file="data/nuts/geo_levels.csv", row.names=F)

for(i in 1:3) {
  g = nuts[ nuts$nuts.level == i, c('nuts.code','country.code', 'nuts.label')]
  g$nuts.code = as.character(g$nuts.code)
  if(i > 1) {
    j = i - 1
	while(j > 0) {
		v = paste("code_nuts", j, sep='')
		g[,v] = substr(g$nuts.code, 1, j + 2)
		j = j - 1
	}
  }
  g = rename(g, list("nuts.code"=paste("code_nuts",i, sep=''), 'country.code'="country", 'nuts.label'="title"))
  write.csv(g, file=paste("data/nuts/geo_nuts",i,".csv",sep=''),  row.names=F)
}
  
  # Load demographic data 
for(year in output.years) {  
  
  cat("Computing ", year,"\n")
  d = read.csv("data/eurostat/eurostat_population_nuts2.csv")
  names(d) <- tolower(names(d))
  
  d = d[ d$time <= year, ] # Remove future years
  
  # excluding znes
  for(p in exclude.levels) {
	i = grepl(p, d$geo)
	print(d[i,])
	d = d[!i, ]
  }
  
  d$country = gsub("^([A-Z]{2}).*","\\1", d$geo)
  
  d = d[ d$country %in% countries, ]
  
  d$value = as.numeric(as.character(gsub(",","", d$value, fixed=T)))
  
  d$flag.and.footnotes = as.character(d$flag.and.footnotes)
  
  d$flag.and.footnotes = ifelse(d$flag.and.footnotes == "", NA, d$flag.and.footnotes)
  
  r = melt(d, id=c('time','geo','sex', 'age'), measure.vars=c('value'))
  x1 = dcast(r, time + geo + age ~ sex, fun.aggregate=sum)
  
  # Get flags
  r = melt(d, id=c('time','geo','sex', 'age'), measure.vars=c('flag.and.footnotes'))
  x2 = dcast(r, time + geo + age ~ sex, fun.aggregate=function(x){x[1]})
  # Assume that overall category flag (for sex) is the same as Female and Male ones
  x2 = subset(x2, select=-c(F,M))
  x2 = rename(x2, list("T"="flags"))
  
  x1 = merge(x1, x2, all.x=T)
  x1 = rename(x1, list("F"="female","M"="male","T"="all"))
  
  x1 = merge(x1, nuts[, c('nuts.code', 'nuts.level', 'country.code')], by.x='geo', by.y='nuts.code', all.x=T)
  
  stopifnot( all(!is.na(x1$country.code)))
  
  x1.alllevels = x1
  
  # Keep only nuts2 level
  x1 = x1[ x1$nuts.level == 2, ]
  x1$geo = factor(x1$geo)
  x1$country.code = factor(x1$country.code)
  
  # Get last available year for each country
  y = as.list(by(x1, x1$geo, function(x) {
        max(x$time[!is.na(x$all)], na.rm=T)
      }))
  y = data.frame(time=unlist(y), geo=names(y))
  
  if( !all(is.finite(y$time)) ) {
      print( y[ !is.finite(y$time), ] )
      cat("No data for this year in some area. Population cannot be computed\n")
      next()
  }
  
  y = merge(y, nuts[ nuts$nuts.level == 2, c('nuts.code','country.code')], by.x='geo', by.y='nuts.code', all.x=T)
  y$country.code = factor(y$country.code)
  y$geo = factor(y$geo)
  
  available.years = tapply(y$time, y$country.code, function(x) length(unique(x)))
  if(! all(available.years == 1)) {
    stop("Some country has different year available for different levels")
  }
  
  country.year = aggregate(time ~ country.code, data=y, min)
  country.year = rename(country.year, list("time"="year.ref"))
  
  x1 = merge(x1, country.year, by='country.code', all.x=T)
  
  pop = x1[ x1$time == x1$year.ref, ]
  
  # Check that's ok
  table(pop$country.code, pop$year.ref)
  
  pop$i = 1
  check = aggregate(i ~ geo + age, data=pop, sum)
  stopifnot(  all(check$i == 1) )
  
  max.age = 200
  
  pop$age.min = NA
  pop$age.max = NA
  
  pop.allages = pop[ pop$age == "TOTAL", ]
  
  pop = pop[ !pop$age == "TOTAL", ]
  pop$age = factor(pop$age)
  
  # Recode age group label to age.min and age.max columns
  i = grepl("^Y([0-9]+)\\-([0-9]+)", pop$age)
  group = strsplit(gsub("^Y([0-9]+)\\-([0-9]+)","\\1;\\2", pop$age[i]), split=";",fixed=T)
  group = do.call(rbind, lapply(group, function(x) { x = as.numeric(x); data.frame(min=x[1], max=x[2]) }))
  
  pop$age.min[i] = group$min
  pop$age.max[i] = group$max
  
  i = pop$age == "Y_LT5"
  pop$age.min[i] = 0
  pop$age.max[i] = 4
  
  i = grepl("^Y_GE([0-9]+)", pop$age)
  group = as.numeric(gsub("^Y_GE([0-9]+)","\\1", pop$age[i]))
  pop$age.min[i] = group
  pop$age.max[i] = NA
  
  # Select optimal bound (greatest age with all countries)
  pop$bound = is.na(pop$age.max) & !is.na(pop$age.min)
  
  bounds = table(pop$country.code[pop$bound], pop$age.min[pop$bound])
  bounds = bounds > 0
  
  # Which bound is available for all countries
  bounds.all = apply(bounds, 2, all)
  bounds.all = max(as.numeric(names(bounds.all)[which(bounds.all)]))
  
  cat("Selected bounds = ", bounds.all,"\n")
  
  # Remove other kind of bounds
  pop$bounds.ok = pop$bound & pop$age.min == bounds.all
  pop = pop[ !(pop$bound & !pop$bounds.ok), ]
  
  pop$age = factor(pop$age)
  
  age.groups = unique(pop[, c('age','age.min', 'age.max')])
  age.groups = age.groups[ order(age.groups$age.min), ]
  
  i = age.groups$age != "UNK"
  age.groups$min.expected[i] = seq(0, bounds.all, by=5)
  age.groups$max.expected[i] = age.groups$min.expected[i] + 5
  age.groups$max.expected[ age.groups$min.expected == bounds.all] = NA
  
  # Check all expected groups are ok
  stopifnot(all(age.groups$min[i] == age.groups$min.expected[i]))
  
  pop.frame = merge(data.frame(geo=nuts2$nuts.code), data.frame(age=age.groups$age))
  
  pop = merge(pop, pop.frame, by=c('geo','age'), all=T)
  
  if( any(is.na(pop$all)) ) {
    print( pop[ is.na(pop$all)])
    stop("Some population are unknown in expected geo levels or age groups")
  }
  
  # Now that's ok
  
  pop = pop[ pop$age != "UNK", ] # Remove unknown age-group category (actually always 0)
  
  #pop = pop[, c('age','geo','country.code','all','male','female','flags','year.ref', 'age.min','age.max')]
  pop = rename(pop, list("geo"="code_nuts2","country.code"="country"))
  
  cat("Reference year for this year")
  print(table(pop$country, pop$year.ref))
  
  cols.age = c('age.min','age.max','all','male','female','flags','year.ref','country')
  
  write.csv(pop[, c(cols.age, 'code_nuts2')], file=paste("data/population/",year,"_pop_nuts2_age5.csv",sep=''), row.names=F)
  
  pop = merge(pop, geo.levels[, c("code_nuts2","code_nuts1")], by="code_nuts2", all.x=T)
  
  pop.nuts2 = pop
  
  p = aggregate(cbind(all, male, female) ~ code_nuts2, data=pop.nuts2, sum)
  m = aggregate(cbind(year.ref) ~ code_nuts2, data=pop.nuts2 , min)
  p = merge(p, m, by='code_nuts2', all.x=T)
  p$country = substr(p$code_nuts2, 1, 2)
  write.csv(p, file=paste("data/population/",year,"_pop_nuts2.csv",sep=''), row.names=F)
  
  p = aggregate(cbind(all, male, female) ~ code_nuts1 + age, data=pop, sum)
  p = merge(p, age.groups[,c('age','age.min','age.max')], by='age', all.x=T)
  m = aggregate(cbind(year.ref) ~ code_nuts1, data=pop, min)
  p = merge(p, m, by='code_nuts1', all.x=T)
  if( any(!is.na(pop$flags)) ) {
    m = aggregate(flags ~ code_nuts1, data=pop, function(x) { x = x[!is.na(x)]; ifelse(length(x)>0, x[1], "")})
    p = merge(p, m, by='code_nuts1', all.x=T)
  } else {
    p$flags = NA
  }
  p$country = substr(p$code_nuts1, 1, 2)
  
  pop.nuts1 = p
  p = subset(p, select=-age)
  write.csv(p, file=paste("data/population/",year,"_pop_nuts1_age5.csv",sep=''), row.names=F)
  
  p = aggregate(cbind(all, male, female) ~ code_nuts1, data=pop.nuts1, sum)
  m = aggregate(cbind(year.ref) ~ code_nuts1, data=pop.nuts1, min)
  p = merge(p, m, by='code_nuts1', all.x=T)
  p$country = substr(p$code_nuts1, 1, 2)
  write.csv(p, file=paste("data/population/",year,"_pop_nuts1.csv",sep=''), row.names=F)
  
  p = aggregate(cbind(all, male, female) ~ country + age, data=pop.nuts1, sum)
  p = merge(p, age.groups[,c('age','age.min','age.max')], by='age', all.x=T)
  m = aggregate(cbind(year.ref) ~ country, data=pop.nuts1, min)
  p = merge(p, m, by='country', all.x=T)
  p = subset(p, select=-age)
  write.csv(p, file=paste("data/population/",year,"_pop_country_age5.csv",sep=''), row.names=F)

  p = aggregate(cbind(all, male, female) ~ country, data=pop.nuts1, sum)
  m = aggregate(cbind(year.ref) ~ country, data=pop.nuts1, min)
  p = merge(p, m, by='country', all.x=T)
  write.csv(p, file=paste("data/population/",year,"_pop_country.csv",sep=''), row.names=F)
  
}
