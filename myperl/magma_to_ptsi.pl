#!/usr/local/bin/perl

while (<>)
{
  @linearray = split(" ", $_);

  $linearray[2] =~ s/\$m\///g;
  $linearray[6] =~ s/\]//g;

  #print "size_cell $linearray[2] tc320ca_hs_ss_1\.10v_tjm40_nldm\/$linearray[6]\n";
  print "size_cell $linearray[2] tc340c_hs_ss_1\.10v_tj125_eccs\/$linearray[6]\n";
  #print "swap_cell $linearray[2] \[get_lib_cells tc340c_hs_ss_1\.10v_tj125_eccs/$linearray[6]\]\n";
}
