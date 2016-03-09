grep RF111 cevax1643.v > cevax1643_sram_instance_list.txt
formatit2.pl < cevax1643_sram_instance_list.txt > cevax1643_sram_to_from_paths.tcl
