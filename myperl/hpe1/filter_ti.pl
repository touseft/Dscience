#!/usr/local/bin/perl

$bline = <>;
chomp($bline);

while (<>)
{
  if ($_ !~ /data arrival time/)
  {
    chomp;
    $bline = $_;
    next;
  }
  while (<>)
  {
    if ($_ !~ /slack /)
    {
      next; 
    }
    @linearray = split (" ", $_);
    $slack = $linearray[2];
    last;
  }
  @blinearray = split(" ", $bline);
  print " $blinearray[0] $linearray[2] $blinearray[1]\n"; 
  
}
