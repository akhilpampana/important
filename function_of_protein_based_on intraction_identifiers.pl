#!/usr/bin/perl
my %proteinname;
my %genedesc;
my @interact;
my %gene_ont;
my %genelist;
my @genio;
my @geneovalues;
my $GENE_ID;
my $life = 1;
my $incre = 0;
my $string;
my $results;
open( readfile , 'BIOGRID-ORGANISM-Homo_sapiens-3.1.91.tab.txt');
open( writefile, '>file1.txt');
$num_args = $#ARGV + 1;
if($num_args != 1)
     { 
      print " please enter in specific format and run the program with perl filename.pl GENE_ID\n";
        exit; 
       }
$GENE_ID = $ARGV[0];
print "what was the protein name to be annotated: $GENE_ID \n";
while ($font = <readfile>)
{
 if($font =~ m/$GENE_ID/)
 {
  @rows = split ("\t",$font);
  @aliases = split(/\|/ , $rows[4]);
  { 
   for($i=0; $i<@aliases; $i++) 
   {
    if(@aliases[$i] eq $GENE_ID)
    { 
     $GENE_ID = $rows[2];
     $life = 1;
    }
    if($life == 0)
    {
     @aliases = split("|",$rows[5]);
      for($i=0;$i < @aliases;$i++)
      {
       if($aliases[$i] eq $GENE_ID)
				{
					$GENE_ID = $rows[5];
					$life = 1;
				}
     } 			
  }			
}
   if($life == 1 && $incre == 1)
   {
    print "the gene id and protein name  is $GENE_ID  \n";
    $incre = 0;
      }
   }
}  
close(readfile);
open( readfile , 'BIOGRID-ORGANISM-Homo_sapiens-3.1.91.tab.txt');
print " the interactions of the proteins are determined to give the required results\n";
while ($font = <readfile>)
{
   if ($font =~ m/\b$GENE_ID\b/)
    	{
		@rows = split("\t",$font);
		$proteinname{$rows[2]} = 1;
		$proteinname{$rows[3]} = 1;
        	print writefile $rows[0]."\t".$rows[1]."\t".$rows[2]."\t".$rows[3]."\n";
    	}
}

delete $proteinsname{$GENE_ID};
# print "$proteins" ;


@interact = keys %proteinname;


print " the no of interactions for the protein with gene id ".$GENE_ID." is ".@interact."";


if(@interact > 5 )
  {
   print " processing the data and finding the interactions of the proteins with otherss, pls wait";
  }
  else 
  {
   print " protein has less interactions";
   exit;
  }

for($i=0;$i<@interact;$i++)
{
 print writefile $interact[$i]."\n";
  $string =  $interact[$i];
  print"$string\n";
  open ( HUMANGEO , 'gene_association.goa_human1.txt');
  while($font = <HUMANGEO>)
  {
   if($font =~ m/\b$string\b/)
   {
    @rows = split("\t",$font);
    $gene_ont = $rows[4];
       if(exists $genelist{$gene_ont})
			{
				$genelist{$gene_ont} = $genelist{$gene_ont} + 1;
			}
			else
			{
				$genelist{$gene_ont} = 1;
			
			}
                        $results = $rows[9];
			$genedesc{$gene_ont} = $results;
			printf $genedesc{$gene_ont}."\n";
                        print writefile $rows[0]."\t".$rows[1]."\t".$rows[2]."\t".$rows[3]."\t".$rows[4]."\t".$genedesc."\n";
		}
	}
	close(HUMANGEO);
}
	

@genio = sort { $genelist{$b} <=> $genelist{$a} } keys(%genelist);
@geneovalues = @genelist{@genio};

print "\ntotal no of proteins : ".@interact."\n";

print "The total number of interactions : ".@genio."\n";

if(@genio<20)
{
	print "interactions < 20. So, displaying the frequency of all the interactions\n";
	$end = @genio;
}
else
{
 print " interactions > 20. So, displaying the top 20 GOs with highest frequency\n";
	$end = 20;
	
}

print "GO Number\t\tFrequency\t\t\tDescription\n";

for($i=0; $i< $end;$i++)
{
	print writefile $genio[$i]." = ".$geneovalues[$i]."\n" ;
	$freq = ($geneovalues[$i]/@interact);
	print $genio[$i]."\t\t".$geneovalues[$i]/@interact."\t\t".$genedesc{$genio[$i]}."\n";
}

close (readfile);
close (writefile);
}

