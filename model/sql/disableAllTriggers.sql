-- Author Lalitha Viswanathan
-- caMOD
-- Script to disable all triggers in caMOD Model
alter table availability disable all triggers;
alter table disease disable all triggers;
alter table environmental_factor disable all triggers;
alter table histopathology disable all triggers;
alter table image disable all triggers;
alter table organ disable all triggers;
alter table publication disable all triggers;

exit;
