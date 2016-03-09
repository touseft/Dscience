#!/usr/local/bin/perl

open (fileH, "< $ARGV[0]") or die "Can't open $ARGV[0] for reading: $!\n";

while (<fileH>)
{
  if ( ($_ =~ /library \(/) || ($_ =~ /library\(/) )
  #if ($_ !~ /library\(/) 
  {
    $_ =~ s/0\.90v_/1\.0575v_/g;
    $_ =~ s/_eccs/_nldm/g;
    print $_;
    next;
  }
  print $_;
}
