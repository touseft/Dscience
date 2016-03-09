#! /usr/local/bin/perl


#while (<>)
#{
#  if ($_ !~ /delay_model/)
#library_features(report_delay_calculation);
#  {
#    print $_;
#    next;
#  }
#  print $_;
#  print "library_features(report_delay_calculation);\n";
#  while (<>)
#  {
#    print $_;
#  }
#}

opendir (DIR, ".") or die "$!";
my @files = grep {/\.txt$/ and not /clock/} readdir DIR;
close DIR;

@line = ();
$endpoint = 0;
$total_slack = 0;
$wns = 0;

foreach my $file (@files) {

  #$mfile = $file . "\.m";
  $mfile = $file;
  open (FH, "<$file") or die "$!";

  while (<FH>) {

    if ($_ !~ /Endpoint:/)
    {
      next;
    }

    $endpoint++;

    while (<FH>)
    {
      if ($_ !~ /slack /)
      {
        next;
      }
      if ($_ !~ /VIOLATED/)
      {
        $endpoint--;
        last;
      } else {
        @line = split (" ", $_);
        $total_slack = $total_slack + $line[2];
        if ($line[2] < $wns)
        {
          $wns = $line[2];
        }
        #print "$mfile "; 
        #print $_; 
        last;
      }
    } 
  }
  if ($endpoint > 0)
  {
    $avg = $total_slack / $endpoint;
  } else {
    $avg = 0.0;
  }
  close (FH);
  open (FH, ">>$file") or die "$!";
  #print FH "### $mfile TNS: $total_slack FEP: $endpoint AVG: $avg \n";

  #print "Sorting by domain\n";
  #print " Cnt    Max     Avg    Total  Name\n";

  #print FH "\&\&\& $endpoint        $wns        $avg        $total_slack        $mfile\n";
  #printf (FH "\&\&\&  %f %f %f %f %s\n", $endpoint  $wns    $avg   $total_slack  $mfile;
  printf (FH "&&& %5d %7.3f %6.2f %8.1f %s\n", $endpoint, $wns, $avg, $total_slack, $mfile);

  close (FH);
  $endpoint = 0;
  $total_slack = 0;
  $wns = 0;
  #system("mv $mfile $file");
}
#printf " %1s%20s%20s%20s%20.2f\n", $chipmode,$clockdomain,$condition2,$slacktype,$slackarray[2];
