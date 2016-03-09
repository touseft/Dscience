#!/usr/local/bin/perl

while (<>)

{
  if ($_ =~ / \(net\)/)
  {
    next;
  }

  if ($_ =~ /\/Q /)
  {
    next;
  }

  if ($_ =~ /\/Z /)
  {
    next;
  }

  if ($_ !~ / &/)
  {
    next;
  }

  @linearray = split (" ", $_);
  $linesize = @linearray;

  if ($linesize == 11)
  {
    if ( !($linearray[5] eq "0\.000") )
    {
      #print $_;
      print "$linearray[0] $linearray[1] $linearray[5]\n";      
    }
  }
}

