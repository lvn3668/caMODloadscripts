-- Author Lalitha Viswanathan
-- Nomenclature class
truncate table nomenclature;
insert into nomenclature select * from zstg_nomenclature;
commit; 

exit;
