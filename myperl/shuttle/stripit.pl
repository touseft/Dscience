#!/usr/local/bin/perl

while(<>)
{
  if ($_ !~ /C_TBH_5_DLY_CLK/)
  {
    next;
  }

  $line2 = <>;
  $line3 = <>;
  $line4 = <>;
  $line5 = <>;
  $line6 = <>;
  $line7 = <>;
  $line8 = <>;
  $line9 = <>;
  $line10 = <>;
  $line11 = <>;
  $line12 = <>;

  if ( ($line4 =~ /C_TBH_5_DLY_CLK/) && ($line7 =~ /C_TBH_5_DLY_CLK/) && ($line10 =~ /C_TBH_5_DLY_CLK/) )

  {
    @line7array = split (" ", $line7);
    @line10array = split (" ", $line10);
    $line7array[0] =~ s/\/A//g;
    $line10array[0] =~ s/\/A//g;

    print "kwu_remove_buffer \$m $line7array[0]\n";
    print "kwu_remove_buffer \$m $line10array[0]\n\n";
    next;
  }

}
