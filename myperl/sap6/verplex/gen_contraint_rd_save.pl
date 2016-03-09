#!/usr/local/bin/perl

while (<>)
{
  @linearray = split (" ", $_);
  @linearray1 = split ("/", $linearray[1]);
  $count = @linearray1;
  
  #print "\/\/ $_";

  $instance = "";
  for ($i=0; $i < $count-1; $i++)
  {
    if ($i == 0)
    {
      $instance = $linearray1[0];
      next;
    }
    $instance = $instance . "/" . $linearray1[$i];
  }

  $instance = $instance . "/" . $linearray1[$i]; 
  $instance =~ s/\\//g;
  print "add instance constraint 0 $instance \-revised\n";

  #print "add instance constraint 0 $instance\/rfuse_r_reg\[0\] \-revised\n";
  #print "add instance constraint 0 $instance\/rfuse_r_reg\[1\] \-revised\n";
  #print "add instance constraint 0 $instance\/rfuse_r_reg\[2\] \-revised\n";
  #print "add instance constraint 0 $instance\/rfuse_r_reg\[3\] \-revised\n";
  #print "add instance constraint 0 $instance\/rfuse_r_reg\[4\] \-revised\n";
  #print "add instance constraint 0 $instance\/rfuse_r_reg\[5\] \-revised\n\n";

}
