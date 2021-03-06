
create index ENVIRCTOR_COMMENTS_lwr on ENVIRONMENTAL_FACTOR(lower(COMMENTS)) PARALLEL NOLOGGING tablespace CAMOD;
create index ENVIRCTOR_CAS_NUMBER_lwr on ENVIRONMENTAL_FACTOR(lower(CAS_NUMBER)) PARALLEL NOLOGGING tablespace CAMOD;
create index ENVIRCTOR_NAME_ALTER_lwr on ENVIRONMENTAL_FACTOR(lower(NAME_ALTERN_ENTRY)) PARALLEL NOLOGGING tablespace CAMOD;
create index ENVIRCTOR_NAME_lwr on ENVIRONMENTAL_FACTOR(lower(NAME)) PARALLEL NOLOGGING tablespace CAMOD;
create index ENVIRCTOR_TYPE_ALTER_lwr on ENVIRONMENTAL_FACTOR(lower(TYPE_ALTERN_ENTRY)) PARALLEL NOLOGGING tablespace CAMOD;
create index ENVIRCTOR_TYPE_lwr on ENVIRONMENTAL_FACTOR(lower(TYPE)) PARALLEL NOLOGGING tablespace CAMOD;

EXIT;
