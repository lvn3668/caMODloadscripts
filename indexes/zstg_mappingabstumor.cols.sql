
create index ZSTG_UMOR_TREATMENTA on ZSTG_MAPPINGABSTUMOR(TREATMENTAGENTS) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_UMOR_TREATMENTT on ZSTG_MAPPINGABSTUMOR(TREATMENTTYPES) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_UMOR_STRAINTYPE on ZSTG_MAPPINGABSTUMOR(STRAINTYPES) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_UMOR_STRAIN on ZSTG_MAPPINGABSTUMOR(STRAIN) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_UMOR_STRAINKEY on ZSTG_MAPPINGABSTUMOR(STRAINKEY) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_UMOR_STRAINGENN on ZSTG_MAPPINGABSTUMOR(STRAINGENNOTE) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_UMOR_MTBTUMORID on ZSTG_MAPPINGABSTUMOR(MTBTUMORID_FILLER) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_UMOR_AVAILABILI on ZSTG_MAPPINGABSTUMOR(AVAILABILITY_ID) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_UMOR_NAME on ZSTG_MAPPINGABSTUMOR(NAME) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_UMOR_NOMENCLATU on ZSTG_MAPPINGABSTUMOR(NOMENCLATURE_ID) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_UMOR_ABSCANCERM on ZSTG_MAPPINGABSTUMOR(ABSCANCERMODELID) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_UMOR_MTBTUMORID on ZSTG_MAPPINGABSTUMOR(MTBTUMORID) PARALLEL NOLOGGING tablespace CAMOD;

EXIT;
