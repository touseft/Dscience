#!/usr/local/bin/perl

while (<>)
{
  @linearray = split(" ", $_);
  print "#$_";

  $fname = $linearray[1];
  $fname =~ s/\//\-\-\-/g;

  #print "report_timing \-path_type full_clock_expanded -delay_type max \-input_pins \-nets \-transition_time \-capacitance \-crosstalk_delta \-derate -through $linearray[1]/* \> $fname $linearray[0].rpt\n";
  #print "report_timing \-path_type full_clock_expanded -delay_type max \-input_pins \-nets \-transition_time \-capacitance \-crosstalk_delta \-derate -to $linearray[1]/A* \>\> $fname $linearray[0].rpt\n";
  #print "report_timing \-path_type full_clock_expanded -delay_type max \-input_pins \-nets \-transition_time \-capacitance \-crosstalk_delta \-derate -from $linearray[1]/O* \>\> $fname $linearray[0].rpt\n\n\n";


  print "set paths \[get_timing_paths \-path full_clock_expanded \-to $linearray[1]/I\*\]\n";
  print "append_to_collection paths \[get_timing_paths \-path full_clock_expanded \-to   $linearray[1]/A\*\]\n";
  print "append_to_collection paths \[get_timing_paths \-path full_clock_expanded \-to   $linearray[1]/CEN\]\n";
  print "append_to_collection paths \[get_timing_paths \-path full_clock_expanded \-to   $linearray[1]/BW\*\]\n";
  print "append_to_collection paths \[get_timing_paths \-path full_clock_expanded \-to   $linearray[1]/WEN\]\n";
  print "append_to_collection paths \[get_timing_paths \-path full_clock_expanded \-from $linearray[1]/O\*\]\n";
  print "process_paths \$paths\n";
  print "write_path_summary \-fields \{index startpoint endpoint slack levels launch_latency capture_latency\} \>\> report_timing\.rpt\n\n";

}
