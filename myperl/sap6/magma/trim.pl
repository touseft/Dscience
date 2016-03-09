#!/usr/local/bin/perl

while (<>)
{
  @linearray = split (" ", $_);
  $linearray[0] =~ s/\/[A-Z0-9]*   /   /g;
  print "$linearray[0]     $linearray[1]     $linearray[2]\n";
}
