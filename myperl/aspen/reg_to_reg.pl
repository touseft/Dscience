#!/usr/local/bin/perl

while (<>)
{
  if ($_ !~ /Startpoint:/ )
  {
    next;
  }

  $start = $_;
  if ($_ =~ /mem/)
  {
    next;
  }
  else {
    $_ = <>;
    $_ = <>;
    $end = $_;
    if ($_ =~ /mem/)
    {
      next;
    }
    else {
      print $start;
      print $end;
      next;
    }
  }
}

