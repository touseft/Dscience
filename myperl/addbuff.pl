#!/usr/local/bin/perl

while (<>)
{
  @linearray = split(" ", $_);
  print "kwu_add_buffers_afterpin \$m \$l \[lu\_findmaster \$l CQNIVX4H\] \$m\/$linearray[0] \-prefix FT_15A_R16_SW_ \-place \-default_route \-number 1\n"; 
}
