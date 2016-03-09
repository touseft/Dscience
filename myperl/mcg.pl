#!/usr/local/bin/perl

while (<>)
{
  $_ =~ s/CFDN1QX1H/XCFDN1QX1H/g;
  $_ =~ s/CFD2X4H/XCFD2X4H/g;
  $_ =~ s/CFD2X1H/XCFD2X1H/g;
  $_ =~ s/CFD2QX4H/XCFD2QX4H/g;
  $_ =~ s/CFD1QX4H/XCFD1QX4H/g;
  $_ =~ s/CFD2QX1H/XCFD2QX1H/g;
  $_ =~ s/CFD1QX1H/XCFD1QX1H/g;
  $_ =~ s/CFD1X1H/XCFD1X1H/g;
  $_ =~ s/CFD4X1H/XCFD4X1H/g;
  print $_;
}
