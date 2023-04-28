# How to set up development environment 

## Set up R environment 

You need to have R installed. 

We use [renv](https://rstudio.github.io/renv/index.html) package to keep a reproducible environment between users. 

Opening the R project [SCRIPTS/R_repo_management/R_repo_management.Rproj](../SCRIPTS/R_repo_management/R_repo_management.Rproj) in Rstudio will automatically install `renv` create a isolated R environment and install all the necessary packages. It also will warn if the R version needs to be updated. 


## Copy the Athena vocabulary files 

Navigate to the latest release in GitHub and download output_omop_vocabulary.zip. 
Unzip the contents in the folder OMOP_VOCABULARIES/input_omop_vocabulary/. 



