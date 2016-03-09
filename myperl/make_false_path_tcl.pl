#!/usr/local/bin/perl

while (<>)
{
  @linearray = split (" ", $_);
  print "set_false_path -to $linearray[0]\n";
}
