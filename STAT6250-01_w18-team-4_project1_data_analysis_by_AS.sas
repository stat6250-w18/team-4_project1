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

footnote1
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
'Research Question: What is the most likely reason for Job Satisfaction?'
;

title2
'Rationale: This would help the companies identify the common reasons for job satisfaction.'
;

footnote1
''
;

footnote2
''
;

footnote3
''
;
*
Methodology: Use PROC FREQ to study Job Satisfaction metrics, and
list them by reasons in data file.
Limitations: Some fields have No values [NA] .Also this is subset of
comprehensive 64,000 data set.
Possible Follow-up Steps: Come up with predictive algorithm based on 
analysis and also add IF/ELSE for missing condition.
;


proc freq
	data=StackO_analytic_file order= freq;
	table (
		LearningNewTech
		BoringDetails
		JobSecurity
		DiversityImportant
		FriendsDevelopers
		RightWrongWay
		SeriousWork
		ChallengeMyself
		ImportantBenefits)
	output out=reasons;
run;
title;
footnote;

*
