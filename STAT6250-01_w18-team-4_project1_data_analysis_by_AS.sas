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
Methodology: Use PROC FREQ procedure to generate a frequency table . 
Use PROC SORT to sort the column DeveloperType.
Use PROC PRINT to print the observations.

Limitations: This methodology does not account for fields with missing [NA] values.

Possible Follow-up Steps: Better handling of missing data.IF ELSE condition.
;

proc freq
        data=StackO_analytic_file
    ;
    tables
        DeveloperType / out=FreqCount  list
    ;
run;

proc sort
    data=FreqCount
	    out=FreqCount_Desc
	;
	by
	    descending percent
	;
run;

proc print
    data=FreqCount_Desc 
        (obs=3)
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
Methodology: Use PROC FREQ procedure to generate frequency table for the different countries.

Limitations: Since we have used limited data set 3000 of 64000 results may not be accurate.

Possible Follow-up Steps: Bump up the data set and compare with historical data .
;

proc freq
        data=StackO_analytic_file
    ;
    tables
        Country / out=FreqCount  list
    ;
run;

proc sort
    data=FreqCount
	    out=FreqCount_Desc
	;
	by
	    descending Country
	;
run;

proc print
    data=FreqCount_Desc 
        (obs=5)
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
Methodology: Use PROC FREQ procedure to generate frequency table for the different FormalEducation Types.
Use PROC PRINT to print the data

Limitations: Since we have used limited data set 3000 of 64000 results may not be accurate.

Possible Follow-up Steps: Bump up the data set and compare with historical data .
;

proc freq
        data=StackO_analytic_file
    ;
    tables
        FormalEducation / out=FreqCount  list
    ;
run;

proc sort
    data=FreqCount
	    out=FreqCount_Desc
	;
	by
	    descending FormalEducation
	;
run;

proc print
    data=FreqCount_Desc 
        (obs=10)
	;
run;
title;
footnote;
