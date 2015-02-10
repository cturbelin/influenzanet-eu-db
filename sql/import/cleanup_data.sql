UPDATE epidb_results_intake set "country"=upper("country");
UPDATE epidb_results_intake set "Q3"=upper("Q3");

UPDATE epidb_results_intake set "country"='BE' where "country"='BN';
UPDATE epidb_results_weekly set "country"='BE' where "country"='BN';

CREATE INDEX idx_intake_q3_country ON epidb_results_intake USING btree (country, "Q3");
