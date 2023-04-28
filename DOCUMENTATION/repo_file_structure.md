# Repository folder structure

- README.md : basic repo info. 
- NEWS.md : over all repo change log.


## VOCABULARIES

This folder contains one subfolder for each of the local vocabularies, and one file "vocabularies_info.csv".
Subfolders are, typically, named as the vocabulary_id. 
Each vocabulary subfolder contains the following files: 

- <vocabulary_id>/<vocabulary_id>.info.csv: File with the `concept_id`s, `vocabulary_id`, and `concept_class_id` needed to create the vocabulary in OMOP format. File must follow the in `vocabulary-info` file format. 
- <vocabulary_id>/<vocabulary_id>.usagi.csv: File with the codes, mapping to standard concepts, and additional information to create the vocabulary in OMOP format. File must follow the in `usagi-extended` file format. 
- <vocabulary_id>/NEWS.md: File with local vocabulary change log. 
- (optionally)<vocabulary_id>/<vocabulary_id>.usagi.input.csv: if `usagi-extended` has been created using a `usagi-extended-input`, then the `usagi-extended-input` can be also stored here.
- (optionally)<vocabulary_id>/source/: This folder, includes, if available source files and/or scripts used to create  `usagi-extended` or `usagi-extended-input`. 


"vocabularies_info.csv" file contain links to each of the subfolder files to be processed and some additional info per vocabulary. 
This file must follow the in `vocabularies-info` format. 

## OMOP_VOCABULARIES

- FinOMOP_selecting_Athena_vocabularies.csv: File with the list of official vocabularies from Athena used by the FinOMOP members. 
- input_omop_vocabulary/: This folder is used to store the omop vocabulary tables downloaded from Athena. In the remote repository, it only contains a readme.md file to keep the folder tracked. 
- temp_omop_vocabulary/: This folder is used to store the omop vocabulary tables generated from the `usagi` files . In the remote repository, it only contains a readme.md file to keep the folder tracked. 
- output_omop_vocabulary/: This folder is used to store the merged omop vocabulary tables from input_omop_vocabulary and temp_omop_vocabulary. In the remote repository, it only contains a readme.md file to keep the folder tracked. 

## CODE_COUNTS

- databases/ : folder with one file with code counts for each database. Files must follow the `code-counts` file format. 
- database_coverage.csv: file with links and information each of the code counts files in `databases/`.  This file must follow the in `database-coverage` file format. 
- vocabularies_coverage: file that defines how to calculate the codes coverages for each vocabulary. This file must follow the in `vocabularies-coverage` format. 


## SCRIPTS

Scripts used to automatized task in the repository.  

- R_repo_management/: Subfolder with scripts in R. This folder contains the necessary files to reproduce the development environment ([how to set up development environment](./how_to_set_up_development_enviroment.md)). 
- R_repo_management/R_scripts: contain scripts in R for automatized task in the repository. 
- R_repo_management/R: contains common functions used by the scripts in R_scripts. 
- R_repo_management/R_scripts/update_repository.R: main script to validate changes in the repository, transform the  `usagi-extended` and `vocabulary-info` to OMOP format, and build the Status Dasboard. 



## DOCUMENTATION 

Multiple markdown files with documentation. README.md connects them all with an index. 



## StatusReport

Status dashboard. 