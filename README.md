
! This is a partial copy from the private repository [github.com/FinOMOP/FinOMOP_OMOP_vocabulary](https://github.com/FinOMOP/FinOMOP_OMOP_vocabulary) used for demostration and testing porpuses!

# FinOMOP OMOP vocabularies 

This repository helps to maintain the mapping of Finnish medical codes to OMOP standard concepts. 

The repository track the changes of :
- Mapping files in `usagi-extended` format (USAGI v1.4.0 format plus few additional columns) for multiple vocabularies. 
- Source code counts from different Finnish institutions for assessing mapping coverage. 

The repository stores for each release :
- A copy of the OMOP-vocabulary tables downloaded from Athena with the vocabularies agrred by the FinOMOP group. 
- A copy of USAGI v1.4.0 with prebuild indexes using the avobe tables. 
- An ETL-ready instance of the OMOP-vocabulary tables with the Finnish vocabularies and selected vocabularies from Athena.  
- HTML dashboard to visualize mapping status, database coverage, and quality check of files. 

(this repo uses the companion R package [ROMOPMappingTools](https://github.com/FinOMOP/ROMOPMappingTools))

# Quick reference

## For visualizing status 
(at the moment)

- Download  [StatusReport/dashboard.html](StatusReport/dashboard.html)
- Open it in a web browser. 

## For mappers 

- Navigate to the latest releas and download USAGI_with_FinnOMOP.zip
- Unzip it
- Download the wanted `<vocabulary>.usagi.csv` file from the correct folder in [VOCABULARIES](VOCABULARIES)
- Open and edit in USAGI
- Save and upload back to the repository when ready 

## For ETL

- Navigate to the latest releas and download output_omop_vocabulary.zip
- Unzip it
- Load in your local database 

## For maintainers 
See extended documentation in [DOCUMENTATION/README.md](./DOCUMENTATION/README.md)




