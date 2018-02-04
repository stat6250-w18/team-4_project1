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
'Research Question: What is the top 1 country from where the respondents contributing on stack of flow?'
;

title2
'Rationale: This should help identify the most nationality who take part in the survey.'
;

footnote1
'Based on the above output, the top  country is Unite States'
;

footnote2
'Moreover, we can see more information to analyze.'
;

footnote3
'Further analysis to look for the top 1 formal education level in the respondences who coming from United States'
;

*
Methodology: Use PROC PRINT to print just the top country from
the temporary dataset created in the corresponding data-prep file.

Limitations: This methodology can result the only one country. The purpose for
the research is not very useful and represtful.

Possible Follow-up Steps: More carefully clean the values of the variable.
;

proc print
    data=FreqMajCount_Desc 
        (obs=3)
	;
run;
title;
footnote;


title1
'Research Question: How does the distribution of "Major Undergrad" for the first top 1 country to that of top 2 country?'
;

title2
'Rationale: This would help inform whether the education level depend on region.'
;

footnote1
'Based on the above output, top 2 eduation level are "Bachelor" and "some college/university study without earning a bachelors degree", which are 694 and 272 persons.'
;

footnote2
'However, there are still lots of data and we need to narrow them and put one more restrict so that conditions looks more details.'
;

footnote3
'In addition, we should see the employment status who have a special degree and from a special region.'
;

*
Methodology: Use PROC PRINT to print just the most education level from
the temporary dataset created in the corresponding data-prep file.

Limitations: This methodology only result respondents' education level.
The purpose for the research should be considered the employed status 
as well.

Possible Follow-up Steps: More restricts
;

proc print
    data=FreqWanCount_Desc
        (obs=5)
	;
run;
title;
footnote;



title1
'Research Question: what's the most employment status who have bachelar degree already and from USA?'
;

title2
'Rationale: This would help determine what's the most employ status among person who live in USA and having Bachalar degree.'
;

footnote1
'Based on the above output, 543 records shows that they are full-time employed.'
;

footnote2
'Finally, this survey can help us to identify the respondents educaion and employment status.'
;

*
Methodology: Use PROC PRINT to print just the most employment status base on
the corresponding temp file.

Limitations: This methodology still can result a lot of redundent.

Possible Follow-up Steps: More restricts
;

proc print
    data=FreqsalaryCount_Desc
        (obs=10)
	;
run;
title;
footnote;

