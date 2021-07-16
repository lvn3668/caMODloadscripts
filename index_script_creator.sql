rem -----------------------------------------------------------------------
rem Filename:   idxrecr8.sql
rem Purpose:    Script to spool a listing of all drop and create statements 
rem             required to rebuild indexes.
rem Notes:      Will build all non-sys/system indexes
rem Date:       10-Oct-1998
rem Author:     Anonymous
rem -----------------------------------------------------------------------

set linesize 300;
set pagesize 10000;
set long 50;
set trimspool on;
set termout off;
set echo off;
set feedback off;
set heading off;
set verify off;

col dummy       noprint format a10 wrap word;
col dummy2      noprint format a1 wrap word;
col index_name  noprint format a1 wrap word;
col command     format a10 wrap word;

VAR tabName VARCHAR2(50);
COLUMN tabName NEW_VALUE tabName;
SELECT lower('&1') AS tabName FROM dual;

spool /cabio/cabiodb/caMOD/indexes/&tabName..drop.sql
SELECT 'drop index ' || A.index_name || ';' FROM user_indexes A WHERE lower(
A.table_name) = lower('&1');
SELECT 'EXIT;' FROM dual;
spool off;


spool /cabio/cabiodb/caMOD/indexes/&tabName..lower.sql 
SELECT 'create index ' || substr(A.table_name, 1, 5) || substr(A.table_name, -4) || '_' || substr(A.column_name, 1, 10) || '_lwr on ' || A.table_name || 
'(lower(' || A.column_name || ')) PARALLEL NOLOGGING tablespace ' || nvl(
B.tablespace_name, 'CABIO_FUT') || ';' FROM user_tab_columns A, user_tables B 
WHERE lower(A.table_name) = lower('&1') AND A.table_name = B.table_name AND 
A.data_type LIKE '%VARCHAR%' AND A.column_name <> 'BIG_ID';

SELECT 'EXIT;' FROM dual;
spool off;

spool /cabio/cabiodb/caMOD/indexes/&tabName..cols.sql

SELECT 'create index ' || substr(A.table_name, 1, 5) || substr(A.table_name, -4) || '_' || substr(A.column_name, 1, 10) || ' on ' || A.table_name || '(' 
|| A.column_name || ') PARALLEL NOLOGGING tablespace ' || nvl(
B.tablespace_name, 'CABIO_FUT') || ';' FROM user_tab_columns A, user_tables B 
WHERE lower(A.table_name) = lower('&1') AND A.table_name = B.table_name AND 
A.data_type <> 'CLOB' AND A.column_name <> 'BIG_ID';

SELECT 'EXIT;' FROM dual;
spool off;

set heading on;
set pagesize 100;
set termout on;
set echo on;
--set feedback on;
set heading on;
set verify on;

exit;
