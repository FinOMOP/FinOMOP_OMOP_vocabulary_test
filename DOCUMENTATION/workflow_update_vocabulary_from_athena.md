
# Update the OMOP vocabulary from Athena


## 1. Create a new issue and associated branch 

Create a new issue with name  `OMOP vocab update <vocabulary_id>` and label `OMOP vocab update`. 
Create a new branch branching from `development` branch with name `<issue_id>-omop-vocab-vocab-<date>`,
 e.g. `3-omop-vocab-vocab-09022023`. Gitlab can do this automatically for you.


## 2. Download vocabulary
  
- Download vocabulary from Athena with the vocabularies agreed in [OMOP_VOCABULARIES/FinOMOP_selecting_Athena_vocabularies.csv](../OMOP_VOCABULARIES/FinOMOP_selecting_Athena_vocabularies.csv).  If the update is meant to add a new vocabulary, then mark that in the table !!. 
- Run cpt script. Unzip and run cpt command with token in [OMOP_VOCABULARIES/cpt_token.txt](../OMOP_VOCABULARIES/cpt_token.txt). This may take up to 8h !!. 
- Zip the updated vocabularies into [OMOP_VOCABULARIES/input_omop_vocabulary.zip](../OMOP_VOCABULARIES/input_omop_vocabulary.zip) so that they get updated in the repository. 


 ## 3. Update Usagi

 - If you haven't already, unzip the [OMOP_VOCABULARIES/input_omop_vocabulary.zip](../OMOP_VOCABULARIES/USAGI_with_FinnOMOP.zip) file. 
 - Open the `Usagi_v1.4.3.jar` within the unziped folder. 
 - Once Usagui is running, go to `help > rebuild index`. There set the path to the vocabulary you have downloaded from Athena and updated with cpt script. This takes up to 3h !!. 
 - Once the index are build, you can close Usagi and zip the folder back to [OMOP_VOCABULARIES/input_omop_vocabulary.zip](../OMOP_VOCABULARIES/USAGI_with_FinnOMOP.zip), so that it gets updated in the repo. 


## 4. Update all mapping 

Open one by one all the `usagi-extende` files in the Usagi with the new mappings and correct the `invalid targets`. 

Or at least save the usagi file with the new `invalid targets`. 




 
## 5. Use R scripts to validate files and add them to vocabulary. 

Run script in [SCRIPTS/R_repo_management/R_scripts/update_repository.R](../SCRIPTS/R_repo_management/R_scripts/update_repository.R). (see [how to setup development enviroment](./how_to_set_up_development_enviroment.md)). 

The steps in this script: 
- Checks you have format `vocabularies-info`, `vocabulary-info`, and `usagi-extended` files  correctly. 
- Convers all the vocabularies, including the one you just added into OMOP vocabulary tables. 
- Merges the FinOMOP vocabulary tables with the OMOP tables from Athena. 
- Check for errors in the resulting merged tables. 
- Builds the status report dashboard from `vocabulary-coverage`. 

## 6. Upload changes 

If the R scrips pass all the test and your vocabulary appears in the  Status-Dashboard, then you are ready to send your work. 

1. Zip the new vocabulary tables in [OMOP_VOCABULARIES/output_omop_vocabulary/](../OMOP_VOCABULARIES/output_omop_vocabulary/) into a zip file replacing 
[OMOP_VOCABULARIES/output_omop_vocabulary.zip](../OMOP_VOCABULARIES/output_omop_vocabulary.zip). 
2. Commint your last work and create a pull-request towards the `development` branch. 
3. Wait. A repository maintainer will evaluate your changes and if correct will merge your vocabulary to the `development` branch.  