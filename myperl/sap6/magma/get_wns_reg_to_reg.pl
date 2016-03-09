#!/usr/local/bin/perl

while (<>)
{
  if ($_ !~ /\-\-\-\-\-\-\-\-\-/)
  {
    next;
  }
  while (<>)
  {
    @linearray = split (" ", $_);

    if ( ($linearray[0] =~ /\/QN$/) && ($linearray[2] =~ /\/D$/)  )
    {
      print "$linearray[0]     $linearray[2]     $linearray[4]\n";
    }
    if ( ($linearray[0] =~ /\/Q$/) && ($linearray[2] =~ /\/D$/)  )
    {
      print "$linearray[0]     $linearray[2]     $linearray[4]\n";
    }
  }
}
