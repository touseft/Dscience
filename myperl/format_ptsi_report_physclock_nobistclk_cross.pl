#!/usr/local/bin/perl

$linecount = 0;

@pathlaunch = ();
@pathcapture = ();

while (<>)
{
  push (@pathlaunch, $_);
  $linecount++;
  if ($_ !~ /Startpoint: /)
  {
    next;
  }
  $_ = <>;
  push (@pathlaunch, $_);
  $linecount++;
  $_ = <>;
  push (@pathlaunch, $_);
  $linecount++;
  $_ = <>;
  push (@pathlaunch, $_);
  $linecount++;

  #@startlinearray = split (" ", $start);
  #@endlinearray = split (" ", $end);

  $_ = <>;
  push (@pathlaunch, $_);
  $linecount++;
  $_ = <>;
  push (@pathlaunch, $_);
  $linecount++;
  $_ = <>;
  push (@pathlaunch, $_);
  $linecount++;
  $_ = <>;
  push (@pathlaunch, $_);
  $linecount++;
  $_ = <>;
  push (@pathlaunch, $_);
  $linecount++;

  $launch_is_bistclk = 0;
  $capture_is_bistclk = 0;
  while (<>) 
  {
    push (@pathlaunch, $_);
    $linecount++;
    if ($_ !~ / data arrival time/)
    {
      if ($_ =~ /_group_BISTCLK_/)
      {
        $launch_is_bistclk = 1;
      }
    } else {
      last;
    }
  }
  push (@pathlaunch, $_);
  
  while (<>) 
  {
    push (@pathcapture, $_);
    $linecount++;
    if ($_ !~ /with no derating/)
    {
      if ($_ =~ /_group_BISTCLK_/)
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

  #if  ( (($launch_is_bistclk == 1) && (!$capture_is_bistclk)) || ((!$launch_is_bistclk == 1) && ($capture_is_bistclk == 1)) )
  
  if  ( !(($launch_is_bistclk == 1) && (!$capture_is_bistclk)) || ((!$launch_is_bistclk) && ($capture_is_bistclk == 1)) )
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

print "total line count is: $linecount\n";
