#!/usr/local/bin/perl

$mode = AB_RBAN;


$firstline = 0;

while (<>)
{
  if ($firstline) 
  {
    chomp;
    @linearray = split(" ", $_);
    $binstance = $linearray[0];
    $bslack = $linearray[1];
    $wslack = $linearray[1];
    $fisrstline++;
    next;
  }

  chomp;
  @linearray = split(" ", $_);
  $ainstance = $linearray[0];
  $aslack = $linearray[1];

  if ($ainstance  =~ /$binstance/)
  {
    if ($aslack < $bslack)
    {
      #print "a is less: $aslack $bslack\n";
      $wslack = $aslack;
      $bslack = $wslack;
    }
    else
    {
      $wslack = $bslack; 
      $bslack = $wslack;
    }
    $binstance = $ainstance;
  }
  else {
    print "$binstance $wslack $mode\n";
    $bslack = $aslack;
    $wslack = $bslack;
    $binstance = $ainstance;
  }
}
