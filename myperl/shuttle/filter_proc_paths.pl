#!/usr/local/bin/perl

@patharray = ();
$linenum = -1;
$start_yes = 0;
$end_yes = 0;


print "$ARGV[0]\n";
open (REPORT, "<$ARGV[1]") or die "Error: Can't open file $ARGV[1]: $!";



while (<REPORT>)
{
  if ($_ !~ /Date   /)
  {
    print;
    next;
  }
  last;
}
print;
print "\n\n";;

$linenum = -1;

while (<REPORT>)
{
  if ($_ !~ /Startpoint: /)
  {
    next;
  }

  if ($_ !~ /$ARGV[0]/)
  {
    next;
  }
  else {
   $linenum = 0;
   $patharray[$linenum] = $_;
   $start_yes = 1;
  }

  $_ = <REPORT>;
  $linenum++;
  $patharray[$linenum] = $_;

  $_ = <REPORT>;
  $linenum++;
  $patharray[$linenum] = $_;

  if ($_ !~ /$ARGV[0]/)
  {
    next;
  }
  else {
   $end_yes = 1;
  }

  if ( (!$start_yes) || (!$end_yes) )
  {
    $linenum = -1;
    next;
  }

  while (<REPORT>)
  {
    if ($_ !~ /with no derating/)
    {
      $linenum++;
      $patharray[$linenum] = $_;
    }
    else {
      $linenum++;
      $patharray[$linenum] = $_;
      last;
    }
  }

  for ($i=0; $i<$linenum+1;$i++)
  {
    print $patharray[$i];
  }

}

