#!/usr/local/bin/perl

$total_bits = 0;
$bits = 0;

while (<>)
{
  chomp;

  @linearray = split ("B", $_);
  $bits = $linearray[0] * $linearray[1];
  $total_bits = $total_bits + $bits;

  print "$linearray[0] $linearray[1] $bits\n";
}

print "Total number of bits is: $total_bits\n";
