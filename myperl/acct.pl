#!/usr/local/bin/perl

use File::Find;

my $sum = 0;
my $count = 0;

sub cfiles() {
  $count = $count+1;
}


$i = 1000;

for ($i = 1000; $i < 1005; $i++)
{
  $sum = 0;
  $count = 0;

  $dir = "$ARGV[0]/$i";
  find(\&cfiles, $dir);
  find sub { $sum += -s }, $dir;
  print "$dir contains $count files, and $sum bytes\n";
} 
