./get_wns_1st_to_ram.pl < rts_fix_cell_final_talus1093scm_vth2.rpt > to_ram.rpt
./get_wns_1st_from_ram.pl < rts_fix_cell_final_talus1093scm_vth2.rpt > from_ram.rpt
./get_wns_ram_to_ram.pl < rts_fix_cell_final_talus1093scm_vth2.rpt > ram_to_ram.rpt
./get_wns_reg_to_reg.pl < rts_fix_cell_final_talus1093scm_vth2.rpt > reg_to_reg.rpt

grep -v "# " rts_fix_cell_final_talus1093scm_vth2.rpt | grep -v "##" | grep -v " count  " | grep -v " slack  " | grep -v " endpoints " | grep -v " Summary" | grep -v "Failing endpoints" | grep -v "\/ram" | grep "/" > reg_2_reg.rpt

grep -v "# " rts_fix_cell_final_talus1093scm_vth2.rpt | grep -v "##" | grep -v " count  " | grep -v " slack  " | grep -v " endpoints " | grep -v " Summary" | grep -v "Failing endpoints" | grep -v "\/ram" | grep -v "\-\-\-\-\-\-\-" | grep "/" > reg_2_reg.rpt

./trim_from.pl < from_ram.rpt > from_ram_trim.rpt
./trim_to.pl < to_ram.rpt > to_ram_trim.rpt

#FT./trim_from.pl < ram_to_ram.rpt > from_ram_to_ram_trim.rpt
#FT./trim_to.pl < ram_to_ram.rpt > to_ram_to_ram_trim.rpt
./trim_from_to.pl < ram_to_ram.rpt > ram_to_ram_trim.rpt

sort from_ram_trim.rpt > from_ram_trim_sort.rpt
sort +1 to_ram_trim.rpt > to_ram_trim_sort.rpt
sort ram_to_ram_trim.rpt > ram_to_ram_trim_sort.rpt

./merge_uniquify_col0.pl < from_ram_trim_sort.rpt | sort -u | sort +1n > from_ram_trim_sort_unique.rpt
./merge_uniquify_col1.pl < to_ram_trim_sort.rpt | sort -u | sort +1n > to_ram_trim_sort_unique.rpt
./merge_uniquify_col.pl < ram_to_ram_trim_sort.rpt | sort -u | sort +1n > ram_to_ram_trim_sort_unique.rpt
#FTseparate the space and resave file.
sort ram_to_ram_trim_sort_unique.rpt > ram_to_ram_trim_sort_unique_sort.rpt





