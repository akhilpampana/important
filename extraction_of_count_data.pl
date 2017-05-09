@files=glob("*.count");
$file=@files;
open('OUT','>',"output.txt");
for($f=0;$f<$file;$f++){
	open('fh',"$files[$f]") or die "Couldn't open $1";
	
	@lines=<fh>;
	$len=@lines;
	close(fh);
	if($files[$f]=~/(.*)\.count/){
	print OUT "$1\t";
	}
	for(my $x=6;$x<$len;$x++){
				chomp $lines[$x];
				@val=split /\t/,$lines[$x];
				print OUT "$val[7]\t";
			}
			print OUT "\n";
		}