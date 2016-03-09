#!/usr/local/bin/perl

$filename1 = $ARGV[0];
$filename2 = $ARGV[1];

open (FILE1, "<$filename1") or die "Error: Can't open file $filename1: $!";
open (FILE2, "<$filename2") or die "Error: Can't open file $filename2: $!";


while (<FILE1>)
{
  @linearray = split(" ", $_);
  $slack = <FILE2>;
  chomp($slack);
  print "$linearray[0]  $slack\n";
}
