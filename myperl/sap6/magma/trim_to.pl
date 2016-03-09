#!/usr/local/bin/perl

while (<>)
{
  @linearray = split (" ",$_);
  
  @linearray1 = split ("/", $linearray[1]);
  $count = @linearray1;

  print "$linearray[0]     "; 
  for ($i=0; $i<$count-1; $i++)
  {
    if ($i)
    {  
      print "/"; 
    }
    print "$linearray1[$i]";
  }
  print "     $linearray[2]\n"; 
}
