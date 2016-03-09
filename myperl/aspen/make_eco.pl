#!/usr/local/bin/perl

while (<>)
{
  $_ =~ s/\/Z //g;
  $_ =~ s/\/Q //g;
  $_ =~ s/\/QN //g;

  @linearray = split(" ", $_);
  print "data attach \$m\/$linearray[0] cell_model \[lu_findmaster \$l $linearray[1]H\]\n";
}
