#!/usr/local/bin/perl

while (<>)
{
  @linearray = split(" ", $_);
  $count = @linearray;

  for($i=0; $i<$count; $i++)
  {
    print "$linearray[$i]\n";
  }
}
