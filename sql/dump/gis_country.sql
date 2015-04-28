
SET search_path = {{schema}}, pg_catalog;
-- Template to select country 
DELETE FROM pop_nuts2 WHERE country != '{{country}}';
DELETE FROM pop_nuts1 WHERE country != '{{country}}';
DELETE FROM pop_country WHERE country != '{{country}}';

DELETE FROM pop_age5_nuts2 WHERE country != '{{country}}';
DELETE FROM pop_age5_nuts1 WHERE country != '{{country}}';
DELETE FROM pop_age5_country WHERE country != '{{country}}';

DELETE FROM geo_country WHERE country != '{{country}}';
DELETE FROM geo_nuts1 WHERE country != '{{country}}';
DELETE FROM geo_nuts2 WHERE country != '{{country}}';
DELETE FROM geo_nuts3 WHERE country != '{{country}}';
DELETE FROM geo_zip WHERE country != '{{country}}';
DELETE FROM geo_levels WHERE country != '{{country}}';

