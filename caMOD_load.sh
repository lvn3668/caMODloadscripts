#!/bin/sh
echo Starting load  
source setupenv.sh

# create backup tables

echo ****Creating staging tables
$SQLPLUS $UNAME/$PASSWD@$DB @createTables.sql

# -- Preprocess raw data  

echo ****Cleanng raw data

cd $DATA_DIR
perl -p -i -e "s/\t/#/g" MTB.2009.05.08.TUMOR_AGENT.txt 
perl -p -i -e "s/\t/#/g" MTB.2009.05.08.TUMOR_REF.txt 
ln -sf MTB.2009.05.08.AGENT.txt AGENT.txt
ln -sf MTB.2009.05.08.METASTASES.txt METASTASES.txt
ln -sf MTB.2009.05.08.REFERENCE.txt REFERENCE.txt
ln -sf MTB.2009.05.08.TUMOR.txt TUMOR.txt
ln -sf MTB.2009.05.08.TUMOR_AGENT.txt TUMOR_AGENT.txt
ln -sf MTB.2009.05.08.TUMOR_REF.txt TUMOR_REF.txt
cd $DATA_DIR
echo `pwd`
perl -p -i -e "s/\t/#/g" TUMOR_AGENT.txt
perl -p -i -e "s/\"//g" TUMOR.txt
perl -p -i -e "s/\'//g" TUMOR.txt
perl -p -i -e "s/\&plusmn;/\&plusmn:/g" TUMOR.txt
perl -p -i -e "s/\t/#/g" TUMOR_REF.txt

echo ****Creating JacksonLab tables

cd $JLAB
rm *.bad *.log
sh jacksonLabLoader.sh $UNAME/$PASSWD@$DB 2> jacksonLab.log

echo ****Implementing model
cd /cabio/cabiodb/caMOD/model
rm *.log *.bad
sh modelLoader.sh $UNAME/$PASSWD@$DB 2>modelLoading.log

echo ****Enabling referential integrity constraints
$SQLPLUS $UNAME/$PASSWD@$DB @$BASE_DIR/constraints/enable.referential.sql

echo Finished loading caMOD data 
