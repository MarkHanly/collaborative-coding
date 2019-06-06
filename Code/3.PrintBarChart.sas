/**************************************************************
* Project: 	HDAT9400 - Management and curation of health data
* Purpose:	Print histogram of mortality by age and sex
* Inputs: 	mort_by_age_sex.sas7bdat
* Outputs:	yyyymmdd_risk_by_age_sex.pdf
* Author:	Mark Hanly
* Date:		5th Feb 2018
**************************************************************/

* Print the proportion of deaths by age and sex, saving to pdf;
ODS PDF FILE ="&output/&date._risk_by_age_sex.pdf";

title 'Mortality by age and sex';
proc sgplot data=data.mort_by_age_sex;
vbar age_grp / response=died stat=mean group=sex_clean nostatlabel groupdisplay=cluster;
xaxis label="Age group (years)";
yaxis grid label="Proportion of deaths";
run;

ODS PDF CLOSE;

/* END */
