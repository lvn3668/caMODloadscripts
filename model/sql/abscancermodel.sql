-- Author Lalitha Viswanathan
-- caMOD mapping tumor 
truncate table abs_cancer_model;
truncate table zstg_mappingabstumor;
insert into abs_cancer_model select * from zstg_abs_cancer_model;
commit;

-------------------------------------------------------------------------------
--------------------- Update abs cancer model ---------------------------------
update abs_cancer_model set state = 'Inactive' where external_source = 'Jax MTB' and state = 'Edited-approved';
--update abs_cancer_model set comments = 'Date of retrieval: May 2009';
commit;

exit;
