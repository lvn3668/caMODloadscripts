#!/bin/sh
export BASE_DIR=/cabio/cabiodb/caMOD
export DATA_DIR=/cabio/cabiodb/caMOD/data
export INDEX_DIR=/cabio/cabiodb/caMOD/indexes
export CONSTRAINTS_DIR=/cabio/cabiodb/caMOD/constraints
export JLAB=/cabio/cabiodb/caMOD/jacksonLab
export ORACLE_HOME=/app/oracle/product/10gClient 
export SQLLDR=/app/oracle/product/10gClient/bin/sqlldr 
export SQLPLUS=/app/oracle/product/10gClient/bin/sqlplus 
export SCHEMA='DBI:Oracle:CAMODSTG' 
export DB=NCID1STG 
export UNAME='camodstg' 
export PASSWD='dzx349#q' 
export PATH=.:$ORACLE_HOME/bin:~/bin:$PATH


