#!/usr/local/bin/perl

while (<>)
{
  @linearray = split (" ", $_);
  $linearray[1] =~ s/\\//g;

  #print "$linearray[0] $linearray[2]\n"; 
  #print "grep \"$linearray[0]\" \/data\/data117\/maxim\/raptor2\/ptsi\/m8_clk\/nrc7_r34\/netlist\/\*\.v\n"; 

  print "data attach \$m\/$linearray[1] cell_model \[find_model $linearray[0]\]\n";
  
}
