-- Author Lalitha Viswanathan
-- SQL Loader Control file for Carcinogenic Exposure
LOAD DATA 
 
INFILE '/cabio/cabiodb/caMOD/data/CarcinogenicExposure.txt'
APPEND 
into table CARCINOGEN_EXPOSURE 
FIELDS TERMINATED BY "|"
(
  CARCINOGEN_EXPOSURE_ID,
  ABS_CANCER_MODEL_ID,
  ENVIRONMENTAL_FACTOR_ID
)
