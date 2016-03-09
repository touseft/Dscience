#!/usr/local/bin/perl

while (<>)
{
  if ($_ !~ /\/mbmux\_/)
  {
    next;
  }
  
  if ($_ !~ /A1 \(CQM/)
  {
    next;
  }

  @linearray1 = split(" ", $_);
 
  while (<>)
  {
    if ($_ !~ /slack /)
    {
      next;
    }
    @linearray2 = split (" ", $_);
    last;
  }

  #print "$linearray1[0]   $linearray2[2] AB_RWAN\n"; 
  print "$linearray1[0]   $linearray2[2]\n"; 
  
}
