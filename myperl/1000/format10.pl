#!/usr/local/bin/perl

while (<>)
{
  @linearray = split(" ", $_);
  $linearray[1] =~ s/\./\//g;
  $linearray[2] =~ s/\./\//g;
  print "  $linearray[1] \\\n";
  print "  $linearray[2] \\\n";
}
