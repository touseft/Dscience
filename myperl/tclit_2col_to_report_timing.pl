#!/usr/local/bin/perl

while (<>)
{
  @linearray = split (" ", $_);

  print "report_timing -delay_type min -from $linearray[2]\/Q \>\> report_timing_above_start_count_limit.rpt\n"; 

}
