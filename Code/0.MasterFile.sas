/********************************************************************
* Project: 	HDAT9400 - Management and curation of health data
* Purpose:	Set macros and run project programs
* Inputs: 	hospital.sas7bdat; survey.sas7bdat; 
* Outputs:	Proportion of deaths in follow-up period by age and sex
* Author:	Mark Hanly
* Date:		5th Feb 2018
* Note:		Specify the input and output folders in Step 1a - Step1d
			(Make sure these locations exist)
*********************************************************************/

/* 1. Set project macros */

* Edit the root folder macro here;
**************************************************************************************;
*1a. Set the root location for the project folder;
%let source = H:/Teaching/MSc_HealthDataScience/HDAT9400-Curation/collaborative-coding; 
**************************************************************************************;

*1b. Automatically update the location of the code folder;
%let code = &source/Code; 

*1c. Automatically update the location of the data folder;
%let data = &source/Data; 

*1d. Automatically update the location of the results folder;
%let output = &source/Results; 

* Today's date automatically set here;
%let date = %sysfunc(putn(%sysfunc(today()),yymmddn8.));

/* 2. Use the libname statement to create a folder for results */
options dlcreatedir;
libname Results "&source/Results";

/* 3. Define libraries based on the above locations */
libname data "&data";
libname output "&output";
libname source "&source";

* Tell SAS to ignore missing formats;
options nofmterr;


*/ 4. Reproduce the analysis */

* Run the project programs in order;
%INCLUDE "&code/1.PrepData.sas";
%INCLUDE "&code/2.SummVars.sas";
%INCLUDE "&code/3.PrintBarChart.sas";

/* END */
