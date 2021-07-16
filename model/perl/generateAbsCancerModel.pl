#!/usr/bin/perl
use strict;
use warnings;
use DBI;


my (%abscancermodelhash, %EnvFactorsHash, $Nomenclature, %MTBTumorsAbsCancerModel, %CarcinogenicExposure,  @tagents, @ttypes);
&generateAbsCancerModels(\%abscancermodelhash, \%EnvFactorsHash, \%MTBTumorsAbsCancerModel, \%CarcinogenicExposure);


open fhandle1, ">/cabio/cabiodb/caMOD/data/AbsCancerModel.txt" || die "Error opening output file \n";
foreach my $ky (keys %abscancermodelhash) {
	print  fhandle1 $abscancermodelhash{$ky}."\n";
}
close fhandle1;


open fhandle2, ">/cabio/cabiodb/caMOD/data/CarcinogenicExposure.txt" || die "Error opening file CarcinogenicExposure \n";
foreach my $ky (keys %CarcinogenicExposure) {
	print  fhandle2 $ky."\n";
}
close fhandle2;


open fhandle3, ">/cabio/cabiodb/caMOD/data/mtbidsAbsCancer.txt" || die "error opening file \n";
foreach my $ky (keys %MTBTumorsAbsCancerModel) {
	print  fhandle3 $ky."|".$MTBTumorsAbsCancerModel{$ky}."\n";
}
close fhandle3;

open fhandle4, ">/cabio/cabiodb/caMOD/data/Nomenclature.txt" || die "error opening file \n";
foreach my $ky (keys %$Nomenclature) {
	print  fhandle4 $ky."|".$Nomenclature->{$ky}."\n";
}
close fhandle4;

sub generateAbsCancerModels() {
my $AbsCancerModels = shift || die "Error generating tumor metastases\n";
my $EnvFactors = shift || die "Error generating tumor metastases\n";
my $MTBTumorAbsCancerModel = shift || die "Error generating tumor metastases\n";
my $CarcinogenicExposure = shift || die "Error generating abs cancer model \n";


my ($mtbId, $nomenclature_id, $carcinogenexposure_id, $abscancermodelId, $availId, $strain, $experimentdesign, $smallesttumorkey, $strainkey, $strainsynonyms,$straintypes, $straingeneralnote, $treatmenttype, $treatmentagents, $nameentry, $typeentry, $envfactorid);


# Get the maximum availability id 

my $dbh = DBI->connect($ENV{'SCHEMA'}, $ENV{'UNAME'}, $ENV{'PASSWD'}) || die  "Error ".DBI->errstr;
my $sql = qq(SELECT max(availability_id) from availability);
my $sth = $dbh->prepare($sql);
$sth->execute();
$sth->bind_columns(\$availId);
while($sth->fetch()) {
	$availId=~s/\s+//g;
}

# Get the maximum abs cancer model id 

$sql = qq(SELECT max(abs_cancer_model_id) from abs_cancer_model);
$sth = $dbh->prepare($sql);
$sth->execute();
$sth->bind_columns(\$abscancermodelId);
while($sth->fetch()) {
	$abscancermodelId=~s/\s+//g;
}

# Get the maximum nomenclature id 

$sql = qq(SELECT max(nomenclature_id) from nomenclature);
$sth = $dbh->prepare($sql);
$sth->execute();
$sth->bind_columns(\$nomenclature_id);
while($sth->fetch()) {
	$nomenclature_id=~s/\s+//g;
}

# Get the maximum carcinogenic exposure id 

$sql = qq(SELECT max(carcinogen_exposure_id) from carcinogen_exposure);
$sth = $dbh->prepare($sql);
$sth->execute();
$sth->bind_columns(\$carcinogenexposure_id);
while($sth->fetch()) {
	$carcinogenexposure_id=~s/\s+//g;
}


# Get Environmental factor data for carcinogenic exposure

$sql = qq(select distinct nvl(e.TYPE_ALTERN_ENTRY,' '), nvl(e.NAME_ALTERN_ENTRY,' '), e.ENVIRONMENTAL_FACTOR_ID from environmental_factor e);
$sth = $dbh->prepare($sql);
$sth->execute();
$sth->bind_columns(\$typeentry, \$nameentry, \$envfactorid);
while($sth->fetch()) {
	$EnvFactors->{$nameentry."#".$typeentry} = $envfactorid;
#	print $nameentry."#".$typeentry."#".$envfactorid."\n";
}


$sql = qq(select nvl(X.STRAIN_NAME,' ') as strain, 'Strain Type: '||nvl(to_char(replace(x.STRAIN_TYPES, '|', ' & '))||'<br>Notes: '||to_char(X.STRAIN_GENERAL_NOTE)||'<br>Strain Synonyms: '||to_char(replace(to_char(X.STRAIN_SYNONYMS), '|', '&nbsp;&#8226;&nbsp;')),' ') as experimentdesign,
X.smallestTumorKey, nvl(X.strainkey,' '), nvl(to_char(X.strain_synonyms),' ') as strainynonyms, nvl(X.strain_types,' '), nvl(to_char(X.strain_general_note),' '), nvl(X.treatment_type,' '), nvl(X.treatment_agents,' ') 
from
(
 select DISTINCT a.STRAIN_KEY as strainkey,
 a.STRAIN_NAME, a.STRAIN_TYPES, a.STRAIN_GENERAL_NOTE,
 a.TREATMENT_TYPE, a.TREATMENT_AGENTS,
 to_char(a.STRAIN_SYNONYMS) as STRAIN_SYNONYMS,
 min(a.MTB_ID) as smallestTumorKey
 from
 JACKSON_LAB_TMP2 a
 group by a.STRAIN_NAME, a.STRAIN_KEY,
 a.STRAIN_TYPES, a.STRAIN_GENERAL_NOTE,to_char(a.STRAIN_SYNONYMS),
 a.TREATMENT_TYPE, a.TREATMENT_AGENTS) X); 

$sth = $dbh->prepare($sql);
$sth->execute();
$sth->bind_columns(\$strain, \$experimentdesign, \$smallesttumorkey, \$strainkey, \$strainsynonyms, \$straintypes, \$straingeneralnote, \$treatmenttype, \$treatmentagents);

while($sth->fetch()) {

# caMOD Model is unique on strain note, key, strain-name, type, treatment-type and treatment-agent 

if(!(exists($AbsCancerModels->{$straingeneralnote."|".$strainkey."|".$strain."|".$straintypes."|".$treatmenttype."|".$treatmentagents}))) {
	$abscancermodelId++;
	$nomenclature_id++;

# if data does not exist for this model, add the above 
# also add availability id and nomenclature id 
# to insert data into nomenclature table

	$AbsCancerModels->{$straingeneralnote."|".$strainkey."|".$strain."|".$straintypes."|".$treatmenttype."|".$treatmentagents} = $abscancermodelId."|".$nomenclature_id."|".$strain."|".$experimentdesign."|".$availId."|".$smallesttumorkey."|".$straingeneralnote."|".$strainkey."|".$strain."|".$straintypes."|".$treatmenttype."|".$treatmentagents;
	
#print "AbsCancerModelId : $abscancermodelId \n";
#print "Treatment Agents : $treatmentagents \n";
#print "Treatment type : $treatmenttype \n";
	
  if(!exists($Nomenclature->{$strain."|".$abscancermodelId})) {
	   $Nomenclature->{$nomenclature_id."|".$strain."|".$abscancermodelId}=1;
	}

}


# if data exists for environmental factor
# write out data for carcinogenic exposure

# split each treatment agent into separate records
# ditto with treatment types

chomp($treatmentagents);
chomp($treatmenttype);

#print "Original: ", $treatmentagents,"^^^", $treatmenttype,"\n";

if($treatmentagents =~/\|/) {
	@tagents = split(/\|/,$treatmentagents);
} elsif ($treatmentagents ne ' ') {
	@tagents = $treatmentagents;
} 

if($treatmenttype =~/\|/) {
	@ttypes = split(/\|/, $treatmenttype);
} elsif ($treatmenttype ne 'None (Spontaneous)') {
	@ttypes = $treatmenttype;
}

if(scalar(@tagents) != scalar(@ttypes)) {
 print "Exiting";
 exit(1);
}

foreach (my $i =0, my $j=0; $i <scalar(@tagents) && $j <scalar(@ttypes); $i++, $j++)  {
  #print "INSIDE THE LOOP $tagents[$i]#$ttypes[$j] \n";
 if (exists($EnvFactors->{$tagents[$i]."#".$ttypes[$j]})) {
		#print "Writing out carcinogen exposure: ".$abscancermodelId."|".$EnvFactors->{$tagents[$i]."#".$ttypes[$j]}."\n";	
                $carcinogenexposure_id++;
		$CarcinogenicExposure->{$carcinogenexposure_id."|".$abscancermodelId."|".$EnvFactors->{$tagents[$i]."#".$ttypes[$j]}}=1;	
	}
  }

  @ttypes=();
  @tagents=();
}


# Now loop through MTB Tumor dataset to map every tumor key to an AbsCancerModel 

$sql = qq(select DISTINCT nvl(a.STRAIN_KEY,' ') as strainkey, nvl(a.STRAIN_NAME,' '), nvl(a.STRAIN_TYPES,' '), nvl(a.STRAIN_GENERAL_NOTE,' '), nvl(a.TREATMENT_TYPE,' '), nvl(a.TREATMENT_AGENTS,' '), nvl(to_char(a.STRAIN_SYNONYMS),' ') as STRAIN_SYNONYMS, a.MTB_ID from JACKSON_LAB_TMP2 a);


$sth = $dbh->prepare($sql);
$sth->execute();
$sth->bind_columns(\$strainkey, \$strain, \$straintypes, \$straingeneralnote, \$treatmenttype, \$treatmentagents, \$strainsynonyms, \$mtbId);

# retrieve AbsCancerModel Id using the above

 while($sth->fetch()) {
  $MTBTumorAbsCancerModel->{$mtbId} = $AbsCancerModels->{$straingeneralnote."|".$strainkey."|".$strain."|".$straintypes."|".$treatmenttype."|".$treatmentagents};
	}
}
