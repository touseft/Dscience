#!/usr/local/bin/perl


$firstline = 0;

while (<>)
{
  if (!$firstline) 
  {
    chomp;
    @linearray = split(" ", $_);
    $binstance = $linearray[0];
    $bslack = $linearray[1];
    $wslack = $linearray[1];
    $firstline++;
    #print "$binstance $firstline\n";
    next;
  }

  #chomp;
  @linearray = split(" ", $_);
  $ainstance = $linearray[0];
  $aslack = $linearray[1];
  
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
      #print "b is less: $aslack $bslack\n";
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

