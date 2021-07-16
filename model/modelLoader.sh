# Lalitha Viswanathan
# caMOD Load script
# Generate AbsCancerModel data

echo Loading ABS_CANCER_MODEL 

$SQLPLUS $1 @$BASE_DIR/index_script_creator.sql abscancermodel 
$SQLPLUS $1 @$BASE_DIR/constraints.sql abscancermodel 
$SQLPLUS $1 @$BASE_DIR/constraints/abscancermodel.disable.sql 
$SQLPLUS $1 @$BASE_DIR/indexes/abscancermodel.drop.sql 
$SQLPLUS $1 @$BASE_DIR/model/sql/abscancermodel.sql
$SQLPLUS $1 @$BASE_DIR/indexes/abscancermodel.cols.sql 
$SQLPLUS $1 @$BASE_DIR/indexes/abscancermodel.lower.sql 
$SQLPLUS $1 @$BASE_DIR/constraints/abscancermodel.enable.sql 

echo Loading PARTY 
$SQLPLUS $1 @$BASE_DIR/index_script_creator.sql party 
$SQLPLUS $1 @$BASE_DIR/constraints.sql party 
$SQLPLUS $1 @$BASE_DIR/constraints/party.disable.sql 
$SQLPLUS $1 @$BASE_DIR/indexes/party.drop.sql 
$SQLPLUS $1 @$BASE_DIR/model/sql/party.sql
$SQLPLUS $1 @$BASE_DIR/indexes/party.cols.sql 
$SQLPLUS $1 @$BASE_DIR/indexes/party.lower.sql 
$SQLPLUS $1 @$BASE_DIR/constraints/party.enable.sql 

echo Loading AVAILABILITY 
$SQLPLUS $1 @$BASE_DIR/index_script_creator.sql availability 
$SQLPLUS $1 @$BASE_DIR/constraints.sql availability 
$SQLPLUS $1 @$BASE_DIR/constraints/availability.disable.sql 
$SQLPLUS $1 @$BASE_DIR/indexes/availability.drop.sql 
$SQLPLUS $1 @$BASE_DIR/model/sql/availability.sql
$SQLPLUS $1 @$BASE_DIR/indexes/availability.cols.sql 
$SQLPLUS $1 @$BASE_DIR/indexes/availability.lower.sql 
$SQLPLUS $1 @$BASE_DIR/constraints/availability.enable.sql 

echo Loading PUBLICATION 
$SQLPLUS $1 @$BASE_DIR/index_script_creator.sql publication 
$SQLPLUS $1 @$BASE_DIR/constraints.sql publication 
$SQLPLUS $1 @$BASE_DIR/constraints/publication.disable.sql 
$SQLPLUS $1 @$BASE_DIR/indexes/publication.drop.sql 
$SQLPLUS $1 @$BASE_DIR/model/sql/publication.sql
$SQLPLUS $1 @$BASE_DIR/indexes/publication.cols.sql 
$SQLPLUS $1 @$BASE_DIR/indexes/publication.lower.sql 
$SQLPLUS $1 @$BASE_DIR/constraints/publication.enable.sql 

echo Loading DISEASE 
$SQLPLUS $1 @$BASE_DIR/index_script_creator.sql disease 
$SQLPLUS $1 @$BASE_DIR/indexes/disease.drop.sql 
$SQLPLUS $1 @$BASE_DIR/model/sql/disease.sql
$SQLPLUS $1 @$BASE_DIR/indexes/disease.cols.sql 
$SQLPLUS $1 @$BASE_DIR/indexes/disease.lower.sql 

echo Loading ORGAN 
$SQLPLUS $1 @$BASE_DIR/index_script_creator.sql organ 
$SQLPLUS $1 @$BASE_DIR/indexes/organ.drop.sql 
$SQLPLUS $1 @$BASE_DIR/model/sql/organ.sql
$SQLPLUS $1 @$BASE_DIR/indexes/organ.cols.sql 
$SQLPLUS $1 @$BASE_DIR/indexes/organ.lower.sql 

echo Loading ENVIRONMENTAL_FACTOR 
$SQLPLUS $1 @$BASE_DIR/index_script_creator.sql environmental_factor 
$SQLPLUS $1 @$BASE_DIR/indexes/environmental_factor.drop.sql 
$SQLPLUS $1 @$BASE_DIR/model/sql/environmental_factor.sql
$SQLPLUS $1 @$BASE_DIR/indexes/environmental_factor.cols.sql 
$SQLPLUS $1 @$BASE_DIR/indexes/environmental_factor.lower.sql 

echo Loading NOMENCLATURE 
$SQLPLUS $1 @$BASE_DIR/index_script_creator.sql nomenclature 
$SQLPLUS $1 @$BASE_DIR/indexes/nomenclature.drop.sql 
$SQLPLUS $1 @$BASE_DIR/model/sql/nomenclature.sql
$SQLPLUS $1 @$BASE_DIR/indexes/nomenclature.cols.sql 
$SQLPLUS $1 @$BASE_DIR/indexes/nomenclature.lower.sql 

echo Loading CARCINOGEN_EXPOSURE 
$SQLPLUS $1 @$BASE_DIR/index_script_creator.sql carcinogenic_exposure 
$SQLPLUS $1 @$BASE_DIR/indexes/carcinogenic_exposure.drop.sql 
$SQLPLUS $1 @$BASE_DIR/model/sql/carcinogenic_exposure.sql
$SQLPLUS $1 @$BASE_DIR/indexes/carcinogenic_exposure.cols.sql 
$SQLPLUS $1 @$BASE_DIR/indexes/carcinogenic_exposure.lower.sql 

echo  Generate Abs Cancer Model data
# Generate AbsCancerModel data

perl $BASE_DIR/model/perl/generateAbsCancerModel.pl 

cd control
rm *.log *.bad
$SQLLDR $1 rows=1000  silent=HEADER direct=TRUE control=AbsCancerModel.ctl log=AbsCancerModel.log bad=AbsCancerModel.bad errors=5000 
$SQLLDR $1 rows=1000  silent=HEADER direct=TRUE control=MappingAbsTumor.ctl log=MappingAbsTumor.log bad=MappingAbsTumor.bad errors=5000 
$SQLLDR $1 rows=1000  silent=HEADER direct=TRUE control=CarcinogenicExposure.ctl log=CarcinogenicExposure.log bad=CarcinogenicExposure.bad errors=5000 
#$SQLLDR $1 rows=1000  silent=HEADER,FEEDBACK  control=Nomenclature.ctl log=Nomenclature.log bad=Nomenclature.bad errors=5000 

$SQLPLUS $1 @$BASE_DIR/index_script_creator.sql histopathology 
$SQLPLUS $1 @$BASE_DIR/indexes/histopathology.drop.sql 
$SQLPLUS $1 @$BASE_DIR/indexes/histopathology.cols.sql 
$SQLPLUS $1 @$BASE_DIR/model/sql/histopathology.sql
$SQLPLUS $1 @$BASE_DIR/indexes/histopathology.lower.sql 

$SQLPLUS $1 @$BASE_DIR/index_script_creator.sql image 
$SQLPLUS $1 @$BASE_DIR/indexes/image.drop.sql 
$SQLPLUS $1 @$BASE_DIR/model/sql/image.sql
$SQLPLUS $1 @$BASE_DIR/indexes/image.cols.sql 
$SQLPLUS $1 @$BASE_DIR/indexes/image.lower.sql 

$SQLPLUS $1 @$BASE_DIR/index_script_creator.sql abscancermodel_publication 
$SQLPLUS $1 @$BASE_DIR/indexes/abscancermodel_publication.drop.sql 
$SQLPLUS $1 @$BASE_DIR/model/sql/abscancermodel_publication.sql
$SQLPLUS $1 @$BASE_DIR/indexes/abscancermodel_publication.cols.sql 
$SQLPLUS $1 @$BASE_DIR/indexes/abscancermodel_publication.lower.sql 

$SQLPLUS $1 @$BASE_DIR/model/sql/disableAllTriggers.sql
exit;
