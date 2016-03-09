#!/usr/local/bin/perl

@aggressors = ();

while (<>)
{
  if ($_ !~ "[)]+" ) 
  {
    next;
  }

  if ($_ =~ "net name")
  {
    next;
  }

  $victim = $_;
  chomp($victim);
  @linearray = split (" ", $_);
  $linearray[1] =~ s/\(//g;
  $linearray[1] =~ s/\)//g;
  
  $netname0 =  $linearray[0]; 
  $netname1 =  $linearray[1]; 

  while (<>)
  {
    if ($_ !~ "Total:")
    {
      chomp;
      push (@aggressors, $_); 
      next;
    }
    chomp;
    print "echo \"$_\" \>\> report_timing_noise_top\.rpt\n";
    print "echo \"$victim\" \>\> report_timing_noise_top\.rpt\n";
    $count = @aggressors;
    for ($i=0; $i < $count; $i++)
    {
      print "echo \"$aggressors[$i]\"  \>\> report_timing_noise_top\.rpt\n";
    }
    last;
  }
  print "report_timing \-through $netname1 \>\> report_timing_noise_top.rpt\n\n"; 
  @aggressors = ();
}
