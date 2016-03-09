#!/usr/local/bin/perl

use File::Find;

$i = 1000;

for ($i = 1000; $i < 1005; $i++)
{
  $mysum = 0;
  $dir = "$ARGV[0]/hcs/$i";
  find sub { $sum += -s }, $dir;
  print "$dir contains $sum bytes\n";
} 
