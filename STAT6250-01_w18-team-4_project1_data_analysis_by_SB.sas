*******************************************************************************;
**************** 80-character banner for column width reference ***************;
* (set window width to banner width to calibrate line length to 80 characters *;
*******************************************************************************;

*
This file uses the following analytic dataset to address several research
questions regarding the lives of data scientists contributing to the Stack
Overflow.

Dataset Name: StackO_raw_analytic_file created in external file
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

title;
footnote;

title1
'Research Question: What are the 5 most popular version control tools among the 
Stack Overflow users?'
;

title2
'Rationale: This should help identify the most important/in-demand version control 
tools that programmers make use of and that new programmers should know in order to 
succeed in their field.'
;

footnote1
'Based on the below output, 5 version control tools have been identified, out of which 
"git" is used the most.' 
;

footnote2
'However, this is perhaps only a randomly selected sample of 3000 respondents out of 
64000.'
;

*
Methodology: Use PROC FREQ procedure to generate a frequency table for the different 
version control tools. And use PROC SORT procedure to get the top 5 version control 
tools.

Limitations: Since the data is based on a survey, there were many fields that had NA 
for an answer. Because of that, even NA is one of the top 5 results in thr SORT 
procedure.

Possible Follow-up Steps: More carefully clean the values of the variable
Percent_Eligible_FRPM_K12 so that the means computed do not include any possible
illegal values, and better handle missing data, e.g., by using a previous year's
data or a rolling average of previous years' data as a proxy.'
;

proc freq
        data=FRPM1516_raw
    ;
    tables
        VersionControl / out=FreqCount  list
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
        (obs=5)
	;
run;
title;
footnote;


title1
'Research Question: Which professionals contribute more on Stack Overflow?'
;

title2
'Rationale: This would help to understand the popularity of Stack Overflow 
among different professionals. And this information would help stack overflow 
to know their audience in order to provide relevent advertisements to them.'
;

footnote1
'Based on the below output, profesional developers tops the list, followed by 
others.'
;

footnote2
'Moreover, there are a lot of 'NA' values, which hinders the results of the 
analysis. And makes it difficult to take right business decisions.'
;

*
Methodology: Use PROC FREQ procedure to generate a frequency table for the professionals.
And use PROC SORT procedure to get the frequencies in descending order.

Limitations: Since the data is based on a survey, there were limited options available. 


Possible Follow-up Steps: 
;
proc freq
        data=FRPM1516_raw
    ;
    table
        Professional / out=FreqCount  list
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
	;
run;
title;
footnote;



title1
'Research Question: What are the top 5 ranges of years of programming experience 
for the respondents?'
;

title2
'Rationale: This would help stack Overflow to know what is the experience level 
of its audience. The result will help in posting relevent job opportunities to 
the right audience.'
;

footnote1
'Based on the below output, professionals with more than 20 years of experience 
contribute the most on stack overflow.'
;

footnote2
'However, the dataset represents only a small sample of the original data. 
So results cannot be generalised 100% onto the whole data.'
;

*
Methodology: Use PROC FREQ procedure to generate a frequency table for the different 
version control tools. And use PROC SORT procedure to get the top 5 version control tools.

Limitations: Since the data is based on a survey, there were many fields that had 
'NA' for an answer. Because of that, even 'NA' is one of the top 5 results in thr SO


Follow-up Steps: A possible follow-up to this approach could use an inferential
statistical technique like beta regression.
;
proc freq
        data=FRPM1516_raw
    ;
    table
        YearsProgram / out=FreqCount  list
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
	(obs=5)
	;	
run;
title;
footnote;
