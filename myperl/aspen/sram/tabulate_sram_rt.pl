#!/usr/local/bin/perl

$filename1 = $ARGV[0];
open(FILE1, "<$filename1") or die "Error: Can't open file $filename1: $!";

while (<FILE1>)

{
  @linearray = split (" ", $_);

  if ($linearray[1] !~ /\(R/)
  {
    next;
  }
  $sramline = $_;
  if ($sramline =~ /CLK /)
  {
    $sramline = <FILE1>;
  }
  while (<FILE1>)
  {
    if ($_ !~ /  clock /)
    {
      next;
    }
    $clockline = $_;
    last;
  }
  while (<FILE1>)
  {
    if ($_ !~ /  slack /)
    {
      next;
    }
    $slackline = $_;
    last;
  }

  @sramlinearray = split(" ", $sramline);
  $sramlinearray[1] =~ s/\(//g;
  $sramlinearray[1] =~ s/\)//g;
  @sramlinearray2 = split ("/", $sramlinearray[0]);
  $count = @sramlinearray2;
 
  $sram_instance = ""; 
  for ($i=1; $i<$count-1;$i++)
  {
    $sram_instance = $sram_instance . "/" . $sramlinearray2[$i];
  }


  @clocklinearray = split(" ", $clockline);
  @slacklinearray = split(" ", $slackline);

  #print "$sramlinearray2[0], $sramlinearray[1], $sramlinearray2[1],  $sramlinearray2[2], $clocklinearray[1], $clocklinearray[4], $slacklinearray[2]\n";
  print "$sramlinearray2[0], $sramlinearray[1], $sram_instance, $sramlinearray2[$count-1], $clocklinearray[1], $clocklinearray[4], $slacklinearray[2]\n";

}

