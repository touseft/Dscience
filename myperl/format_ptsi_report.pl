#!/usr/local/bin/perl

$linenum = 0;
@patharray = ();

while (<>)
{
  if ($_ !~ /Startpoint: /)
  {
    print $_;
    next;
  }

  chomp;
  $patharray[$linenum] = $_;
  $linenum++;
  while (<>)
  {
    if ($_ !~ /$patharray[$linenum]/)
    {
      $patharray[$linenum] = $_;
      next; 
    }
   
    $patharray[$linenum] = $_; 
    $_ = <>; 
    $patharray[$linenum] = $_; 

    @instancearray = split("/", $_);
    $count = @instancearray;
    @pinarray = split(" ",$instancearray[$count-1]);
    $frompinname = $pinarray[0];
    last;
  }
  print "HEREHERE $frompinname\n";
} 
