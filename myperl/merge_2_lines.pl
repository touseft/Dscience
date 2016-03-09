#!/usr/local/bin/perl

while (<>)
{
  chomp;
  $line1 = $_;

  $line2 = <>;

  print "$line1 $line2"; 
  
}
