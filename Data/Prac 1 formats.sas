*** PROGRAM: Formats for Prac 1;


proc format;
value sexf
	1 = '1 Male'
	2 = '2 Female'
	;
value cobf
	1 = '1 Australia'
	2 = '2 Overseas'
	77 = '77 Refused'
	99 = "99 Don't know"
	;
value maritalf
	1 = '1 Married'
	2 = '2 Widowed'
	3 = '3 Divorced'
	4 = '4 Separated'
	5 = '5 Never married'
	6 = '6 Living with partner'
	77 = '77 Refused'
	99 = "99 Don't know"
	;
value conf
	1 = '1 Yes'
	2 = '2 No'
	7 = '7 Refused'
	9 = "Don't know"
	;
value eduf
	1 = '1 Did not complete school'
	2 = '2 School certificate'
	3 = '3 HSC'
	4 = '4 Traineeship/apprenticeship'
	5 = '5 University'
	7 = '7 Refused'
	9 = "9 Don't know"
	;
value phif
	0 = '0 None'
	1 = 'PHI (extras)'
	2 = 'PHI (no extras)'
	3 = 'Health care card';

value incomef
	1 = "1 Under 20,000"
	2 = "2 20,000 - <35,000"
	3 = "3 35,000 - <55,000"
	4 = "4 55,000 - <75,000"
	5 = "5 75,000 - <100,000"
	6 = "6 100,000 and over"
	77 = '77 Refused'
	99 = "99 Don't know"
	;

value healthf
	1 = '1 Excellent'
	2 = '2 Very good'
	3 = '3 Good'
	4 = '4 Fair'
	5 = '5 Poor'
	7 = '7 Refused'
	9  = "9 Don't know"
	;
value sepf
	1 = '1 Discharged by hospital'
	2 = '2 Discharged at own risk'
	3 = '3 Transferred to another hospital'
	4 = '4 Transferred to nursing home'
	5 = '5 Died (no autopsy)'
	6 = '6 Died (autopsy)'
	;
run;
