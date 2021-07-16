# Generate AbsCancerModel data
$SQLPLUS $1 @$BASE_DIR/index_script_creator.sql zstg_agent 
$SQLPLUS $1 @$BASE_DIR/index_script_creator.sql zstg_agentnames_trimmed 
$SQLPLUS $1 @$BASE_DIR/index_script_creator.sql zstg_metastases 
$SQLPLUS $1 @$BASE_DIR/index_script_creator.sql zstg_reference 
$SQLPLUS $1 @$BASE_DIR/index_script_creator.sql zstg_tumor 
$SQLPLUS $1 @$BASE_DIR/index_script_creator.sql zstg_tumor_agent 
$SQLPLUS $1 @$BASE_DIR/index_script_creator.sql zstg_tumor_ref 
$SQLPLUS $1 @$BASE_DIR/index_script_creator.sql zstg_tumor_agentname_combined
$SQLPLUS $1 @$BASE_DIR/index_script_creator.sql zstg_tumor_agentname
$SQLPLUS $1 @$BASE_DIR/index_script_creator.sql zstg_metastases_combined
$SQLPLUS $1 @$BASE_DIR/index_script_creator.sql zstg_tumor_reference_combined
$SQLPLUS $1 @$BASE_DIR/index_script_creator.sql jackson_lab_tmp 
$SQLPLUS $1 @$BASE_DIR/index_script_creator.sql jackson_lab_tmp2 
$SQLPLUS $1 @$BASE_DIR/index_script_creator.sql zstg_mappingabstumor 
 
$SQLPLUS $1 @$BASE_DIR/indexes/zstg_agent.drop.sql 
$SQLPLUS $1 @$BASE_DIR/indexes/zstg_agentnames_trimmed.drop.sql 
$SQLPLUS $1 @$BASE_DIR/indexes/zstg_metastases.drop.sql 
$SQLPLUS $1 @$BASE_DIR/indexes/zstg_reference.drop.sql 
$SQLPLUS $1 @$BASE_DIR/indexes/zstg_tumor.drop.sql 
$SQLPLUS $1 @$BASE_DIR/indexes/zstg_tumor_agent.drop.sql 
$SQLPLUS $1 @$BASE_DIR/indexes/zstg_tumor_ref.drop.sql 
$SQLPLUS $1 @$BASE_DIR/indexes/zstg_tumor_agentname_combined.drop.sql 
$SQLPLUS $1 @$BASE_DIR/indexes/zstg_metastases_combined.drop.sql 
$SQLPLUS $1 @$BASE_DIR/indexes/zstg_tumor_reference_combined.drop.sql 
$SQLPLUS $1 @$BASE_DIR/indexes/jackson_lab_tmp.drop.sql 
$SQLPLUS $1 @$BASE_DIR/indexes/jackson_lab_tmp2.drop.sql 
$SQLPLUS $1 @$BASE_DIR/indexes/zstg_mappingabstumor.drop.sql


$SQLPLUS $1 @$BASE_DIR/all_ref_constraints.sql
$SQLPLUS $1 @$BASE_DIR/constraints/disable.referential.sql
$SQLPLUS $1 @$BASE_DIR/jacksonLab/sql/truncate.sql

 
