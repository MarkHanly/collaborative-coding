/**************************************************************
* Project: 	HDAT9400 - Management and curation of health data
* Purpose:	Read and prepare the analysis data 
* Inputs: 	hospital.sas7bdat; survey.sas7bdat;
* Outputs:	mort_by_age_sex.sas7bdat
* Author:	Mark Hanly
* Date:		5th Feb 2018
**************************************************************/

/* 1. Read a local copy of the project datasets */
data data.surv0; set data.survey; run;
data data.hosp0; set data.hospital; run;


/* 2. Sort the data */
proc sort data=data.surv0; by ppn;
proc sort data=data.hosp0; by ppn admdate sepdate;


/* 3. Prepare the survey data */
data surv1 (keep=ppn sex_clean age_grp); *Note interim file sent to temporary work folder;
set data.surv0;  
by ppn;
* Identify duplicates;
retain count;
if first.ppn then count=0;
count = count+1;
* Derive categorical age group variable;
age_grp = floor(age/10);
* Keep one record per individual;
if count=2 then delete;
run;


/* 4. Prepare the hospital data */ 
data hosp1 (keep=ppn died); *Note interim file sent to temporary work folder;
set data.hosp0; 
died=0;
if separation IN ('5', '6') then died = 1; *Identify deaths;
run;

proc sort data=hosp1; by ppn descending died; run; 
data hosp2 (keep=ppn);
set hosp1;
by ppn;
if first.ppn and died=1 then output; *Keep records where there was a death;
run;


/* 5. Merge the survey and hospital data */
data mort1;
merge surv1 (in=a) hosp2 (in=b);
by ppn;
died=0;
if b then died=1;
if a then output;
run;


/* 6. Define and apply format labels */
proc format;
value agegrp
0 = '0-9'
1 = '10-19'
2 = '20-29'
3 = '30-39'
4 = '40-49'
5 = '50-59'
6 = '60-69'
7-9 = '70+';

value died
0 = 'survived'
1 = 'died';

value died
0 = 'survived'
1 = 'died';

value sexf
1 = '1 Male'
2 = '2 Female';

run;

data data.mort_by_age_sex;
set mort1;
format age_grp agegrp.;
format died died.;
run;

/* END */
