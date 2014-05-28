ALTER TABLE epidb_results_intake ADD COLUMN "Q4d" integer;
ALTER TABLE epidb_results_intake 
	ADD COLUMN "Q18_0" boolean,
	ADD COLUMN "Q18_1" boolean,
	ADD COLUMN "Q18_2" boolean,
	ADD COLUMN "Q18_3" boolean,
	ADD COLUMN "Q18_4" boolean,
	ADD COLUMN "Q18_5" boolean,
	ADD COLUMN "Q18_6" boolean,
	ADD COLUMN "Q18" text;


