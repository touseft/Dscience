#!/usr/local/bin/perl

while (<>)
{
  @linearray = split(" ", $_);
  print "########\n";
  print "#$_";
  print "########\n";

  $fname = $linearray[1];
  $fname =~ s/\//\-\-\-/g;

  print "report_timing \-path_type full_clock_expanded -delay_type max \-input_pins \-transition_time \-capacitance \-crosstalk_delta \-derate -to $linearray[1]/A\* \> $fname $linearray[0].rpt\n";
  print "report_timing \-path_type full_clock_expanded -delay_type max \-input_pins \-transition_time \-capacitance \-crosstalk_delta \-derate -to $linearray[1]/CEN \>\> $fname $linearray[0].rpt\n";
  print "report_timing \-path_type full_clock_expanded -delay_type max \-input_pins \-transition_time \-capacitance \-crosstalk_delta \-derate -to $linearray[1]/BW\* \>\> $fname $linearray[0].rpt\n";
  print "report_timing \-path_type full_clock_expanded -delay_type max \-input_pins \-transition_time \-capacitance \-crosstalk_delta \-derate -to $linearray[1]/WEN\* \>\> $fname $linearray[0].rpt\n";
  print "report_timing \-path_type full_clock_expanded -delay_type max \-input_pins \-transition_time \-capacitance \-crosstalk_delta \-derate -from $linearray[1]/O\* \>\> $fname $linearray[0].rpt\n\n\n";

}
