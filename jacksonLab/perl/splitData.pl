#!/usr/bin/perl
use strict;
use warnings;
use DBI;

# Author Lalitha Viswanathan
# Parses the MTB dataset
# To get TreatmentKey, MetastasisKey, ReferenceKey, ModifiedTreatmentAgent

my (%agentKeyHash, %treatmentKeyHash, %metaKeyHash,  %metaOrganHash, %refKeyHash, %agentModifiedHash);
&getTumorMetases(\%metaKeyHash,\%metaOrganHash);
&getTreatmentAgents(\%treatmentKeyHash, \%agentKeyHash, \%agentModifiedHash);
&getReferences(\%refKeyHash);

my ($fhandle1, $fhandle2, $fhandle3, $fhandle4);

open fhandle1, ">/cabio/cabiodb/caMOD/data/TreatmentKey.txt" || die "Error opening output file \n";
open fhandle2, ">/cabio/cabiodb/caMOD/data/MetastasisKey.txt" || die "Error opening output file \n";
open fhandle3, ">/cabio/cabiodb/caMOD/data/ReferenceKey.txt" || die "Error opening output file \n";
open fhandle4, ">/cabio/cabiodb/caMOD/data/ModifiedTreatmentAgent.txt" || die "Error opening output file \n";

foreach my $tumor (keys %treatmentKeyHash) {
		$treatmentKeyHash{$tumor} =~s/\|$//g;
		$agentKeyHash{$tumor} =~s/\|$//g;
	print fhandle1 $tumor, "\t", $treatmentKeyHash{$tumor},"\t", $agentKeyHash{$tumor},"\n"; 
}
close fhandle1;

foreach my $tumor (keys %metaKeyHash) {
		$metaKeyHash{$tumor} =~s/\|$//g;
		$metaOrganHash{$tumor} =~s/\|$//g;
	print fhandle2 $tumor, "\t", $metaKeyHash{$tumor},"\t",$metaOrganHash{$tumor},"\n"; 
}
close fhandle2;

foreach my $tumor (keys %refKeyHash) {
		$refKeyHash{$tumor} =~s/\|$//g;
	print fhandle3 $tumor, "\t", $refKeyHash{$tumor},"\n"; 
}
close fhandle3;

foreach my $agentkey (keys %agentModifiedHash) {
	print fhandle4 $agentkey, "|", $agentModifiedHash{$agentkey},"\n"; 
}
close fhandle4;

sub getTumorMetases() {

my($tumorkey, $metastaseskey, $metastasesorgan);
my $metaKeyHash =  shift || die "Function needs hash ref \n";
my $metaOrganHash = shift || die "Function usage: getTumorMetases(\%hashref1, \%hasref2) \n";
my $dbh = DBI->connect($ENV{'SCHEMA'}, $ENV{'UNAME'}, $ENV{'PASSWD'}) || die  "Error ".DBI->errstr;
my $sql = qq(SELECT * from ZSTG_METASTASES);
my $sth = $dbh->prepare($sql);
$sth->execute();
$sth->bind_columns(\$tumorkey, \$metastaseskey, \$metastasesorgan);
while($sth->fetch()) {
        $tumorkey=~s/^\s+//g;
        $tumorkey=~s/\s+$//g;
        $metastaseskey=~s/^\s+//g;
        $metastaseskey=~s/\s+$//g;
        $metastasesorgan=~s/^\s+//g;
        $metastasesorgan=~s/\s+$//g;
        $metaKeyHash->{$tumorkey} .= $metastaseskey."|";
        $metaOrganHash->{$tumorkey} .= $metastasesorgan."|";
}

}

sub getTreatmentAgents() {

my($tumorkey, $agentName, $agenttype, $agentKey);
my $treatmentKeyHash =  shift || die "Function needs hash ref \n";
my $agentKeyHash =  shift || die "Function needs hash ref \n";
my $agentModifiedHash =  shift || die "Function needs hash ref \n";
my $dbh = DBI->connect($ENV{'SCHEMA'}, $ENV{'UNAME'}, $ENV{'PASSWD'}) || die  "Error ".DBI->errstr;
my $sqlUpdate = qq(update ZSTG_AGENT set AGENTTYPE = 'None (Spontaneous)' where AGENTTYPE is NULL);
my $sthUpdate = $dbh->prepare($sqlUpdate);
$sthUpdate->execute();


$sqlUpdate = qq(update zstg_agent set agenttype = 'Signaling Molecule' where agenttype = 'Signaling molecule');
$sthUpdate = $dbh->prepare($sqlUpdate);
$sthUpdate->execute();

$sqlUpdate = qq(update zstg_agent set agenttype = 'Chemical / Drug' where agenttype = 'Chemical/Drug');
$sthUpdate = $dbh->prepare($sqlUpdate);
$sthUpdate->execute();
$sqlUpdate = qq(commit);
$sthUpdate = $dbh->prepare($sqlUpdate);
$sthUpdate->execute();

my $sql = qq(SELECT distinct a.TUMORKEY, b.AGENTTYPE, b.AGENTNAME, b.AGENTKEY from ZSTG_TUMOR_AGENT a, ZSTG_AGENT b where a.AGENTKEY = b.AGENTKEY order by a.TUMORKEY, b.AGENTKEY);
my $sth = $dbh->prepare($sql);
$sth->execute();
$sth->bind_columns(\$tumorkey, \$agenttype, \$agentName, \$agentKey);
while($sth->fetch()) {
        $tumorkey=~s/^\s+//g;
        $tumorkey=~s/\s+$//g;

        $agentName=~s/^\s+//g;
        $agentName=~s/\s+$//g;
        
	while ($agentName =~/\)$/g) {
	$agentName = substr ($agentName, 0, (rindex($agentName, '('))-1);
	$agentModifiedHash->{$agentKey} = $agentName;
	}

	$agenttype=~s/^\s+//g;
        $agenttype=~s/\s+$//g;

	if ($agenttype eq "") {
		$agenttype = 'None(Spontaneous)';
	}

        $treatmentKeyHash->{$tumorkey} .= $agentName."|";
	$agentKeyHash->{$tumorkey} .= $agenttype."|";
}

}


sub getReferences() {

my($tumorkey, $jNum);
my $refKeyHash =  shift || die "Function needs hash ref \n";
my $dbh = DBI->connect($ENV{'SCHEMA'}, $ENV{'UNAME'}, $ENV{'PASSWD'}) || die  "Error ".DBI->errstr;
my $sql = qq(SELECT distinct a.TUMORKEY, b.JNUM from ZSTG_TUMOR_REF a, ZSTG_REFERENCE b where a.REFKEY = b.REFKEY);
my $sth = $dbh->prepare($sql);
$sth->execute();
$sth->bind_columns(\$tumorkey, \$jNum);
while($sth->fetch()) {
        $tumorkey=~s/^\s+//g;
        $tumorkey=~s/\s+$//g;
        $jNum=~s/^\s+//g;
        $jNum=~s/\s+$//g;
        $refKeyHash->{$tumorkey} .= $jNum."|";
}

}
