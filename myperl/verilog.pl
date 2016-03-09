#!/usr/local/bin/perl
$|++;

$linecnt = 0;
$line = "";

while (<>)
{
  if ($_ =~ /^\/\// )
  {
    print $_;
    $line = "";
    next;
  }
  if ($_ !~ /;/)
  {
    $linecnt++;
    chomp;
    $_ =~ s/^[ ]+//g;
    $line = $line . $_;
    if ($linecnt > 10000)
    {
      print $line;
      $line = "";
      $linecnt = 0;
    }
    next;
  }
  if ($_ =~ /;/)
  {
    $_ =~ s/^[ ]+//g;
    $line = $line . $_;
    print $line;
    $line = "";
  }
  print "\n";
  $linecnt = 0;
}
