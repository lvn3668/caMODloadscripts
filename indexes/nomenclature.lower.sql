
create index NOMENTURE_NAME_lwr on NOMENCLATURE(lower(NAME)) PARALLEL NOLOGGING tablespace CAMOD;

EXIT;