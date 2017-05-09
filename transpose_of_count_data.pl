my @rows = ();
my @transposed = ();

open(F1,"output.txt") or die "Couldn't open $1";
open('OUT','>',"out.txt");
while(<F1>) {
    chomp;
    push @rows, [split  /\t/ ];
}
#print @rows;

for my $row (@rows) {
  for my $column (0 .. $#{$row}) {
    push(@{$transposed[$column]}, $row->[$column]);
  }
}

for my $new_row (@transposed) {
  for my $new_col (@{$new_row}) {
      print OUT $new_col, "\t";
  }
  print OUT "\n";
}