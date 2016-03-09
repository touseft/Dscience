#!/usr/local/bin/perl

while(<>)
{
  if ($_ !~ /Endpoint: /)
  {
    next;
  }

  chomp;
  $endpt = $_;
  @endpointlinearray = split(" ", $endpt);

  while (<>)
  {
    if ($_ !~ /\/D \(CQ/)
    {
      next;
    }
    @mbmuxlinearray = split(" ", $_);

    while (<>)
    {
      if ($_ !~ / slack \(/)
      {
        next;
      }
      @slacklinearray = split(" ", $_);
      last;
    }

    print "$mbmuxlinearray[0]  $slacklinearray[2]\n";
  }
}
