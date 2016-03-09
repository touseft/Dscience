#!/usr/local/bin/perl

while(<>)
{
  if ($_ !~ /Endpoint: /)
  {
    next;
  }

  chomp;
  $endpt = $_;

  while (<>)
  {
    if ($_ !~ /data arrival time/)
    {
      $endpt = $_;
      next;
    }
    
    @endpointlinearray = split(" ", $endpt);

    while (<>)
    {
      if ($_ !~ / slack \(/)
      {
        next;
      }
      @slacklinearray = split(" ", $_);

      while (<>)
      {
        if ($_ !~ /with no derating/)
        {
          next;
        }
        @noderatelinearray = split(" ", $_);
        last;
      }
      last;
    }

    #print "NOCV $endpointlinearray[0]  $slacklinearray[2] $noderatelinearray[5]\n";
    print "$endpointlinearray[0]  $slacklinearray[2]\n";
    last;
  }
}
