-- Author Lalitha Viswanathan
-- Organ class 
truncate table organ;
alter trigger organ_id_trigger disable;
insert into organ select * from zstg_organ;
commit;

---------------------------------------------------------------------------
----------------------- Update ORGAN --------------------------------------

var v_maxrow number;
COLUMN V_MAXROW NEW_VALUE V_MAXROW;

select max(organ_id)+1 as v_maxrow from organ;
drop sequence organ_id;
create sequence organ_id start with &v_maxrow;

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

insert into organ(name, concept_code) 
select distinct t.organaffected, '000000' as CONCEPT_CODE from 
(select distinct organaffected from zstg_tumor 
MINUS
select distinct name from organ) t;
commit;
exit;
