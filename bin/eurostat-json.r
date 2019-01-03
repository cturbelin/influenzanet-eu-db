library(rjstat)

url ="http://ec.europa.eu/eurostat/wdds/rest/data/v2.1/json/en/demo_r_pjangroup?sex=F&sex=M&precision=1&sinceTimePeriod=2009&age=TOTAL&age=UNK&age=Y10-14&age=Y15-19&age=Y20-24&age=Y25-29&age=Y30-34&age=Y35-39&age=Y40-44&age=Y45-49&age=Y5-9&age=Y50-54&age=Y55-59&age=Y60-64&age=Y65-69&age=Y70-74&age=Y75-79&age=Y80-84&age=Y_GE75&age=Y_GE80&age=Y_GE85&age=Y_LT5"


r = fromJSONstat('data/eurostat/demo_r_pjangroup.json', naming = "id")
