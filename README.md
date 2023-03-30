# FinOMOP OMOP vocabularies 

This repository helps to maintain the mapping of Finnish medical codes to OMOP standard concepts. 
The repository includes:
- Mapping files in `usagi-extended` format (USAGI v1.4.0 format plus few additional columns) for multiple vocabularies. 
- Source code counts from different Finnish institutions for assessing mapping coverage. 
- A copy of USAGI v1.4.0 with prebuild indexes. 
- An ETL-ready instance of the OMOP-vocabulary tables with the Finnish vocabularies and selected vocabularies from Athena.  
- HTML dashboard to visualize mapping status, database coverage, and files QC. 

(this repo uses [ROMOPMappingTools](https://github.com/javier-gracia-tabuenca-tuni/ROMOPMappingTools))


# Quick reference

## For visualizing status 
(at the moment)

- Download  [StatusReport/dashboard.html](StatusReport/dashboard.html)
- Open it in a web browser. 

## For mappers 

- Download  [OMOP_VOCABULARIES/USAGI_with_FinnOMOP.zip](OMOP_VOCABULARIES/USAGI_with_FinnOMOP.zip)
- Unzip it
- Download the wanted `<vocabulary<.usagi.csv` file from the correct folder in [VOCABULARIES](VOCABULARIES)
- Open and edit in USAGI
- Save and upload back to repository when ready 

## For ETL

- Download  [OMOP_VOCABULARIES/output_omop_vocabulary.zip](OMOP_VOCABULARIES/output_omop_vocabulary.zip) 
- Unzip it
- Load in your local database 

## For maintainers 
See extended documentation in [DOCUMENTATION/README.md](./DOCUMENTATION/README.md)



