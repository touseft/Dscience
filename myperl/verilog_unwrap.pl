#!/usr/local/bin/perl

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
    chomp;
    $_ =~ s/^[ ]+//g;
    $line = $line . $_;
    next;
  }
  if ($_ =~ /;/)
  {
    $_ =~ s/^[ ]+//g;
    $line = $line . $_;
    print $line;
    $line = "";
  }
}
