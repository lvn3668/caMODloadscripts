-- Author Lalitha Viswanathan
-- caMOD Histopathology class
truncate table histopathology;
alter trigger histopathology_id_trigger disable;
insert into histopathology select * from zstg_histopathology;
commit;

update zstg_tumor z set z.ABS_CANCER_MODEL_ID = (select distinct abscancermodelid from zstg_mappingabstumor m where m.MTBTUMORID = z.TUMORKEY);
commit;

var v_maxrow number;
COLUMN V_MAXROW NEW_VALUE V_MAXROW;

select max(histopathology_id)+1 as v_maxrow from histopathology;
drop sequence histopathology_id;
create sequence histopathology_id start with &v_maxrow;

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

SET SCAN OFF;

insert into histopathology(age_of_onset, age_of_detection, tumor_incidence_rate, comments, abs_cancer_model_id, mtb_id, disease_id, organ_id)
select distinct ageofonset, ageofdetection, tumorfrequency, 'Disease Name Synonyms: '|| replace(to_char(tumorsynonyms), '|','&nbsp;&#8226;&nbsp;') || '<br>Reproductive Status: '||to_char(reproductivestatus) || '<br>Gender: '|| decode(to_char(Sex),'F', 'Female', 'M','Male', 'X', 'Mixed', 'U', 'Not specified'), abs_cancer_model_id, tumorkey, a.diseaseId, d.organId from zstg_tumor z, (select distinct min(d.DISEASE_ID) as diseaseId, d.NAME from disease d where substr(d.concept_code,0,1) in ('C','0') group by d.name ) a, (select distinct min(o.ORGAN_ID) as organId, o.NAME from organ o where substr(o.CONCEPT_CODE,0,1) in ('C','0') group by o.name) d where z.TUMORNAME = a.name and z.ORGANAFFECTED = d.NAME;
commit;

update histopathology h set h.PARENT_HISTOPATHOLOGY_ID = 
(select hi.HISTOPATHOLOGY_ID 
 from zstg_metastases z, histopathology hi, 
 zstg_tumor zt where
h.MTB_ID = z.METASTASISKEY and z.TUMORKEY = zt.TUMORKEY 
and zt.ABS_CANCER_MODEL_ID = hi.ABS_CANCER_MODEL_ID and  
zt.TUMORKEY = hi.MTB_ID and 
h.ABS_CANCER_MODEL_ID = zt.ABS_CANCER_MODEL_ID); 
commit;

update histopathology h set h.ABS_CANCER_MODEL_ID = null where
h.MTB_ID in ( 
select distinct h.MTB_ID from histopathology h, zstg_tumor z 
where h.mtb_id = z.tumorkey and 
h.abs_cancer_model_id = z.abs_cancer_model_id and 
z.TUMORKEY in (select distinct metastasiskey from zstg_metastases)
);
commit;

exit;
