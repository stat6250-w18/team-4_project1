

*******************************************************************************;
**************** 80-character banner for column width reference ***************;
* (set window width to banner width to calibrate line length to 80 characters *;
*******************************************************************************;

* 
This file prepares the dataset described below for analysis.

[Dataset Name] Stack Overflow Developer Survey, 2017

[Experimental Units] A look into the lives of over 64,000 Stack Overflow developers

[Number of Observations] 51,393

[Number of Features] 128

[Data Source] https://www.kaggle.com/stackoverflow/so-survey-2017/data

[Data Dictionary] https://www.kaggle.com//stackoverflow/so-survey-2017/downloads/survey_results_public.csv

[Unique ID] The column "Respondent" is a primary key.The column Professional,Country,YearsProgram and DeveloperType form a composite key
,


* environmental setup;

* create output formats;
proc format;
    value YearsProgram_bins
        2-5="Junior"
        6-10="Senior"
        11-15="Staff"
        16-20="Manager"
    ;
    value Percent_Eligible_FRPM_K12_bins
        NA-<3="Not Satisfied"
        3-<6="Somewhat Satisfied"
        6-<9="Quite Satisfied"
        9-10="Happy"
    ;
run;


* setup environmental parameters;
%let inputDatasetURL =
https://www.kaggle.com//stackoverflow/so-survey-2017/downloads/survey_results_public.csv?raw=true
;


* load raw FRPM dataset over the wire;
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
    xls
)
