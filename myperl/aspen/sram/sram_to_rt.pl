#!/usr/local/bin/perl

$filename1 = $ARGV[0];
open(FILE1, "<$filename1") or die "Error: Can't open file $filename1: $!";

#if ($filename1 =~ /lss/)
#{
  #$instance_name = "lss_0";
#}
#if ($filename1 =~ /css/)
#{
  #$instance_name = "css_0";
#}
#if ($filename1 =~ /rss/)
#{
  #$instance_name = "rss_0";
#}
#if ($filename1 =~ /gss_top/)
#{
  #$instance_name = "gss_top_0";
#}
#if ($filename1 =~ /wss/)
#{
  #$instance_name = "wss_0";
#}


while (<FILE1>)

{
  @linearray = split (" ", $_);
  $linearray[1] =~ s/\\//g;

  if ($linearray[0] =~ /111/)
  {
    print "report_timing \-nosplit \-to $linearray[1]/CEN \>\> rtp_to_from_sram.rpt\n";
    print "report_timing \-nosplit \-to $linearray[1]/WEN \>\> rtp_to_from_sram.rpt\n";

    print "report_timing \-nosplit \-to $linearray[1]/I* \>\> rtp_to_from_sram.rpt\n";
    print "report_timing \-nosplit \-to $linearray[1]/A* \>\> rtp_to_from_sram.rpt\n";
    print "report_timing \-nosplit \-to $linearray[1]/BWEN* \>\> rtp_to_from_sram.rpt\n";

    print "report_timing \-nosplit \-from to_from_sram/$linearray[1]/O* \>\> rtp_to_from_sram.rpt\n";
  }

  if ($linearray[0] =~ /RF211/)
  {
    print "report_timing \-nosplit \-to $linearray[1]/WAEN \>\> rtp_to_from_sram.rpt\n";
    print "report_timing \-nosplit \-to $linearray[1]/RBEN \>\> rtp_to_from_sram.rpt\n";
    print "report_timing \-nosplit \-to $linearray[1]/WAA* \>\> rtp_to_from_sram.rpt\n";
    print "report_timing \-nosplit \-to $linearray[1]/RBA* \>\> rtp_to_from_sram.rpt\n";
    print "report_timing \-nosplit \-to $linearray[1]/WAI* \>\> rtp_to_from_sram.rpt\n";
    print "report_timing \-nosplit \-from $linearray[1]/RBO* \>\> rtp_to_from_sram.rpt\n";
  }

  if ($linearray[0] =~ /RA222/)
  {
    print "report_timing \-nosplit \-to $linearray[1]/ACEN* \>\> rtp_to_from_sram.rpt\n";
    print "report_timing \-nosplit \-to $linearray[1]/BCEN* \>\> rtp_to_from_sram.rpt\n";

    print "report_timing \-nosplit \-to $linearray[1]/AWEN* \>\> rtp_to_from_sram.rpt\n";
    print "report_timing \-nosplit \-to $linearray[1]/BWEN* \>\> rtp_to_from_sram.rpt\n";
    
    print "report_timing \-nosplit \-to $linearray[1]/AA* \>\> rtp_to_from_sram.rpt\n";
    print "report_timing \-nosplit \-to $linearray[1]/BA* \>\> rtp_to_from_sram.rpt\n";

    print "report_timing \-nosplit \-to $linearray[1]/AI* \>\> rtp_to_from_sram.rpt\n";
    print "report_timing \-nosplit \-to $linearray[1]/BI* \>\> rtp_to_from_sram.rpt\n";

    print "report_timing \-nosplit \-to $linearray[1]/ABWEN* \>\> rtp_to_from_sram.rpt\n";
    print "report_timing \-nosplit \-to $linearray[1]/BBWEN* \>\> rtp_to_from_sram.rpt\n";

    print "report_timing \-nosplit \-from $linearray[1]/AO* \>\> rtp_to_from_sram.rpt\n";
    print "report_timing \-nosplit \-from $linearray[1]/BO* \>\> rtp_to_from_sram.rpt\n";

  }
}

