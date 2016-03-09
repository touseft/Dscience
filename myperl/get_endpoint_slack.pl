#!/usr/local/bin/perl

while(<>)
{
  if ($_ !~ /Endpoint: /)
  {
    next;
  }

  chomp;
  $endpt = $_;
  print $endpt;

  while (<>)
  {
    if ($_ !~ /data arrival time/)
    {
      $endpt = $_;
      next;
    }
    #print $endpt;
    
    @endpointlinearray = split(" ", $endpt);
    #print "FOO - $endpt\n";

    while (<>)
    {
      if ($_ !~ / slack \(/)
      {
        next;
      }
      @slacklinearray = split(" ", $_);

      #while (<>)
      #{
      #  if ($_ !~ /with no derating/)
      #  {
      #    next;
      #  }
      #  @noderatelinearray = split(" ", $_);
      #  #last;
      #}
      last;
    }

    #print "AOCVM $endpointlinearray[0]  $slacklinearray[2] $noderatelinearray[5]\n";
    print "$endpointlinearray[0]  $endpointlinearray[1] $slacklinearray[2]\n";
    #print "$endpointlinearray[0]\n";
    last;
  }
}
