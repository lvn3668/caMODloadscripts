
create index ZSTG_ENCE_PMID_lwr on ZSTG_REFERENCE(lower(PMID)) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_ENCE_JNUM_lwr on ZSTG_REFERENCE(lower(JNUM)) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_ENCE_END_PAGES_lwr on ZSTG_REFERENCE(lower(END_PAGES)) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_ENCE_START_PAGE_lwr on ZSTG_REFERENCE(lower(START_PAGES)) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_ENCE_PAGES_lwr on ZSTG_REFERENCE(lower(PAGES)) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_ENCE_YEAR_lwr on ZSTG_REFERENCE(lower(YEAR)) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_ENCE_VOLUME_lwr on ZSTG_REFERENCE(lower(VOLUME)) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_ENCE_JOURNAL_lwr on ZSTG_REFERENCE(lower(JOURNAL)) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_ENCE_AUTHORS2_lwr on ZSTG_REFERENCE(lower(AUTHORS2)) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_ENCE_AUTHORS_lwr on ZSTG_REFERENCE(lower(AUTHORS)) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_ENCE_TITLE2_lwr on ZSTG_REFERENCE(lower(TITLE2)) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_ENCE_TITLE_lwr on ZSTG_REFERENCE(lower(TITLE)) PARALLEL NOLOGGING tablespace CAMOD;
create index ZSTG_ENCE_REFKEY_lwr on ZSTG_REFERENCE(lower(REFKEY)) PARALLEL NOLOGGING tablespace CAMOD;

EXIT;