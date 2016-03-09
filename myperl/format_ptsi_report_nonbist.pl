#!/usr/local/bin/perl

while (<>)
{
  if ($_ !~ /Startpoint: /)
  {
    next;
  }
  $start = $_;
  $startnext = <>;
  $end = <>;
  $endnext = <>;

  @startlinearray = split (" ", $start);
  @endlinearray = split (" ", $end);

  if ( ($startlinearray[1] !~ /BIRA/) && ($startlinearray[1] !~ /cap_data/) && ($endlinearray[1] !~ /BIRA/) && ($endlinearray[1] !~ /cap_data/) && ($startlinearray[1] !~ /comp_flag_reg/) && ($endlinearray[1] !~ /comp_flag_reg/) )
  {
    print $start;
    print $startnext;
    print $end;
    print $endnext;

    while (<>)
    {
      if ($_ !~ /slack /)
      {
        print $_;
      } else {
        print $_;
        print "\n\n";
        last;
      }
    }
  }
}
