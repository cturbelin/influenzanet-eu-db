CREATE TABLE geo_levels
(
   country character(2) NOT NULL, 
   code_nuts1 character(3) NOT NULL, 
   code_nuts2 character(4) NOT NULL
);

CREATE TABLE geo_nuts1
(
   country character(2) NOT NULL, 
   code_nuts1 character(3) NOT NULL, 
   title text NOT NULL,
   CONSTRAINT pk_geo_nuts1 PRIMARY KEY (code_nuts1)
);


CREATE TABLE geo_nuts2
(
   country character(2) NOT NULL, 
   code_nuts1 character(3) NOT NULL, 
   code_nuts2 character(4) NOT NULL,
   title text NOT NULL,
   CONSTRAINT pk_geo_nuts2 PRIMARY KEY (code_nuts2)
);

-- Population tables

CREATE TABLE pop_nuts1 (
   code_nuts1 character(3) NOT NULL, 
   "country" character(2) NOT NULL,
   "year"	integer  NOT NULL,
   "all" integer NOT NULL,
   "male" integer NOT NULL,
   "female" integer NOT NULL,
   "year_ref" integer NOT NULL,
   CONSTRAINT pk_pop_nuts1 PRIMARY KEY ("year", code_nuts1)
);

CREATE TABLE pop_age5_nuts1 (
   code_nuts1 character(3) NOT NULL, 
   age_min integer NOT NULL,
   age_max integer,
   "country" character(2) NOT NULL,
   "year"	integer  NOT NULL,
   "all" integer NOT NULL,
   "male" integer NOT NULL,
   "female" integer NOT NULL,
   "year_ref" integer NOT NULL,
   CONSTRAINT pk_pop_age5_nuts1 PRIMARY KEY ("year", code_nuts1,"age_min")
);

CREATE TABLE pop_nuts2 (
   code_nuts2 character(4) NOT NULL, 
   "country" character(2) NOT NULL,
   "year"	integer  NOT NULL,
   "all" integer NOT NULL,
   "male" integer NOT NULL,
   "female" integer NOT NULL,
   "year_ref" integer NOT NULL,
   CONSTRAINT pk_pop_nuts2 PRIMARY KEY ("year", code_nuts2)
);

CREATE TABLE pop_age5_nuts2 (
   code_nuts2 character(4) NOT NULL, 
   age_min integer NOT NULL,
   age_max integer,
   "country" character(2) NOT NULL,
   "year"	integer  NOT NULL,
   "all" integer NOT NULL,
   "male" integer NOT NULL,
   "female" integer NOT NULL,
   "year_ref" integer NOT NULL,
   CONSTRAINT pk_pop_age5_nuts2 PRIMARY KEY ("year", code_nuts2,"age_min")
);

CREATE TABLE pop_country (
   "country" character(2) NOT NULL,
   "year"	integer  NOT NULL,
   "all" integer NOT NULL,
   "male" integer NOT NULL,
   "female" integer NOT NULL,
   "year_ref" integer NOT NULL,
   CONSTRAINT pk_pop_country PRIMARY KEY ("year", "country")
);

CREATE TABLE pop_age5_country (
   "country" character(2) NOT NULL,
   age_min integer NOT NULL,
   age_max integer,
   "year"	integer  NOT NULL,
   "all" integer NOT NULL,
   "male" integer NOT NULL,
   "female" integer NOT NULL,
   "year_ref" integer NOT NULL,
   CONSTRAINT pk_pop_age5_country PRIMARY KEY ("year", "country","age_min")
);

