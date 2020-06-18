@echo off

rem This assumes uq4metawards is installed
rem This assumes that the data repo and the uq4covid repo are in the same folder

if not exist "data" md "data"

rem Call the pre-processor to fix the inputs for metawards

uq4metawards-pre inputs\design.csv ..\..\..\uq4covid\model_config\metawards_multidemographic\limits.csv inputs\disease.csv -e -f

rem Call metawards
rem Note: to prevent spamming the repo, the output folder has been changed to a local one here, you'll need to change this

if not exist ..\..\..\test md ..\..\..\test

metawards -d ..\..\..\uq4covid\model_config\metawards_multidemographic\ncov_extra_d -D ..\..\..\uq4covid\model_config\metawards_multidemographic\demographics.json -o ..\..\..\test --force-overwrite-output --input inputs\disease.csv -a ExtraSeedsLondon.dat --extractor ..\..\..\uq4covid\model_config\metawards_multidemographic\mix_move_extractor::extract -u ..\..\..\uq4covid\model_config\metawards_multidemographic\constants.txt --iterator ..\..\..\uq4covid\model_config\metawards_multidemographic\iterate --mover ..\..\..\uq4covid\model_config\metawards_multidemographic\move_pathways --mixer ..\..\..\uq4covid\model_config\metawards_multidemographic\mix_pathways --start-date 2020/01/01 --theme simple