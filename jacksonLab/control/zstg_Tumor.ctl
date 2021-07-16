LOAD DATA 
INFILE "$DATA_DIR/TUMOR.txt"
REPLACE
INTO TABLE ZSTG_TUMOR 
REENABLE DISABLED_CONSTRAINTS  
FIELDS TERMINATED BY "	"
TRAILING NULLCOLS
(TUMORID,
 TUMORKEY,
 TUMORNAME,
 TUMORSYNONYMS char(50000),
 STRAINKEY,
 STRAINNAME,
 STRAINSYNONYMS char(50000),
 STRAINTYPES,
 STRAINGENERALNOTE,
 ORGANKEY,
 ORGANAFFECTED,
 SEX,
 REPRODUCTIVESTATUS,
 TUMORFREQUENCY,
 AGEOFONSET,
 AGEOFDETECTION,
 HASIMAGES 
)