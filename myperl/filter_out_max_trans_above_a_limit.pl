#!/usr/local/bin/perl

while (<>)
{
  @linearray = split (" ", $_);

  $node = $linearray[1];
  $limit = $linearray[2];
  $tran = $linearray[3];

  $max_limit = 1.180;

  $real_viol = $tran - $max_limit;
  $real_viol = $max_limit - $tran;
  print "$linearray[0]  $node  $max_limit  $tran  $real_viol\n";   
}
