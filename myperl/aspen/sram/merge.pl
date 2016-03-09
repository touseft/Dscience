#!/usr/local/bin/perl

$filename1 = $ARGV[0];
$bitenable_filename2 = $ARGV[1];
open(FILE1, "<$filename1") or die "Error: Can't open file $filename1: $!";
open(FILE2, "<$bitenable_filename2") or die "Error: Can't open file $bitenable_filename2: $!";

%instancehash = ();
print "instance/module, sram model, bit_write required, instance name, pin name, clock name, clock period, slack to/from(ns)\n";
while (<FILE2>)
{
  @linearray = split(" ", $_);
  if (exists ($instancehash{$linearray[7]}))
  {
    print "ERROR: Cannot have two instance names in this hash table. $linearray[7]\n";
    next;
  }
  $instancehash{$linearray[7]} = 1;
}

while (<FILE1>)
{
  @linearray = split(/\,/, $_);
  $linearray[2] =~ s/[ ]*//g;
  if (exists ($instancehash{$linearray[2]}))
  {
    print "$linearray[0], $linearray[1], 0, $linearray[2], $linearray[3], $linearray[4], $linearray[5], $linearray[6]";
  }
  else {
    print "$linearray[0], $linearray[1], 1, $linearray[2], $linearray[3], $linearray[4], $linearray[5], $linearray[6]";
  }
}
