#!/usr/local/bin/perl

while (<>)
{
  @linearray = split (" ", $_);
  print "$linearray[0]   $linearray[1]    $linearray[4]\n";
}
