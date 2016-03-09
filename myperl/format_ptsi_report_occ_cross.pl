#!/usr/local/bin/perl

$linecount = 0;

#print "$ARGV[0]\n";
#print "$ARGV[1]\n";

open (TIMINGREPORTFH, "<$ARGV[2]") or die "Error: Can't open file liberty file $ARGV[2]: $!";


@pathlaunch = ();
@pathcapture = ();

while (<TIMINGREPORTFH>)
{
  push (@pathlaunch, $_);
  $linecount++;
  if ($_ !~ /Startpoint: /)
  {
    next;
  }
  $_ = <TIMINGREPORTFH>;
  push (@pathlaunch, $_);
  $linecount++;
  $_ = <TIMINGREPORTFH>;
  push (@pathlaunch, $_);
  $linecount++;
  $_ = <TIMINGREPORTFH>;
  push (@pathlaunch, $_);
  $linecount++;

  #@startlinearray = split (" ", $start);
  #@endlinearray = split (" ", $end);

  $_ = <TIMINGREPORTFH>;
  push (@pathlaunch, $_);
  $linecount++;
  $_ = <TIMINGREPORTFH>;
  push (@pathlaunch, $_);
  $linecount++;
  $_ = <TIMINGREPORTFH>;
  push (@pathlaunch, $_);
  $linecount++;
  $_ = <TIMINGREPORTFH>;
  push (@pathlaunch, $_);
  $linecount++;
  $_ = <TIMINGREPORTFH>;
  push (@pathlaunch, $_);
  $linecount++;

  $launch_is_bistclk = 0;
  $capture_is_bistclk = 0;
  while (<TIMINGREPORTFH>) 
  {
    push (@pathlaunch, $_);
    $linecount++;
    if ($_ !~ / data arrival time/)
    {
      if ($_ =~ /$ARGV[0]/)
      {
        $launch_is_bistclk = 1;
      }
    } else {
      last;
    }
  }
  push (@pathlaunch, $_);
  
  while (<TIMINGREPORTFH>) 
  {
    push (@pathcapture, $_);
    $linecount++;
    if ($_ !~ /with no derating/)
    {
      if ($_ =~ /$ARGV[1]/)
      {
        $capture_is_bistclk = 1;
      }
    } else {
      last;
    }
  }
  push (@pathcapture, $_);

  #print "Hello Launch: $launch_is_bistclk\n";
  #print "Hello Capture: $capture_is_bistclk\n";

  #if  ( ($launch_is_bistclk == 1) && ($capture_is_bistclk == 1) )
  if  ( (($launch_is_bistclk == 1) && (!$capture_is_bistclk)) || ((!$launch_is_bistclk) && ($capture_is_bistclk == 1)) )
  {
    $launchcount = @pathlaunch;
    $capturecount = @pathcapture;

    for ($i=0; $i < $launchcount; $i++)
    {
      print "$pathlaunch[$i]";
    }
    for ($i=0; $i < $capturecount; $i++)
    {
      print "$pathcapture[$i]";
    }
    print "\n";
  }
  @pathlaunch = ();
  @pathcapture = ();
}

#print "total line count is: $linecount\n";
