#!/usr/local/bin/perl


$firstline = 0;

while (<>)
{
  if (!$firstline) 
  {
    chomp;
    @linearray = split(" ", $_);
    $binstance = $linearray[1];
    $bslack = $linearray[2];
    $wslack = $linearray[2];
    $firstline++;
    #print "$binstance $firstline\n";
    next;
  }

  #chomp;
  @linearray = split(" ", $_);
  $ainstance = $linearray[1];
  $aslack = $linearray[2];
  
  #print "$ainstance $wslack \n";

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
    print "$binstance $wslack \n";
    $bslack = $aslack;
    $wslack = $bslack;
    $binstance = $ainstance;
  }
}
print "$binstance $wslack \n";

