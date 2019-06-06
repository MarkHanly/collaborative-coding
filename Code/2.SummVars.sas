/**************************************************************
* Project: 	HDAT9400 - Management and curation of health data
* Purpose:	Summarise variables
* Inputs: 	mort_by_age_sex.sas7bdat
* Outputs:	yyyymmdd_variable_summary.pdf
* Author:	Mark Hanly
* Date:		5th Feb 2018
**************************************************************/

* Summarise the data, saving to pdf;
ODS PDF FILE ="&output/&date._variable_summary.pdf";

proc freq data=data.mort_by_age_sex;
title "Summary distribution of study variables";
tables sex_clean age_grp died sex_clean*age_grp /missing nocum norow nocol; 
run;

ODS PDF CLOSE;
