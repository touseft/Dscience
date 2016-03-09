grep "\/Q " rtp_fix-wire_final_internal_slack0p_all_eco2.rpt | grep -v "Start " | grep -v "End " | grep -v "latch" | grep -v "\/D " | grep -v "\/CP " | grep -v "\/EN " | grep -v ICGCell | grep -v "H " > q_eco3
grep "\/QN " rtp_fix-wire_final_internal_slack0p_all_eco2.rpt | grep -v "Start " | grep -v "End " | grep -v "latch" | grep -v "\/D " | grep -v "\/CP " | grep -v "\/EN " | grep -v ICGCell | grep -v "H " > qn_eco3
grep "\/Z" rtp_fix-wire_final_internal_slack0p_all_eco2.rpt | grep -v CQBIV | grep -v latch | grep -v "Start " | grep -v "End " | grep -v "\/D " | grep -v "\/CP " | grep -v "\/EN " | grep -v ICGCell | grep -v "H " > z_eco3

cat q_eco3 qn_eco3 z_eco3 > eco3.list
/home/tousef/myperl/aspen/make_eco.pl < eco3.list | sort -u > change_vth_for_eco3.tcl

