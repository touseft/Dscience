#!/usr/local/bin/perl

while (<>)
{
  if ($_ !~ /data arrival time/)
  {
    next;
  }
  while (<>)
  {
    if ($_ !~ / VISUAL /)
    {
      next;
    }
    last;
  }
  while (<>)
  {
    if ($_ !~ /clock reconvergence pessimism/)
    {
      @line = split (" ", $_);
      print "$line[0] $line[1]\n";
      next;
    }
    last;
  }
}

