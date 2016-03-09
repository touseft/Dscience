#!/usr/local/bin/perl

# This script file read the PrimeTime report and update the input
# setup and hold time in the lddl2 file using row and col number.
# Please look at the run_dcal_16x_csh file for example.

#######################
# Cmd line help
#######################
if ($#ARGV < 2) {
  print "\n";
  print "Usage: lddl2_update.pl <In File1> <In File2> <Row> <Col>\n";
  print "\n";
  print "       <In File1>    - Input File, all_input.rpt\n";
  print "       <In File2>    - Input File, <design>.lddl2\n";
  print "       <Row number>  - row number of setup/hold table; 1 - 4\n";
  print "       <Col number>  - col number of setup/hold table; 1 - 4\n";
  exit;
}

#######################
# Cmd line arguments
#######################
$info = $ARGV[0];
$lddl = $ARGV[1];
$out  = "tmp.out";
$row  = $ARGV[2];
$col  = $ARGV[3];

$tmp  = "temp.out";

print "Input file:  $info\n";
print "input File:  $lddl\n";
print "row: $row\n";
print "col: $col\n";

open (INFO, "<$info") or die "Error: Can't open file $info: $!";
open (LDDL_IN, "<$lddl") or die "Error: Can't open file $lddl: $!";
open (LDDL_OUT, ">$out")  or die "Error: Can't open file $out: $!";
#open (TEMP, ">$tmp");

$count = 0;
$lib_hold_time = 0;
####################################################
# Read input file
####################################################
while (<INFO>) {
  s/://g;
  if (/delay min/ || /delay max/) {
    @line = split (" ", $_);
    $delay_type = $line[1];
  } elsif (/Startpoint/) {
    @line = split (" ", $_);
    $pin_name = $line[1];
    $pin = "YES";
  } elsif(/Path Group/ && $pin eq "YES") {
    @line = split (" ", $_);
    if($pin_name eq "HRESETN" || $pin_name eq "DBGNTRST") {
    $clock = "CLK";
    } else {
    $clock = $line[2];
    }
  } elsif(/input external delay/ && ($clock eq "CLK" || $clock eq "WRAPCLK")) {
    @line = split (" ", $_);
    $input_ext_delay = $line[3];
  } elsif(/data arrival time/ && ($clock eq "CLK" || $clock eq "WRAPCLK")) {
    @line = split (" ", $_);
    $data_arr_time = $line[3];
    $artime = "YES";
  } elsif(/clock network delay/ && ($clock eq "CLK" || $clock eq "WRAPCLK")) {
    @line = split (" ", $_);
    $clk_net_delay = $line[4];
  } elsif(/library hold time/ || /library removal time/) {
    if ($pin eq "YES") {
      @line = split (" ", $_);
      $lib_hold_time = $line[3];

      # Derate hold by 300 pSec
      #
      $gate_delay = $data_arr_time - $input_ext_delay;
      $hold_time = ($clk_net_delay + $lib_hold_time) - ($gate_delay);
      $hold_time = $hold_time + 8.300;

      #if($pin_name eq "DBGNTRST" || $pin_name eq "HRESETN") {
      #   print "$pin_name $delay_type $clock hold time = $hold_time\n";
      #}

      if($delay_type eq "min_rise" && $clock eq "CLK") {
          #print TEMP "$pin_name min_rise CLK $hold_time\n";
          $input_hold_clk_rise{$pin_name} = $hold_time;
      } elsif($delay_type eq "min_fall" && $clock eq "CLK") {
          #print TEMP "$pin_name min_fall CLK $hold_time\n";
          $input_hold_clk_fall{$pin_name} = $hold_time;
      } elsif($delay_type eq "min_rise" && $clock eq "WRAPCLK") {
          #print TEMP "$pin_name min_rise WRAPCLK $hold_time\n";
          $input_hold_wclk_rise{$pin_name} = $hold_time;
      } elsif($delay_type eq "min_fall" && $clock eq "WRAPCLK") {
          #print TEMP "$pin_name min_fall WRAPCLK $hold_time\n";
          $input_hold_wclk_fall{$pin_name} = $hold_time;
      }
      $pin = "";
      $artime = "";
    }
  } elsif(/library setup time/ || /library recovery time/) {
    if($pin eq "YES") {
      @line = split (" ", $_);
      $lib_setup_time = $line[3];

      # Derate setup by 300 pSec
      #
      $gate_delay = $data_arr_time - $input_ext_delay;
      $setup_time = ($gate_delay + $lib_setup_time) - ($clk_net_delay);
      $setup_time = $setup_time + 8.300;

      #if($pin_name eq "DBGNTRST" || $pin_name eq "HRESETN") {
      #   print "$pin_name $delay_type $clock setup time = $setup_time\n";
      #}

      if($delay_type eq "max_rise" && $clock eq "CLK") {
          #print TEMP "$pin_name max_rise CLK $setup_time\n";
          $input_setup_clk_rise{$pin_name} = $setup_time;
      } elsif($delay_type eq "max_fall" && $clock eq "CLK") {
          #print TEMP "$pin_name max_fall CLK $setup_time\n";
          $input_setup_clk_fall{$pin_name} = $setup_time;
      } elsif($delay_type eq "max_rise" && $clock eq "WRAPCLK") {
          #print TEMP "$pin_name max_rise WRAPCLK $setup_time\n";
          $input_setup_wclk_rise{$pin_name} = $setup_time;
      } elsif($delay_type eq "max_fall" && $clock eq "WRAPCLK") {
          #print TEMP "$pin_name max_fall WRAPCLK $setup_time\n";
          $input_setup_wclk_fall{$pin_name} = $setup_time;
      }
      $pin = "";
      $artime = "";
    }
  } else {
  }
} #end while
close INFO;

print "Building setup/hold array completed ... \n";

####################################################
# Updating lddl2 file
####################################################
while (<LDDL_IN>) {
  if (/setuphold/) {
    print LDDL_OUT $_;
  } elsif (/refterm/) {
    print LDDL_OUT $_;
    @line = split (" ", $_);
    $clock = $line[1];
  } elsif (/tarterm/) {
    print LDDL_OUT $_;
    @line = split (" ", $_);
    $pin_name = $line[1];
  } elsif (/tarlevel/) {
    print LDDL_OUT $_;
    @line = split (" ", $_);
    $rise_fall = $line[1];
  } elsif (/stbl/ && $rise_fall eq "HIGH" && $clock eq "CLK") {
      if($input_setup_clk_rise{$pin_name}) {
         $hold_time = $input_setup_clk_rise{$pin_name};
      } else {
         $hold_time = 0.111111;
         print "Error: $pin_name $clock, has no setup rise CLK.\n";
      }
      $tbl_type = "stbl{";
      $table = "start";
  } elsif (/htbl/ && $rise_fall eq "HIGH" && $clock eq "CLK") {
      if($input_hold_clk_rise{$pin_name}) {
         $hold_time = $input_hold_clk_rise{$pin_name};
      } else {
         $hold_time = 0.111111;
         print "Error: $pin_name $clock, has no hold rise CLK.\n";
      }
      $tbl_type = "htbl{";
      $table = "start";
  } elsif (/stbl/ && $rise_fall eq "LOW" && $clock eq "CLK") {
      if($input_setup_clk_fall{$pin_name}) {
         $hold_time = $input_setup_clk_fall{$pin_name};
      } else {
         $hold_time = 0.111111;
         print "Error: $pin_name $clock, has no setup fall CLK.\n";
      }
      $tbl_type = "stbl{";
      $table = "start";
  } elsif (/htbl/ && $rise_fall eq "LOW" && $clock eq "CLK") {
      if($pin_name eq "HRESETN" || $pin_name eq "DBGNTRST") {
        if($input_hold_clk_rise{$pin_name}) {
           $hold_time = $input_hold_clk_rise{$pin_name};
        } else {
           $hold_time = 0.111111;
           print "Error: $pin_name $clock, has no hold fall CLK.\n";
        }
        $tbl_type = "htbl{";
        $table = "start";
      } else {
        if($input_hold_clk_fall{$pin_name}) {
           $hold_time = $input_hold_clk_fall{$pin_name};
        } else {
           $hold_time = 0.111111;
           print "Error: $pin_name $clock, has no hold fall CLK.\n";
        }
        $tbl_type = "htbl{";
        $table = "start";
      }
  } elsif (/stbl/ && $rise_fall eq "HIGH" && $clock eq "WRAPCLK") {
      if($input_setup_wclk_rise{$pin_name}) {
         $hold_time = $input_setup_wclk_rise{$pin_name};
      } else {
         $hold_time = 0.111111;
         print "Error: $pin_name $clock, has no setup rise WRAPCLK.\n";
      }
      $tbl_type = "stbl{";
      $table = "start";
  } elsif (/htbl/ && $rise_fall eq "HIGH" && $clock eq "WRAPCLK") {
      if($input_hold_wclk_rise{$pin_name}) {
         $hold_time = $input_hold_wclk_rise{$pin_name};
      } else {
         $hold_time = 0.111111;
         print "Error: $pin_name $clock, has no hold rise WRAPCLK.\n";
      }
      $tbl_type = "htbl{";
      $table = "start";
  } elsif (/stbl/ && $rise_fall eq "LOW" && $clock eq "WRAPCLK") {
      if($input_setup_wclk_fall{$pin_name}) {
         $hold_time = $input_setup_wclk_fall{$pin_name};
      } else {
         $hold_time = 0.111111;
         print "Error: $pin_name $clock, has no setup fall WRAPCLK.\n";
      }
      $tbl_type = "stbl{";
      $table = "start";
  } elsif (/htbl/ && $rise_fall eq "LOW" && $clock eq "WRAPCLK") {
      if($input_hold_wclk_fall{$pin_name}) {
         $hold_time = $input_hold_wclk_fall{$pin_name};
      } else {
         $hold_time = 0.111111;
         print "Error: $pin_name $clock, has no hold fall WRAPCLK.\n";
      }
      $tbl_type = "htbl{";
      $table = "start";
  } else {
      print LDDL_OUT $_;
      $table = "";
  }
  
  # Adjust for negative setup/hold
  #
  $hold_time = $hold_time - 8;
  if($hold_time < 0) {
      $hold_time = 0;
  }

  if($row == 1 && $table eq "start") {
    ($tbl_type, $hold1, $hold2, $hold3, $hold4) = split (" ", $_);
    if($col == 1) {
      printf LDDL_OUT "          %5s %1.6f %1.6f %1.6f %1.6f ;\n",$tbl_type,$hold_time,$hold2,$hold3,$hold4;
    } elsif($col == 2) {
      printf LDDL_OUT "          %5s %1.6f %1.6f %1.6f %1.6f ;\n",$tbl_type,$hold1,$hold_time,$hold3,$hold4;
    } elsif($col == 3) {
      printf LDDL_OUT "          %5s %1.6f %1.6f %1.6f %1.6f ;\n",$tbl_type,$hold1,$hold2,$hold_time,$hold4;
    } elsif($col == 4) {
      printf LDDL_OUT "          %5s %1.6f %1.6f %1.6f %1.6f ;\n",$tbl_type,$hold1,$hold2,$hold3,$hold_time;
    }
  } elsif($row == 2 && $table eq "start") {
    print LDDL_OUT $_;
    $_ = <LDDL_IN>;
    ($hold1, $hold2, $hold3, $hold4) = split (" ", $_);
    if($col == 1) {
      printf LDDL_OUT "                %1.6f %1.6f %1.6f %1.6f ;\n",$hold_time,$hold2,$hold3,$hold4;
    } elsif($col == 2) {
      printf LDDL_OUT "                %1.6f %1.6f %1.6f %1.6f ;\n",$hold1,$hold_time,$hold3,$hold4;
    } elsif($col == 3) {
      printf LDDL_OUT "                %1.6f %1.6f %1.6f %1.6f ;\n",$hold1,$hold2,$hold_time,$hold4;
    } elsif($col == 4) {
      printf LDDL_OUT "                %1.6f %1.6f %1.6f %1.6f ;\n",$hold1,$hold2,$hold3,$hold_time;
    }
  } elsif($row == 3 && $table eq "start") {
    print LDDL_OUT $_;
    $_ = <LDDL_IN>;
    print LDDL_OUT $_;
    $_ = <LDDL_IN>;
    ($hold1, $hold2, $hold3, $hold4) = split (" ", $_);
    if($col == 1) {
      printf LDDL_OUT "                %1.6f %1.6f %1.6f %1.6f ;\n",$hold_time,$hold2,$hold3,$hold4;
    } elsif($col == 2) {
      printf LDDL_OUT "                %1.6f %1.6f %1.6f %1.6f ;\n",$hold1,$hold_time,$hold3,$hold4;
    } elsif($col == 3) {
      printf LDDL_OUT "                %1.6f %1.6f %1.6f %1.6f ;\n",$hold1,$hold2,$hold_time,$hold4;
    } elsif($col == 4) {
      printf LDDL_OUT "                %1.6f %1.6f %1.6f %1.6f ;\n",$hold1,$hold2,$hold3,$hold_time;
    }
  } elsif($row == 4 && $table eq "start") {
    print LDDL_OUT $_;
    $_ = <LDDL_IN>;
    print LDDL_OUT $_;
    $_ = <LDDL_IN>;
    print LDDL_OUT $_;
    $_ = <LDDL_IN>;
    ($hold1, $hold2, $hold3, $hold4) = split (" ", $_);
    if($col == 1) {
      printf LDDL_OUT "                %1.6f %1.6f %1.6f %1.6f }\n",$hold_time,$hold2,$hold3,$hold4;
    } elsif($col == 2) {
      printf LDDL_OUT "                %1.6f %1.6f %1.6f %1.6f }\n",$hold1,$hold_time,$hold3,$hold4;
    } elsif($col == 3) {
      printf LDDL_OUT "                %1.6f %1.6f %1.6f %1.6f }\n",$hold1,$hold2,$hold_time,$hold4;
    } elsif($col == 4) {
      printf LDDL_OUT "                %1.6f %1.6f %1.6f %1.6f }\n",$hold1,$hold2,$hold3,$hold_time;
    }
  }
  $pin_dir = "";
} #end while
close LDDL_IN;

close LDDL_OUT;
rename($lddl, "$lddl.old");
rename($out, $lddl);
 
#close TEMP;
