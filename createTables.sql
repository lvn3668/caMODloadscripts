---- Name: createTables.sql
---- Author: Lalitha Viswanath
---- Date:
---- Comment: Creates tables necessary to load caMOD data
---- Comment: Creates sequences and triggers necessary for caMOD data load

---- Create intermediate Jackson Lab table

CREATE  TABLE JACKSON_LAB_TMP2
(
  MTB_ID               VARCHAR2(255 BYTE),
  TUMOR_NAME           VARCHAR2(255 BYTE),
  TUMOR_SYNONYMS       CLOB,
  STRAIN_KEY           VARCHAR2(255 BYTE),
  STRAIN_NAME          VARCHAR2(255 BYTE),
  STRAIN_TYPES         VARCHAR2(255 BYTE),
  STRAIN_GENERAL_NOTE  VARCHAR2(255 BYTE),
  TREATMENT_TYPE       VARCHAR2(255 BYTE),
  TREATMENT_AGENTS     VARCHAR2(255 BYTE),
  ORGAN_KEY            VARCHAR2(255 BYTE),
  ORGAN_AFFECTED       VARCHAR2(255 BYTE),
  METASTASIZED_TO      CLOB,
  MTBIDS_OF_METS       VARCHAR2(255 BYTE),
  SEX                  VARCHAR2(255 BYTE),
  REPRODUCTIVE_STATUS  VARCHAR2(255 BYTE),
  TUMOR_FREQUENCY      VARCHAR2(255 BYTE),
  AGE_OF_ONSET         VARCHAR2(255 BYTE),
  AGE_OF_DETECTION     VARCHAR2(255 BYTE),
  REFERENCES           VARCHAR2(255 BYTE),
  STRAIN_SYNONYMS      VARCHAR2(2500 BYTE)
);
 
-------------------------------------------------------
---- Create MTB Agent table

CREATE  TABLE ZSTG_AGENT
(
  AGENTKEY   VARCHAR2(2500 BYTE)                NOT NULL,
  AGENTTYPE  VARCHAR2(2500 BYTE)                NOT NULL,
  AGENTNAME  VARCHAR2(2500 BYTE)                NOT NULL,
  AGENTNAMEMOD  VARCHAR2(2500 BYTE)             
);
 
------------------------------------------------------------
------ Create MTB Tumor table

CREATE  TABLE ZSTG_MAPPINGABSTUMOR
(
  MTBTUMORID         VARCHAR2(2500 BYTE),
  ABSCANCERMODELID   VARCHAR2(2500 BYTE),
  NOMENCLATURE_ID    VARCHAR2(2500 BYTE),
  NAME               VARCHAR2(2500 BYTE),
  EXPERIMENT_DESIGN  CLOB,
  AVAILABILITY_ID    VARCHAR2(2500 BYTE),
  MTBTUMORID_FILLER  VARCHAR2(2500 BYTE),
  STRAINGENNOTE      VARCHAR2(2500 BYTE),
  STRAINKEY          VARCHAR2(2500 BYTE),
  STRAIN             VARCHAR2(2500 BYTE),
  STRAINTYPES        VARCHAR2(2500 BYTE),
  TREATMENTTYPES     VARCHAR2(2500 BYTE),
  TREATMENTAGENTS    VARCHAR2(2500 BYTE)
);
 
-----------------------------------------------------
--------- Create MTB Metastases table

CREATE  TABLE ZSTG_METASTASES
(
  TUMORKEY         NUMBER                       NOT NULL,
  METASTASISKEY    NUMBER                       NOT NULL,
  METASTASISORGAN  VARCHAR2(2500 BYTE)          NOT NULL
);
 
CREATE  TABLE ZSTG_METASTASES_COMBINED
(
  TUMORKEY         VARCHAR2(2500 BYTE)          NOT NULL,
  METASTASISKEY    VARCHAR2(2500 BYTE)          NOT NULL,
  METASTASISORGAN  VARCHAR2(4000 BYTE)          NOT NULL
);
 
---------------------------------------------------
---------- Create MTB Tumor table

CREATE  TABLE ZSTG_TUMOR
(
  TUMORID              VARCHAR2(2500 BYTE)      ,
  TUMORKEY             VARCHAR2(2500 BYTE)      ,
  TUMORNAME            VARCHAR2(2500 BYTE)      ,
  TUMORSYNONYMS        CLOB                     ,
  STRAINKEY            VARCHAR2(2500 BYTE)      ,
  STRAINNAME           VARCHAR2(2500 BYTE)      ,
  STRAINSYNONYMS       CLOB                     ,
  STRAINTYPES          VARCHAR2(2500 BYTE)      ,
  STRAINGENERALNOTE    VARCHAR2(2500 BYTE),
  ORGANKEY             VARCHAR2(2500 BYTE)      ,
  ORGANAFFECTED        VARCHAR2(2500 BYTE)      ,
  SEX                  VARCHAR2(2500 BYTE)      ,
  REPRODUCTIVESTATUS   VARCHAR2(2500 BYTE),
  TUMORFREQUENCY       VARCHAR2(2500 BYTE),
  AGEOFONSET           VARCHAR2(2500 BYTE),
  AGEOFDETECTION       VARCHAR2(2500 BYTE),
  HASIMAGES            VARCHAR2(2500 BYTE)      ,
  ABS_CANCER_MODEL_ID  NUMBER
);
 
----------------------------------------------------
------- Create table to associate tumor with agent

CREATE  TABLE ZSTG_TUMOR_AGENT
(
  TUMORKEY  VARCHAR2(2500 BYTE)                 NOT NULL,
  AGENTKEY  VARCHAR2(2500 BYTE)                 NOT NULL
);
 

CREATE  TABLE ZSTG_TUMOR_AGENTNAME_COMBINED
(
  TUMORKEY   VARCHAR2(2500 BYTE)                NOT NULL,
  AGENTNAME  VARCHAR2(2500 BYTE)                NOT NULL,
  AGENTTYPE  VARCHAR2(2500 BYTE)                NOT NULL
);
 
---------------------------------------------------
---- create reference table

CREATE TABLE ZSTG_REFERENCE
(REFKEY VARCHAR2(2500),
  TITLE VARCHAR2(2500),
  TITLE2 VARCHAR2(2500),
  AUTHORS  VARCHAR2(2500),
  AUTHORS2  VARCHAR2(2500),
  JOURNAL  VARCHAR2(2500),
  VOLUME  VARCHAR2(2500),
  YEAR  VARCHAR2(2500),
  PAGES  VARCHAR2(2500),
  START_PAGES  VARCHAR2(2500),
  END_PAGES  VARCHAR2(2500),
  JNUM  VARCHAR2(2500),
  PMID VARCHAR2(2500));


CREATE  TABLE ZSTG_TUMOR_REF
(
  TUMORKEY  VARCHAR2(2500 BYTE)                 NOT NULL,
  REFKEY    VARCHAR2(2500 BYTE)                 NOT NULL
);
 
CREATE  TABLE ZSTG_TUMOR_REFERENCE_COMBINED
(
  TUMORKEY       VARCHAR2(2500 BYTE)            NOT NULL,
  JNUM_COMBINED  VARCHAR2(2500 BYTE)            NOT NULL
);
 
-----------------------------------------------------------
------------ Create sequences

create sequence availability_id;
create or replace trigger availability_id_trigger  
BEFORE INSERT
ON availability
FOR EACH ROW
BEGIN
  SELECT availability_id.NEXTVAL
  INTO :NEW.availability_id
  FROM DUAL;
END;
/

create sequence disease_id;
create or replace trigger disease_id_trigger
BEFORE INSERT
ON disease
FOR EACH ROW
BEGIN
  SELECT disease_id.NEXTVAL
  INTO :NEW.disease_id
  FROM DUAL;
END;
/
create sequence env_factor_id;
CREATE OR REPLACE TRIGGER envfactor_id_trigger
BEFORE INSERT
ON ENVIRONMENTAL_FACTOR
FOR EACH ROW
BEGIN
  SELECT env_factor_ID.NEXTVAL
  INTO :NEW.environmental_factor_ID
  FROM DUAL;
END;
/

create sequence histopathology_id;
create or replace trigger histopathology_id_trigger
BEFORE INSERT
ON histopathology
FOR EACH ROW
BEGIN
  SELECT histopathology_id.NEXTVAL
  INTO :NEW.histopathology_id
  FROM DUAL;
END;
/

create sequence image_id;
create or replace trigger image_id_trigger
BEFORE INSERT
ON image
FOR EACH ROW
BEGIN
  SELECT image_id.NEXTVAL
  INTO :NEW.image_id
  FROM DUAL;
END;
/

create sequence organ_id;
create or replace trigger organ_id_trigger
BEFORE INSERT
ON organ
FOR EACH ROW
BEGIN
  SELECT organ_id.NEXTVAL
  INTO :NEW.organ_id
  FROM DUAL;
END;
/
-- ZSTG_AGENTNAMES_TRIMMED  (Table) 
--
CREATE TABLE ZSTG_AGENTNAMES_TRIMMED ( AGENTKEY NUMBER NULL, AGENTNAME VARCHAR2(4000 BYTE) NULL );
/



--------------- Create backup
create table zstg_abs_can_mod_publication as select * from abs_can_mod_publication;
create table zstg_abs_cancer_model as select * from abs_cancer_model;
create table zstg_availability as select * from availability;
create table zstg_carcinogen_exposure as select * from carcinogen_exposure;
create table zstg_disease as select * from disease;
create table zstg_environmental_factor as select * from environmental_factor;
create table zstg_histopathology as select * from histopathology;
create table zstg_image as select * from image;
create table zstg_nomenclature as select * from nomenclature;
create table zstg_organ as select * from organ;
create table zstg_party as select * from party;
create table zstg_publication as select * from publication;

exit;
