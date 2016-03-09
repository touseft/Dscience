#!/usr/local/bin/perl

while (<>)
{
  @linearray = split (" ", $_);
  $linearray[6] =~ s/\]//g;

  $linearray[2] =~ s/\$m\///g;
  
  print "size_cell \-libraries \{tc320c_hs_worst_1\.10v_tj125_nldm\} \{$linearray[2]\} $linearray[6]\n";
}
