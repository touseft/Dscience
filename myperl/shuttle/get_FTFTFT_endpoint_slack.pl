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
    if ($_ !~ /FTFTFT/)
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

    print "$mbmuxlinearray[1]  $slacklinearray[2]\n";
  }
}
