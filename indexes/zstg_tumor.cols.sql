
create index ZSTG_UMOR_ABS_CANCER on ZSTG_TUMOR(ABS_CANCER_MODEL_ID) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_UMOR_HASIMAGES on ZSTG_TUMOR(HASIMAGES) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_UMOR_AGEOFDETEC on ZSTG_TUMOR(AGEOFDETECTION) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_UMOR_AGEOFONSET on ZSTG_TUMOR(AGEOFONSET) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_UMOR_TUMORFREQU on ZSTG_TUMOR(TUMORFREQUENCY) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_UMOR_REPRODUCTI on ZSTG_TUMOR(REPRODUCTIVESTATUS) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_UMOR_SEX on ZSTG_TUMOR(SEX) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_UMOR_ORGANAFFEC on ZSTG_TUMOR(ORGANAFFECTED) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_UMOR_ORGANKEY on ZSTG_TUMOR(ORGANKEY) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_UMOR_STRAINGENE on ZSTG_TUMOR(STRAINGENERALNOTE) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_UMOR_STRAINTYPE on ZSTG_TUMOR(STRAINTYPES) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_UMOR_STRAINNAME on ZSTG_TUMOR(STRAINNAME) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_UMOR_STRAINKEY on ZSTG_TUMOR(STRAINKEY) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_UMOR_TUMORNAME on ZSTG_TUMOR(TUMORNAME) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_UMOR_TUMORKEY on ZSTG_TUMOR(TUMORKEY) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_UMOR_TUMORID on ZSTG_TUMOR(TUMORID) PARALLEL NOLOGGING tablespace CAMOD;

EXIT;