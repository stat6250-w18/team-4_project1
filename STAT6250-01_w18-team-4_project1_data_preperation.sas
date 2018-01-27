

*******************************************************************************;
**************** 80-character banner for column width reference ***************;
* (set window width to banner width to calibrate line length to 80 characters *;
*******************************************************************************;

* 
This file prepares the dataset described below for analysis.

[Dataset Name] Stack Overflow Developer Survey, 2017

[Experimental Units] A look into the lives of over 64,000 Stack Overflow developers

[Number of Observations] Originally had 51,393 obs, but for the sake of file size limit, few columns and all observations but 3000 were deleted.

[Number of Features] 143

[Data Source] https://www.kaggle.com/stackoverflow/so-survey-2017/data. The original dataset based on the survey has been edited as it was too large for the max file size accepted on github. The edit has been made by deleting all obseravtions but 3000.

[Data Dictionary] https://www.kaggle.com//stackoverflow/so-survey-2017/downloads/survey_results_public.csv

[Unique ID] The column "Respondent" is a primary key.
;


* environmental setup;

* setup environmental parameters;

%let inputDatasetURL =
https://github.com/stat6250/team-4_project1/blob/master/Stack%20Overflow%20refined%20data.xlsx?raw=true
;

* load raw dataset over the wire;
%macro loadDataIfNotAlreadyAvailable(dsn,url,filetype);
    %put &=dsn;
    %put &=url;
    %put &=filetype;
    %if
        %sysfunc(exist(&dsn.)) = 0
    %then
        %do;
            %put Loading dataset &dsn. over the wire now...;
            filename tempfile "%sysfunc(getoption(work))/tempfile.xlsx";
            proc http
                method="get"
                url="&url."
                out=tempfile
                ;
            run;
            proc import
                file=tempfile
                out=&dsn.
                dbms=&filetype.;
            run;
            filename tempfile clear;
        %end;
    %else
        %do;
            %put Dataset &dsn. already exists. Please delete and try again.;
        %end;
%mend;
%loadDataIfNotAlreadyAvailable(
    FRPM1516_raw,
    &inputDatasetURL.,
    xlsx
)
* check raw dataset for duplicates with respect to its primary key;
proc sort
        nodupkey
        data=FRPM1516_raw
        dupout=FRPM1516_raw_dups
        out=_null_
    ;
    by
        Respondent

    ;
run;

* create output formats;
proc format;
    value YearsProgram_bins
        2-5="Junior"
        6-10="Senior"
        11-15="Staff"
        16-20="Manager"
    ;
    value Percent_Eligible_FRPM_K12_bins
		other='NA'
        low-<3="Not Satisfied"
        3-<6="Somewhat Satisfied"
        6-<9="Quite Satisfied"
        9-10="Happy"
    ;
run;

* build analytic dataset from FRPM dataset with the least number of columns and
minimal cleaning/transformation needed to address research questions in
corresponding data-analysis files;

data FRPM1516_analytic_file;
    retain
        Respondent
		MajorUndergrad
		FormalEducation
		YearsProgramming
		DeveloperType
		Professional
		Country
		WorkStart
		HaveworkedLanguage
		VersionControl
		Salary
    ;
    	keep
        Respondent
		MajorUndergrad
		FormalEducation
		YearsProgram
		DeveloperType
		Professional
		Country
		WorkStart
		HaveworkedLanguage
		VersionControl
		Salary
    set FRPM1516_raw;
run;
