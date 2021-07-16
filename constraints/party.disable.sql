-- Author Lalitha Viswanathan
-- MTB Post process disable scripts 
alter table PARTY disable constraint SYS_C0029609;
alter table PARTY disable constraint SYS_C0029610;

alter table PARTY disable primary key;

EXIT;
