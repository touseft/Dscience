#!/usr/local/bin/perl

use warnings;

@job_files = glob "*.job";

foreach $job_file (@job_files) {

  open (RJOBFILEH, "< $job_file") or  die "Error: Can't open file $job_file: $!";
  $newjob_file = $job_file . "\.new";
  open (WJOBFILEH, ">$newjob_file") or  die "Error: Can't open file $job_file: $!";
  while (<RJOBFILEH>)
  {
    $_ =~ s/\-vcs /\-mti \-simopts \+notimingchecks /g;
    print WJOBFILEH $_;
  }
  close RJOBFILEH;
  close WJOBFILEH;
  #print "$job_file \n";
}

