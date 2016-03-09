#!/usr/local/bin/perl

while (<>)
{
  @linearray = split(" ", $_);
  $linearray[2] =~ s/\$m\///g;
  $linearray[6] =~ s/\]//g;
  
  #print "$linearray[2] $linearray[6]\n";

  print "size_cell \-libraries \{tc320c_lp_worst_1\.10v_tj125_nldm tc320c_hs_worst_1\.10v_tj125_nldm\} \{$linearray[2]\} $linearray[6]\n";
}
