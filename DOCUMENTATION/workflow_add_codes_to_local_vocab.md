
# Add codes to an existing local vocabulary (DRAFT)

For adding codes to a new vocabulary you first need: 
- A local vocabulary exists in the repository. There is a `vocabulary-info` file and a `usagi-extended` file. 
- A `usagi-extended` file with the new codes to add. 

The new  `usagi-extended` file can be created in 2 ways: 
- Creating a `usagi-extended-input` file, importing it in Usagi, saving as `usagi-extended`. 
- Directly creating a file in `usagi-extended` format. 



## 1. Create a new issue and associated branch 

Create a new issue with name  `updating local vocab <vocabulary_id>` and label `updating local vocabulary`. 
Create a new branch branching from `development` branch with name `<issue_id>-updating-local-vocab-<vocabulary_id>`, e.g.    `3-updating-local-vocab-ICD10fi`.
Gitlab can do this automatically for you.


## 2. Append new codes to existing vocabulary


TODO: use function appendCodesToVocabulary to merge the existing  `usagi-extended`  file and the  `usagi-extended` with the codes to update. 

This codes does: 
- If a code does not exists, it is append to the existing  `usagi-extended` with a non existing concept_id (highest concept_id is found and increment)
- If a code exists, they it is asked if the existing code wants to be replace. If yes, the new code is added with  a non existing concept_id and the old code is marked as "invalid".  

- Update vocabulary version, if only new codes have been added, they is a minor version, if old codes have been invalidated is a major verison 


....

....

## 4. Use R scripts to validate files and add them to vocabulary. 

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