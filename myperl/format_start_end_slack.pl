#!/usr/local/bin/perl

while (<>)
{
  if ($_ !~ /Startpoint: /)
  {
    next;
  }
  @startline = split(" ", $_);
  $start  = $startline[1];
  while (<>)
  {
    if ($_ !~ /Endpoint: /)
    {
      next;
    }
    @endline = split(" ", $_);
    $end  = $endline[1];
    last;
  }
  while (<>)
  {
    if ($_ !~ /slack /)
    {
      next;
    }
    @slackline = split(" ", $_);
    $slack  = $slackline[2];
    last;
  }

  print "$start  $end  $slack\n";
}
