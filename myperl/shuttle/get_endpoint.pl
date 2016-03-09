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
    print "#$endpt  $slack\n";
    print "report_timing -from $endpointlinearray[1]/Q \>> capture_reg_from_path_scanclk2\.rpt\n";
    print "puts \"Need $slack\"\n";
    last;
  }
}
