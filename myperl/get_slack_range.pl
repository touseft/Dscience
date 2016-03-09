#! /usr/local/bin/perl


opendir (DIR, ".") or die "$!";
my @files = grep {/\.rpt$/ and /report_timing/} readdir DIR;
close DIR;

@line = ();
$endpoint = 0;
$total_slack = 0;
$wns = 0;

foreach my $file (@files) {

  $mfile = $file;
  open (FH, "<$file") or die "$!";

  while (<FH>) {

    if ($_ !~ /Startpoint/)
    {
      next;
    }
    @startline = split (" ", $_);

    print "$startline[1] "; 

    $endpoint++;

    while (<FH>)
    {
      if ($_ !~ /slack /)
      {
        next;
      }
      @slackline = split (" ", $_);
      print " $slackline[2] ";
    }
    print "\n";
  }
  close (FH);
}
