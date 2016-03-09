#!/usr/local/bin/perl

while (<>)
{

  @linearray = split (" ", $_);

  if ( ($linearray[0] !~ /BIRA/) && ($linearray[0] !~ /comp_flag_reg/) && ($linearray[1] =~ /cap_data/) ) 
  {
    print $_;
  }
}
