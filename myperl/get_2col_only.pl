#!/usr/local/bin/perl

while (<>)
{
  @linearray = split (" ", $_);
  #$linearray[1] =~ s/\/CP$//g;

  print "$linearray[1]\n"; 
  
}
