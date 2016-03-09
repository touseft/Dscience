
proc rds {} {

  #foreach_in_collection groupname [get_path_groups *] {
    set group_tns 0
    set group_wns 999999
    set design_tps 0

    set pinname "i_ddpcore/i_vps/i_osd/i_osd_wlm/rc_cnt0_hold_wq_reg/EN"
    set pinobject [get_pins i_ddpcore/i_vps/i_osd/i_osd_wlm/rc_cnt0_hold_wq_reg/EN]
    #set maxrarr [get_attribute $pinobject max_rise_arrival]
    #set maxfarr [get_attribute $pinobject max_fall_arrival]
    #echo [format "pin '%s' Max Rise Arrival is: %f" $pinname $maxrarr]
    #echo [format "pin '%s' max Fall Arrival is : %f" $pinname $maxfarr]
    
    #set group_name [get_attribute $groupname full_name]
    #echo [format "Group '%s' is:" $group_name]
    foreach_in_collection path [get_timing_paths -aocvm -nworst 1 -group wclk -to i_ddpcore/i_vps/i_osd/i_osd_wlm/rc_cnt0_hold_wq_reg/EN] {
      set slack [get_attribute $path slack]
      #set group_name [get_attribute $groupname full_name]
      echo [format "Group '%s' Worst slack is : %g" wclk $slack]
    }
  #}
}

set pinname "u_core/u_shared_core_shared_core/u_gems_gems_ss/u_gems_w_gems_w/u_w_gems/gems_logic/gems_regs_mux/active_regs_set_reg_0_/CP"
