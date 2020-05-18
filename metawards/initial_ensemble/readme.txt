This is the initial ensemble prepared for release from UQ4Covid.

TODO: Add a better description here (link to the vignette from Danny)

Description:
------------

data: The data folder which contains processed output ready for analysis
inputs: All required files to run the ensemble
raw_outputs: Raw data from the model

Design:
-------

The design for this run is detailed in the example here (https://github.com/UQ4covid/uq4covid.github.io/blob/master/vignettes/metawards_kextendedLHC.md)

The design was processed as follows:

python <uq_base>\tools\make_design\uq3a.py design.csv <uq_base>\model_config\metawards\limits.csv inputs\uq3a_out.csv -f
python <uq_base>\tools\make_design\uq3b.py inputs\uq3a_out.csv inputs\disease.csv -f

Where <uq_base> is the base path to the UQ4Covid directory

Inputs:
-------

Design file: inputs\design.csv
Transformed epidemiological variables: inputs\uq3a_out.csv
MetaWards disease input: inputs\disease.csv

Outputs:
--------

The raw_outputs folder contains all of the output data from MetaWards. Each run contains a console trace that includes the command string needed to replicate it.

The index file was created with the following command:

python <uq_base>\tools\make_design\uq4.py inputs\disease.csv raw_outputs data\uq4.csv -f

Where <uq_base> is the base path to the UQ4Covid directory

NOTE: This was completed on a version of MetaWards that did not support variable repeats, so there are two summary results folders (raw_outputs\repeats1 and raw_outputs\repeats5). The individual runs have been combined into the raw_outputs folder. Summary results are the SEIR categorical time-series data across the runs. The individual runs contain the infection count per ward in addition to each SEIR trace.

Making plots from MetaWards:
----------------------------

The summary files can create plots from MetaWards if required by running the following commands (replace <output folder> with your destination folder)

metawards-plot -i raw_outputs\repeats1 -o <output folder>
metawards-plot -i raw_outputs\repeats5 -o <output folder>

Processed data:
---------------

This is where the processed data tables will go (it is likely this will be sorted very soon). At the moment there is a single index file to make loading the data slightly easier be providing aliases to the output run folder names.

[WIP]