
grep "\/Z " rtp_fix_cell_final_fg1_73u_derate.rpt | grep -v "CQLBP" | grep -v "_CLK" | grep -v "H " > change_vth1.list

 ./filter.pl < change_vth1.list | sort -u > change_vth1.tcl

