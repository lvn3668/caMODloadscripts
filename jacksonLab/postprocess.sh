-- Author Lalitha Viswanathan
-- Post proccess (enable constraints, etc.)
# Create indexes
$SQLPLUS $1 @$JLAB/sql/jacksonlab.sql 
 
$SQLPLUS $1 @$INDEX_DIR/zstg_agent.cols.sql 
$SQLPLUS $1 @$INDEX_DIR/zstg_agentnames_trimmed.cols.sql 
$SQLPLUS $1 @$INDEX_DIR/zstg_metastases.cols.sql 
$SQLPLUS $1 @$INDEX_DIR/zstg_reference.cols.sql 
$SQLPLUS $1 @$INDEX_DIR/zstg_tumor.cols.sql 
$SQLPLUS $1 @$INDEX_DIR/zstg_tumor_agent.cols.sql 
$SQLPLUS $1 @$INDEX_DIR/zstg_tumor_ref.cols.sql 
$SQLPLUS $1 @$INDEX_DIR/zstg_tumor_agentname_combined.cols.sql 
$SQLPLUS $1 @$INDEX_DIR/zstg_metastases_combined.cols.sql 
$SQLPLUS $1 @$INDEX_DIR/zstg_tumor_reference_combined.cols.sql 
$SQLPLUS $1 @$INDEX_DIR/jackson_lab_tmp.cols.sql 
$SQLPLUS $1 @$INDEX_DIR/jackson_lab_tmp2.cols.sql 
$SQLPLUS $1 @$INDEX_DIR/zstg_mappingabstumor.cols.sql 

# functional indexes
$SQLPLUS $1 @$INDEX_DIR/zstg_agent.lower.sql 
$SQLPLUS $1 @$INDEX_DIR/zstg_agentnames_trimmed.lower.sql 
$SQLPLUS $1 @$INDEX_DIR/zstg_metastases.lower.sql 
$SQLPLUS $1 @$INDEX_DIR/zstg_reference.lower.sql 
$SQLPLUS $1 @$INDEX_DIR/zstg_tumor.lower.sql 
$SQLPLUS $1 @$INDEX_DIR/zstg_tumor_agent.lower.sql 
$SQLPLUS $1 @$INDEX_DIR/zstg_tumor_ref.lower.sql 
$SQLPLUS $1 @$INDEX_DIR/zstg_tumor_agentname_combined.lower.sql 
$SQLPLUS $1 @$INDEX_DIR/zstg_metastases_combined.lower.sql 
$SQLPLUS $1 @$INDEX_DIR/zstg_tumor_reference_combined.lower.sql 
$SQLPLUS $1 @$INDEX_DIR/jackson_lab_tmp.lower.sql 
$SQLPLUS $1 @$INDEX_DIR/jackson_lab_tmp2.lower.sql 
$SQLPLUS $1 @$INDEX_DIR/zstg_mappingabstumor.lower.sql 
 
