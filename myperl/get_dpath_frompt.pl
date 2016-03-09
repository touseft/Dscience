#!/usr/local/bin/perl

@patharray = ();
$linenum = -1;
$muxinpath = 0;

while (<>)
{
  if ($_ !~ /Date   /)
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
  #if ($_ =~ /S \(CQM/)
  if ($_ =~ /_TBH_/)
  {
    $muxinpath = 1;
  }

  #########################
  # Have read complete path
  #########################
  if ($_ =~ /with no derating/)
  {
    if ($muxinpath)
    {
      for ($i=0; $i<$linenum;$i++)
      {
        print $patharray[$i];
      }
    }
    @patharray = ();
    $muxinpath = 0;
    $linenum = -1;
  }
}
