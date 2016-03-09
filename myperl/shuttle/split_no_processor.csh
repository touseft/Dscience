#!/usr/local/bin/csh

#ARM1176JZFS \u_core_shuttle_core/u_a11_arm1176_etm11cs/u_ARM1176JZFS 
#CORTEXR4 #\u_core_shuttle_core/u_crtx_cortexr4_pl310_etmr4/cortex_r4_pl310/u_cortex_r4  (
#cevax1643 \u_core_shuttle_core/u_ceva_cevax1643_wrp/u_cevax1643  (
#cevaX1622 #\u_core_shuttle_core/u_aud_ceva_xs1200_sub_wrapper/u_dspsub_cevaxs1202/cevaX1622  (

cd /data/data100/motorola/aspen_shuttle/ptsi/yz19/n4.4.2_d2_f1_3

#####
~tousef/myperl/shuttle/filter_no_proc_paths.pl u_ARM1176JZFS F/sw11_125_125j_RWan/reports/setupfix.F.sw11_125_125j_RWan.rpt > F/sw11_125_125j_RWan/reports/noa
~tousef/myperl/shuttle/filter_no_proc_paths.pl u_cortex_r4 F/sw11_125_125j_RWan/reports/noa > F/sw11_125_125j_RWan/reports/noac
~tousef/myperl/shuttle/filter_no_proc_paths.pl u_cevax1643 F/sw11_125_125j_RWan/reports/noac > F/sw11_125_125j_RWan/reports/noac3
~tousef/myperl/shuttle/filter_no_proc_paths.pl cevaX1622 F/sw11_125_125j_RWan/reports/noac3 > F/sw11_125_125j_RWan/reports/setupfix.NOPROC.SC.sw11_125_125j_RWan.rpt
rm  F/sw11_125_125j_RWan/reports/noa
rm  F/sw11_125_125j_RWan/reports/noac
rm  F/sw11_125_125j_RWan/reports/noac3

#####
#~tousef/myperl/shuttle/filter_no_proc_paths.pl u_ARM1176JZFS F/hb12_m40_m40j_RBan/reports/holdfix.F.hb12_m40_m40j_RBan.rpt > F/hb12_m40_m40j_RBan/reports/noa
#~tousef/myperl/shuttle/filter_no_proc_paths.pl u_cortex_r4 F/hb12_m40_m40j_RBan/reports/noa > F/hb12_m40_m40j_RBan/reports/noac
#~tousef/myperl/shuttle/filter_no_proc_paths.pl u_cevax1643 F/hb12_m40_m40j_RBan/reports/noac > F/hb12_m40_m40j_RBan/reports/noac3
#~tousef/myperl/shuttle/filter_no_proc_paths.pl cevaX1622 F/hb12_m40_m40j_RBan/reports/noac3 > F/hb12_m40_m40j_RBan/reports/holdfix.NORPOC.F.hb12_m40_m40j_RBan.rpt
#rm  F/hb12_m40_m40j_RBan/reports/noa
#rm  F/hb12_m40_m40j_RBan/reports/noac
#rm  F/hb12_m40_m40j_RBan/reports/noac3

####




#####
#~tousef/myperl/shuttle/filter_no_proc_paths.pl u_ARM1176JZFS SC/sw11_125_125j_RWan/reports/setupfix.SC.sw11_125_125j_RWan.rpt > SC/sw11_125_125j_RWan/reports/noa
#~tousef/myperl/shuttle/filter_no_proc_paths.pl u_cortex_r4 SC/sw11_125_125j_RWan/reports/noa > SC/sw11_125_125j_RWan/reports/noac
#~tousef/myperl/shuttle/filter_no_proc_paths.pl u_cevax1643 SC/sw11_125_125j_RWan/reports/noac > SC/sw11_125_125j_RWan/reports/noac3
#~tousef/myperl/shuttle/filter_no_proc_paths.pl cevaX1622 SC/sw11_125_125j_RWan/reports/noac3 > SC/sw11_125_125j_RWan/reports/setupfix.NORPOC.SC.sw11_125_125j_RWan.rpt
#rm  SC/sw11_125_125j_RWan/reports/noa
#rm  SC/sw11_125_125j_RWan/reports/noac
#rm  SC/sw11_125_125j_RWan/reports/noac3

######
#~tousef/myperl/shuttle/filter_no_proc_paths.pl u_ARM1176JZFS SC/hb12_m40_m40j_RBan/reports/holdfix.SC.hb12_m40_m40j_RBan.rpt > SC/hb12_m40_m40j_RBan/reports/noa
#~tousef/myperl/shuttle/filter_no_proc_paths.pl u_cortex_r4 SC/hb12_m40_m40j_RBan/reports/noa > SC/hb12_m40_m40j_RBan/reports/noac
#~tousef/myperl/shuttle/filter_no_proc_paths.pl u_cevax1643 SC/hb12_m40_m40j_RBan/reports/noac > SC/hb12_m40_m40j_RBan/reports/noac3
#~tousef/myperl/shuttle/filter_no_proc_paths.pl cevaX1622 SC/hb12_m40_m40j_RBan/reports/noac3 > SC/hb12_m40_m40j_RBan/reports/holdfix.NORPOC.SC.hb12_m40_m40j_RBan.rpt
#rm  SC/hb12_m40_m40j_RBan/reports/noa
#rm  SC/hb12_m40_m40j_RBan/reports/noac
#rm  SC/hb12_m40_m40j_RBan/reports/noac3
#
####



#####
#~tousef/myperl/shuttle/filter_no_proc_paths.pl u_ARM1176JZFS SS/sw11_125_125j_RWan/reports/setupfix.SS.sw11_125_125j_RWan.rpt > SS/sw11_125_125j_RWan/reports/noa
#~tousef/myperl/shuttle/filter_no_proc_paths.pl u_cortex_r4 SS/sw11_125_125j_RWan/reports/noa > SS/sw11_125_125j_RWan/reports/noac
#~tousef/myperl/shuttle/filter_no_proc_paths.pl u_cevax1643 SS/sw11_125_125j_RWan/reports/noac > SS/sw11_125_125j_RWan/reports/noac3
#~tousef/myperl/shuttle/filter_no_proc_paths.pl cevaX1622 SS/sw11_125_125j_RWan/reports/noac3 > SS/sw11_125_125j_RWan/reports/setupfix.NORPOC.SS.sw11_125_125j_RWan.rpt
#rm  SS/sw11_125_125j_RWan/reports/noa
#rm  SS/sw11_125_125j_RWan/reports/noac
#rm  SS/sw11_125_125j_RWan/reports/noac3

#####
#~tousef/myperl/shuttle/filter_no_proc_paths.pl u_ARM1176JZFS SS/hb12_m40_m40j_RBan/reports/holdfix.SS.hb12_m40_m40j_RBan.rpt > SS/hb12_m40_m40j_RBan/reports/noa
#~tousef/myperl/shuttle/filter_no_proc_paths.pl u_cortex_r4 SS/hb12_m40_m40j_RBan/reports/noa > SS/hb12_m40_m40j_RBan/reports/noac
#~tousef/myperl/shuttle/filter_no_proc_paths.pl u_cevax1643 SS/hb12_m40_m40j_RBan/reports/noac > SS/hb12_m40_m40j_RBan/reports/noac3
#~tousef/myperl/shuttle/filter_no_proc_paths.pl cevaX1622 SS/hb12_m40_m40j_RBan/reports/noac3 > SS/hb12_m40_m40j_RBan/reports/holdfix.NORPOC.SS.hb12_m40_m40j_RBan.rpt
#rm  SS/hb12_m40_m40j_RBan/reports/noa
#rm  SS/hb12_m40_m40j_RBan/reports/noac
#rm  SS/hb12_m40_m40j_RBan/reports/noac3

####



#####
#~tousef/myperl/shuttle/filter_no_proc_paths.pl u_ARM1176JZFS B/sw11_125_125j_RWan/reports/setupfix.B.sw11_125_125j_RWan.rpt > B/sw11_125_125j_RWan/reports/noa
#~tousef/myperl/shuttle/filter_no_proc_paths.pl u_cortex_r4 B/sw11_125_125j_RWan/reports/noa > B/sw11_125_125j_RWan/reports/noac
#~tousef/myperl/shuttle/filter_no_proc_paths.pl u_cevax1643 B/sw11_125_125j_RWan/reports/noac > B/sw11_125_125j_RWan/reports/noac3
#~tousef/myperl/shuttle/filter_no_proc_paths.pl cevaX1622 B/sw11_125_125j_RWan/reports/noac3 > B/sw11_125_125j_RWan/reports/setupfix.NORPOC.B.sw11_125_125j_RWan.rpt
#rm  B/sw11_125_125j_RWan/reports/noa
#rm  B/sw11_125_125j_RWan/reports/noac
#rm  B/sw11_125_125j_RWan/reports/noac3

#####
#~tousef/myperl/shuttle/filter_no_proc_paths.pl u_ARM1176JZFS B/hb12_m40_m40j_RBan/reports/holdfix.B.hb12_m40_m40j_RBan.rpt > B/hb12_m40_m40j_RBan/reports/noa
#~tousef/myperl/shuttle/filter_no_proc_paths.pl u_cortex_r4 B/hb12_m40_m40j_RBan/reports/noa > B/hb12_m40_m40j_RBan/reports/noac
#~tousef/myperl/shuttle/filter_no_proc_paths.pl u_cevax1643 B/hb12_m40_m40j_RBan/reports/noac > B/hb12_m40_m40j_RBan/reports/noac3
#~tousef/myperl/shuttle/filter_no_proc_paths.pl cevaX1622 B/hb12_m40_m40j_RBan/reports/noac3 > B/hb12_m40_m40j_RBan/reports/holdfix.NORPOC.B.hb12_m40_m40j_RBan.rpt
#rm  B/hb12_m40_m40j_RBan/reports/noa
#rm  B/hb12_m40_m40j_RBan/reports/noac
#rm  B/hb12_m40_m40j_RBan/reports/noac3

####


