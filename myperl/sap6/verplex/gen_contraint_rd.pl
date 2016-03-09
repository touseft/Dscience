#!/usr/local/bin/perl

use POSIX qw(floor);

sub atoi {
  my $t;
  foreach my $d (split(//, shift())) {
    $t = $t * 10 + $d;
  }
  return $t;
}


while (<>)
{
  @linearray = split (" ", $_);
  @linearray1 = split ("/", $linearray[1]);
  $count = @linearray1;
  
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

  $instance_rd = $instance;
  $instance_rd =~ s/\\//g;

  $instance = $instance . "/" . $linearray1[$i]; 
  $instance =~ s/\\//g;
  print "\n\/\/ $linearray[0] $linearray[1]\n";

  @ramtypearray = split ("W", $linearray[0]);
  $ramtypearray[1] =~ tr/[A-Z]/ /;
  @ramtypearray2 = split (" ", $ramtypearray[1]);
  $bitwidth = atoi($ramtypearray2[1]);
  $bits = (log($bitwidth) / log(2) );
  print "\/\/ number of bits is: $bits\n";

  #$bits = $bits - 1;

  if ($bits - int($bits) > 0)
  {
    $bits = int($bits) + 2;
  } else {
    $bits = int($bits) + 1 ;
  }

  #print "numb of bits is: $bits\n";
  for ($i=0; $i < $bits; $i++)
  {
    print "add instance constraint 0 $instance_rd\/rfuse_r_reg\[$i\] \-revised\n";
  }

}
