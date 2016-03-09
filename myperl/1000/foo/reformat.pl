#!/usr/local/bin/perl

while (<>)
{
  chomp();
  @linearray = split (" ", $_);
  print "echo \"$_\" >> result\n";
  print "grep $linearray[0] ddp3021_full.v >> result\n";
  print "echo \"\" >> result\n";
}

