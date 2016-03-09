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

foreach my $file (@files) {

  #$mfile = $file . "\.m";
  $mfile = $file;
  $outmfile = "slack_" . $mfile;
  open (FH, "<$file") or die "$!";
  open (OFH, ">$outmfile") or die "$!";
  print OFH "$mfile\n";

  while (<FH>) {

    if ($_ !~ /slack \(/)
    {
      next;
    }


    @line = split (" ", $_);
    print OFH "$line[2]\n";
    while (<FH>)
    {
      if ($_ !~ /Startpoint: /)
      {
        next;
      }
      last;
    }

  }
  close (FH);
  close (OFH);
} 
