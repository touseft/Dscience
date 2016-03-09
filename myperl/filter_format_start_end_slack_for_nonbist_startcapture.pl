#!/usr/local/bin/perl

while (<>)
{

  @linearray = split (" ", $_);

  if ( ($linearray[1] !~ /BIRA/) && ($linearray[1] !~ /comp_flag_reg/) && ($linearray[0] =~ /cap_data/) ) 
  {
    print $_;
  }
}
