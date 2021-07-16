#!/bin/sh
# housekeeping operations like truncating tables, dropping indexes, etc
-- Author Lalitha Viswanathan
-- preprocess for caMOD tables
echo ****Dropping indexes, disabling constraints, disabling triggers
cd $JLAB
sh preprocess.sh $1 

echo ****Loading data into staging tables from `pwd`

cd $JLAB/control
rm *.bad *.log
echo ****Loading zstg_agent 

$SQLLDR $1  rows=1000 silent=HEADER direct=TRUE   control=zstg_Agent.ctl log=zstg_Agent.log bad=zstg_Agent.bad errors=5000 skip=1

echo ****Loading zstg_metastases

$SQLLDR $1  rows=1000 silent=HEADER direct=TRUE  control=zstg_Metastases.ctl log=zstg_Metastases.log bad=zstg_Metastases.bad errors=5000 skip=1

echo ****Loading zstg_tumor

$SQLLDR $1  rows=1000 silent=HEADER direct=TRUE  control=zstg_Tumor.ctl log=zstg_Tumor.log bad=zstg_Tumor.bad errors=5000 skip=1

echo ****Loading zstg_reference

$SQLLDR $1  rows=1000 silent=HEADER direct=TRUE  control=zstg_Reference.ctl log=zstg_Reference.log bad=zstg_Reference.bad errors=5000 skip=1

echo ****Loading zstg_tumor_agent

$SQLLDR $1  rows=1000 silent=HEADER direct=TRUE  control=zstg_Tumor_Agent.ctl log=zstg_Tumor_Agent.log bad=zstg_Tumor_Agent.bad errors=5000 skip=1

echo ****Loading zstg_tumor_reference

$SQLLDR $1  rows=1000 silent=HEADER direct=TRUE  control=zstg_Tumor_Ref.ctl log=zstg_Tumor_Ref.log bad=zstg_Tumor_Ref.bad errors=5000 skip=1

# -- concat data as first step to recreate Jackson Lab table
echo  ****Concatenating data in zstg_tumor-agent, zstg_tumor-reference, etc to create jacksonlab table from `pwd`

$SQLPLUS $1 @$BASE_DIR/jacksonLab/sql/update_zstgagent.sql 

perl $JLAB/perl/splitData.pl


# -- load concatenated data

echo ****Loading zstg_tumor_metastasis_combined from `pwd`

$SQLLDR $1  rows=1000 silent=HEADER direct=TRUE  control=zstg_Tumor_Metastasis_combined.ctl log=zstg_Tumor_Metastases_combined.log bad=zstg_Tumor_Metastases_combined.bad errors=5000 

echo ****Loading zstg_tumor_treatmentagent_combined

$SQLLDR $1  rows=1000 silent=HEADER direct=TRUE  control=zstg_Tumor_TreatmentAgent_combined.ctl log=zstg_Tumor_TreatmentAgent_combined.log bad=zstg_Tumor_TreatmentAgent_combined.bad errors=5000 

echo ****Loading zstg_tumor_ref_combined

$SQLLDR $1  rows=1000 silent=HEADER direct=TRUE  control=zstg_Tumor_Ref_combined.ctl log=zstg_Tumor_Reference_combined.log bad=zstg_Tumor_Reference_combined.bad errors=5000 

echo ****Loading zstg_agentNames_trimmed

$SQLLDR $1  rows=1000 silent=HEADER direct=TRUE  control=zstg_agentnames_trimmed.ctl log=zstg_agentnames_trimmed.log bad=zstg_agentnames_trimmed.bad errors=5000 


echo ****Creating indexes, enabling constraints, creating Jackson Lab table  

sh $JLAB/postprocess.sh $1 

echo ****Finished creating jackson lab table
