-- Author Lalitha Viswanathan
-- caMOD Image class
truncate table image;
alter trigger image_id_trigger disable;
insert into image select * from zstg_image;
commit;

var v_maxrow number;
COLUMN V_MAXROW NEW_VALUE V_MAXROW;

select max(image_id)+1 as v_maxrow from image;
drop sequence image_id;
create sequence image_id start with &v_maxrow;

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

insert into image(title, url_altern_entry, abs_cancer_model_id) 
select 'MTB data for '||tumorkey, 
'http://tumor.informatics.jax.org/mtbwi/tumorFrequencyDetails.do?key='||
tumorkey||'&'||'page=pathology', abs_cancer_model_id from zstg_tumor z where 
z.HASIMAGES = 1;
commit;

exit;
