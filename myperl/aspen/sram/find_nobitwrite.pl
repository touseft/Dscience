#!/usr/local/bin/perl

$filename1 = $ARGV[0];
open(FILE1, "<$filename1") or die "Error: Can't open file $filename1: $!";

$bitcount = 0;

if ($filename1 =~ /lss/)
{
  $instance_name = "lss_0";
}
if ($filename1 =~ /css/)
{
  $instance_name = "css_0";
}
if ($filename1 =~ /rss/)
{
  $instance_name = "rss_0";
}
if ($filename1 =~ /gss_top/)
{
  $instance_name = "gss_top_0";
}
if ($filename1 =~ /wss/)
{
  $instance_name = "wss_0";
}


while (<FILE1>)
{

  @linearray = split (/\./, $_);

  if ($linearray[0] =~ /111/)
  {
    $count = @linearray;
    $ground = 1;
    for ($i=1; $i<$count; $i++)
    {
      if ($linearray[$i] !~ /BWEN/)
      {
        next;
      }
      if ($linearray[$i] !~ /VSSC/)
      {
        $ground = 0;
        last;
      }
    }

    if ($ground)
    {
      @linearray1 = split(" ", $linearray[0]);
      $linearray1[1] =~ s/\\//g;
      $bits = $linearray1[0];
      $bits =~ s/[RAFGPWLP0-9]+B/B/g;
      $bits =~ s/B000/B/g;
      $bits =~ s/B00/B/g;
      $bits =~ s/B0/B/g;
      $bits =~ s/B//g;
      chop($bits);
       
      $bitcount = $bitcount + $bits;
      print " no bit write required for instance: $linearray1[0] $instance_name\/$linearray1[1]\n";
    }
    next;
  }

  if ($linearray[0] =~ /RF211/)
  {
    next;
  }

  if ($linearray[0] =~ /RA222/)
  {
    $count = @linearray;
    $ground = 1;
    for ($i=1; $i<$count; $i++)
    {
      if ($linearray[$i] !~ /BWEN/)
      {
        next;
      }
      if ($linearray[$i] !~ /VSSC/)
      {
        $ground = 0;
        last;
      }
    }

    if ($ground)
    {
      @linearray1 = split(" ", $linearray[0]);
      $linearray1[1] =~ s/\\//g;
      $bits = $linearray1[0];
      $bits =~ s/[RAFGPWLP0-9]+B/B/g;
      $bits =~ s/B000/B/g;
      $bits =~ s/B00/B/g;
      $bits =~ s/B0/B/g;
      $bits =~ s/B//g;
      chop($bits);
       
      $bitcount = $bitcount + $bits;
      print " no bit write required for instance: $linearray1[0] $instance_name\/$linearray1[1]\n";
    }
  }
    next;
}

print "Total bits that do not require bit write enable is:  $bitcount\n";
