#!/usr/local/bin/perl

while (<>)
{
  @linearray = split (" ", $_);

  @linearray0 = split ("B", $linearray[0]);
  $bitwidth = $linearray0[1];
  $bitwidth =~ s/A$//g;
  $bitwidth =~ s/B$//g;
  $bitwidth =~ s/C$//g;
  $bitwidth =~ s/D$//g;
  $bitwidth =~ s/E$//g;
  $bitwidth =~ s/G$//g;
  $bitwidth =~ s/H$//g;
  $bitwidth = $bitwidth - 1;

  if ($linearray[0] =~ /RF211/)
  {
    print "add ignore input WAI$bitwidth \-module $linearray[0] \-revised\n\n";
  }

  if ($linearray[0] =~ /RF111/)
  {
    print "add ignore input I$bitwidth \-module $linearray[0] \-revised\n";
    print "add ignore input BWEN$bitwidth \-module $linearray[0] \-revised\n\n";
  }

  if ($linearray[0] =~ /RA111/)
  {
    print "add ignore input I$bitwidth \-module $linearray[0] \-revised\n";
    print "add ignore input BWEN$bitwidth \-module $linearray[0] \-revised\n\n";
  }

  if ($linearray[0] =~ /RA22/)
  {
    print "add ignore input AI$bitwidth \-module $linearray[0] \-revised\n";
    print "add ignore input BI$bitwidth \-module $linearray[0] \-revised\n";
    print "add ignore input ABWEN$bitwidth \-module $linearray[0] \-revised\n";
    print "add ignore input BBWEN$bitwidth \-module $linearray[0] \-revised\n\n";
  }
}
