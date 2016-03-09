#!/usr/local/bin/perl

open (fileH, "< $ARGV[0]") or die "Can't open $ARGV[0] for reading: $!\n";

while (<fileH>)
{
  if ( ($_ =~ /library \(/) || ($_ =~ /library\(/) )
  #if ($_ !~ /library\(/) 
  {
    $_ =~ s/_mg_lp_/_rf111_mg_lp_/g;
    print $_;
    next;
  }
  print $_;
}
