-- Author Lalitha Viswanathan
-- caMOD Disease class 
truncate table disease;
alter trigger disease_id_trigger disable;
insert into disease select * from zstg_disease;
commit;

-------------------------- Update disease table ----------------------------------------

var v_maxrow number;
COLUMN V_MAXROW NEW_VALUE V_MAXROW;

select max(disease_id)+1 as v_maxrow from disease;
drop sequence disease_id;
create sequence disease_id start with &v_maxrow;

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

insert into disease(name, concept_code) 
select distinct t.name, '000000' as concept_code from 
(select distinct tumorname as name from zstg_tumor 
MINUS
select distinct name from disease) t;
commit;

exit;
