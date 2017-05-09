#!/usr/bin/perl -W

# Translate DNA into protein; dinucleotide and codon frequency

print "sequence given as input:"; #sequence as input
$sequence = <STDIN>;
chomp $sequence;
unless ( open(LIFE, $sequence) ) { 
print "Cannot open file \"$sequence\"\n\n"; 
exit; 
}
my @dna = <LIFE>;
close LIFE;
print " \nGiven sequence: \n @dna\n\n ";

my $dna = join('', @dna);
$dna =~ s/\s//g;

frequency_of_codon($dna);
dinucleotide_frequency($dna);
translation($dna);

# Initialize variables
#my @sequence = ();
#my $dna = '';

my $codon;
my $protein = '';
#my $count = 3;
#my $size = length($dna);
#my $frequency = 0;
# Translate each three-base codon into an amino acid, and append to a protein 
for(my $i=0; $i < (length($dna) - 2); $i += 3){
    $codon = substr($dna,$i,3);
    $protein .= translation($codon);
}
print "I translated the DNA\n\n$dna\n\n  into the protein\n\n$protein\n\n";
exit;
sub frequency_of_codon { 
my($ucasedna) = @_;
$ucasedna = uc $ucasedna; 
$TCA =0; 
$TCC =0; 
$TCG =0; $TCT =0;  
$TTC =0;$TTT =0;$TTA =0; $TTG =0;
$TAC =0; $TAT =0; $TAA =0; $TAG =0;
$TGC =0;$TGT =0; $TGA =0;$TGG =0;
$CTA =0;$CTC =0;$CTG =0;$CTT =0; 
$CCA =0;$CCC =0;$CCG =0;$CCT =0; 
$CAC =0;$CAT =0; $CAA =0;$CAG =0;
$CGA =0; $CGC =0;$CGG =0; $CGT =0; 
$ATA =0;$ATC =0;$ATT =0; $ATG =0; 
$ACA =0; $ACC =0; $ACG =0; $ACT =0;
$AAC =0;$AAT =0; $AAA =0; $AAG =0;
$AGC =0;$AGT =0;$AGA =0; $AGG =0; 
$GTA =0; $GTC =0;$GTG =0;$GTT =0; 
$GCA =0; $GCC =0; $GCG =0; $GCT =0;
$GAC =0;$GAT =0; $GAA =0;$GAG =0;
$GGA =0; $GGC =0; $GGG =0; $GGT =0; 


for ($j =0; $j < length ($ucasedna) ; $j += 3)
{
 my $dna = substr( $ucasedna , $j , 3);
 #$l = length($ucasedna);
 #print "in seq $j $l ";
	if ( $dna =~ /TCA/i ) { ++$TCA;} #serine
elsif ( $dna =~ /TCC/i ) { ++$TCC;}
elsif ( $dna =~ /TCG/i ) { ++$TCG;}
elsif ( $dna =~ /TCT/i ) { ++$TCT;}  
elsif ( $dna =~ /TTC/i ) { ++$TTC;}  #Phenylalanine 
elsif ( $dna =~ /TTT/i ) { ++$TTT;} #Phenylalanine 
elsif ( $dna =~ /TTA/i ) { ++$TTA;} #Leucine 
elsif ( $dna =~ /TTG/i ) { ++$TTG;} #Leucine 
elsif ( $dna =~ /TAC/i ) { ++$TAC;} #Tyrosine 
elsif ( $dna =~ /TAT/i ) { ++$TAT;} #Tyrosine 
elsif ( $dna =~ /TAA/i ) { ++$TAA;}#STOP
elsif ( $dna =~ /TAG/i ) { ++$TAG;} # Stop 
elsif ( $dna =~ /TGC/i ) { ++$TGC;} #Cysteine 
elsif ( $dna =~ /TGT/i ) { ++$TGT;} #Cysteine 
elsif ( $dna =~ /TGA/i ) { ++$TGA;} # Stop 
elsif ( $dna =~ /TGG/i ) { ++$TGG;} #Tryptophan 
elsif ( $dna =~ /CTA/i ) { ++$CTA;} #Leucine 
elsif ( $dna =~ /CTC/i ) { ++$CTC;} #Leucine 
elsif ( $dna =~ /CTG/i ) { ++$CTG;} #Leucine 
elsif ( $dna =~ /CTT/i ) { ++$CTT; } #Leucine 
elsif ( $dna =~ /CCA/i ) { ++$CCA; } #Proline 
elsif ( $dna =~ /CCC/i ) { ++$CCC; } #Proline 
elsif ( $dna =~ /CCG/i ) { ++$CCG; } #Proline 
elsif ( $dna =~ /CCT/i ) { ++$CCT; } #Proline 
elsif ( $dna =~ /CAC/i ) { ++$CAC; } #Histidine 
elsif ( $dna =~ /CAT/i ) { ++$CAT; } #Histidine 
elsif ( $dna =~ /CAA/i ) { ++$CAA; } #Glutamine 
elsif ( $dna =~ /CAG/i ) { ++$CAG; } #Glutamine 
elsif ( $dna =~ /CGA/i ) { ++$CGA; } #Arginine 
elsif ( $dna =~ /CGC/i ) { ++$CGC; } #Arginine 
elsif ( $dna =~ /CGG/i ) { ++$CGG;} #arginine 
elsif ( $dna =~ /CGT/i ) { ++$CGT; } #Arginine 
elsif ( $dna =~ /ATA/i ) { ++$ATA; } #Isoleucine 
elsif ( $dna =~ /ATC/i ) { ++$ATC; } #Isoleucine 
elsif ( $dna =~ /ATT/i ) { ++$ATT; } #soleucine 
elsif ( $dna =~ /ATG/i ) { ++$ATG; } #Methionine 
elsif ( $dna =~ /ACA/i ) { ++$ACA; } #Threonine 
elsif ( $dna =~ /ACC/i ) { ++$ACC; } #Threonine 
elsif ( $dna =~ /ACG/i ) { ++$ACG; } #Threonine 
elsif ( $dna =~ /ACT/i ) { ++$ACT; } #Threonine 
elsif ( $dna =~ /AAC/i ) { ++$AAC; } #Asparagine 
elsif ( $dna =~ /AAT/i ) { ++$AAT; } #Asparagine 
elsif ( $dna =~ /AAA/i ) { ++$AAA; } #Lysine 
elsif ( $dna =~ /AAG/i ) { ++$AAG; } #Lysine 
elsif ( $dna =~ /AGC/i ) { ++$AGC; } #Serine 
elsif ( $dna =~ /AGT/i ) { ++$AGT; } #Serine 
elsif ( $dna =~ /AGA/i ) { ++$AGA; } #rginine 
elsif ( $dna =~ /AGG/i ) { ++$AGG; } #Arginine 
elsif ( $dna =~ /GTA/i ) { ++$GTA; } #Valine 
elsif ( $dna =~ /GTC/i ) { ++$GTC; } #Valine 
elsif ( $dna =~ /GTG/i ) { ++$GTG; } #Valine 
elsif ( $dna =~ /GTT/i ) { ++$GTT; } #Valine 
elsif ( $dna =~ /GCA/i ) { ++$GCA; } #Alanine 
elsif ( $dna =~ /GCC/i ) { ++$GCC; } #Alanine 
elsif ( $dna =~ /GCG/i ) { ++$GCG;} # lanine 
elsif ( $dna =~ /GCT/i ) { ++$GCT; } #Alanine 
elsif ( $dna =~ /GAC/i ) { ++$GAC; } #Aspartic Acid 
elsif ( $dna =~ /GAT/i ) { ++$GAT; } #Aspartic Acid 
elsif ( $dna =~ /GAA/i ) { ++$GAA; } #Glutamic Acid 
elsif ( $dna =~ /GAG/i ) { ++$GAG; } #Glutamic Acid 
elsif ( $dna =~ /GGA/i ) { ++$GGA;} #lycine 
elsif ( $dna =~ /GGC/i ) { ++$GGC; } #Glycine 
elsif ( $dna =~ /GGG/i ) { ++$GGG; } #Glycine 
elsif ( $dna =~ /GGT/i ) { ++$GGT; } #Glycine 
else {
print  "\n\n\n";
} 
}
print "codons in the sequence have frequencies of : \n\n "; #output for codon frequency
print "AAA=$AAA\n";
print "AAT=$AAT\n";
print "AAG=$AAG\n";
print "AAC=$AAC\n";
print "ATA=$ATA\n";
print "ATT=$ATT\n";
print "ATG=$ATG\n";
print "ATC=$ATC\n";
print "AGA=$AGA\n";
print "AGT=$AGT\n";
print "AGG=$AGG\n";
print "AGC=$AGC\n";
print "ACA=$ACA\n";
print "ACT=$ACT\n";
print "ACG=$ACG\n";
print "ACC=$ACC\n";
print "TAA=$TAA\n";
print "TAT=$TAT\n";
print "TAG=$TAG\n";
print "TAC=$TAC\n";
print "TTA=$TTA\n";
print "TTT=$TTT\n";
print "TTG=$TTG\n";
print "TTC=$TTC\n";
print "TGA=$TGA\n";
print "TGT=$TGT\n";
print "TGG=$TGG\n";
print "TGC=$TGC\n";
print "TCA=$TCA\n";
print "TCT=$TCT\n";
print "TCG=$TCG\n";
print "TCC=$TCC\n";
print "GAA=$GAA\n";
print "GAT=$GAT\n";
print "GAG=$GAG\n";
print "GAC=$GAC\n";
print "GTA=$GTA\n";
print "GTT=$GTT\n";
print "GTG=$GTG\n";
print "GTC=$GTC\n";
print "GGA=$GGA\n";
print "GGT=$GGT\n";
print "GGG=$GGG\n";
print "GGC=$GGC\n";
print "GCA=$GCA\n";
print "GCT=$GCT\n";
print "GCG=$GCG\n";
print "GCC=$GCC\n";
print "CAA=$CAA\n";
print "CAT=$CAT\n";
print "CAG=$CAG\n";
print "CAC=$CAC\n";
print "CTA=$CTA\n";
print "CTT=$CTT\n";
print "CTG=$CTG\n";
print "CTC=$CTC\n";
print "CGA=$CGA\n";
print "CGT=$CGT\n";
print "CGG=$CGG\n";
print "CGC=$CGC\n";
print "CCA=$CCA\n";
print "CCT=$CCT\n";
print "CCG=$CCG\n";
print "CCC=$CCC\n";
}

sub dinucleotide_frequency { 
my($upperdna) = @_; 
$upperdna = uc $upperdna; 

$AA = 0; $AT = 0; $AG = 0; $AC = 0;
$TT = 0; $TA = 0; $TG = 0; $TC = 0;
$CC = 0; $CA = 0; $CT = 0; $CG = 0;
$GG = 0; $GA = 0; $GT = 0; $GC = 0; $err = 0;

for ($k =0; $k < length ($upperdna) ; $k += 2)
{
 my $dna = substr( $upperdna , $k , 2);

   if($dna =~ /AA/ig) {$AA++;}
elsif($dna =~ /AT/ig) {$AT++;}
elsif($dna =~ /AG/ig) {$AG++;}
elsif($dna =~ /AC/ig) {$AC++;}
elsif($dna =~ /TT/ig) {$TT++;}
elsif($dna =~ /TA/ig) {$TA++;}
elsif($dna =~ /TG/ig) {$TG++;}
elsif($dna =~ /TC/ig) {$TC++;}
elsif($dna =~ /GG/ig) {$GG++;}
elsif($dna =~ /GA/ig) {$GA++;}
elsif($dna =~ /GT/ig) {$GT++;}
elsif($dna =~ /GC/ig) {$GC++;}
elsif($dna =~ /CC/ig) {$CC++;}
elsif($dna =~ /CA/ig) {$CA++;}
elsif($dna =~ /CT/ig) {$CT++;}
elsif($dna =~ /CG/ig) {$CG++;}
else {$err++;}
}

print "\ndinucleotides in the sequence have frequency of :\n\n";
print"\tAA = $AA \tGG = $GG  
        AT = $AT \tGA = $GA 
        AG = $AG \tGT = $GT 
        AC = $AC \tGC = $GC  
        TT = $TT \tCC = $CC
        TA = $TA \tCA = $CA
        TG = $TG \tCT = $CT
        TC = $TC \tCG = $CG
        errors=$err \n\n";

}


sub translation  {
   my($codon) = @_ ;
   if ( $codon =~ /TCA/i ) { return 'S';} #serine
elsif ( $codon =~ /TCC/i ) { return 'S';} 
elsif ( $codon =~ /TCG/i ) { return 'S';}
elsif ( $codon =~ /TCT/i ) { return 'S';}  
elsif ( $codon =~ /TTC/i ) { return 'F';}  #Phenylalanine 
elsif ( $codon =~ /TTT/i ) { return 'F';} #Phenylalanine 
elsif ( $codon =~ /TTA/i ) { return 'L';} #Leucine 
elsif ( $codon =~ /TTG/i ) { return 'L';} #Leucine 
elsif ( $codon =~ /TAC/i ) { return 'Y';} #Tyrosine 
elsif ( $codon =~ /TAT/i ) { return 'Y';} #Tyrosine 
elsif ( $codon =~ /TAA/i ) { return '_';}#STOP
elsif ( $codon =~ /TAG/i ) { return '_';} # Stop 
elsif ( $codon =~ /TGC/i ) { return 'C';} #Cysteine 
elsif ( $codon =~ /TGT/i ) { return 'C';} #Cysteine 
elsif ( $codon =~ /TGA/i ) { return '_'} # Stop 
elsif ( $codon =~ /TGG/i ) { return 'W';} #Tryptophan 
elsif ( $codon =~ /CTA/i ) { return 'L';} #Leucine 
elsif ( $codon =~ /CTC/i ) { return 'L';} #Leucine 
elsif ( $codon =~ /CTG/i ) { return 'L';} #Leucine 
elsif ( $codon =~ /CTT/i ) { return 'L'; } #Leucine 
elsif ( $codon =~ /CCA/i ) { return 'P'; } #Proline 
elsif ( $codon =~ /CCC/i ) { return 'P'; } #Proline 
elsif ( $codon =~ /CCG/i ) { return 'P'; } #Proline 
elsif ( $codon =~ /CCT/i ) { return 'P'; } #Proline 
elsif ( $codon =~ /CAC/i ) { return 'H'; } #Histidine 
elsif ( $codon =~ /CAT/i ) { return 'H'; } #Histidine 
elsif ( $codon =~ /CAA/i ) { return 'Q'; } #Glutamine 
elsif ( $codon =~ /CAG/i ) { return 'Q'; } #Glutamine 
elsif ( $codon =~ /CGA/i ) { return 'R'; } #Arginine 
elsif ( $codon =~ /CGC/i ) { return 'R'; } #Arginine 
elsif ( $codon =~ /CGG/i ) { return 'R';} #arginine 
elsif ( $codon =~ /CGT/i ) { return 'R'; } #Arginine 
elsif ( $codon =~ /ATA/i ) { return 'I'; } #Isoleucine 
elsif ( $codon =~ /ATC/i ) { return 'I'; } #Isoleucine 
elsif ( $codon =~ /ATT/i ) { return 'I'; } #soleucine 
elsif ( $codon =~ /ATG/i ) { return 'M'; } #Methionine 
elsif ( $codon =~ /ACA/i ) { return 'T'; } #Threonine 
elsif ( $codon =~ /ACC/i ) { return 'T'; } #Threonine 
elsif ( $codon =~ /ACG/i ) { return 'T'; } #Threonine 
elsif ( $codon =~ /ACT/i ) { return 'T'; } #Threonine 
elsif ( $codon =~ /AAC/i ) { return 'N'; } #Asparagine 
elsif ( $codon =~ /AAT/i ) { return 'N'; } #Asparagine 
elsif ( $codon =~ /AAA/i ) { return 'K'; } #Lysine 
elsif ( $codon =~ /AAG/i ) { return 'K'; } #Lysine 
elsif ( $codon =~ /AGC/i ) { return 'S'; } #Serine 
elsif ( $codon =~ /AGT/i ) { return 'S'; } #Serine 
elsif ( $codon =~ /AGA/i ) { return 'R'; } #Arginine 
elsif ( $codon =~ /AGG/i ) { return 'R'; } #Arginine 
elsif ( $codon =~ /GTA/i ) { return 'V'; } #Valine 
elsif ( $codon =~ /GTC/i ) { return 'V'; } #Valine 
elsif ( $codon =~ /GTG/i ) { return 'V'; } #Valine 
elsif ( $codon =~ /GTT/i ) { return 'V'; } #Valine 
elsif ( $codon =~ /GCA/i ) { return 'A'; } #Alanine 
elsif ( $codon =~ /GCC/i ) { return 'A'; } #Alanine 
elsif ( $codon =~ /GCG/i ) { return 'A';} #Alanine 
elsif ( $codon =~ /GCT/i ) { return 'A'; } #Alanine 
elsif ( $codon =~ /GAC/i ) { return 'D'; } #Aspartic Acid 
elsif ( $codon =~ /GAT/i ) { return 'D'; } #Aspartic Acid 
elsif ( $codon =~ /GAA/i ) { return 'E'; } #Glutamic Acid 
elsif ( $codon =~ /GAG/i ) { return 'E'; } #Glutamic Acid 
elsif ( $codon =~ /GGA/i ) { return 'G';} #Glycine 
elsif ( $codon =~ /GGC/i ) { return 'G'; } #Glycine 
elsif ( $codon =~ /GGG/i ) { return 'G'; } #Glycine 
elsif ( $codon =~ /GGT/i ) { return 'G'; } #Glycine 
else { 
print  STDERR "bad codon \"$codon\"!!\n";
} 	
}; # this is the hash table for the amino acids

