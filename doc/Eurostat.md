Import Geographic levels & Population data from EuroStat
=========================================================

* Extract NUTS 2 levels & save it as CSV files using ";" separator

Expected columns are

 NUTS CODE;NUTS LABEL;NUTS LEVEL;COUNTRY CODE;COUNTRIES SORTING ORDER;ORDER

* Extract population data with 5-year-age group and sex at NUTS 2 level, 
	* All years from 2009 
	* use "With code" option (avoid "label"), with Total
	* Include all age groups (including total, unknown and sometimes several upper bounds)
    * Include "Flag and Footnotes"
	
Expected columns are :
 * "TIME" : Year of population
 * "GEO" : NUTS 2 code
 * "SEX" : "T","F","M" 
 * "AGE" : Age group code for ex. "Y45-49", "TOTAL", "UNK" (for unknown), Y_GE80 (for upper bounds)
 * "Value" : Population for the strata (English notation, "," as thousands separator)
 * "Flag and Footnotes"
 
Save it as CSV (";" sep) into data/eurostat/eurostat_population_nuts2.csv

Run eurostat.r (in root dir)
 * Will generate all files in data/nuts
 * Will generate all population files
	* total by for each geo levels
	* age_group for each geo levels (country, nuts1, nuts2)
	
For each year from 2011-2013, pick the last available census available in each country (sometimes the last census could not be available for the current year).
The year of the used census for each country will be registred in the "year_ref" column

Some geo levels can be excluded (like overseas regions in France, counted in global population), since those population are not included in InfluenzaNet project yet.