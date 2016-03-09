
set allfanout [all_fanout -flat -end -from u_core/u_a11_arm1176_etm11cs/u_ARM1176JZFS/uNoRAM/uMain/uCore/uCoreCtl/uDec/uIBuf/clk_gate_DPPAlignHold_reg/latch/Z]

foreach_in_collection fout $allfanout {
  set cpin [get_object_name $fout]
  printvar $cpin
}
