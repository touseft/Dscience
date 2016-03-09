#!/usr/local/bin/perl

@patharray = ();
$linenum = -1;
$start_yes = 0;
$end_yes = 0;


open (REPORT, "<$ARGV[0]") or die "Error: Can't open file $ARGV[1]: $!";



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
  $pre_data_arrival = 1;

  if ($_ !~ /Startpoint: /)
  {
    next;
  }

  while (<REPORT>)
  {
    if ( $_ =~ /data arrival time/ )
    {
      $pre_data_arrival = 0;
      last;
    }
    
    if ( ($_ =~ /\/mbmux_/) && ($pre_data_arrival) )
    {
      $mux = $_;
      @muxarray = split (" ", $_);
      last;
    }
  }

  while (<REPORT>)
  {
    if ($_ !~ / slack /)
    {
      next;
    }
    @slackarray = split (" ", $_);
    last;
  }

  print "$muxarray[0]  $slackarray[2]\n"; 
}

