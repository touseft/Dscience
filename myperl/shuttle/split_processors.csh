#!/usr/local/bin/csh

#ARM1176JZFS \u_core_shuttle_core/u_a11_arm1176_etm11cs/u_ARM1176JZFS 
#CORTEXR4 #\u_core_shuttle_core/u_crtx_cortexr4_pl310_etmr4/cortex_r4_pl310/u_cortex_r4  (
#cevax1643 \u_core_shuttle_core/u_ceva_cevax1643_wrp/u_cevax1643  (
#cevaX1622 #\u_core_shuttle_core/u_aud_ceva_xs1200_sub_wrapper/u_dspsub_cevaxs1202/cevaX1622  (

#####
cd /data/data100/motorola/aspen_shuttle/ptsi/yz19/n4.4.2_d2_f1_3
~tousef/myperl/shuttle/filter_proc_paths.pl u_ARM1176JZFS F/sw11_125_125j_RWan/reports/setupfix.F.sw11_125_125j_RWan.rpt > F/sw11_125_125j_RWan/reports/setupfix.ARM11.F.sw11_125_125j_RWan.rpt

~tousef/myperl/shuttle/filter_proc_paths.pl u_cortex_r4 F/sw11_125_125j_RWan/reports/setupfix.F.sw11_125_125j_RWan.rpt > F/sw11_125_125j_RWan/reports/setupfix.CORTEXR4.F.sw11_125_125j_RWan.rpt

~tousef/myperl/shuttle/filter_proc_paths.pl u_cevax1643 F/sw11_125_125j_RWan/reports/setupfix.F.sw11_125_125j_RWan.rpt > F/sw11_125_125j_RWan/reports/setupfix.CEVAX1643.F.sw11_125_125j_RWan.rpt

~tousef/myperl/shuttle/filter_proc_paths.pl cevaX1622 F/sw11_125_125j_RWan/reports/setupfix.F.sw11_125_125j_RWan.rpt > F/sw11_125_125j_RWan/reports/setupfix.CEVAX1622.F.sw11_125_125j_RWan.rpt

#####
~tousef/myperl/shuttle/filter_proc_paths.pl u_ARM1176JZFS F/hb12_m40_m40j_RBan/reports/holdfix.F.hb12_m40_m40j_RBan.rpt > F/hb12_m40_m40j_RBan/reports/holdfix.ARM11.F.hb12_m40_m40j_RBan.rpt

~tousef/myperl/shuttle/filter_proc_paths.pl u_cortex_r4 F/hb12_m40_m40j_RBan/reports/holdfix.F.hb12_m40_m40j_RBan.rpt > F/hb12_m40_m40j_RBan/reports/holdfix.CORTEXR4.F.hb12_m40_m40j_RBan.rpt

~tousef/myperl/shuttle/filter_proc_paths.pl u_cevax1643 F/hb12_m40_m40j_RBan/reports/holdfix.F.hb12_m40_m40j_RBan.rpt > F/hb12_m40_m40j_RBan/reports/holdfix.CEVAX1643.F.hb12_m40_m40j_RBan.rpt

~tousef/myperl/shuttle/filter_proc_paths.pl cevaX1622 F/hb12_m40_m40j_RBan/reports/holdfix.F.hb12_m40_m40j_RBan.rpt > F/hb12_m40_m40j_RBan/reports/holdfix.CEVAX1622.F.hb12_m40_m40j_RBan.rpt

####




#####
~tousef/myperl/shuttle/filter_proc_paths.pl u_ARM1176JZFS SC/sw11_125_125j_RWan/reports/setupfix.SC.sw11_125_125j_RWan.rpt > SC/sw11_125_125j_RWan/reports/setupfix.ARM11.SC.sw11_125_125j_RWan.rpt

~tousef/myperl/shuttle/filter_proc_paths.pl u_cortex_r4 SC/sw11_125_125j_RWan/reports/setupfix.SC.sw11_125_125j_RWan.rpt > SC/sw11_125_125j_RWan/reports/setupfix.CORTEXR4.SC.sw11_125_125j_RWan.rpt

~tousef/myperl/shuttle/filter_proc_paths.pl u_cevax1643 SC/sw11_125_125j_RWan/reports/setupfix.SC.sw11_125_125j_RWan.rpt > SC/sw11_125_125j_RWan/reports/setupfix.CEVAX1643.SC.sw11_125_125j_RWan.rpt

~tousef/myperl/shuttle/filter_proc_paths.pl cevaX1622 SC/sw11_125_125j_RWan/reports/setupfix.SC.sw11_125_125j_RWan.rpt > SC/sw11_125_125j_RWan/reports/setupfix.CEVAX1622.SC.sw11_125_125j_RWan.rpt

#####
~tousef/myperl/shuttle/filter_proc_paths.pl u_ARM1176JZFS SC/hb12_m40_m40j_RBan/reports/holdfix.SC.hb12_m40_m40j_RBan.rpt > SC/hb12_m40_m40j_RBan/reports/holdfix.ARM11.SC.hb12_m40_m40j_RBan.rpt

~tousef/myperl/shuttle/filter_proc_paths.pl u_cortex_r4 SC/hb12_m40_m40j_RBan/reports/holdfix.SC.hb12_m40_m40j_RBan.rpt > SC/hb12_m40_m40j_RBan/reports/holdfix.CORTEXR4.SC.hb12_m40_m40j_RBan.rpt

~tousef/myperl/shuttle/filter_proc_paths.pl u_cevax1643 SC/hb12_m40_m40j_RBan/reports/holdfix.SC.hb12_m40_m40j_RBan.rpt > SC/hb12_m40_m40j_RBan/reports/holdfix.CEVAX1643.SC.hb12_m40_m40j_RBan.rpt

~tousef/myperl/shuttle/filter_proc_paths.pl cevaX1622 SC/hb12_m40_m40j_RBan/reports/holdfix.SC.hb12_m40_m40j_RBan.rpt > SC/hb12_m40_m40j_RBan/reports/holdfix.CEVAX1622.SC.hb12_m40_m40j_RBan.rpt

####



#####
~tousef/myperl/shuttle/filter_proc_paths.pl u_ARM1176JZFS SS/sw11_125_125j_RWan/reports/setupfix.SS.sw11_125_125j_RWan.rpt > SS/sw11_125_125j_RWan/reports/setupfix.ARM11.SS.sw11_125_125j_RWan.rpt

~tousef/myperl/shuttle/filter_proc_paths.pl u_cortex_r4 SS/sw11_125_125j_RWan/reports/setupfix.SS.sw11_125_125j_RWan.rpt > SS/sw11_125_125j_RWan/reports/setupfix.CORTEXR4.SS.sw11_125_125j_RWan.rpt

~tousef/myperl/shuttle/filter_proc_paths.pl u_cevax1643 SS/sw11_125_125j_RWan/reports/setupfix.SS.sw11_125_125j_RWan.rpt > SS/sw11_125_125j_RWan/reports/setupfix.CEVAX1643.SS.sw11_125_125j_RWan.rpt

~tousef/myperl/shuttle/filter_proc_paths.pl cevaX1622 SS/sw11_125_125j_RWan/reports/setupfix.SS.sw11_125_125j_RWan.rpt > SS/sw11_125_125j_RWan/reports/setupfix.CEVAX1622.SS.sw11_125_125j_RWan.rpt

#####
~tousef/myperl/shuttle/filter_proc_paths.pl u_ARM1176JZFS SS/hb12_m40_m40j_RBan/reports/holdfix.SS.hb12_m40_m40j_RBan.rpt > SS/hb12_m40_m40j_RBan/reports/holdfix.ARM11.SS.hb12_m40_m40j_RBan.rpt

~tousef/myperl/shuttle/filter_proc_paths.pl u_cortex_r4 SS/hb12_m40_m40j_RBan/reports/holdfix.SS.hb12_m40_m40j_RBan.rpt > SS/hb12_m40_m40j_RBan/reports/holdfix.CORTEXR4.SS.hb12_m40_m40j_RBan.rpt

~tousef/myperl/shuttle/filter_proc_paths.pl u_cevax1643 SS/hb12_m40_m40j_RBan/reports/holdfix.SS.hb12_m40_m40j_RBan.rpt > SS/hb12_m40_m40j_RBan/reports/holdfix.CEVAX1643.SS.hb12_m40_m40j_RBan.rpt

~tousef/myperl/shuttle/filter_proc_paths.pl cevaX1622 SS/hb12_m40_m40j_RBan/reports/holdfix.SS.hb12_m40_m40j_RBan.rpt > SS/hb12_m40_m40j_RBan/reports/holdfix.CEVAX1622.SS.hb12_m40_m40j_RBan.rpt

####



#####
~tousef/myperl/shuttle/filter_proc_paths.pl u_ARM1176JZFS B/sw11_125_125j_RWan/reports/setupfix.B.sw11_125_125j_RWan.rpt > B/sw11_125_125j_RWan/reports/setupfix.ARM11.B.sw11_125_125j_RWan.rpt

~tousef/myperl/shuttle/filter_proc_paths.pl u_cortex_r4 B/sw11_125_125j_RWan/reports/setupfix.B.sw11_125_125j_RWan.rpt > B/sw11_125_125j_RWan/reports/setupfix.CORTEXR4.B.sw11_125_125j_RWan.rpt

~tousef/myperl/shuttle/filter_proc_paths.pl u_cevax1643 B/sw11_125_125j_RWan/reports/setupfix.B.sw11_125_125j_RWan.rpt > B/sw11_125_125j_RWan/reports/setupfix.CEVAX1643.B.sw11_125_125j_RWan.rpt

~tousef/myperl/shuttle/filter_proc_paths.pl cevaX1622 B/sw11_125_125j_RWan/reports/setupfix.B.sw11_125_125j_RWan.rpt > B/sw11_125_125j_RWan/reports/setupfix.CEVAX1622.B.sw11_125_125j_RWan.rpt

#####
~tousef/myperl/shuttle/filter_proc_paths.pl u_ARM1176JZFS B/hb12_m40_m40j_RBan/reports/holdfix.B.hb12_m40_m40j_RBan.rpt > B/hb12_m40_m40j_RBan/reports/holdfix.ARM11.B.hb12_m40_m40j_RBan.rpt

~tousef/myperl/shuttle/filter_proc_paths.pl u_cortex_r4 B/hb12_m40_m40j_RBan/reports/holdfix.B.hb12_m40_m40j_RBan.rpt > B/hb12_m40_m40j_RBan/reports/holdfix.CORTEXR4.B.hb12_m40_m40j_RBan.rpt

~tousef/myperl/shuttle/filter_proc_paths.pl u_cevax1643 B/hb12_m40_m40j_RBan/reports/holdfix.B.hb12_m40_m40j_RBan.rpt > B/hb12_m40_m40j_RBan/reports/holdfix.CEVAX1643.B.hb12_m40_m40j_RBan.rpt

~tousef/myperl/shuttle/filter_proc_paths.pl cevaX1622 B/hb12_m40_m40j_RBan/reports/holdfix.B.hb12_m40_m40j_RBan.rpt > B/hb12_m40_m40j_RBan/reports/holdfix.CEVAX1622.B.hb12_m40_m40j_RBan.rpt

####


