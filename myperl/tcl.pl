#!/usr/local/bin/perl

while (<>)
{
  print "#$_";
  @linearray = split(" ", $_);
  print "#$linearray[0] $linearray[1] $linearray[2] $linearray[3] $linearray[5] $linearray[6]\n";
 
  print "set p \$m\/$linearray[0]\/CP\n\n";
}
