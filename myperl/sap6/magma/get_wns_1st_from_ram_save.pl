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

    if ($linearray[2] =~ /cap_data_/) {  
    {
      print "$linearray[0]     $linearray[2]     $linearray[4]\n";
      next;
    }


    if ( ($linearray[0] =~ /\/ram/) && ($linearray[2] =~ /\/ram/) )
    {
      next;
    }
    if ($linearray[0] !~ /\/ram/)
    {
      next;
    }
    print "$linearray[0]     $linearray[2]     $linearray[4]\n";
  }
}
