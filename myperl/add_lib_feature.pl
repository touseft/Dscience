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
my @files = grep {/\.lib$/} readdir DIR;
#my @files = grep {/lib/} readdir DIR;
close DIR;

foreach my $file (@files) {

  #$mfile = $file . "\.m";
  $mfile = $file;
  open (FH, "<$file") or die "$!";
  open (MFH, ">../primetime_lib_w_delay_calc/$mfile") or die "$!";

  while (<FH>) {
    if ($_ !~ /delay_model/)
    {
      print MFH $_;
      next;
    }
    print MFH $_;
    print MFH "library_features(report_delay_calculation);\n";
    while (<FH>)
    {
      print MFH $_;
    }
  }
  close (FH);
  close (MFH);
  #system("mv $mfile $file");
}

