-- Author Lalitha  Viswanathan
-- SQL Loader control file for Abstract Cancer Model (caMOD)
LOAD DATA 
 
INFILE '/cabio/cabiodb/caMOD/data/AbsCancerModel.txt'
APPEND
INTO TABLE  ABS_CANCER_MODEL
REENABLE DISABLED_CONSTRAINTS  
FIELDS TERMINATED BY "|"
TRAILING NULLCOLS
(
  ABS_CANCER_MODEL_ID,
  NOMENCLATURE_ID FILLER,
  MODEL_DESCRIPTOR,
  EXPERIMENT_DESIGN char(5000000),
  AVAILABILITY_ID,
  SMALLEST_TUMOR_KEY FILLER,
  STRAINGENNOTE FILLER,
  STRAINKEY FILLER,
  STRAIN FILLER,
  STRAINTYPES FILLER,
  TREATMENTTYPES FILLER,
  TREATMENTAGENTS FILLER, 
  STATE CONSTANT "Edited-approved",
  SUBMITTER_ID CONSTANT "50000000",
  PRINCIPAL_INVESTIGATOR_ID CONSTANT "50000001",
  URL CONSTANT "http://tumor.informatics.jax.org",
  IS_TOOL_STRAIN CONSTANT "0",
  PHENOTYPE_ID CONSTANT "50000000",
  STRAIN_ID CONSTANT "50000000",
  EXTERNAL_SOURCE CONSTANT "Jax MTB",
  ABS_CANCER_MODEL_TYPE CONSTANT "AM", 
  COMMENTS CONSTANT "Date of data retrieval: May 2009" 
)

into table NOMENCLATURE
APPEND
FIELDS TERMINATED by "|"
TRAILING NULLCOLS
(
  ABS_CANCER_MODEL_ID POSITION(1),
  NOMENCLATURE_ID,
  NAME,
  EXPERIMENT_DESIGN filler  char(500000),
  AVAILABILITY_ID filler,
  SMALLEST_TUMOR_KEY FILLER,
  STRAINGENNOTE FILLER,
  STRAINKEY FILLER,
  STRAIN FILLER,
  STRAINTYPES FILLER,
  TREATMENTTYPES FILLER,
  TREATMENTAGENTS FILLER 
)
