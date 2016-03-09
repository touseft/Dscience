#!/usr/local/bin/perl

while (<>)
{

  @linearray = split (" ", $_);

  @cornerarray = split ("/", $linearray[0]); 

  if ($cornerarray[1] =~ /sw_/)
  {
    print "report_timing \-delay_type max \-derate \-nosplit \-nets \-transition_time \-capacitance \-crosstalk_delta \-path_type full_clock_expanded -pba_mode path -through $linearray[1] \>\> $cornerarray[0].$cornerarray[1]\.rpt\n "
  } elsif ($cornerarray[1] =~ /hb_/) {
    print "report_timing \-delay_type min \-derate \-nosplit \-nets \-transition_time \-capacitance \-crosstalk_delta \-path_type full_clock_expanded -pba_mode path -through $linearray[1] \>\> $cornerarray[0].$cornerarray[1]\.rpt\n "
  } elsif ($cornerarray[1] =~ /hw_/) {
    print "report_timing \-delay_type min \-derate \-nosplit \-nets \-transition_time \-capacitance \-crosstalk_delta \-path_type full_clock_expanded -pba_mode path -through $linearray[1] \>\> $cornerarray[0].$cornerarray[1]\.rpt\n "
  }
}
