grep " RF211" sap6_fix_time_final.v > rf211
grep " RF111" sap6_fix_time_final.v > rf111
grep " RA111" sap6_fix_time_final.v > ra111
grep " RA222" sap6_fix_time_final.v > ra222
cat rf211 rf111 ra111 ra222 > rams
rm rf211 rf111 ra111 ra222
wc -l rams
~tousef/myperl/sap6/verplex/format.pl < rams | grep SMRD > smrd_rams
wc -l smrd_rams

~tousef/myperl/sap6/verplex/gen_contraint_rd.pl < smrd_rams > vpx_constraint_rd.do
### grep "/rfuse_r_reg\[" *.v > rfuse

~tousef/myperl/sap6/verplex/gen_ignore_sram_pins_rd.pl < smrd_rams > vpx_ignore_sram_pins.do

