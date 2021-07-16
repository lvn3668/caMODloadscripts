-- Author Lalitha Viswanathan
-- caMOD Availability class
truncate table availability;
alter trigger availability_id_trigger disable;
insert into availability select * from zstg_availability;
commit;

--------------------------------------------------------------------------------
------------------------ Update availability -----------------------------------

var v_maxrow number;
COLUMN V_MAXROW NEW_VALUE V_MAXROW;

select max(availability_id)+1 as v_maxrow from availability;
drop sequence availability_id;
create sequence availability_id start with &v_maxrow;

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

insert into availability(entered_date, visible_to, release_date) values(SYSDATE, 'PUBLIC', SYSDATE);
commit;

exit;
