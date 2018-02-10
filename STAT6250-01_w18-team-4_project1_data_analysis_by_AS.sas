*******************************************************************************;
**************** 80-character banner for column width reference ***************;
* (set window width to banner width to calibrate line length to 80 characters *;
*******************************************************************************;

*
This file uses the following analytic dataset to address several research
questions regarding the lives of data scientists contributing to the Stack
Overflow.

Dataset Name: StackO_analytic_file_analytic_file created in external file
STAT6250-01_w18-team-4_project1_data_preparation.sas, which is assumed to be
in the same directory as this file

See included file for dataset properties
;

* environmental setup;

* set relative file import path to current directory (using standard SAS trick);
X "cd ""%substr(%sysget(SAS_EXECFILEPATH),1,%eval(%length(%sysget(SAS_EXECFILEPATH))
-%length(%sysget(SAS_EXECFILENAME))))""";


* load external file that generates analytic dataset FRPM1516_analytic_file;
%include '.\STAT6250-01_w18-team-4_project1_data_preparation.sas';



title1
'Research Question: What are the top 3 DeveloperType among StackOverflow Users?'
;

title2
'Rationale: This helps explain the developers in most demand'
;

footnote1
'Web Developer is the common developertype being seen across the industry' 
;

footnote2
'Further we can see that Graphics Designer is the least common across the industry' 
;

*
Methodology:Use PROC PRINT to print the 3 observations.

Limitations: This methodology does not account for fields with missing 
[NA] values.

Possible Follow-up Steps: Better handling of missing data.IF ELSE condition.
;

proc print
    data=FreqDevCount_Desc (obs=3)
	;
run;
title;
footnote;



title1
'Research Question: Which country are the maximumnumber of stack overflow users from ?'
;

title2
'Rationale: This should help identify the users from the countries that have surveyed.'
;

footnote1
'US has the maximum number of respondents followed by UK.' 
;

footnote2
'Data is a subset [3000] of 64000.'
;

*
Methodology: Use PROC PRINT to print the 5 observations.

Limitations: Since we have used limited data set 3000 of 64000 results may not be 
accurate.

Possible Follow-up Steps: Bump up the data set and compare with historical data.
;

proc print
    data=FreqCountryCount_Desc (obs=5)
	;
run;
title;
footnote;



title1
'Research Question: How many users have Bachelors,Masters and Doctoral as FormalEducation ?'
;

title2
'Rationale: This should help identify the users who have completed 4+ years of college.'
;

footnote1
'There are 1359 users with Bachelors degree followed by 560 Masters and 70 Doctorates.' 
;

footnote2
'Data is a subset [3000] of 64000.'
;

*
Methodology:Use PROC PRINT to print the 10 observations

Limitations: Since we have used limited data set 3000 of 64000 results may not 
be accurate.

Possible Follow-up Steps: Bump up the data set and compare with historical data .
;

proc print
    data=FreqFeCount_Desc (obs=10)
	;
run;
title;
footnote;

