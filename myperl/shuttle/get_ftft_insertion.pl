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
    #if ($_ !~ / \(ddrph_top\) /)
    if ($_ !~ /FTFT /)
    #if ($_ !~ /\/D \(CQF/)
    #if ($_ !~ /\/mbmux_[A-Z0-9]*\/U2\/A1/)
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
