#!/usr/local/bin/perl

$filename1 = $ARGV[0];
open(FILE1, "<$filename1") or die "Error: Can't open flat verilog file $filename1: $!";


while (<FILE1>)
{
  if ( ($_ !~ / RA/) && ($_ !~ / RF/) )
  {
    next;
  }

  print $_;

  while (<FILE1>)
  {
    print $_;
    if ($_ =~ /\;/)
    {
      last;
    }
  }
}

