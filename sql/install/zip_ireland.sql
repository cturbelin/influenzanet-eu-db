insert into geo_zip (code_zip, country, code_nuts1, code_nuts2, code_nuts3) 
select code_nuts3 as code_zip, country, code_nuts1, code_nuts2, code_nuts3 from geo_nuts3 where country='IE'