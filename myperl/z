#!/usr/local/bin/perl

while (<>)
{

  @linearray = split (" ", $_);

  if ( ($linearray[0] !~ /BIRA/) && ($linearray[1] !~ /cap_data/) && ($linearray[1] !~ /BIRA/) && ($linearray[0] !~ /BIRA/) && ($linearray[0] !~ /comp_flag_reg/) && ($linearray[1] !~ /comp_flag_reg/) )
  {
    print $_;
  }
}
