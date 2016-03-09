#!/usr/local/bin/perl

while (<>)
{
  @linearray = split (" ", $_);

  $linearray[1] =~ s/\-//g;
  print "set_annotated_delay \-max \-increment \-cell \-from $linearray[0]\/CP \-to $linearray[0]\/Q $linearray[1]\n";
  print "set_annotated_delay \-min \-increment \-cell \-from $linearray[0]\/CP \-to $linearray[0]\/Q $linearray[1]\n";
}
