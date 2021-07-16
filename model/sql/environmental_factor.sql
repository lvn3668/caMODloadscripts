-- Author Lalitha Viswanathan
-- Environmental Factor class
truncate table environmental_factor;
alter trigger envfactor_id_trigger disable;
insert into environmental_factor select * from zstg_environmental_factor;
commit;

-----------------------------------------------------------------------------
------------------ Update Environmental Factor ------------------------------

var v_maxrow number;
COLUMN V_MAXROW NEW_VALUE V_MAXROW;
select max(environmental_factor_id)+1 as v_maxrow from environmental_factor;
drop sequence env_factor_id;
create sequence env_factor_id start with &v_maxrow;


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

update zstg_agent z set z.agentnamemod =  (select distinct agentname from zstg_agentnames_trimmed t where z.agentkey = t.agentkey );
commit;
update zstg_agent x set x.agentnamemod = x.agentname where agentnamemod is null;
commit;

insert into environmental_factor(type_altern_entry, name_altern_entry) select distinct rtrim(agenttype), rtrim(agentnamemod) from zstg_agent 
MINUS
select distinct rtrim(type_altern_entry), rtrim(name_altern_entry) from environmental_factor;
commit;

exit;
