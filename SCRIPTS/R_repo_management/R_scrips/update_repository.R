


# setup paths -------------------------------------------------------------------

base_path <- here::here("../../")

path_to_input_mapping_vocabularies_info_file <- file.path(base_path, "VOCABULARIES", "vocabularies_info.csv")
path_to_input_omop_vocabulary_folder <- file.path(base_path, "OMOP_VOCABULARIES", "input_omop_vocabulary")
path_to_input_database_counts_file <- file.path(base_path, "CODE_COUNTS", "databases_coverage.csv")
path_to_input_vocabularies_coverage_file <- file.path(base_path, "CODE_COUNTS", "vocabularies_coverage.csv")
path_to_temp_omop_vocabulary_folder <- file.path(base_path, "OMOP_VOCABULARIES", "temp_omop_vocabulary")
path_to_output_omop_vocabulary_folder <- file.path(base_path, "OMOP_VOCABULARIES", "output_omop_vocabulary")
path_to_output_dashboard_file <- file.path(base_path, "StatusReport", "dashboard.html")




# Import mapping tables  ---------------------------------------------
#
# - Reads the  VOCABULARIES/vocabularies_info.csv.
# - It throws an error if vocabularies_info.csv has the wrong format.
# - Reads all the vocabulary-info and usagi-extended files defined in VOCABULARIES/vocabularies_info.csv, unless `ignore` column is TRUE.
#

mapping_tables <- ROMOPMappingTools::importMappingTables(path_to_input_mapping_vocabularies_info_file)


usagi_mapping_tables <- mapping_tables$usagi_mapping_tables
vocabulary_info_mapping_tables <- mapping_tables$vocabulary_info_mapping_tables


# Validate mapping tables  ---------------------------------------------
#
# - It throws an error if any of usagi-extended has the wrong format.
# - It throws an error if any of vocabulary-info  has the wrong format.
#

usagi_mapping_tables <- usagi_mapping_tables |>
  ROMOPMappingTools::validateTables("UsagiForCCR")

usagi_mapping_tables_with_errors <- usagi_mapping_tables |>
  dplyr::filter(n_failed_rules!=0)

if(nrow(usagi_mapping_tables_with_errors)>1){ stop("error in usagi tables: ", usagi_mapping_tables_with_errors$name)}


vocabulary_info_mapping_tables <- vocabulary_info_mapping_tables |>
  ROMOPMappingTools:::validateTables("VocabularyInfo")

vocabulary_info_mapping_tables_with_errors <- vocabulary_info_mapping_tables |>
  dplyr::filter(n_failed_rules!=0)

if(nrow(vocabulary_info_mapping_tables_with_errors)>1){ stop("error in usagi tables: ", vocabulary_info_mapping_tables_with_errors$name)}



# Convert mapping files to OMOP tables  -----------------------------------
#
# - Take all loaded and correctly format vocabularies and convert them into the OMOP vocabulary tables:
# CONCEPT.csv, CONCEPT_RELATIONSIP.csv, CONCEPT_SYNONIM.csv, VOCABULAY.csv, CONCEPT_CLASS.csv
# - these are saved in path_to_temp_omop_vocabulary_folder
#

ROMOPMappingTools::convertMappingsTablesToOMOPtables(
  usagi_mapping_tables,
  vocabulary_info_mapping_tables,
  path_to_temp_omop_vocabulary_folder,
  ignore_failed_rules = FALSE
)



# Merge new vocabulary tables with vocabulary tables from Athena-----------
#
# Merge vocabulary tables created in path_to_temp_omop_vocabulary_folder to the vocabulary tables downloaded from Athena
# stored in path_to_input_omop_vocabulary_folder, and save the resulting table into path_to_output_omop_vocabulary_folder
#

ROMOPMappingTools::mergeOMOPtables(
  path_to_input_omop_vocabulary_folder,
  path_to_temp_omop_vocabulary_folder,
  path_to_output_omop_vocabulary_folder)



# Validate the newly created vocabularies --------------------------------
#
# Usese DataQualityDashboard to errors in the tables in path_to_output_omop_vocabulary_folder.
# For example, all concept_ids are unique, codes per vocabulary are unic, vocabulary_ids are correct, etc
#

connection_details_omop_tables <- ROMOPMappingTools::createTemporalDatabaseWithOMOPtable(path_to_output_omop_vocabulary_folder)
results_DQD <- ROMOPMappingTools::validateOMOPtablesWithDQD(connection_details_omop_tables)


# Calculate databases coverage ------------------------------------------------------
#
# - Reads databases code-counts files
# - Fix some common errors done in the  code-counts files. e.g. merge duplicate code counts, remove counts with less than 5.
#

databases_code_counts_tables <- ROMOPMappingTools::importDatabasesCodeCountsTables(path_to_input_database_counts_file)
databases_code_counts_tables <- ROMOPMappingTools::validateTables(databases_code_counts_tables, table_type = "CodeCounts")

# stop if errors
if(sum(databases_code_counts_tables$n_failed_rules)!=0){
  databases_code_counts_tables
  stop("errors in databases_code_counts_tables")
}



# Build Status-Dashboard ---------------------------------------------------
#
# Creates Status-Dashboard in path_to_output_dashboard_file
# Opens it in the browser
#


mapping_status <- ROMOPMappingTools::calculateMappingStatus(
  path_to_input_vocabularies_coverage_file,
  connection_details_omop_tables,
  databases_code_counts_tables)

# uncomment if want to see results before build dasboard
# ROMOPMappingTools::plotTableMappingStatus(mapping_status)
# ROMOPMappingTools::plotTableVocabularyStatus(mapping_status, "ICD10fi")

tmp_html <- path_to_output_dashboard_file

ROMOPMappingTools::buildStatusDashboard(
  usagi_mapping_tables = usagi_mapping_tables,
  vocabulary_info_mapping_tables = vocabulary_info_mapping_tables,
  results_DQD  = results_DQD,
  databases_code_counts_tables = databases_code_counts_tables,
  mapping_status  = mapping_status,
  output_file_html = tmp_html)

# open in browser
browseURL(tmp_html)







