
ALTER TABLE epidb_results_intake DROP COLUMN "Q4d";

ALTER TABLE epidb_results_weekly 
	DROP COLUMN "Q8b_multi_row5_col1",
	DROP COLUMN "Q12_multi_row1_col1",
	DROP COLUMN "Q13_multi_row1_col1";
