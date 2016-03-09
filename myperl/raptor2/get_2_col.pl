#!/usr/local/bin/perl

while (<>)
{
  @linearray = split (" ", $_);
  $linearray[0] =~ s/\/CP$//g;
  $linearray[1] =~ s/\(//g;
  $linearray[1] =~ s/\)//g;

  print "swap_cell {$linearray[0]} \[get_lib_cells tc340c_hs_ss_1\.00v_tjm40_eccs\/$linearray[1]H\]\n"; 
  #print "grep \"$linearray[0]\" \/data\/data117\/maxim\/raptor2\/ptsi\/m8_clk\/nrc7_r34\/netlist\/\*\.v\n"; 
  
}
