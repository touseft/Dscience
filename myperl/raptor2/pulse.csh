
report_min_pulse_width -all_violators -nosplit -path_type full_clock_expanded > report_min_pulse_width.rpt
report_min_pulse_width -all_violators -nosplit > summary

/usr/local/scripts/bin/search.pl -s "open edge" -b 1 report_min_pulse_width.rpt | grep -v "open edge" | grep -v LOCKUP | grep -v LBP > pulse_fix.txt
~/myperl/raptor2/get_2_col.pl <  pulse_fix.txt | sort -u >  pulse_fix.tcl


/data/data117/maxim/raptor2/talus_multi_corner/m8_clk/nrc7_r22_ft_eco/r35/swap_cell_F_ASC_125.tcl
/data/data117/maxim/raptor2/talus_multi_corner/m8_clk/nrc7_r22_ft_eco/r35/swap_cell_F_ASC.tcl
