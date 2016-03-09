#!/usr/local/bin/perl

while (<>)
{

  @linearray = split (" ", $_);

  if ( ($linearray[0] =~ /_reg/) && ($linearray[1] =~ /_reg/) ) {
    print "FF2FF $linearray[0] $linearray[1] $linearray[2]\n";
  } elsif ( ($linearray[0] =~ /_reg/) && ($linearray[1] !~ /_reg/) ) {
    print "FF2SR $linearray[0] $linearray[1] $linearray[2]\n";
  } elsif ( ($linearray[0] !~ /_reg/) && ($linearray[1] =~ /_reg/) ) {
    print "SR2FF $linearray[0] $linearray[1] $linearray[2]\n";
  } else {
    print "$linearray[0] $linearray[1] $linearray[2]\n";
  }

}
