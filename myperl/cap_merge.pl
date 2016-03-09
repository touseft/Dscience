#!/usr/local/bin/perl

print "$ARGV[0]\n";
print "$ARGV[1]\n";

open (LIBERTYFH, "<$ARGV[0]") or die "Error: Can't open file liberty file $ARGV[0]: $!";
open (CAPFH, "<$ARGV[1]") or die "Error: Can't open file capacitance file $ARGV[1]: $!";


$outfilename = $ARGV[0] . "_capmerge";

open (OUTFILEFH, ">$outfilename") or  die "Error: Can't open file $outfilename: $!";

 
while (<LIBERTYFH>)
{
  if ($_ !~ /max_capacitance/)
  {
    print OUTFILEFH $_;
    next;
  }
  $_ = <CAPFH>;
  print OUTFILEFH $_;
}
