#!/usr/local/bin/perl

while (<>)
{
  print "#$_";
  @linearray=split(" ", $_);
  print "add_1buff4_on_top \$m \$l $linearray[0]\n\n";
}
