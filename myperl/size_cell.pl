#!/usr/local/bin/perl

while (<>)
{
  @linearray = split (" ", $_);
  $linearray[1] =~ s/\(//g;
  $linearray[1] =~ s/\)//g;

  
  $linearray[0] =~ s/\/Z//g;
  $linearray[0] =~ s/\/Q//g;
  $linearray[0] =~ s/\/QN//g;

  print "size_cell \-libraries \{tc320c_hs_worst_1\.10v_tj125_nldm\} \{$linearray[0]\} $linearray[1]H\n";
}
