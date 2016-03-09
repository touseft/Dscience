#!/usr/local/bin/perl

@patharray = ();
$linenum = -1;
$muxinpath = 0;

while (<>)
{
  if ($_ !~ /Startpoint: /)
  {
    next;
  }
  last;
}
$_ = <>;


while (<>)
{
#  print $_;
  $linenum++;
  $patharray[$linenum] = $_; 

  #if ( ($_ =~ /SDBIST_BIST/) && ($_ =~ /S /) )
  #if ($_ =~ /\s+Startp/)
  if ($_ =~ /_R14A_R7_/)
  {
print "want $_";
    $want_path = 1;
  }

}
