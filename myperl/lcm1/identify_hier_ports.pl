#!/usr/local/bin/perl

while (<>)
{
  if ($_ =~ /[(]get_top_wrapper[)]/)
  {
    $_ = <>;
    next;
  } 
  if ($_ =~ /[(]APU_SUBCORE[)]/)
  {
    $_ = <>;
    next;
  } 
  if ($_ =~ /[(]ddr2_top_64_ddr2_/)
  {
    $_ = <>;
    next;
  } 
  if ($_ =~ /[(]ddr2_top_32_ddr2/)
  {
    $_ = <>;
    next;
  } 
  else {
    print $_;
  }
}
