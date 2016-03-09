#!/usr/local/bin/perl

while (<>)
{
  if ($_ =~ /\/Q[N]* /)
  {
    if ($_ =~ /\/D /)
    {
      next;
    }
  }
  print $_;

}
