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
    $bslack2 = $linearray[2];
    $wslack2 = $linearray[2];
    $bslack1 = $linearray[1];
    $wslack1 = $linearray[1];
    $bslack3 = $linearray[3];
    $wslack3 = $linearray[3];
    $fisrstline++;
    next;
  }

  chomp;
  @linearray = split(" ", $_);
  $ainstance = $linearray[0];
  $aslack = $linearray[2];

  if ($ainstance  =~ /$binstance/)
  {
    if ($aslack < $bslack2)
    {
      $wslack = $aslack;
      $bslack2 = $wslack;
      $bslack1 = $linearray[1];
      $bslack3 = $linearray[3];
    }
    else
    {
      $wslack = $bslack2; 
      $bslack2 = $wslack;
      $bslack1 = $linearray[1];
      $bslack3 = $linearray[3];
    }
    $binstance = $ainstance;
  }
  else {
    print "$binstance $bslack1 $wslack $bslack3\n";
    $bslack2 = $aslack;
    $wslack = $bslack2;
    $binstance = $ainstance;
    $bslack1 = $linearray[1];
    $bslack3 = $linearray[3];
  }
}
