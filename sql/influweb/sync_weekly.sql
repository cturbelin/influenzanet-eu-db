DROP TABLE IF EXISTS public.epidb_results_weekly;

CREATE TABLE public.epidb_results_weekly AS
SELECT country,
       global_id,
       TIMESTAMP,
       "Q1_0",
       "Q1_1",
       "Q1_2",
       "Q1_3",
       "Q1_4",
       "Q1_5",
       "Q1_6",
       "Q1_7",
       "Q1_8",
       "Q1_9",
       "Q1_10",
       "Q1_11",
       "Q1_12",
       "Q1_13",
       "Q1_14",
       "Q1_15",
       "Q1_16",
       "Q1_17",
       "Q1_18",
       "Q1_19",
       "Q2",
       "N1",
       "Q3",
       "Q3_0_open",
       "Q4",
       "Q4_0_open",
       "Q5",
       "Q6",
       "Q6_1_open",
       "Q6b",
       "Q6c",
       "Q6d",
       "Q7_0",
       "Q7_1",
       "Q7_3",
       "Q7_2",
       "Q7_4",
       "Q7_5",
       "Q7b_multi_row1_col1",
       "Q7b_multi_row2_col1",
       "Q7b_multi_row3_col1",
       "Q7b_multi_row4_col1",
       "Q8_0",
       "Q8_1",
       "Q8_2",
       "Q8_3",
       "Q8_4",
       "Q8_5",
       "Q8b_multi_row1_col1",
       "Q8b_multi_row2_col1",
       "Q8b_multi_row3_col1",
       "Q8b_multi_row4_col1",
       "Q9_0",
       "Q9_1",
       "Q9_2",
       "Q9_3",
       "Q9_4",
       "Q9_5",
       "Q9_6",
       "Q9b",
       "Q10",
       "Q10b",
       "Q10c",
       "Q11"
FROM epidb_it.epidb_results_weekly;

INSERT INTO public.epidb_results_weekly
SELECT country,
       global_id,
       TIMESTAMP,
       "Q1_0",
       "Q1_1",
       "Q1_2",
       "Q1_3",
       "Q1_4",
       "Q1_5",
       "Q1_6",
       "Q1_7",
       "Q1_8",
       "Q1_9",
       "Q1_10",
       "Q1_11",
       "Q1_12",
       "Q1_13",
       "Q1_14",
       "Q1_15",
       "Q1_16",
       "Q1_17",
       "Q1_18",
       "Q1_19",
       "Q2",
       "N1",
       "Q3",
       "Q3_0_open",
       "Q4",
       "Q4_0_open",
       "Q5",
       "Q6",
       "Q6_1_open",
       "Q6b",
       "Q6c",
       "Q6d",
       "Q7_0",
       "Q7_1",
       "Q7_3",
       "Q7_2",
       "Q7_4",
       "Q7_5",
       NULL AS "Q7b_multi_row1_col1",
       NULL AS "Q7b_multi_row2_col1",
       NULL AS "Q7b_multi_row3_col1",
       NULL AS "Q7b_multi_row4_col1",
       "Q8_0",
       "Q8_1",
       "Q8_2",
       "Q8_3",
       "Q8_4",
       "Q8_5",
       NULL AS "Q8b_multi_row1_col1",
       NULL AS "Q8b_multi_row2_col1",
       NULL AS "Q8b_multi_row3_col1",
       NULL AS "Q8b_multi_row4_col1",
       "Q9_0",
       "Q9_1",
       "Q9_2",
       "Q9_3",
       "Q9_4",
       "Q9_5",
       "Q9_6",
       "Q9b",
       "Q10",
       "Q10b",
       "Q10c",
       "Q11"
FROM epidb_es.epidb_results_weekly;

INSERT INTO public.epidb_results_weekly
SELECT country,
       global_id,
       TIMESTAMP,
       "Q1_0",
       "Q1_1",
       "Q1_2",
       "Q1_3",
       "Q1_4",
       "Q1_5",
       "Q1_6",
       "Q1_7",
       "Q1_8",
       "Q1_9",
       "Q1_10",
       "Q1_11",
       "Q1_12",
       "Q1_13",
       "Q1_14",
       "Q1_15",
       "Q1_16",
       "Q1_17",
       "Q1_18",
       "Q1_19",
       "Q2",
       "N1",
       "Q3",
       "Q3_0_open",
       "Q4",
       "Q4_0_open",
       "Q5",
       "Q6",
       "Q6_1_open",
       "Q6b",
       "Q6c",
       "Q6d",
       "Q7_0",
       "Q7_1",
       "Q7_3",
       "Q7_2",
       "Q7_4",
       "Q7_5",
       "Q7b_multi_row1_col1",
       "Q7b_multi_row2_col1",
       "Q7b_multi_row3_col1",
       "Q7b_multi_row4_col1",
       "Q8_0",
       "Q8_1",
       "Q8_2",
       "Q8_3",
       "Q8_4",
       "Q8_5",
       "Q8b_multi_row1_col1",
       "Q8b_multi_row2_col1",
       "Q8b_multi_row3_col1",
       "Q8b_multi_row4_col1",
       "Q9_0",
       "Q9_1",
       "Q9_2",
       "Q9_3",
       "Q9_4",
       "Q9_5",
       "Q9_6",
       "Q9b",
       "Q10",
       "Q10b",
       "Q10c",
       "Q11"
FROM epidb_ggm.epidb_results_weekly;

INSERT INTO public.epidb_results_weekly
SELECT country,
       global_id,
       TIMESTAMP,
       "Q1_0",
       "Q1_1",
       "Q1_2",
       "Q1_3",
       "Q1_4",
       "Q1_5",
       "Q1_6",
       "Q1_7",
       "Q1_8",
       "Q1_9",
       "Q1_10",
       "Q1_11",
       "Q1_12",
       "Q1_13",
       "Q1_14",
       "Q1_15",
       "Q1_16",
       "Q1_17",
       "Q1_18",
       "Q1_19",
       "Q2",
       "N1",
       "Q3",
       "Q3_0_open",
       "Q4",
       "Q4_0_open",
       "Q5",
       "Q6",
       "Q6_1_open",
       "Q6b",
       "Q6c",
       "Q6d",
       "Q7_0",
       "Q7_1",
       "Q7_3",
       "Q7_2",
       "Q7_4",
       "Q7_5",
       "Q7b_multi_row1_col1",
       "Q7b_multi_row2_col1",
       "Q7b_multi_row3_col1",
       "Q7b_multi_row4_col1",
       "Q8_0",
       "Q8_1",
       "Q8_2",
       "Q8_3",
       "Q8_4",
       "Q8_5",
       "Q8b_multi_row1_col1",
       "Q8b_multi_row2_col1",
       "Q8b_multi_row3_col1",
       "Q8b_multi_row4_col1",
       "Q9_0",
       "Q9_1",
       "Q9_2",
       "Q9_3",
       "Q9_4",
       "Q9_5",
       "Q9_6",
       "Q9b",
       "Q10",
       "Q10b",
       "Q10c",
       "Q11"
FROM epidb_uk.epidb_results_weekly;

INSERT INTO public.epidb_results_weekly
SELECT country,
       global_id,
       TIMESTAMP,
       "Q1_0",
       "Q1_1",
       "Q1_2",
       "Q1_3",
       "Q1_4",
       "Q1_5",
       "Q1_6",
       "Q1_7",
       "Q1_8",
       "Q1_9",
       "Q1_10",
       "Q1_11",
       "Q1_12",
       "Q1_13",
       "Q1_14",
       "Q1_15",
       "Q1_16",
       "Q1_17",
       "Q1_18",
       "Q1_19",
       "Q2",
       "N1",
       "Q3",
       "Q3_0_open",
       "Q4",
       "Q4_0_open",
       "Q5",
       "Q6",
       "Q6_1_open",
       "Q6b",
       "Q6c",
       "Q6d",
       "Q7_0",
       "Q7_1",
       "Q7_3",
       "Q7_2",
       "Q7_4",
       "Q7_5",
       "Q7b_multi_row1_col1",
       "Q7b_multi_row2_col1",
       "Q7b_multi_row3_col1",
       "Q7b_multi_row4_col1",
       "Q8_0",
       "Q8_1",
       "Q8_2",
       "Q8_3",
       "Q8_4",
       "Q8_5",
       "Q8b_multi_row1_col1",
       "Q8b_multi_row2_col1",
       "Q8b_multi_row3_col1",
       "Q8b_multi_row4_col1",
       "Q9_0",
       "Q9_1",
       "Q9_2",
       "Q9_3",
       "Q9_4",
       "Q9_5",
       "Q9_6",
       "Q9b",
       "Q10",
       "Q10b",
       "Q10c",
       "Q11"
FROM epidb_dk.epidb_results_weekly;

INSERT INTO public.epidb_results_weekly
SELECT country,
       global_id,
       TIMESTAMP,
       "Q1_0",
       "Q1_1",
       "Q1_2",
       "Q1_3",
       "Q1_4",
       "Q1_5",
       "Q1_6",
       "Q1_7",
       "Q1_8",
       "Q1_9",
       "Q1_10",
       "Q1_11",
       "Q1_12",
       "Q1_13",
       "Q1_14",
       "Q1_15",
       "Q1_16",
       "Q1_17",
       "Q1_18",
       "Q1_19",
       "Q2",
       "N1",
       "Q3",
       "Q3_0_open",
       "Q4",
       "Q4_0_open",
       "Q5",
       "Q6",
       "Q6_1_open",
       "Q6b",
       "Q6c",
       "Q6d",
       "Q7_0",
       "Q7_1",
       "Q7_3",
       "Q7_2",
       "Q7_4",
       "Q7_5",
       NULL AS "Q7b_multi_row1_col1",
       NULL AS "Q7b_multi_row2_col1",
       NULL AS "Q7b_multi_row3_col1",
       NULL AS "Q7b_multi_row4_col1",
       "Q8_0",
       "Q8_1",
       "Q8_2",
       "Q8_3",
       "Q8_4",
       "Q8_5",
       NULL AS "Q8b_multi_row1_col1",
       NULL AS "Q8b_multi_row2_col1",
       NULL AS "Q8b_multi_row3_col1",
       NULL AS "Q8b_multi_row4_col1",
       "Q9_0",
       "Q9_1",
       "Q9_2",
       "Q9_3",
       "Q9_4",
       "Q9_5",
       "Q9_6",
       "Q9b",
       "Q10",
       "Q10b",
       "Q10c",
       "Q11"
FROM epidb_pt.epidb_results_weekly;

INSERT INTO public.epidb_results_weekly
SELECT country,
       global_id,
       TIMESTAMP,
       "Q1_0",
       "Q1_1",
       "Q1_2",
       "Q1_3",
       "Q1_4",
       "Q1_5",
       "Q1_6",
       "Q1_7",
       "Q1_8",
       "Q1_9",
       "Q1_10",
       "Q1_11",
       "Q1_12",
       "Q1_13",
       "Q1_14",
       "Q1_15",
       "Q1_16",
       "Q1_17",
       "Q1_18",
       "Q1_19",
       "Q2",
       "N1",
       "Q3",
       "Q3_0_open",
       "Q4",
       "Q4_0_open",
       "Q5",
       "Q6",
       "Q6_1_open",
       "Q6b",
       "Q6c",
       "Q6d",
       "Q7_0",
       "Q7_1",
       "Q7_3",
       "Q7_2",
       "Q7_4",
       "Q7_5",
       NULL AS "Q7b_multi_row1_col1",
       NULL AS "Q7b_multi_row2_col1",
       NULL AS "Q7b_multi_row3_col1",
       NULL AS "Q7b_multi_row4_col1",
       "Q8_0",
       "Q8_1",
       "Q8_2",
       "Q8_3",
       "Q8_4",
       "Q8_5",
       NULL AS "Q8b_multi_row1_col1",
       NULL AS "Q8b_multi_row2_col1",
       NULL AS "Q8b_multi_row3_col1",
       NULL AS "Q8b_multi_row4_col1",
       "Q9_0",
       "Q9_1",
       "Q9_2",
       "Q9_3",
       "Q9_4",
       "Q9_5",
       "Q9_6",
       "Q9b",
       "Q10",
       "Q10b",
       "Q10c",
       "Q11"
FROM epidb_se.epidb_results_weekly;

INSERT INTO public.epidb_results_weekly
SELECT country,
       global_id,
       TIMESTAMP,
       "Q1_0",
       "Q1_1",
       "Q1_2",
       "Q1_3",
       "Q1_4",
       "Q1_5",
       "Q1_6",
       "Q1_7",
       "Q1_8",
       "Q1_9",
       "Q1_10",
       "Q1_11",
       "Q1_12",
       "Q1_13",
       "Q1_14",
       "Q1_15",
       "Q1_16",
       "Q1_17",
       "Q1_18",
       "Q1_19",
       "Q2",
       "N1",
       "Q3",
       "Q3_0_open",
       "Q4",
       "Q4_0_open",
       "Q5",
       "Q6",
       "Q6_1_open",
       "Q6b",
       "Q6c",
       "Q6d",
       "Q7_0",
       "Q7_1",
       "Q7_3",
       "Q7_2",
       "Q7_4",
       "Q7_5",
       "Q7b_multi_row1_col1",
       "Q7b_multi_row2_col1",
       "Q7b_multi_row3_col1",
       "Q7b_multi_row4_col1",
       "Q8_0",
       "Q8_1",
       "Q8_2",
       NULL AS "Q8_3",
       NULL AS "Q8_4",
       "Q8_5",
       "Q8b_multi_row1_col1",
       "Q8b_multi_row2_col1",
       NULL AS "Q8b_multi_row3_col1",
       "Q8b_multi_row4_col1",
       "Q9_0",
       "Q9_1",
       "Q9_2",
       "Q9_3",
       "Q9_4",
       "Q9_5",
       "Q9_6",
       "Q9b",
       "Q10",
       "Q10b",
       "Q10c",
       "Q11"
FROM epidb_ie.epidb_results_weekly;

INSERT INTO public.epidb_results_weekly
SELECT country,
       global_id,
       TIMESTAMP,
       "Q1_0",
       "Q1_1",
       "Q1_2",
       "Q1_3",
       "Q1_4",
       "Q1_5",
       "Q1_6",
       "Q1_7",
       "Q1_8",
       "Q1_9",
       "Q1_10",
       "Q1_11",
       "Q1_12",
       "Q1_13",
       "Q1_14",
       "Q1_15",
       "Q1_16",
       "Q1_17",
       "Q1_18",
       "Q1_19",
       "Q2",
       "N1",
       "Q3",
       "Q3_0_open",
       "Q4",
       "Q4_0_open",
       "Q5",
       "Q6",
       "Q6_1_open",
       "Q6b",
       "Q6c",
       "Q6d",
       "Q7_0",
       "Q7_1",
       "Q7_3",
       "Q7_2",
       "Q7_4",
       "Q7_5",
       NULL AS "Q7b_multi_row1_col1",
       NULL AS "Q7b_multi_row2_col1",
       NULL AS "Q7b_multi_row3_col1",
       NULL AS "Q7b_multi_row4_col1",
       "Q8_0",
       "Q8_1",
       "Q8_2",
       "Q8_3",
       "Q8_4",
       "Q8_5",
       NULL AS "Q8b_multi_row1_col1",
       NULL AS "Q8b_multi_row2_col1",
       NULL AS "Q8b_multi_row3_col1",
       NULL AS "Q8b_multi_row4_col1",
       "Q9_0",
       "Q9_1",
       "Q9_2",
       "Q9_3",
       "Q9_4",
       "Q9_5",
       "Q9_6",
       "Q9b",
       "Q10",
       "Q10b",
       "Q10c",
       "Q11"
FROM epidb_fr.epidb_results_weekly;
