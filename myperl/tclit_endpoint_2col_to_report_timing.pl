#!/usr/local/bin/perl

while (<>)
{
  @linearray = split (" ", $_);

  print "report_timing -delay_type min -derate -nosplit -nworst 10000 -max_paths 10000 -slack_lesser_than 0.000 -to $linearray[1]\/D \>\> report_timing_nworst_1000.rpt\n"; 

}
