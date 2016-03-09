#!/usr/local/bin/perl

open (FEPFH1, "<$ARGV[0]") or die "Error: Can't open FEP1 file $ARGV[0]: $!";

print "ARGV0:  $ARGV[0]\n";
print "ARGV1:  $ARGV[1]\n";

@linearray = ();

$i = 0;
while (<FEPFH1>)
{
  chomp;
  #$_ =~ s/\//\\\//g;
  #$_ =~ s/\./\\./g;
  @larray = split (" ", $_);
  $linearray[$i]= $larray[0];
  #print "FOO $linearray[$i]\n";
  $i++;
}
close (FEPFH1);

$size = @linearray;

open (FEPFH2, "<$ARGV[1]") or die "Error: Can't open FEP2 file $ARGV[1]: $!";
for ($i=0; $i < $size; $i++)
{
  $foundit = 0;
  while (<FEPFH2>)
  {
    chomp;
    if ($_ =~ /$linearray[$i]/) 
    {
      print "MARKITIT $_\n";
      $foundit = 1;
    }
    if (!$foundit)
    {
      print "$_\n";
    } else {
      last;
    }
  }
}
close (FEPFH2);
