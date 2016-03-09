#!/usr/local/bin/perl

while (<>)
{

  if ($_ !~ /Startpoint: /) {
    next;
  }

  @linestartarray = split (" ", $_);

  $start = $linestartarray[1]; 

  while (<>)
  {
    if ($_ !~ /Endpoint: /) {
      next;
    }
    @lineendarray = split (" ", $_);
    $end = $lineendarray[1];
    last;
  }

  while (<>)  {
    if ($_ !~ / slack \(/) {
      next;
    }
    @slacklinearray = split (" ", $_);
    $slack = $slacklinearray[2];
    last;
  }

  print "$start  $end  $slack\n";

}
