LOAD DATA 
INFILE "$DATA_DIR/METASTASES.txt"
REPLACE
INTO TABLE ZSTG_METASTASES 
REENABLE DISABLED_CONSTRAINTS  
FIELDS TERMINATED BY "	"
TRAILING NULLCOLS
(TUMORKEY,
  METASTASISKEY,
  METASTASISORGAN 
)
