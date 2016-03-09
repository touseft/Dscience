#!/usr/local/bin/perl

@patharray = ();
$linenum = -1;
$muxinpath = 0;

open (REPORTFH, "<$ARGV[1]") or die "Error: Can't open file $ARGV[1]: $!";


while (<REPORTFH>)
{

if ($_ !~ /Date   /)
  {
    print;
    next;
  }
  last;

}
print;
$_ = <REPORTFH>;
print;


while (<REPORTFH>)
{
  $linenum++;
  $patharray[$linenum] = $_; 

  if ($_ =~ /$ARGV[0]/)
  {
    $muxinpath = 1;
  }

  #########################
  # Have read complete path
  #########################
  if ($_ =~ /with no derating/)
  {
    if (!$muxinpath)
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
