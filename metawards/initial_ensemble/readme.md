This is the initial ensemble prepared for release from UQ4Covid. All of the output data was created using MetaWards with version *0.12.0+3.g89cc2ebd* and the MetaWards UK dataset with version *0.4.0-5-g8969083*. Please see `raw_outputs\console.log.bz2` for a full configuration of how the model was run.

Directories:
------------

`data`: The data folder which contains processed output ready for analysis
`inputs`: All required files to run the ensemble
`raw_outputs`: Raw data from the model

Design:
-------

The design for this run is detailed in the example [here](https://github.com/UQ4covid/uq4covid.github.io/blob/master/vignettes/metawards_kextendedLHC.md)

The design was processed using the `uq4metawards` tools with the following command line script:

<pre>uq4metawards-pre inputs\design.csv <uq_base>\model_config\metawards\limits.csv inputs\disease.csv -e -f</pre>

Where `<uq_base>` is the base path to the UQ4Covid directory. The switches `-e` and `-f` create the epidemiology file and overwrite existing design files respectively.

Inputs:
-------

Design file can be found here: `inputs\design.csv`
Transformed epidemiological variables: `disease_epidemiology.csv`
MetaWards disease input file: `inputs\disease.csv`

Outputs:
--------

The `raw_outputs` folder contains all of the output data from MetaWards. Each run contains a console trace that includes the command string needed to replicate it. Summary results can be found in `raw_outputs\results.csv.bz2` are the SEIR categorical time-series data across the runs for a 'single ward' model formed as a cumulative sum of the electoral wards. The individual runs contain the infection count per ward in addition to each SEIR trace.

Making plots from MetaWards:
----------------------------

The summary files can create plots from MetaWards if required by running the following commands (replace <output folder> with your destination folder)

<pre>metawards-plot -i raw_outputs\ -o <output folder></pre>

Processed data:
---------------

The `data` folder contains some processed data tables which can be used to build emulators and perform analyses for uncertainty quantification. There are four data-sets in total which represent snapshots of the disease progression at specific days for each hypercube point. Each of the files beginning with `lads_*` are snapshots taken at the local authority (coarse) detail level, formed by accumulating all of the wards within each designated area. Files beginning with `wards_*` are snapshots taken at the electoral ward (fine) detail level.


 - `*_100.csv` are example tables which snapshot the disease at day 100 across the design hypercube
 - `./pre_lockdown_1/`: Tables on day 79, before lock-down policy 1 is initiated (restricted)
 - `./pre_lockdown_2/`: Tables on day 132, before lock-down policy 2 is initiated (relaxed)
 - `./pre_june/`: Tables just before 01/06/2020, coinciding with potential return to school policies
