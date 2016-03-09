#!/usr/local/bin/perl

while (<>)
{
  @linearray = split (" ", $_);
  print "$linearray[0]   $linearray[1]   $linearray[2]   $linearray[5] $linearray[6]\n";
}
