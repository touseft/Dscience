
#Read in the verilog file that is released from Motorola.


#./sram_to_rt.pl css_design_srams_2col > rt_css.tcl
#./sram_to_rt.pl wss_design_srams_2col > rt_wss.tcl
#./sram_to_rt.pl rss_design_srams_2col > rt_rss.tcl
#./sram_to_rt.pl lss_design_srams_2col > rt_lss.tcl
#./sram_to_rt.pl gss_top_srams_2col > rt_gss_top.tcl


./sram_to_rt.pl css_design_srams > rt_css.tcl
./sram_to_rt.pl wss_design_srams > rt_wss.tcl
./sram_to_rt.pl rss_design_srams > rt_rss.tcl
./sram_to_rt.pl lss_design_srams > rt_lss.tcl
./sram_to_rt.pl gss_top_srams > rt_gss_top.tcl

#run above in PTSI and generate the rpt reports
cat *.rpt > all
mv all all.rpt
./tabulate_sram_rt.pl all.rpt > sram_slack_reports.txt


./find_nobitwrite.pl all_srams > all_srams_nobitwrite

 ./merge.pl sram_slack_reports.txt all_srams_nobitwrite > sram_slack_reports_merged.txt

