This is an alternative initial ensemble prepared for release from UQ4Covid.

Description:
------------

data: The data folder which contains processed output ready for analysis
inputs: All required files to run the ensemble
raw_outputs: Raw data from the model

Design:
-------

The design for this run is a 50 point maximin LHS with 20 repeats per input.
There is a further 10 point maximin LHS with 20 repeats per input appended to 
the bottom of the design to use as a validation data set.

The design was processed as follows:

uq4metawards-uq3a inputs/design.csv ../../../uq4covid/model_config/metawards/limits.csv inputs/uq3a_out.csv -f
uq4metawards-uq3b inputs/uq3a_out.csv inputs/disease.csv -f

This assumes the "UQ4Covid" directory is in the same folder as "data"

Inputs:
-------

Design file: inputs\design.csv
Transformed epidemiological variables: inputs\uq3a_out.csv
MetaWards disease input: inputs\disease.csv

Outputs:
--------

The raw_outputs folder contains all of the output data from MetaWards. Each run contains a console trace that includes the command string needed to replicate it.

The index file was created with the following command:

uq4metawards-uq4 inputs/design.csv inputs/disease.csv raw_outputs ../../../MetaWardsData/model_data/2011Data/Ward_Lookup.csv ./index.csv 102 -f

This assumes the "UQ4Covid" and "MetaWardsData" directories are in the same 
folder as "data"

Making plots from MetaWards:
----------------------------

The summary files can create plots from MetaWards if required by running the following commands (replace <output folder> with your destination folder)

metawards-plot -i raw_outputs\repeats1 -o <output folder>
metawards-plot -i raw_outputs\repeats5 -o <output folder>

Processed data:
---------------

This is where the processed data tables will go (it is likely this will be sorted very soon). At the moment there is a single index file to make loading the data slightly easier be providing aliases to the output run folder names.

[WIP]
