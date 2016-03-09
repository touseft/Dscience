#!/usr/local/bin/perl

while (<>)
{
  @linearray = split (" ", $_);
  $linearray[3] =~ s/\{//g;
  $linearray[3] =~ s/\}//g;

  print "data attach \$m\/$linearray[3] cell_model \[lu_findmaster \$l $linearray[4]\]\n";
}
  
