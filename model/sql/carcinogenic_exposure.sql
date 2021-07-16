-- Author Lalitha Viswanathan
-- caMOD carcinogen exposure
truncate table carcinogen_exposure;
insert into carcinogen_exposure select * from zstg_carcinogen_exposure;
commit; 

exit;
