my $focus;
my $i = 1;
my $count;
#my $cds = "CDS";
my $gene = "gene=";
my $locusTag = "locus_tag=";
my $result = "result=";
my $trans = "trans=";
my $Rabbit = 0;
my $It = 0;
my $pro = 0;
my $Trans = 0;
my $Line = 0;
my $i = 1;

open(RFILE,'L43967.fna');
#open(WRITEFILE,'>outputcds.txt');
#open(WRITEFILE1,'>output.txt');

while ($line = <RFILE>)
{
	chomp($code);
	$code =~ s/^\s+//;
	if ($code =~ m/\b$cds\b/)
	{
		@codons = split(" ", $line);
		if($codons[0] eq "CDS")
		{
			if($code)
			{
				print WFILE "\n\n";
			}
			
			print WFILE $codon[1]."\t";
			#print WRITEFILE1 $codon[0]."\n";
			$Rabbit = 1;
			$It = 1;
			$pro = 1;
			$Trans = 1;
			$Line = 1;
			$i++;	
		}
		

	}

	elsif (($code =~ m/$gene/) && ($Rabbit))
	{
		if($code =~ /"(.+?)"/)
		{
			print WFILE $1."\t";
			$Rabbit = 0;	
		}
	}

	elsif (($code =~ m/$locusTag/) && ($It))
	{
		if($code =~ /"(.+?)"/)
		{
			print WFILE $1."\t";
			$It = 0;
		}
	}

	elsif (($code =~ m/$result/) && ($pro))
	{
		if($code =~ /"(.+?)"/) 
		{
			@codons = split("=", $code);
			print WFILE $codons[1]."\t";
			$pro = 0;
		}
		elsif($code =~ /"(.+?)/)
		{
			@codons = split("=", $code);
			$productPart = $codon[1];
			$productPartFlag = 1;
			#print WFILE $productPart."\t";
		}
	}

	elsif (($code =~ m/$trans/) && ($Trans))
	{
		if($code =~ /"(.+?)"/)
		{
			print WFILE $1;
			$transFlag = 0;
		}
		elsif($line =~ /"(.+?)/)
		{
			@codons = split("=", $code);
			$Trans = $codons[1];
			$TransFlag = 1;
			#print WFILE $Trans."\t";
		}
	}

	elsif(($code =~ /(.+?)"/) && ($productPartFlag || $TransFlag))
	{
		if($productPartFlag)
		{
			$productPart = $productPart." ".$line;
			#$productPart =~ /"(.+?)"/;
			print WFILE $productPart."\t";
			$productPartFlag = 0;
			$proFlag = 0;
		}
		elsif($transPartFlag)
		{
			$transPart = $transPart.$line;
			$transPart =~ /"(.+?)"/;
			print WFILE $1;
			$TransFlag = 0;
			$Trans = 0;
		}
		
		
	}
	elsif($productPartFlag)
	{
		$productPart = $productPart." ".$line;
		#print WFILE $productPart."\t";
	}
	elsif($TransFlag)
	{
		$Trans = $Trans.$code;
	}
 }
	
close (RFILE);
close (WFILE);
close (WFILE1);
