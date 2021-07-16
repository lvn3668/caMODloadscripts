-- Author Lalitha Viswanathan
-- cancerModel class, publication class, many to many association 
truncate table abs_can_mod_publication;
insert into abs_can_mod_publication select * from zstg_abs_can_mod_publication;
commit;
insert into abs_can_mod_publication(abs_cancer_model_id, publication_id) select distinct c.abscancermodelid, d.publication_id from zstg_tumor_ref a, zstg_reference r, zstg_mappingabstumor c, publication d where a.refkey = r.refkey and a.tumorkey = c.mtbtumorid and d.refkey = r.refkey and d.tumorkey = a.tumorkey; 
commit;

alter sequence hibernate_sequence increment by 100000000;
commit;
SELECT hibernate_sequence.NEXTVAL FROM dual;
alter sequence hibernate_sequence increment by 1;
commit;
SELECT hibernate_sequence.NEXTVAL FROM dual;
commit;
exit;
