#!/usr/local/bin/perl

use strict;
use warnings;
use File::stat; 


opendir (DIR, ".") or die "$!";
#my @files = grep {/\.txt$/ and not /clock/} readdir DIR;
my @files = readdir DIR;
close DIR;


foreach my $mfile (@files) {
  my $filesize = stat($mfile)->size;
  if (!$filesize)
  {
    system("rm $mfile");
    print "Deleted 0 file size: $filesize\n";
  }
}
