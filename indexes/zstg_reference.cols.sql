
create index ZSTG_ENCE_PMID on ZSTG_REFERENCE(PMID) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_ENCE_JNUM on ZSTG_REFERENCE(JNUM) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_ENCE_END_PAGES on ZSTG_REFERENCE(END_PAGES) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_ENCE_START_PAGE on ZSTG_REFERENCE(START_PAGES) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_ENCE_PAGES on ZSTG_REFERENCE(PAGES) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_ENCE_YEAR on ZSTG_REFERENCE(YEAR) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_ENCE_VOLUME on ZSTG_REFERENCE(VOLUME) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_ENCE_JOURNAL on ZSTG_REFERENCE(JOURNAL) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_ENCE_AUTHORS2 on ZSTG_REFERENCE(AUTHORS2) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_ENCE_AUTHORS on ZSTG_REFERENCE(AUTHORS) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_ENCE_TITLE2 on ZSTG_REFERENCE(TITLE2) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_ENCE_TITLE on ZSTG_REFERENCE(TITLE) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_ENCE_REFKEY on ZSTG_REFERENCE(REFKEY) PARALLEL NOLOGGING tablespace CAMOD;

EXIT;