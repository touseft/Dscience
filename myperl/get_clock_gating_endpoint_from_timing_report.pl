#!/usr/local/bin/perl

while (<>)
{
  if ($_ !~ /Endpoint: /)
  {
    next;
  }

  $prevline = $_;
  while (<>)
  {
    if ($_ !~ /data arrival time/)
    {
      $prevline = $_;
      next;
    } else {
      $line = $prevline;
      @linearray = split(" ", $line);
      $linearray[0] =~ s/\/[A-Z0-9]+$/\/Z/g;
      print "report_transitive_fanout \-nosplit \-from $linearray[0] \>\> report_transitive_fanout.log\n";
      #print $line;
      last;
    }
  }
}
