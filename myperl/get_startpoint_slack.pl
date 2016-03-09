#!/usr/local/bin/perl

while(<>)
{
  if ($_ !~ /Startpoint: /)
  {
    next;
  }

  #chomp;
  $endpt = $_;
  @startarray = split (" ", $_);
  

  while (<>)
  {
    if ($_ !~ / slack \(/)
    {
      next;
    }
    @slacklinearray = split(" ", $_);
    last;
  }

  print "$startarray[1]  $slacklinearray[2]\n";
}
