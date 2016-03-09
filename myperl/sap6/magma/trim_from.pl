#!/usr/local/bin/perl

while (<>)
{
  @linearray = split (" ",$_);
  
  @linearray0 = split ("/", $linearray[0]);
  $count = @linearray0;

  for ($i=0; $i<$count-1; $i++)
  {
    if ($i)
    {  
      print "/"; 
    }
    print "$linearray0[$i]";
  }
  
  print "     $linearray[1]     $linearray[2]\n";
}
