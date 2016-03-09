
set tempfile "temp.rpt"


#########
#FT substitute whatever options for group, etc, or iterate over the groups and include
#FT set report_timing_options "\-aocvm \-group $groupname \to $endpoint -from $startpoint \etc.etc."
#FT hard coding below for now to get the file opened, written and closed.
#########
set endpoint "i_ddpcore/i_vps/i_osd/i_osd_wlm/rc_cnt0_hold_wq_reg/EN"
eval "report_timing -aocvm -to $endpoint" > $tempfile 

set fp [open $tempfile "r"]

while {0 <= [gets $fp readline]} {
  if {[eof $fp]} break
  echo $readline
}
 
 close $fp
file delete $tempfile

