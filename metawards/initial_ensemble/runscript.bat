@echo off

rem This assumes uq4metawards is installed
rem This assumes that the data repo and the uq4covid repo are in the same folder

if not exist "data" md "data"

rem Sort the input files

uq4metawards-uq3a inputs\design.csv ..\..\..\uq4covid\model_config\metawards\limits.csv inputs\uq3a_out.csv -f
uq4metawards-uq3b inputs\uq3a_out.csv inputs\disease.csv -f

rem Call metawards
rem Note: to prevent spamming the repo, the output folder has been changed to a local one here, you'll need to change this

if not exist ..\..\..\test md ..\..\..\test

metawards -d ncov -o ..\..\..\test --force-overwrite-output --input inputs\disease.csv -a ExtraSeedsLondon.dat --extractor ..\..\..\uq4covid\model_config\metawards\only_i_per_ward -u ..\..\..\uq4covid\model_config\metawards\lockdown_states.txt --iterator ..\..\..\uq4covid\model_config\metawards\iterate --start-date 2020/01/01 --theme simple