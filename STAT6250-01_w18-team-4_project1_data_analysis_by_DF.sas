*******************************************************************************;
**************** 80-character banner for column width reference ***************;
* (set window width to banner width to calibrate line length to 80 characters *;
*******************************************************************************;

*
This file uses the following analytic dataset to address several research
questions regarding A look into the lives of over 64,000 Stack Overflow
developers.

Dataset Name: Stack Overflow Developer Survey, 2017
STAT6250-01_w18-team-4_project1_data_preperation.sas, which is assumed to be
in the same directory as this file

See included file for dataset properties
;

* environmental setup;

* set relative file import path to current directory (using standard SAS trick);
X "cd ""%substr(%sysget(SAS_EXECFILEPATH),1,%eval(%length(%sysget(SAS_EXECFILEPATH))-%length(%sysget(SAS_EXECFILENAME))))""";


* load external file that generates analytic dataset FRPM1516_analytic_file;
%include '.\STAT6250-01_w18-team-4_project1_data_preperation.sas';



title1
'Research Question: What are the top 1 Major who contribute in the survey?'
;

title2
'Rationale: This helps to know what are the most majors which are among in this survey.'
;

footnote1
'Math and statistic is the most common majors in the survey' 
;

footnote2
'Na should be eliminated.' 
;

*
Methodology:Use PROC PRINT to print the 1 observations.
Limitations: The outcomes should be more precise.
Possible Follow-up Steps: I need consider more conditions.
;

proc print
    data=FreqMajCount_Desc 
        (obs=1)
	;
run;
title;
footnote;


title1
'Research Question: Which top 1 are the surveyers want work language ?'
;

title2
'Rationale: This should help identify the people who contribute into the survey most want work language.
;

footnote1
'Sql and Java is the most work language.' 
;

footnote2
'There should be lots types of languages in the survey.'
;

*
Methodology: Use PROC PRINT to print the 2 observation.
Limitations: Since we have lots of types of languages, we can not list the number.
Possible Follow-up Steps: Get some referance from other datasets.
;


proc print
    data=FreqWanCount_Desc
        (obs=2)
	;
run;
title;
footnote;



title1
'Research Question: How much salary do people get who contribute into the survey?'
;

title2
'Rationale: This should help identify the people who have high salary.'
;

footnote1
'The highest salary who get into is 195000.' 
;

footnote2
'There are so many NA values.'
;

*
Methodology: Use PROC PRINT to print the 2 observations
Limitations: This method can not show general salarys' distribution.
Possible Follow-up Steps: use some special function to do so .
;

proc print
    data=FreqsalaryCount_Desc
        (obs=2)
	;
run;
title;
footnote;


