# Legal Notice: (C)2019 Altera Corporation. All rights reserved.  Your
# use of Altera Corporation's design tools, logic functions and other
# software and tools, and its AMPP partner logic functions, and any
# output files any of the foregoing (including device programming or
# simulation files), and any associated documentation or information are
# expressly subject to the terms and conditions of the Altera Program
# License Subscription Agreement or other applicable license agreement,
# including, without limitation, that your use is for the sole purpose
# of programming logic devices manufactured by Altera and sold by Altera
# or its authorized distributors.  Please refer to the applicable
# agreement for further details.

#**************************************************************
# Timequest JTAG clock definition
#   Uncommenting the following lines will define the JTAG
#   clock in TimeQuest Timing Analyzer
#**************************************************************

#create_clock -period 10MHz {altera_reserved_tck}
#set_clock_groups -asynchronous -group {altera_reserved_tck}

#**************************************************************
# Set TCL Path Variables 
#**************************************************************

set 	mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa 	mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa:*
set 	mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_oci 	mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_nios2_oci:the_mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_nios2_oci
set 	mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_oci_break 	mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_nios2_oci_break:the_mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_nios2_oci_break
set 	mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_ocimem 	mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_nios2_ocimem:the_mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_nios2_ocimem
set 	mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_oci_debug 	mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_nios2_oci_debug:the_mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_nios2_oci_debug
set 	mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_wrapper 	mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_debug_slave_wrapper:the_mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_debug_slave_wrapper
set 	mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_jtag_tck 	mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_debug_slave_tck:the_mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_debug_slave_tck
set 	mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_jtag_sysclk 	mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_debug_slave_sysclk:the_mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_debug_slave_sysclk
set 	mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_oci_path 	 [format "%s|%s" $mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa $mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_oci]
set 	mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_oci_break_path 	 [format "%s|%s" $mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_oci_path $mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_oci_break]
set 	mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_ocimem_path 	 [format "%s|%s" $mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_oci_path $mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_ocimem]
set 	mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_oci_debug_path 	 [format "%s|%s" $mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_oci_path $mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_oci_debug]
set 	mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_jtag_tck_path 	 [format "%s|%s|%s" $mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_oci_path $mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_wrapper $mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_jtag_tck]
set 	mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_jtag_sysclk_path 	 [format "%s|%s|%s" $mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_oci_path $mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_wrapper $mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_jtag_sysclk]
set 	mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_jtag_sr 	 [format "%s|*sr" $mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_jtag_tck_path]

#**************************************************************
# Set False Paths
#**************************************************************

set_false_path -from [get_keepers *$mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_oci_break_path|break_readreg*] -to [get_keepers *$mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_jtag_sr*]
set_false_path -from [get_keepers *$mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_oci_debug_path|*resetlatch]     -to [get_keepers *$mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_jtag_sr[33]]
set_false_path -from [get_keepers *$mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_oci_debug_path|monitor_ready]  -to [get_keepers *$mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_jtag_sr[0]]
set_false_path -from [get_keepers *$mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_oci_debug_path|monitor_error]  -to [get_keepers *$mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_jtag_sr[34]]
set_false_path -from [get_keepers *$mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_ocimem_path|*MonDReg*] -to [get_keepers *$mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_jtag_sr*]
set_false_path -from *$mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_jtag_sr*    -to *$mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_jtag_sysclk_path|*jdo*
set_false_path -from *sld_jtag_hub:*|irf_reg* -to *$mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_jtag_sysclk_path|ir*
set_false_path -from *sld_jtag_hub:*|sld_shadow_jsm:shadow_jsm|state[1] -to *$mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa_oci_debug_path|monitor_go
