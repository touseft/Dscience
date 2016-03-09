#!/usr/local/bin/perl


while (<>)
{
  @linearray = split (" ", $_);
  print "\#$linearray[1]\n";
  print "set p \$m\/$linearray[0]\n";
  print "kwu_add_hold_buffers \$m \$l [lu_findmaster \$l CQNIVX1] \$p -prefix ft_eco_hb_abb_rbwan_r16 -number 1 -place -default_rt\n";
  print "\n";
}
