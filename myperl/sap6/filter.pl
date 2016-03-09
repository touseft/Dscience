#!/usr/local/bin/perl

while (<>)
{
  @linearray = split(" ", $_);

  $linearray[0] =~ s/\/Z$//g;

  print "data attach \$m\/$linearray[0] cell_model \[lu_findmaster \$l $linearray[1]H\]\n";

}
