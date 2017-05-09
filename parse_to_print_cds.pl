#!/usr/bin/perl
my $gflag = 1;
my $lflag = 1;
my $pflag = 1;
my $tflag = 1;
my $rflag = 1;
my @matches;
my $tpart;
my $tpflag;
my $ppflag;
my $pp;
my $cds = "CDS";
my $rowflag;
my $i = 1;
my $g = "Gene";
my $ltag = "locus_tag=";
my $p = "product=";
my $trans = "translation=";
my $row;
open(READFILE,'U00096.gbk');
open(fh2,'>result.txt');

while ($row = <READFILE>) {
  chomp($row);
  $row =~ s/^\s+//;
  if($row =~ m/\b$cds\b/)
  {
    @matches = split("", $row);
    if($matches[0] eq "CDS")
    {
      if($rowflag)
      { 
        print fh2"\n\n";
      }
        print fh2 $matches[1]."\t";
          $gflag = 1;
          $lflag = 1;
          $pflag = 1;
          $tflag = 1;
	  $rflag = 1;
	  $i++;	
      }
	elsif (($row =~ m/$g/) && ($gflag))
	{
		if($row =~ /"(.+?)"/)
		{
			print fh2 $1."\t";
			$gflag = 0;	
		}
	}

	elsif (($row =~ m/$ltag/) && ($lflag))
	{
		if($row =~ /"(.+?)"/)
		{
			print fh2 $1."\t";
			$lflag = 0;
		}
	}
	elsif (($row =~ m/$p/) && ($pflag))
	{
		if($row =~ /"(.+?)"/) 
		{
			@matches = split("=", $row);
			print fh2 $matches[1]."\t";
			$pflag = 0;
		}
		elsif($row =~ /"(.+?)/)
		{
			@matches = split("=", $row);
			$pp = $matches[1];
			$ppflag = 1;
		}
	}

	elsif (($row =~ m/$trans/) && ($tflag))
	{
		if($row =~ /"(.+?)"/)
		{
			print fh2 $1;
			$tflag = 0;
		}
		elsif($row =~ /"(.+?)/)
		{
			@matches = split("=", $row);
			$tpart = $matches[1];
			$tpflag = 1;		
		}
	}

	elsif(($row =~ /(.+?)"/) && ($ppflag || $tpflag))
	{
		if($ppflag)
		{
			$pp = $pp." ".$row;
			print fh2 $pp."\t";
			$ppflag = 0;
			$pflag = 0;
		}
		elsif($tpflag)
		{
			$tpart = $tpart.$row;
			$tpart =~ /"(.+?)"/;
			print fh2 $1;
			$tpflag = 0;
			$tflag = 0;
		}	
	}
	elsif($ppflag)
	{
		$pp = $pp." ".$row;
		
	}
	elsif($tpflag)
	{
         $tpart = $tpart.$row;
	}
}
}
close (READFILE);
close (fh2);
