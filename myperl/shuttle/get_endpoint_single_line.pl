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
    if ($_ !~ / slack \(/)
    {
      next;
    }
    @linearray = split (" ", $_);
    $slack = $linearray[2];
    #print "$endpt  $slack\n";
    print "$endpointlinearray[1] $slack\n";
    #print "puts \"Need $slack\"\n";
    last;
  }
}
