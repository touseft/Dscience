#!/usr/local/bin/perl

$notfound = 0;

while (<>)
{
  if ($_ !~ /cell\(C/)
  {
    next;
  }
  
  chomp;
  $cell = $_;

  while (<>)
  {
    if ($_ !~ /area \: /)
    {
      next;
    }
    chomp;
    $area = $_;

    $_ = <>;

    if ($_ !~ /ff\(/)
    {
      $notfound = 1;
      last;
    }
    print "$cell, $area\n";
  }

  if ($notfound)
  {
    $notfound = 0;
  }
  next;
}
