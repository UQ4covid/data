#!/bin/bash

## Call the pre-processor to fix the inputs for metawards

python pre.py inputs\design.csv inputs\limits.csv inputs\disease.csv -e -f

## Call metawards
## Note: to prevent spamming the repo, the output folder has been changed to a local one here, you'll need to change this

mkdir -p raw_outputs

metawards -d ncov -o ../../../test --force-overwrite-output --input inputs/disease.csv -a inputs/seeds.dat --extractor inputs/only_i_per_ward::extract_only_i_per_ward -u inputs/constants.txt --iterator inputs/iterate --start-date 2020/01/01 --theme simple

