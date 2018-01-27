

*******************************************************************************;
**************** 80-character banner for column width reference ***************;
* (set window width to banner width to calibrate line length to 80 characters *;
*******************************************************************************;

*
This file uses the following analytic dataset to address several research
questions regarding  lives of over 64,000 Stack Overflow developers

Dataset Name: survey_results_public created in external file
STAT6250-01_w18-team-4_project1_data_preperation.sas, which is assumed to be
in the same directory as this file

See included file for dataset properties
;

* environmental setup;

* set relative file import path to current directory (using standard SAS trick);
X "cd ""%substr(%sysget(SAS_EXECFILEPATH),1,%eval(%length(%sysget(SAS_EXECFILEPATH))-%length(%sysget(SAS_EXECFILENAME))))""";


* load external file that generates analytic dataset FRPM1516_analytic_file;
%include '.\STAT6250-01_w18-team-4_project1_data_preperation.sas';



*
Research Question: What are the top 3 work start timings?

Rationale: This would help companies set general expectation eg:9am -5pm or 10am-6pm

Methodology: use PROC SORT to sort the column WorkStart, and use PROC PRINT to print variables

Limitations: It does not consider NA values.




