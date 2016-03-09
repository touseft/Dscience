#!/usr/local/bin/perl

while (<>)
{
  @linearray = split (" ", $_);
  $linearray[1] =~ s/\(//g;
  $linearray[1] =~ s/\)//g;

  $linearray[0] =~ s/\/Z$//g;
  $linearray[0] =~ s/\/Q$//g;
  #print "$linearray[0]   $linearray[1]\n"; 
  print "data attach \$m\/$linearray[0] cell_model \[lu_findmaster \$l $linearray[1]H]\n"; 
  
}
