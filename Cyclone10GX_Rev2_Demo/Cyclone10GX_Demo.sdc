## Generated SDC file "Cyclone10GX_Demo.sdc"

## Copyright (C) 2019  Intel Corporation. All rights reserved.
## Your use of Intel Corporation's design tools, logic functions 
## and other software and tools, and any partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Intel Program License 
## Subscription Agreement, the Intel Quartus Prime License Agreement,
## the Intel FPGA IP License Agreement, or other applicable license
## agreement, including, without limitation, that your use is for
## the sole purpose of programming logic devices manufactured by
## Intel and sold by Intel or its authorized distributors.  Please
## refer to the applicable agreement for further details, at
## https://fpgasoftware.intel.com/eula.


## VENDOR  "Intel Corporation"
## PROGRAM "Quartus Prime"
## VERSION "Version 18.1.2 Build 277 02/12/2019 SJ Pro Edition"

## DATE    "Mon Aug 12 22:38:41 2019"

##
## DEVICE  "10CX220YF780I5G"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {~ALTERA_CLKUSR~} -period 8.000 -waveform { 0.000 4.000 } [get_pins -compatibility_mode {~ALTERA_CLKUSR~~ibuf|o}]
create_clock -name {mcu_0|ddr3|ddr3_ref_clock} -period 5.000 -waveform { 0.000 2.500 } [get_ports {refclk_emif_clk}]
create_clock -name {mem_mem_dqs[0]_IN} -period 1.250 -waveform { 0.000 0.625 } [get_ports {mem_mem_dqs[0]}]
create_clock -name {mem_mem_dqs[1]_IN} -period 1.250 -waveform { 0.000 0.625 } [get_ports {mem_mem_dqs[1]}]
create_clock -name {mem_mem_dqs[2]_IN} -period 1.250 -waveform { 0.000 0.625 } [get_ports {mem_mem_dqs[2]}]
create_clock -name {mem_mem_dqs[3]_IN} -period 1.250 -waveform { 0.000 0.625 } [get_ports {mem_mem_dqs[3]}]
create_clock -name {clk0} -period 8.000 -waveform { 0.000 4.000 } [get_ports {clk0}]
create_clock -name {mcu_0|spi|spi|SCLK_reg} -period 16.000 -waveform { 0.000 8.000 } [get_registers {mcu_0|spi|spi|SCLK_reg}]
create_clock -name {rx_ref_clk} -period 1.000 -waveform { 0.000 0.500 } [get_ports {rx_ref_clk}]
create_clock -name {tx_ref_clk} -period 1.000 -waveform { 0.000 0.500 } [get_ports {tx_ref_clk}]
create_clock -name {altera_reserved_tck} -period 30.303 -waveform { 0.000 15.151 } [get_ports {altera_reserved_tck}]


#**************************************************************
# Create Generated Clock
#**************************************************************

create_generated_clock -name {mcu_0|ddr3|ddr3_vco_clk} -source [get_ports {refclk_emif_clk}] -multiply_by 4 -master_clock {mcu_0|ddr3|ddr3_ref_clock} [get_nets {mcu_0|ddr3|ddr3|arch|arch_inst|pll_inst|phy_clk_phs[0]}] 
create_generated_clock -name {mcu_0|ddr3|ddr3_vco_clk_1} -source [get_ports {refclk_emif_clk}] -multiply_by 4 -master_clock {mcu_0|ddr3|ddr3_ref_clock} [get_nets {mcu_0|ddr3|ddr3|arch|arch_inst|pll_inst|pll_inst~_DuplicateVCOPH0}] 
create_generated_clock -name {mcu_0|ddr3|ddr3_core_usr_clk} -source [get_nets {mcu_0|ddr3|ddr3|arch|arch_inst|pll_inst|phy_clk_phs[0]}] -divide_by 4 -phase 45/2 -master_clock {mcu_0|ddr3|ddr3_vco_clk} [get_pins {mcu_0|ddr3|ddr3|arch|arch_inst|io_tiles_wrap_inst|io_tiles_inst|tile_gen[0].tile_ctrl_inst|pa_core_clk_out[0]}] 
create_generated_clock -name {mcu_0|ddr3|ddr3_core_cal_slave_clk} -source [get_nets {mcu_0|ddr3|ddr3|arch|arch_inst|pll_inst|phy_clk_phs[0]}] -divide_by 5 -master_clock {mcu_0|ddr3|ddr3_vco_clk} [get_pins {mcu_0|ddr3|ddr3|arch|arch_inst|pll_inst|pll_inst|outclk[3]}] 
create_generated_clock -name {mcu_0|ddr3|ddr3_phy_clk_0} -source [get_nets {mcu_0|ddr3|ddr3|arch|arch_inst|pll_inst|phy_clk_phs[0]}] -divide_by 2 -phase 45/1 -master_clock {mcu_0|ddr3|ddr3_vco_clk} [get_nets {mcu_0|ddr3|ddr3|arch|arch_inst|pll_inst|phy_clk[0]}] 
create_generated_clock -name {mcu_0|ddr3|ddr3_phy_clk_1} -source [get_nets {mcu_0|ddr3|ddr3|arch|arch_inst|pll_inst|pll_inst~_DuplicateVCOPH0}] -divide_by 2 -phase 45/1 -master_clock {mcu_0|ddr3|ddr3_vco_clk_1} [get_nets {mcu_0|ddr3|ddr3|arch|arch_inst|pll_inst|pll_inst~_DuplicateLOADEN0}] 
create_generated_clock -name {mcu_0|ddr3|ddr3_phy_clk_l_0} -source [get_nets {mcu_0|ddr3|ddr3|arch|arch_inst|pll_inst|phy_clk_phs[0]}] -divide_by 4 -phase 45/2 -master_clock {mcu_0|ddr3|ddr3_vco_clk} [get_nets {mcu_0|ddr3|ddr3|arch|arch_inst|pll_inst|phy_clk[1]}] 
create_generated_clock -name {mcu_0|ddr3|ddr3_phy_clk_l_1} -source [get_nets {mcu_0|ddr3|ddr3|arch|arch_inst|pll_inst|pll_inst~_DuplicateVCOPH0}] -divide_by 4 -phase 45/2 -master_clock {mcu_0|ddr3|ddr3_vco_clk_1} [get_nets {mcu_0|ddr3|ddr3|arch|arch_inst|pll_inst|pll_inst~_DuplicateLVDS_CLK0}] 
create_generated_clock -name {mcu_0|ddr3|ddr3_wf_clk_0} -source [get_pins {mcu_0|ddr3|ddr3|arch|arch_inst|pll_inst|pll_inst|vcoph[0]}] -master_clock {mcu_0|ddr3|ddr3_vco_clk} [get_registers {mcu_0|ddr3|ddr3|arch|arch_inst|io_tiles_wrap_inst|io_tiles_inst|tile_gen[0].lane_gen[1].lane_inst~out_phy_reg}] 
create_generated_clock -name {mcu_0|ddr3|ddr3_wf_clk_1} -source [get_pins {mcu_0|ddr3|ddr3|arch|arch_inst|pll_inst|pll_inst|vcoph[0]}] -master_clock {mcu_0|ddr3|ddr3_vco_clk} [get_registers {mcu_0|ddr3|ddr3|arch|arch_inst|io_tiles_wrap_inst|io_tiles_inst|tile_gen[0].lane_gen[2].lane_inst~out_phy_reg}] 
create_generated_clock -name {mcu_0|ddr3|ddr3_wf_clk_2} -source [get_pins {mcu_0|ddr3|ddr3|arch|arch_inst|pll_inst|pll_inst|vcoph[0]}] -master_clock {mcu_0|ddr3|ddr3_vco_clk} [get_registers {mcu_0|ddr3|ddr3|arch|arch_inst|io_tiles_wrap_inst|io_tiles_inst|tile_gen[0].lane_gen[0].lane_inst~out_phy_reg}] 
create_generated_clock -name {mcu_0|ddr3|ddr3_wf_clk_3} -source [get_pins {mcu_0|ddr3|ddr3|arch|arch_inst|pll_inst|pll_inst~_Duplicate|vcoph[0]}] -master_clock {mcu_0|ddr3|ddr3_vco_clk_1} [get_registers {mcu_0|ddr3|ddr3|arch|arch_inst|io_tiles_wrap_inst|io_tiles_inst|tile_gen[0].lane_gen[3].lane_inst~out_phy_reg}] 
create_generated_clock -name {mcu_0|ddr3|ddr3_wf_clk_4} -source [get_pins {mcu_0|ddr3|ddr3|arch|arch_inst|pll_inst|pll_inst~_Duplicate|vcoph[0]}] -master_clock {mcu_0|ddr3|ddr3_vco_clk_1} [get_registers {mcu_0|ddr3|ddr3|arch|arch_inst|io_tiles_wrap_inst|io_tiles_inst|tile_gen[1].lane_gen[0].lane_inst~out_phy_reg}] 
create_generated_clock -name {mcu_0|ddr3|ddr3_wf_clk_5} -source [get_pins {mcu_0|ddr3|ddr3|arch|arch_inst|pll_inst|pll_inst~_Duplicate|vcoph[0]}] -master_clock {mcu_0|ddr3|ddr3_vco_clk_1} [get_registers {mcu_0|ddr3|ddr3|arch|arch_inst|io_tiles_wrap_inst|io_tiles_inst|tile_gen[1].lane_gen[1].lane_inst~out_phy_reg}] 
create_generated_clock -name {mcu_0|ddr3|ddr3_wf_clk_6} -source [get_pins {mcu_0|ddr3|ddr3|arch|arch_inst|pll_inst|pll_inst|vcoph[0]}] -master_clock {mcu_0|ddr3|ddr3_vco_clk} [get_registers {mcu_0|ddr3|ddr3|arch|arch_inst|io_tiles_wrap_inst|io_tiles_inst|tile_gen[1].lane_gen[2].lane_inst~out_phy_reg}] 


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_4}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_wf_clk_4}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_4}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_wf_clk_4}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_4}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.200  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_4}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.200  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_4}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_wf_clk_4}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_4}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_wf_clk_4}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_4}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.200  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_4}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.200  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_5}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_wf_clk_5}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_5}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_wf_clk_5}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_5}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.200  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_5}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.200  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_5}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_wf_clk_5}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_5}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_wf_clk_5}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_5}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.200  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_5}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.200  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_6}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_wf_clk_6}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_6}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_wf_clk_6}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_6}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.200  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_6}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.200  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_6}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_wf_clk_6}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_6}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_wf_clk_6}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_6}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.200  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_6}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.200  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_3}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_wf_clk_3}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_3}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_wf_clk_3}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_3}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.200  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_3}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.200  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_3}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_wf_clk_3}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_3}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_wf_clk_3}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_3}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.200  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_3}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.200  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_2}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_wf_clk_2}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_2}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_wf_clk_2}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_2}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.200  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_2}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.200  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_2}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_wf_clk_2}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_2}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_wf_clk_2}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_2}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.200  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_2}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.200  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_1}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_wf_clk_1}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_1}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_wf_clk_1}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_1}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.200  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_1}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.200  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_1}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_wf_clk_1}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_1}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_wf_clk_1}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_1}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.200  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_1}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.200  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_0}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_wf_clk_0}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_0}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_wf_clk_0}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_0}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.200  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_0}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.200  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_0}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_wf_clk_0}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_0}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_wf_clk_0}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_0}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.200  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_wf_clk_0}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.200  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_1}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_1}]  0.050  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_1}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_1}]  0.050  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_1}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -setup 0.245  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_1}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -hold 0.253  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_1}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -setup 0.245  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_1}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -hold 0.253  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_1}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -setup 0.245  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_1}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -hold 0.253  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_1}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -setup 0.245  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_1}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -hold 0.253  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_1}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_1}]  0.050  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_1}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_1}]  0.050  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_1}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -setup 0.245  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_1}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -hold 0.253  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_1}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -setup 0.245  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_1}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -hold 0.253  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_1}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -setup 0.245  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_1}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -hold 0.253  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_1}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -setup 0.245  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_1}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -hold 0.253  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_0}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_0}]  0.050  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_0}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_0}]  0.050  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_0}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -setup 0.108  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_0}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -hold 0.116  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_0}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -setup 0.108  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_0}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -hold 0.116  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_0}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -setup 0.148  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_0}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -hold 0.156  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_0}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -setup 0.148  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_0}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -hold 0.156  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_0}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_0}]  0.050  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_0}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_0}]  0.050  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_0}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -setup 0.108  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_0}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -hold 0.116  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_0}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -setup 0.108  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_0}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -hold 0.116  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_0}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -setup 0.148  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_0}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -hold 0.156  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_0}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -setup 0.148  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_0}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -hold 0.156  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_1}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_1}]  0.040  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_1}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_1}]  0.040  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_1}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -setup 0.245  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_1}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -hold 0.253  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_1}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -setup 0.245  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_1}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -hold 0.253  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_1}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -setup 0.245  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_1}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -hold 0.253  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_1}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -setup 0.245  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_1}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -hold 0.253  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_1}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_1}]  0.040  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_1}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_1}]  0.040  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_1}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -setup 0.245  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_1}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -hold 0.253  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_1}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -setup 0.245  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_1}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -hold 0.253  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_1}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -setup 0.245  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_1}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -hold 0.253  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_1}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -setup 0.245  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_1}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -hold 0.253  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_0}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_0}]  0.040  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_0}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_0}]  0.040  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_0}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -setup 0.108  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_0}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -hold 0.116  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_0}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -setup 0.108  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_0}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -hold 0.116  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_0}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -setup 0.148  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_0}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -hold 0.156  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_0}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -setup 0.148  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_0}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -hold 0.156  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_0}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_0}]  0.040  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_0}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_0}]  0.040  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_0}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -setup 0.108  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_0}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -hold 0.116  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_0}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -setup 0.108  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_0}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -hold 0.116  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_0}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -setup 0.148  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_0}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -hold 0.156  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_0}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -setup 0.148  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_phy_clk_0}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -hold 0.156  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_1}] -setup 0.278  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_1}] -hold 0.304  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_1}] -setup 0.278  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_1}] -hold 0.304  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_0}] -setup 0.141  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_0}] -hold 0.167  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_0}] -setup 0.141  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_0}] -hold 0.167  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_1}] -setup 0.278  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_1}] -hold 0.304  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_1}] -setup 0.278  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_1}] -hold 0.304  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_0}] -setup 0.141  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_0}] -hold 0.167  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_0}] -setup 0.141  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_0}] -hold 0.167  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}]  0.050  -enable_same_physical_edge
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}]  0.050  -enable_same_physical_edge
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_1}] -setup 0.278  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_1}] -hold 0.304  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_1}] -setup 0.278  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_1}] -hold 0.304  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_0}] -setup 0.141  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_0}] -hold 0.167  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_0}] -setup 0.141  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_0}] -hold 0.167  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_1}] -setup 0.278  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_1}] -hold 0.304  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_1}] -setup 0.278  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_1}] -hold 0.304  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_0}] -setup 0.141  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_0}] -hold 0.167  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_0}] -setup 0.141  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_0}] -hold 0.167  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}]  0.050  -enable_same_physical_edge
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}]  0.050  -enable_same_physical_edge
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_1}] -setup 0.278  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_1}] -hold 0.304  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_1}] -setup 0.278  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_1}] -hold 0.304  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_0}] -setup 0.181  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_0}] -hold 0.207  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_0}] -setup 0.181  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_0}] -hold 0.207  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_1}] -setup 0.278  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_1}] -hold 0.304  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_1}] -setup 0.278  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_1}] -hold 0.304  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_0}] -setup 0.141  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_0}] -hold 0.167  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_0}] -setup 0.141  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_0}] -hold 0.167  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}]  0.030  -enable_same_physical_edge
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}]  0.030  -enable_same_physical_edge
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -rise_to [get_clocks {clk0}]  0.480  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -fall_to [get_clocks {clk0}]  0.480  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_1}] -setup 0.278  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_1}] -hold 0.304  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_1}] -setup 0.278  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_1}] -hold 0.304  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_0}] -setup 0.181  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_0}] -hold 0.207  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_0}] -setup 0.181  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_0}] -hold 0.207  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_1}] -setup 0.278  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_1}] -hold 0.304  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_1}] -setup 0.278  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_1}] -hold 0.304  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_0}] -setup 0.141  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_0}] -hold 0.167  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_0}] -setup 0.141  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_0}] -hold 0.167  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}]  0.030  -enable_same_physical_edge
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}]  0.030  -enable_same_physical_edge
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -rise_to [get_clocks {clk0}]  0.480  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}] -fall_to [get_clocks {clk0}]  0.480  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_vco_clk_1}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_vco_clk_1}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_vco_clk_1}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_vco_clk_1}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_vco_clk_1}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.200  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_vco_clk_1}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.200  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_vco_clk_1}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_vco_clk_1}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_vco_clk_1}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_vco_clk_1}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_vco_clk_1}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.200  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_vco_clk_1}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.200  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_vco_clk}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_vco_clk}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_vco_clk}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_vco_clk}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_vco_clk}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.200  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_vco_clk}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.200  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_vco_clk}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_vco_clk}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_vco_clk}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_vco_clk}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_vco_clk}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.200  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_vco_clk}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.200  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {altera_reserved_tck}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {altera_reserved_tck}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {clk0}]  0.310  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {clk0}]  0.310  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {altera_reserved_tck}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {altera_reserved_tck}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {clk0}]  0.310  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {clk0}]  0.310  
set_clock_uncertainty -rise_from [get_clocks {tx_ref_clk}] -rise_to [get_clocks {tx_ref_clk}]  0.180  
set_clock_uncertainty -rise_from [get_clocks {tx_ref_clk}] -fall_to [get_clocks {tx_ref_clk}]  0.180  
set_clock_uncertainty -rise_from [get_clocks {tx_ref_clk}] -rise_to [get_clocks {clk0}]  0.430  
set_clock_uncertainty -rise_from [get_clocks {tx_ref_clk}] -fall_to [get_clocks {clk0}]  0.430  
set_clock_uncertainty -fall_from [get_clocks {tx_ref_clk}] -rise_to [get_clocks {tx_ref_clk}]  0.180  
set_clock_uncertainty -fall_from [get_clocks {tx_ref_clk}] -fall_to [get_clocks {tx_ref_clk}]  0.180  
set_clock_uncertainty -fall_from [get_clocks {tx_ref_clk}] -rise_to [get_clocks {clk0}]  0.430  
set_clock_uncertainty -fall_from [get_clocks {tx_ref_clk}] -fall_to [get_clocks {clk0}]  0.430  
set_clock_uncertainty -rise_from [get_clocks {rx_ref_clk}] -rise_to [get_clocks {rx_ref_clk}]  0.300  
set_clock_uncertainty -rise_from [get_clocks {rx_ref_clk}] -fall_to [get_clocks {rx_ref_clk}]  0.300  
set_clock_uncertainty -rise_from [get_clocks {rx_ref_clk}] -rise_to [get_clocks {clk0}]  0.530  
set_clock_uncertainty -rise_from [get_clocks {rx_ref_clk}] -fall_to [get_clocks {clk0}]  0.530  
set_clock_uncertainty -fall_from [get_clocks {rx_ref_clk}] -rise_to [get_clocks {rx_ref_clk}]  0.300  
set_clock_uncertainty -fall_from [get_clocks {rx_ref_clk}] -fall_to [get_clocks {rx_ref_clk}]  0.300  
set_clock_uncertainty -fall_from [get_clocks {rx_ref_clk}] -rise_to [get_clocks {clk0}]  0.530  
set_clock_uncertainty -fall_from [get_clocks {rx_ref_clk}] -fall_to [get_clocks {clk0}]  0.530  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|spi|spi|SCLK_reg}] -rise_to [get_clocks {clk0}]  0.300  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|spi|spi|SCLK_reg}] -fall_to [get_clocks {clk0}]  0.300  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|spi|spi|SCLK_reg}] -rise_to [get_clocks {clk0}]  0.300  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|spi|spi|SCLK_reg}] -fall_to [get_clocks {clk0}]  0.300  
set_clock_uncertainty -rise_from [get_clocks {clk0}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_1}]  0.480  
set_clock_uncertainty -rise_from [get_clocks {clk0}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_1}]  0.480  
set_clock_uncertainty -rise_from [get_clocks {clk0}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_0}]  0.480  
set_clock_uncertainty -rise_from [get_clocks {clk0}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_0}]  0.480  
set_clock_uncertainty -rise_from [get_clocks {clk0}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_1}]  0.480  
set_clock_uncertainty -rise_from [get_clocks {clk0}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_1}]  0.480  
set_clock_uncertainty -rise_from [get_clocks {clk0}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_0}]  0.480  
set_clock_uncertainty -rise_from [get_clocks {clk0}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_0}]  0.480  
set_clock_uncertainty -rise_from [get_clocks {clk0}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}]  0.480  
set_clock_uncertainty -rise_from [get_clocks {clk0}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}]  0.480  
set_clock_uncertainty -rise_from [get_clocks {clk0}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}]  0.480  
set_clock_uncertainty -rise_from [get_clocks {clk0}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}]  0.480  
set_clock_uncertainty -rise_from [get_clocks {clk0}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_vco_clk_1}]  0.480  
set_clock_uncertainty -rise_from [get_clocks {clk0}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_vco_clk_1}]  0.480  
set_clock_uncertainty -rise_from [get_clocks {clk0}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_vco_clk}]  0.480  
set_clock_uncertainty -rise_from [get_clocks {clk0}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_vco_clk}]  0.480  
set_clock_uncertainty -rise_from [get_clocks {clk0}] -rise_to [get_clocks {altera_reserved_tck}]  0.310  
set_clock_uncertainty -rise_from [get_clocks {clk0}] -fall_to [get_clocks {altera_reserved_tck}]  0.310  
set_clock_uncertainty -rise_from [get_clocks {clk0}] -rise_to [get_clocks {tx_ref_clk}]  0.430  
set_clock_uncertainty -rise_from [get_clocks {clk0}] -fall_to [get_clocks {tx_ref_clk}]  0.430  
set_clock_uncertainty -rise_from [get_clocks {clk0}] -rise_to [get_clocks {rx_ref_clk}]  0.530  
set_clock_uncertainty -rise_from [get_clocks {clk0}] -fall_to [get_clocks {rx_ref_clk}]  0.530  
set_clock_uncertainty -rise_from [get_clocks {clk0}] -rise_to [get_clocks {mcu_0|spi|spi|SCLK_reg}]  0.300  
set_clock_uncertainty -rise_from [get_clocks {clk0}] -fall_to [get_clocks {mcu_0|spi|spi|SCLK_reg}]  0.300  
set_clock_uncertainty -rise_from [get_clocks {clk0}] -rise_to [get_clocks {clk0}]  0.360  
set_clock_uncertainty -rise_from [get_clocks {clk0}] -fall_to [get_clocks {clk0}]  0.360  
set_clock_uncertainty -rise_from [get_clocks {clk0}] -rise_to [get_clocks {~ALTERA_CLKUSR~}]  0.310  
set_clock_uncertainty -rise_from [get_clocks {clk0}] -fall_to [get_clocks {~ALTERA_CLKUSR~}]  0.310  
set_clock_uncertainty -fall_from [get_clocks {clk0}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_1}]  0.480  
set_clock_uncertainty -fall_from [get_clocks {clk0}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_1}]  0.480  
set_clock_uncertainty -fall_from [get_clocks {clk0}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_0}]  0.480  
set_clock_uncertainty -fall_from [get_clocks {clk0}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_l_0}]  0.480  
set_clock_uncertainty -fall_from [get_clocks {clk0}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_1}]  0.480  
set_clock_uncertainty -fall_from [get_clocks {clk0}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_1}]  0.480  
set_clock_uncertainty -fall_from [get_clocks {clk0}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_0}]  0.480  
set_clock_uncertainty -fall_from [get_clocks {clk0}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_phy_clk_0}]  0.480  
set_clock_uncertainty -fall_from [get_clocks {clk0}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}]  0.480  
set_clock_uncertainty -fall_from [get_clocks {clk0}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_core_cal_slave_clk}]  0.480  
set_clock_uncertainty -fall_from [get_clocks {clk0}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}]  0.480  
set_clock_uncertainty -fall_from [get_clocks {clk0}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}]  0.480  
set_clock_uncertainty -fall_from [get_clocks {clk0}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_vco_clk_1}]  0.480  
set_clock_uncertainty -fall_from [get_clocks {clk0}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_vco_clk_1}]  0.480  
set_clock_uncertainty -fall_from [get_clocks {clk0}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_vco_clk}]  0.480  
set_clock_uncertainty -fall_from [get_clocks {clk0}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_vco_clk}]  0.480  
set_clock_uncertainty -fall_from [get_clocks {clk0}] -rise_to [get_clocks {altera_reserved_tck}]  0.310  
set_clock_uncertainty -fall_from [get_clocks {clk0}] -fall_to [get_clocks {altera_reserved_tck}]  0.310  
set_clock_uncertainty -fall_from [get_clocks {clk0}] -rise_to [get_clocks {tx_ref_clk}]  0.430  
set_clock_uncertainty -fall_from [get_clocks {clk0}] -fall_to [get_clocks {tx_ref_clk}]  0.430  
set_clock_uncertainty -fall_from [get_clocks {clk0}] -rise_to [get_clocks {rx_ref_clk}]  0.530  
set_clock_uncertainty -fall_from [get_clocks {clk0}] -fall_to [get_clocks {rx_ref_clk}]  0.530  
set_clock_uncertainty -fall_from [get_clocks {clk0}] -rise_to [get_clocks {mcu_0|spi|spi|SCLK_reg}]  0.300  
set_clock_uncertainty -fall_from [get_clocks {clk0}] -fall_to [get_clocks {mcu_0|spi|spi|SCLK_reg}]  0.300  
set_clock_uncertainty -fall_from [get_clocks {clk0}] -rise_to [get_clocks {clk0}]  0.360  
set_clock_uncertainty -fall_from [get_clocks {clk0}] -fall_to [get_clocks {clk0}]  0.360  
set_clock_uncertainty -fall_from [get_clocks {clk0}] -rise_to [get_clocks {~ALTERA_CLKUSR~}]  0.310  
set_clock_uncertainty -fall_from [get_clocks {clk0}] -fall_to [get_clocks {~ALTERA_CLKUSR~}]  0.310  
set_clock_uncertainty -rise_from [get_clocks {mem_mem_dqs[3]_IN}] -rise_to [get_clocks {mem_mem_dqs[3]_IN}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {mem_mem_dqs[3]_IN}] -fall_to [get_clocks {mem_mem_dqs[3]_IN}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {mem_mem_dqs[3]_IN}] -rise_to [get_clocks {mem_mem_dqs[3]_IN}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {mem_mem_dqs[3]_IN}] -fall_to [get_clocks {mem_mem_dqs[3]_IN}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {mem_mem_dqs[2]_IN}] -rise_to [get_clocks {mem_mem_dqs[2]_IN}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {mem_mem_dqs[2]_IN}] -fall_to [get_clocks {mem_mem_dqs[2]_IN}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {mem_mem_dqs[2]_IN}] -rise_to [get_clocks {mem_mem_dqs[2]_IN}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {mem_mem_dqs[2]_IN}] -fall_to [get_clocks {mem_mem_dqs[2]_IN}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {mem_mem_dqs[1]_IN}] -rise_to [get_clocks {mem_mem_dqs[1]_IN}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {mem_mem_dqs[1]_IN}] -fall_to [get_clocks {mem_mem_dqs[1]_IN}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {mem_mem_dqs[1]_IN}] -rise_to [get_clocks {mem_mem_dqs[1]_IN}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {mem_mem_dqs[1]_IN}] -fall_to [get_clocks {mem_mem_dqs[1]_IN}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {~ALTERA_CLKUSR~}] -rise_to [get_clocks {tx_ref_clk}]  0.150  
set_clock_uncertainty -rise_from [get_clocks {~ALTERA_CLKUSR~}] -fall_to [get_clocks {tx_ref_clk}]  0.150  
set_clock_uncertainty -rise_from [get_clocks {~ALTERA_CLKUSR~}] -rise_to [get_clocks {rx_ref_clk}]  0.250  
set_clock_uncertainty -rise_from [get_clocks {~ALTERA_CLKUSR~}] -fall_to [get_clocks {rx_ref_clk}]  0.250  
set_clock_uncertainty -rise_from [get_clocks {~ALTERA_CLKUSR~}] -rise_to [get_clocks {clk0}]  0.310  
set_clock_uncertainty -rise_from [get_clocks {~ALTERA_CLKUSR~}] -fall_to [get_clocks {clk0}]  0.310  
set_clock_uncertainty -rise_from [get_clocks {~ALTERA_CLKUSR~}] -rise_to [get_clocks {~ALTERA_CLKUSR~}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {~ALTERA_CLKUSR~}] -fall_to [get_clocks {~ALTERA_CLKUSR~}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {~ALTERA_CLKUSR~}] -rise_to [get_clocks {tx_ref_clk}]  0.150  
set_clock_uncertainty -fall_from [get_clocks {~ALTERA_CLKUSR~}] -fall_to [get_clocks {tx_ref_clk}]  0.150  
set_clock_uncertainty -fall_from [get_clocks {~ALTERA_CLKUSR~}] -rise_to [get_clocks {rx_ref_clk}]  0.250  
set_clock_uncertainty -fall_from [get_clocks {~ALTERA_CLKUSR~}] -fall_to [get_clocks {rx_ref_clk}]  0.250  
set_clock_uncertainty -fall_from [get_clocks {~ALTERA_CLKUSR~}] -rise_to [get_clocks {clk0}]  0.310  
set_clock_uncertainty -fall_from [get_clocks {~ALTERA_CLKUSR~}] -fall_to [get_clocks {clk0}]  0.310  
set_clock_uncertainty -fall_from [get_clocks {~ALTERA_CLKUSR~}] -rise_to [get_clocks {~ALTERA_CLKUSR~}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {~ALTERA_CLKUSR~}] -fall_to [get_clocks {~ALTERA_CLKUSR~}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {mem_mem_dqs[0]_IN}] -rise_to [get_clocks {mem_mem_dqs[0]_IN}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {mem_mem_dqs[0]_IN}] -fall_to [get_clocks {mem_mem_dqs[0]_IN}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {mem_mem_dqs[0]_IN}] -rise_to [get_clocks {mem_mem_dqs[0]_IN}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {mem_mem_dqs[0]_IN}] -fall_to [get_clocks {mem_mem_dqs[0]_IN}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_ref_clock}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}]  0.200  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_ref_clock}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}]  0.200  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_ref_clock}] -rise_to [get_clocks {mem_mem_dqs[3]_IN}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_ref_clock}] -fall_to [get_clocks {mem_mem_dqs[3]_IN}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_ref_clock}] -rise_to [get_clocks {mem_mem_dqs[2]_IN}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_ref_clock}] -fall_to [get_clocks {mem_mem_dqs[2]_IN}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_ref_clock}] -rise_to [get_clocks {mem_mem_dqs[1]_IN}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_ref_clock}] -fall_to [get_clocks {mem_mem_dqs[1]_IN}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_ref_clock}] -rise_to [get_clocks {mem_mem_dqs[0]_IN}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_ref_clock}] -fall_to [get_clocks {mem_mem_dqs[0]_IN}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_ref_clock}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {mcu_0|ddr3|ddr3_ref_clock}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_ref_clock}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}]  0.200  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_ref_clock}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_core_usr_clk}]  0.200  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_ref_clock}] -rise_to [get_clocks {mem_mem_dqs[3]_IN}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_ref_clock}] -fall_to [get_clocks {mem_mem_dqs[3]_IN}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_ref_clock}] -rise_to [get_clocks {mem_mem_dqs[2]_IN}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_ref_clock}] -fall_to [get_clocks {mem_mem_dqs[2]_IN}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_ref_clock}] -rise_to [get_clocks {mem_mem_dqs[1]_IN}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_ref_clock}] -fall_to [get_clocks {mem_mem_dqs[1]_IN}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_ref_clock}] -rise_to [get_clocks {mem_mem_dqs[0]_IN}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_ref_clock}] -fall_to [get_clocks {mem_mem_dqs[0]_IN}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_ref_clock}] -rise_to [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {mcu_0|ddr3|ddr3_ref_clock}] -fall_to [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.030  


#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay  -clock [get_clocks {clk0}]  50.000 [get_ports {adc_fda}]
set_input_delay -add_delay  -clock [get_clocks {clk0}]  50.000 [get_ports {adc_fdb}]
set_input_delay -add_delay  -clock [get_clocks {clk0}]  10.000 [get_ports {altera_reserved_tdi}]
set_input_delay -add_delay  -clock [get_clocks {clk0}]  10.000 [get_ports {altera_reserved_tms}]
set_input_delay -add_delay  -clock [get_clocks {clk0}]  10.000 [get_ports {clk0}]
set_input_delay -add_delay  -clock [get_clocks {clk0}]  20.000 [get_ports {clkd_status[0]}]
set_input_delay -add_delay  -clock [get_clocks {clk0}]  20.000 [get_ports {clkd_status[1]}]
set_input_delay -add_delay  -clock [get_clocks {clk0}]  50.000 [get_ports {dac_irq}]
#set_input_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[0]}]
#set_input_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[1]}]
#set_input_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[2]}]
#set_input_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[3]}]
#set_input_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[4]}]
#set_input_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[5]}]
#set_input_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[6]}]
#set_input_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[7]}]
#set_input_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[8]}]
#set_input_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[9]}]
#set_input_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[10]}]
#set_input_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[11]}]
#set_input_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[12]}]
#set_input_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[13]}]
#set_input_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[14]}]
#set_input_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[15]}]
#set_input_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[16]}]
#set_input_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[17]}]
#set_input_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[18]}]
#set_input_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[19]}]
#set_input_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[20]}]
#set_input_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[21]}]
#set_input_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[22]}]
#set_input_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[23]}]
#set_input_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[24]}]
#set_input_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[25]}]
#set_input_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[26]}]
#set_input_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[27]}]
#set_input_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[28]}]
#set_input_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[29]}]
#set_input_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[30]}]
#set_input_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[31]}]
set_input_delay -add_delay  -clock [get_clocks {clk0}]  10.000 [get_ports {qspi_data[0]}]
set_input_delay -add_delay  -clock [get_clocks {clk0}]  10.000 [get_ports {qspi_data[1]}]
set_input_delay -add_delay  -clock [get_clocks {clk0}]  10.000 [get_ports {qspi_data[2]}]
set_input_delay -add_delay  -clock [get_clocks {clk0}]  10.000 [get_ports {qspi_data[3]}]
set_input_delay -add_delay  -clock [get_clocks {clk0}]  4.000 [get_ports {reset_in}]
set_input_delay -add_delay  -clock [get_clocks {rx_ref_clk}]  1.000 [get_ports {rx_sysref}]
set_input_delay -add_delay  -clock [get_clocks {clk0}]  10.000 [get_ports {spi_sdio}]
set_input_delay -add_delay  -clock [get_clocks {clk0}]  20.000 [get_ports {trig}]
set_input_delay -add_delay  -clock [get_clocks {tx_ref_clk}]  1.000 [get_ports {tx_sysref}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay  -clock [get_clocks {clk0}]  20.000 [get_ports {adc_pd}]
set_output_delay -add_delay  -clock [get_clocks {clk0}]  5.000 [get_ports {altera_reserved_tdo}]
set_output_delay -add_delay  -clock [get_clocks {clk0}]  20.000 [get_ports {clkd_sync}]
set_output_delay -add_delay  -clock [get_clocks {clk0}]  20.000 [get_ports {dac_reset}]
set_output_delay -add_delay  -clock [get_clocks {clk0}]  5.000 [get_ports {dac_txen}]
set_output_delay -add_delay  -clock [get_clocks {clk0}]  50.000 [get_ports {data_0}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_a[0]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_a[1]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_a[2]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_a[3]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_a[4]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_a[5]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_a[6]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_a[7]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_a[8]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_a[9]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_a[10]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_a[11]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_a[12]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_a[13]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_a[14]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_a[15]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_ba[0]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_ba[1]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_ba[2]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_cas_n[0]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_ck[0]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_ck_n[0]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_cke[0]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_cs_n[0]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dm[0]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dm[1]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dm[2]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dm[3]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[0]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[1]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[2]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[3]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[4]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[5]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[6]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[7]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[8]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[9]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[10]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[11]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[12]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[13]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[14]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[15]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[16]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[17]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[18]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[19]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[20]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[21]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[22]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[23]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[24]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[25]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[26]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[27]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[28]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[29]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[30]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dq[31]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dqs[0]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dqs[1]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dqs[2]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dqs[3]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dqs_n[0]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dqs_n[1]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dqs_n[2]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_dqs_n[3]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_odt[0]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_ras_n[0]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_reset_n[0]}]
set_output_delay -add_delay  -clock [get_clocks {mcu_0|ddr3|ddr3_ref_clock}]  0.000 [get_ports {mem_mem_we_n[0]}]
set_output_delay -add_delay  -clock [get_clocks {clk0}]  5.000 [get_ports {qspi_data[0]}]
set_output_delay -add_delay  -clock [get_clocks {clk0}]  5.000 [get_ports {qspi_data[1]}]
set_output_delay -add_delay  -clock [get_clocks {clk0}]  5.000 [get_ports {qspi_data[2]}]
set_output_delay -add_delay  -clock [get_clocks {clk0}]  5.000 [get_ports {qspi_data[3]}]
set_output_delay -add_delay  -clock [get_clocks {clk0}]  10.000 [get_ports {qspi_dclk}]
set_output_delay -add_delay  -clock [get_clocks {clk0}]  10.000 [get_ports {qspi_ncs}]
set_output_delay -add_delay  -clock [get_clocks {rx_ref_clk}]  2.000 [get_ports {rx_sync}]
set_output_delay -add_delay  -clock [get_clocks {rx_ref_clk}]  2.000 [get_ports {rx_sync(n)}]
set_output_delay -add_delay  -clock [get_clocks {clk0}]  10.000 [get_ports {spi_clk}]
set_output_delay -add_delay  -clock [get_clocks {clk0}]  10.000 [get_ports {spi_csn_adc}]
set_output_delay -add_delay  -clock [get_clocks {clk0}]  10.000 [get_ports {spi_csn_clk}]
set_output_delay -add_delay  -clock [get_clocks {clk0}]  10.000 [get_ports {spi_csn_dac}]
set_output_delay -add_delay  -clock [get_clocks {clk0}]  10.000 [get_ports {spi_dir}]
set_output_delay -add_delay  -clock [get_clocks {clk0}]  5.000 [get_ports {spi_sdio}]
set_output_delay -add_delay  -clock [get_clocks {clk0}]  20.000 [get_ports {status_local_cal_fail}]
set_output_delay -add_delay  -clock [get_clocks {clk0}]  20.000 [get_ports {status_local_cal_success}]


#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************

set_false_path -from [get_registers {*|alt_jtag_atlantic:*|jupdate}] -to [get_registers {*|alt_jtag_atlantic:*|jupdate1*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|rdata[*]}] -to [get_registers {*|alt_jtag_atlantic*|td_shift[*]}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|read}] -to [get_registers {*|alt_jtag_atlantic:*|read1*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|read_req}] 
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|rvalid}] -to [get_registers {*|alt_jtag_atlantic*|td_shift[*]}]
set_false_path -from [get_registers {*|t_dav}] -to [get_registers {*|alt_jtag_atlantic:*|tck_t_dav}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|user_saw_rvalid}] -to [get_registers {*|alt_jtag_atlantic:*|rvalid0*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|wdata[*]}] -to [get_registers *]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|write}] -to [get_registers {*|alt_jtag_atlantic:*|write1*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|write_stalled}] -to [get_registers {*|alt_jtag_atlantic:*|t_ena*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|write_stalled}] -to [get_registers {*|alt_jtag_atlantic:*|t_pause*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|write_valid}] 
set_false_path -to [get_registers {*alt_xcvr_resync*sync_r[0]}]
set_false_path -to [get_keepers {*altera_std_synchronizer:*|din_s1}]
set_false_path -from [get_keepers {*mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by:*|mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_nios2_oci:the_mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_nios2_oci|mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_nios2_oci_break:the_mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_nios2_oci_break|break_readreg*}] -to [get_keepers {*mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by:*|mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_nios2_oci:the_mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_nios2_oci|mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_debug_slave_wrapper:the_mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_debug_slave_wrapper|mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_debug_slave_tck:the_mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_debug_slave_tck|*sr*}]
set_false_path -from [get_keepers {*mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by:*|mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_nios2_oci:the_mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_nios2_oci|mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_nios2_oci_debug:the_mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_nios2_oci_debug|*resetlatch}] -to [get_keepers {*mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by:*|mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_nios2_oci:the_mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_nios2_oci|mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_debug_slave_wrapper:the_mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_debug_slave_wrapper|mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_debug_slave_tck:the_mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_debug_slave_tck|*sr[33]}]
set_false_path -from [get_keepers {*mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by:*|mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_nios2_oci:the_mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_nios2_oci|mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_nios2_oci_debug:the_mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_nios2_oci_debug|monitor_ready}] -to [get_keepers {*mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by:*|mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_nios2_oci:the_mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_nios2_oci|mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_debug_slave_wrapper:the_mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_debug_slave_wrapper|mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_debug_slave_tck:the_mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_debug_slave_tck|*sr[0]}]
set_false_path -from [get_keepers {*mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by:*|mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_nios2_oci:the_mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_nios2_oci|mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_nios2_oci_debug:the_mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_nios2_oci_debug|monitor_error}] -to [get_keepers {*mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by:*|mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_nios2_oci:the_mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_nios2_oci|mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_debug_slave_wrapper:the_mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_debug_slave_wrapper|mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_debug_slave_tck:the_mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_debug_slave_tck|*sr[34]}]
set_false_path -from [get_keepers {*mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by:*|mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_nios2_oci:the_mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_nios2_oci|mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_nios2_ocimem:the_mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_nios2_ocimem|*MonDReg*}] -to [get_keepers {*mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by:*|mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_nios2_oci:the_mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_nios2_oci|mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_debug_slave_wrapper:the_mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_debug_slave_wrapper|mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_debug_slave_tck:the_mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_debug_slave_tck|*sr*}]
set_false_path -from [get_keepers {*mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by:*|mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_nios2_oci:the_mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_nios2_oci|mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_debug_slave_wrapper:the_mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_debug_slave_wrapper|mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_debug_slave_tck:the_mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_debug_slave_tck|*sr*}] -to [get_keepers {*mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by:*|mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_nios2_oci:the_mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_nios2_oci|mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_debug_slave_wrapper:the_mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_debug_slave_wrapper|mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_debug_slave_sysclk:the_mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_debug_slave_sysclk|*jdo*}]
set_false_path -from [get_keepers {*sld_jtag_hub:*|irf_reg*}] -to [get_keepers {*mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by:*|mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_nios2_oci:the_mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_nios2_oci|mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_debug_slave_wrapper:the_mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_debug_slave_wrapper|mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_debug_slave_sysclk:the_mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_debug_slave_sysclk|ir*}]
set_false_path -from [get_keepers {*sld_jtag_hub:*|sld_shadow_jsm:shadow_jsm|state[1]}] -to [get_keepers {*mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by:*|mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_nios2_oci:the_mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_nios2_oci|mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_nios2_oci_debug:the_mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_nejv2by_nios2_oci_debug|monitor_go}]
set_false_path -to [get_keepers {{mem_mem_a[0]} {mem_mem_a[1]} {mem_mem_a[2]} {mem_mem_a[3]} {mem_mem_a[4]} {mem_mem_a[5]} {mem_mem_a[6]} {mem_mem_a[7]} {mem_mem_a[8]} {mem_mem_a[9]} {mem_mem_a[10]} {mem_mem_a[11]} {mem_mem_a[12]} {mem_mem_a[13]} {mem_mem_a[14]} {mem_mem_a[15]} {mem_mem_ba[0]} {mem_mem_ba[1]} {mem_mem_ba[2]} {mem_mem_cke[0]} {mem_mem_cs_n[0]} {mem_mem_odt[0]} {mem_mem_we_n[0]} {mem_mem_ras_n[0]} {mem_mem_cas_n[0]}}]
set_false_path -through [get_pins {mcu_0|ddr3|ddr3|arch|arch_inst|io_tiles_wrap_inst|io_tiles_inst|tile_gen[*].lane_gen[*].lane_inst|core_dll[2]}]  -to [get_keepers {mcu_0|ddr3|ddr3*|tile_gen[*].lane_gen[*].lane_inst~lane_reg}]
set_false_path -to [get_keepers {{mem_mem_dq[0]} {mem_mem_dq[1]} {mem_mem_dq[2]} {mem_mem_dq[3]} {mem_mem_dq[4]} {mem_mem_dq[5]} {mem_mem_dq[6]} {mem_mem_dq[7]} {mem_mem_dq[8]} {mem_mem_dq[9]} {mem_mem_dq[10]} {mem_mem_dq[11]} {mem_mem_dq[12]} {mem_mem_dq[13]} {mem_mem_dq[14]} {mem_mem_dq[15]} {mem_mem_dq[16]} {mem_mem_dq[17]} {mem_mem_dq[18]} {mem_mem_dq[19]} {mem_mem_dq[20]} {mem_mem_dq[21]} {mem_mem_dq[22]} {mem_mem_dq[23]} {mem_mem_dq[24]} {mem_mem_dq[25]} {mem_mem_dq[26]} {mem_mem_dq[27]} {mem_mem_dq[28]} {mem_mem_dq[29]} {mem_mem_dq[30]} {mem_mem_dq[31]}}]
set_false_path -from [get_keepers {{mem_mem_dq[0]} {mem_mem_dq[1]} {mem_mem_dq[2]} {mem_mem_dq[3]} {mem_mem_dq[4]} {mem_mem_dq[5]} {mem_mem_dq[6]} {mem_mem_dq[7]} {mem_mem_dq[8]} {mem_mem_dq[9]} {mem_mem_dq[10]} {mem_mem_dq[11]} {mem_mem_dq[12]} {mem_mem_dq[13]} {mem_mem_dq[14]} {mem_mem_dq[15]} {mem_mem_dq[16]} {mem_mem_dq[17]} {mem_mem_dq[18]} {mem_mem_dq[19]} {mem_mem_dq[20]} {mem_mem_dq[21]} {mem_mem_dq[22]} {mem_mem_dq[23]} {mem_mem_dq[24]} {mem_mem_dq[25]} {mem_mem_dq[26]} {mem_mem_dq[27]} {mem_mem_dq[28]} {mem_mem_dq[29]} {mem_mem_dq[30]} {mem_mem_dq[31]}}] 
set_false_path -to [get_keepers {{mem_mem_dm[0]} {mem_mem_dm[1]} {mem_mem_dm[2]} {mem_mem_dm[3]}}]
set_false_path -to [get_keepers {{mem_mem_dqs[0]} {mem_mem_dqs[1]} {mem_mem_dqs[2]} {mem_mem_dqs[3]}}]
set_false_path -to [get_keepers {{mem_mem_dqs_n[0]} {mem_mem_dqs_n[1]} {mem_mem_dqs_n[2]} {mem_mem_dqs_n[3]}}]
set_false_path -from [get_keepers {{mem_mem_dqs[0]} {mem_mem_dqs[1]} {mem_mem_dqs[2]} {mem_mem_dqs[3]}}] 
set_false_path -from [get_keepers {{mem_mem_dqs_n[0]} {mem_mem_dqs_n[1]} {mem_mem_dqs_n[2]} {mem_mem_dqs_n[3]}}] 
set_false_path -to [get_keepers {{mem_mem_ck[0]}}]
set_false_path -to [get_keepers {{mem_mem_ck_n[0]}}]
set_false_path -to [get_keepers {{mem_mem_reset_n[0]}}]
set_false_path -from [get_keepers {{mem_mem_reset_n[0]}}] 
set_false_path -to [get_registers {*dac_bypass_m1*}]
set_false_path -to [get_registers {*dma_bypass_m1*}]
set_false_path -from [get_registers {*dma_waddr_g*}] -to [get_registers {*dac_waddr_m1*}]
set_false_path -from [get_registers {*dma_lastaddr_g*}] -to [get_registers {*dac_lastaddr_m1*}]
set_false_path -from [get_registers {*dma_xfer_out_fifo*}] -to [get_registers {*dac_xfer_out_fifo_m1*}]
set_false_path -from [get_registers {*dma_mem_waddr_g*}] -to [get_registers {*dac_mem_waddr_m1*}]
set_false_path -from [get_registers {*dac_mem_raddr_g*}] -to [get_registers {*dma_mem_raddr_m1*}]
set_false_path -to [get_registers {*dma_rst_m1*}]
set_false_path -to [get_registers {*dac_xfer_req_m1*}]
set_false_path -from [get_registers {*|jesd204_up_tx:i_up_tx|sync_event:i_cdc_manual_sync_request|in_toggle_d1}] -to [get_registers {*|jesd204_up_tx:i_up_tx|sync_event:i_cdc_manual_sync_request|sync_bits:i_sync_out|cdc_sync_stage1[0]}]
set_false_path -from [get_registers {*|jesd204_up_tx:i_up_tx|sync_event:i_cdc_manual_sync_request|out_toggle_d1}] -to [get_registers {*|jesd204_up_tx:i_up_tx|sync_event:i_cdc_manual_sync_request|sync_bits:i_sync_in|cdc_sync_stage1[0]}]
set_false_path -from [get_registers {*|jesd204_up_tx:i_up_tx|sync_data:i_cdc_status|in_toggle_d1}] -to [get_registers {*|jesd204_up_tx:i_up_tx|sync_data:i_cdc_status|sync_bits:i_sync_out|cdc_sync_stage1[0]}]
set_false_path -from [get_registers {*|jesd204_up_tx:i_up_tx|sync_data:i_cdc_status|out_toggle_d1}] -to [get_registers {*|jesd204_up_tx:i_up_tx|sync_data:i_cdc_status|sync_bits:i_sync_in|cdc_sync_stage1[0]}]
set_false_path -from [get_registers {*|jesd204_up_tx:i_up_tx|sync_data:i_cdc_status|cdc_hold[*]}] -to [get_registers {*|jesd204_up_tx:i_up_tx|sync_data:i_cdc_status|out_data[*]}]
set_false_path -to [get_registers {*|jesd204_up_tx:i_up_tx|sync_bits:i_cdc_sync|cdc_sync_stage1[0]}]
set_false_path -from [get_registers {*|jesd204_up_tx:i_up_tx|up_cfg_ilas_data_*}] -to [get_registers {*|jesd204_up_tx:i_up_tx|core_ilas_config_data[*]}]
set_false_path -from [get_registers {*|jesd204_up_tx:i_up_tx|up_cfg_*}] -to [get_registers {*|jesd204_up_common:i_up_common|core_extra_cfg[*]}]
set_false_path -to [get_registers {*|jesd204_tx_ctrl:i_tx_ctrl|sync_bits:i_cdc_sync|cdc_sync_stage1[0]}]
set_false_path -to [get_pins -compatibility_mode {*twentynm_xcvr_native_inst|*inst_twentynm_pcs|*twentynm_hssi_*_pld_pcs_interface*|pld_10g_krfec_rx_pld_rst_n*}]
set_false_path -to [get_pins -compatibility_mode {*twentynm_xcvr_native_inst|*inst_twentynm_pcs|*twentynm_hssi_*_pld_pcs_interface*|pld_8g_g3_rx_pld_rst_n*}]
set_false_path -to [get_pins -compatibility_mode {*twentynm_xcvr_native_inst|*inst_twentynm_pcs|*twentynm_hssi_*_pld_pcs_interface*|pld_pmaif_rx_pld_rst_n*}]
set_false_path -to [get_pins -compatibility_mode {*twentynm_xcvr_native_inst|*inst_twentynm_pcs|*twentynm_hssi_*_pld_pcs_interface*|pld_bitslip*}]
set_false_path -to [get_pins -compatibility_mode {*twentynm_xcvr_native_inst|*inst_twentynm_pcs|*twentynm_hssi_*_pld_pcs_interface*|pld_rx_prbs_err_clr*}]
set_false_path -to [get_pins -compatibility_mode {*twentynm_xcvr_native_inst|*inst_twentynm_pcs|*twentynm_hssi_*_pld_pcs_interface*|pld_polinv_tx*}]
set_false_path -to [get_pins -compatibility_mode {*twentynm_xcvr_native_inst|*inst_twentynm_pcs|*twentynm_hssi_*_pld_pcs_interface*|pld_polinv_rx*}]
set_false_path -to [get_pins -nocase -compatibility_mode {*|alt_rst_sync_uq1|altera_reset_synchronizer_int_chain*|clrn}]
set_false_path -from [get_registers {*|jesd204_up_rx:i_up_rx|sync_data:i_cdc_status|in_toggle_d1}] -to [get_registers {*|jesd204_up_rx:i_up_rx|sync_data:i_cdc_status|sync_bits:i_sync_out|cdc_sync_stage1[0]}]
set_false_path -from [get_registers {*|jesd204_up_rx:i_up_rx|sync_data:i_cdc_status|out_toggle_d1}] -to [get_registers {*|jesd204_up_rx:i_up_rx|sync_data:i_cdc_status|sync_bits:i_sync_in|cdc_sync_stage1[0]}]
set_false_path -from [get_registers {*|jesd204_up_rx:i_up_rx|sync_data:i_cdc_status|cdc_hold[*]}] -to [get_registers {*|jesd204_up_rx:i_up_rx|sync_data:i_cdc_status|out_data[*]}]
set_false_path -from [get_registers {*|jesd204_up_rx:i_up_rx|sync_data:i_cdc_cfg|in_toggle_d1}] -to [get_registers {*|jesd204_up_rx:i_up_rx|sync_data:i_cdc_cfg|sync_bits:i_sync_out|cdc_sync_stage1[0]}]
set_false_path -from [get_registers {*|jesd204_up_rx:i_up_rx|sync_data:i_cdc_cfg|out_toggle_d1}] -to [get_registers {*|jesd204_up_rx:i_up_rx|sync_data:i_cdc_cfg|sync_bits:i_sync_in|cdc_sync_stage1[0]}]
set_false_path -from [get_registers {*|jesd204_up_rx:i_up_rx|sync_data:i_cdc_cfg|cdc_hold[*]}] -to [get_registers {*|jesd204_up_rx:i_up_rx|sync_data:i_cdc_cfg|out_data[*]}]
set_false_path -from [get_registers {*|jesd204_up_sysref:i_up_sysref|sync_event:i_cdc_sysref_event|in_toggle_d1}] -to [get_registers {*|jesd204_up_sysref:i_up_sysref|sync_event:i_cdc_sysref_event|sync_bits:i_sync_out|cdc_sync_stage1[0]}]
set_false_path -from [get_registers {*|jesd204_up_sysref:i_up_sysref|sync_event:i_cdc_sysref_event|out_toggle_d1}] -to [get_registers {*|jesd204_up_sysref:i_up_sysref|sync_event:i_cdc_sysref_event|sync_bits:i_sync_in|cdc_sync_stage1[0]}]
set_false_path -from [get_registers {*|jesd204_up_sysref:i_up_sysref|sync_event:i_cdc_sysref_event|cdc_hold[*]}] -to [get_registers {*|jesd204_up_sysref:i_up_sysref|sync_event:i_cdc_sysref_event|out_event[*]}]
set_false_path -to [get_registers {*|jesd204_up_rx:i_up_rx|jesd204_up_rx_lane:gen_lane[*].i_up_rx_lane|sync_bits:i_cdc_status_ready|cdc_sync_stage1[0]}]
set_false_path -to [get_registers {*|jesd204_up_rx:i_up_rx|jesd204_up_rx_lane:gen_lane[*].i_up_rx_lane|up_status_latency[*]}]
set_false_path -to [get_registers {*|jesd204_up_rx:i_up_rx|jesd204_up_rx_lane:gen_lane[*].i_up_rx_lane|jesd204_up_ilas_mem:i_ilas_mem|sync_bits:i_cdc_ilas_ready|cdc_sync_stage1[0]}]
set_false_path -from [get_registers {*|jesd204_up_common:i_up_common|up_reset_core}] -to [get_registers {*|jesd204_up_common:i_up_common|core_reset_vector[*]}]
set_false_path -from [get_registers {*|jesd204_up_common:i_up_common|core_reset_vector[0]}] -to [get_registers {*|jesd204_up_common:i_up_common|up_reset_synchronizer_vector[*]}]
set_false_path -to [get_pins -compatibility_mode {*|jesd204_up_common:i_up_common|up_core_reset_ext_synchronizer_vector[*]|clrn}]
set_false_path -from [get_registers {*|jesd204_up_common:i_up_common|up_cfg_*}] -to [get_registers {*|jesd204_up_common:i_up_common|core_cfg_*}]
set_false_path -from [get_registers {*|jesd204_up_rx:i_up_rx|up_cfg_*}] -to [get_registers {*|jesd204_up_common:i_up_common|core_extra_cfg[*]}]
set_false_path -from [get_registers {*|jesd204_up_sysref:i_up_sysref|up_cfg_*}] -to [get_registers {*|jesd204_up_common:i_up_common|core_extra_cfg[*]}]
set_false_path -from [get_registers {*up_xfer_cntrl:i_xfer_cntrl|d_xfer_toggle*}] -to [get_registers {*up_xfer_cntrl:i_xfer_cntrl|up_xfer_state_m1*}]
set_false_path -from [get_registers {*up_xfer_cntrl:i_xfer_cntrl|up_xfer_toggle*}] -to [get_registers {*up_xfer_cntrl:i_xfer_cntrl|d_xfer_toggle_m1*}]
set_false_path -from [get_registers {*up_xfer_cntrl:i_xfer_cntrl|up_xfer_data*}] -to [get_registers {*up_xfer_cntrl:i_xfer_cntrl|d_data_cntrl*}]
set_false_path -from [get_registers {*up_xfer_status:i_xfer_status|up_xfer_toggle*}] -to [get_registers {*up_xfer_status:i_xfer_status|d_xfer_state_m1*}]
set_false_path -from [get_registers {*up_xfer_status:i_xfer_status|d_xfer_toggle*}] -to [get_registers {*up_xfer_status:i_xfer_status|up_xfer_toggle_m1*}]
set_false_path -from [get_registers {*up_xfer_status:i_xfer_status|d_xfer_data*}] -to [get_registers {*up_xfer_status:i_xfer_status|up_data_status*}]
set_false_path -from [get_registers {*up_clock_mon:i_clock_mon|d_count_run_m3*}] -to [get_registers {*up_clock_mon:i_clock_mon|up_count_running_m1*}]
set_false_path -from [get_registers {*up_clock_mon:i_clock_mon|up_count_run*}] -to [get_registers {*up_clock_mon:i_clock_mon|d_count_run_m1*}]
set_false_path -from [get_registers {*up_clock_mon:i_clock_mon|d_count*}] -to [get_registers {*up_clock_mon:i_clock_mon|up_d_count*}]
set_false_path -to [get_pins -nocase -hierarchical {rst_async_d*|CLRN}]
set_false_path -to [get_pins -nocase -hierarchical {rst_sync|CLRN}]
set_false_path -from [get_registers {*adc_waddr*}] -to [get_registers {*dma_waddr*}]
set_false_path -to [get_registers {*adc_xfer_req_m[0]*}]
set_false_path -to [get_registers {*axi_dmac*cdc_sync_stage1*}]
set_false_path -from [get_registers {*axi_dmac*cdc_sync_fifo_ram*}] 
set_false_path -from [get_registers {*axi_dmac*eot_mem*}] 
set_false_path -from [get_registers {*axi_dmac*bl_mem*}] 
set_false_path -from [get_registers {*axi_dmac*burst_len_mem*}] 
set_false_path -from [get_registers {*|axi_dmac_transfer:i_transfer|axi_dmac_reset_manager:i_reset_manager|do_reset}] -to [get_pins -compatibility_mode {*|axi_dmac_transfer:i_transfer|axi_dmac_reset_manager:i_reset_manager|reset_gen[*].reset_async[*]|clrn}]
set_false_path -from [get_registers {*|axi_dmac_transfer:i_transfer|axi_dmac_reset_manager:i_reset_manager|reset_gen[*].reset_async[0]}] -to [get_registers {*|axi_dmac_transfer:i_transfer|axi_dmac_reset_manager:i_reset_manager|reset_gen[*].reset_async[3]}]
set_false_path -from [get_registers {*|axi_dmac_transfer:i_transfer|axi_dmac_reset_manager:i_reset_manager|reset_gen[*].reset_async[0]}] -to [get_pins -compatibility_mode {*|axi_dmac_transfer:i_transfer|axi_dmac_reset_manager:i_reset_manager|reset_gen[*].reset_sync_in|clrn}]
set_false_path -from [get_registers {*|axi_dmac_transfer:i_transfer|axi_dmac_reset_manager:i_reset_manager|reset_gen[*].reset_sync[0]}] -to [get_pins -compatibility_mode {*|axi_dmac_transfer:i_transfer|axi_dmac_reset_manager:i_reset_manager|reset_gen[*].reset_sync_in|clrn}]
set_false_path -from [get_registers {*axi_dmac*|*i_request_arb*|cdc_sync_stage2*}] -to [get_registers {*axi_dmac*up_rdata*}]
set_false_path -from [get_registers {*axi_dmac*|*i_request_arb*|*id*}] -to [get_registers {*axi_dmac*up_rdata*}]
set_false_path -from [get_registers {*axi_dmac*|*i_request_arb*|address*}] -to [get_registers {*axi_dmac*up_rdata*}]
set_false_path -from [get_registers {*|axi_dmac_transfer:i_transfer|axi_dmac_reset_manager:i_reset_manager|reset_gen[*].reset_sync[0]}] -to [get_registers {*|axi_dmac_regmap:i_regmap|up_rdata[*]}]


#**************************************************************
# Set Multicycle Path
#**************************************************************

set_multicycle_path -setup -start -from [get_keepers {mcu_0|ddr3|ddr3|arch|arch_inst|io_tiles_wrap_inst|io_tiles_inst|tile_gen[*].tile_ctrl_inst~hmc_reg0}] -through [get_pins {mcu_0|ddr3|ddr3|arch|arch_inst|io_tiles_wrap_inst|io_tiles_inst|tile_gen[*].tile_ctrl_inst|ctl2core_avl_cmd_ready}]  2
set_multicycle_path -hold -start -from [get_keepers {mcu_0|ddr3|ddr3|arch|arch_inst|io_tiles_wrap_inst|io_tiles_inst|tile_gen[*].tile_ctrl_inst~hmc_reg0}] -through [get_pins {mcu_0|ddr3|ddr3|arch|arch_inst|io_tiles_wrap_inst|io_tiles_inst|tile_gen[*].tile_ctrl_inst|ctl2core_avl_cmd_ready}]  1
set_multicycle_path -setup -end -through [get_pins {mcu_0|ddr3|ddr3|arch|arch_inst|seq_if_inst|afi_cal_success_sync_inst|din_s1|d mcu_0|ddr3|ddr3|arch|arch_inst|seq_if_inst|afi_cal_success_sync_inst|din_s1|*data}]  -to [get_keepers {mcu_0|ddr3|ddr3|arch|arch_inst|seq_if_inst|afi_cal_success_sync_inst|din_s1}] 7
set_multicycle_path -hold -end -through [get_pins {mcu_0|ddr3|ddr3|arch|arch_inst|seq_if_inst|afi_cal_success_sync_inst|din_s1|d mcu_0|ddr3|ddr3|arch|arch_inst|seq_if_inst|afi_cal_success_sync_inst|din_s1|*data}]  -to [get_keepers {mcu_0|ddr3|ddr3|arch|arch_inst|seq_if_inst|afi_cal_success_sync_inst|din_s1}] 6
set_multicycle_path -setup -end -through [get_pins {mcu_0|ddr3|ddr3|arch|arch_inst|seq_if_inst|afi_cal_fail_sync_inst|din_s1|d mcu_0|ddr3|ddr3|arch|arch_inst|seq_if_inst|afi_cal_fail_sync_inst|din_s1|*data}]  -to [get_keepers {mcu_0|ddr3|ddr3|arch|arch_inst|seq_if_inst|afi_cal_fail_sync_inst|din_s1}] 7
set_multicycle_path -hold -end -through [get_pins {mcu_0|ddr3|ddr3|arch|arch_inst|seq_if_inst|afi_cal_fail_sync_inst|din_s1|d mcu_0|ddr3|ddr3|arch|arch_inst|seq_if_inst|afi_cal_fail_sync_inst|din_s1|*data}]  -to [get_keepers {mcu_0|ddr3|ddr3|arch|arch_inst|seq_if_inst|afi_cal_fail_sync_inst|din_s1}] 6
set_multicycle_path -setup -end -through [get_pins {mcu_0|ddr3|ddr3|arch|arch_inst|io_tiles_wrap_inst|io_tiles_inst|tile_gen[*].lane_gen[*].lane_inst|reset_n}]  -to [get_keepers {mcu_0|ddr3|ddr3|arch|arch_inst|io_tiles_wrap_inst|io_tiles_inst|tile_gen[*].lane_gen[*].lane_inst*}] 7
set_multicycle_path -hold -end -through [get_pins {mcu_0|ddr3|ddr3|arch|arch_inst|io_tiles_wrap_inst|io_tiles_inst|tile_gen[*].lane_gen[*].lane_inst|reset_n}]  -to [get_keepers {mcu_0|ddr3|ddr3|arch|arch_inst|io_tiles_wrap_inst|io_tiles_inst|tile_gen[*].lane_gen[*].lane_inst*}] 6
set_multicycle_path -setup -end -through [get_pins {mcu_0|ddr3|ddr3|arch|arch_inst|io_tiles_wrap_inst|io_tiles_inst|tile_gen[*].tile_ctrl_inst*|global_reset_n}]  -to [get_keepers {mcu_0|ddr3|ddr3|arch|arch_inst|io_tiles_wrap_inst|io_tiles_inst|tile_gen[*].tile_ctrl_inst*}] 7
set_multicycle_path -hold -end -through [get_pins {mcu_0|ddr3|ddr3|arch|arch_inst|io_tiles_wrap_inst|io_tiles_inst|tile_gen[*].tile_ctrl_inst*|global_reset_n}]  -to [get_keepers {mcu_0|ddr3|ddr3|arch|arch_inst|io_tiles_wrap_inst|io_tiles_inst|tile_gen[*].tile_ctrl_inst*}] 6
set_multicycle_path -setup -end -through [get_pins {mcu_0|ddr3|ddr3|arch|arch_inst|io_aux_inst|io_aux|core_usr_reset_n}]  -to [get_keepers {mcu_0|ddr3|ddr3|arch|arch_inst|io_aux_inst|io_aux*}] 7
set_multicycle_path -hold -end -through [get_pins {mcu_0|ddr3|ddr3|arch|arch_inst|io_aux_inst|io_aux|core_usr_reset_n}]  -to [get_keepers {mcu_0|ddr3|ddr3|arch|arch_inst|io_aux_inst|io_aux*}] 6
set_multicycle_path -setup -end -through [get_pins {mcu_0|ddr3|ddr3|arch|arch_inst|non_hps.core_clks_rsts_inst|*reset_sync*|clrn}]  -to [get_keepers {mcu_0|ddr3|ddr3|arch|arch_inst|non_hps.core_clks_rsts_inst|*reset_sync*}] 7
set_multicycle_path -hold -end -through [get_pins {mcu_0|ddr3|ddr3|arch|arch_inst|non_hps.core_clks_rsts_inst|*reset_sync*|clrn}]  -to [get_keepers {mcu_0|ddr3|ddr3|arch|arch_inst|non_hps.core_clks_rsts_inst|*reset_sync*}] 6


#**************************************************************
# Set Maximum Delay
#**************************************************************

set_max_delay -from [get_keepers {altera_reserved_tdi}] -to [get_ports {altera_reserved_tdo}] 1.000
set_max_delay -from [get_keepers {altera_reserved_tdi}] -to [get_ports {altera_reserved_tdo}] 10.000
set_max_delay -from [get_keepers {mcu_0|gpio|gpio|data_out[10]}] -to [get_ports {adc_pd}] 20.000
set_max_delay -from [get_keepers {auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|atom~jtag_reg}] -to [get_ports {altera_reserved_tdo}] 10.000
set_max_delay -from [get_keepers {auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|atom~jtag_reg__nff}] -to [get_ports {altera_reserved_tdo}] 10.000
set_max_delay -from [get_keepers {auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|int_tdo_reg}] -to [get_ports {altera_reserved_tdo}] 10.000
set_max_delay -from [get_keepers {mcu_0|ddr3|ddr3|arch|arch_inst|seq_if_inst|afi_cal_fail_sync_inst|dreg[1]}] -to [get_ports {status_local_cal_fail}] 5.000
set_max_delay -from [get_keepers {mcu_0|ddr3|ddr3|arch|arch_inst|seq_if_inst|afi_cal_success_sync_inst|dreg[1]}] -to [get_ports {status_local_cal_success}] 5.000
set_max_delay -from [get_keepers {mcu_0|gpio|gpio|data_out[6]}] -to [get_ports {clkd_sync}] 10.000
set_max_delay -from [get_keepers {mcu_0|gpio|gpio|data_out[9]}] -to [get_ports {dac_txen}] 10.000
set_max_delay -from [get_keepers {data_0~reg0}] -to [get_ports {data_0}] 10.000
set_max_delay -from [get_keepers {i_daq2_spi|spi_enable}] -to [get_ports {spi_sdio}] 20.000
set_max_delay -from [get_keepers {mcu_0|qspi_controller2_0|generic_quad_spi_controller2_0|asmi2_inst_qspi_ctrl|asmi2_qspi_interface_0|dataoe_reg[3]}] -to [get_ports {qspi_data[0]}] 10.000
set_max_delay -from [get_keepers {mcu_0|qspi_controller2_0|generic_quad_spi_controller2_0|asmi2_inst_qspi_ctrl|asmi2_qspi_interface_0|outgoing_data[0]}] -to [get_ports {qspi_data[0]}] 10.000
set_max_delay -from [get_keepers {mcu_0|qspi_controller2_0|generic_quad_spi_controller2_0|asmi2_inst_qspi_ctrl|csr_controller|csr_control_data_reg[0]}] -to [get_ports {qspi_data[0]}] 10.000
set_max_delay -from [get_keepers {mcu_0|qspi_controller2_0|generic_quad_spi_controller2_0|asmi2_inst_qspi_ctrl|asmi2_qspi_interface_0|dataoe_reg[1]}] -to [get_ports {qspi_data[1]}] 10.000
set_max_delay -from [get_keepers {mcu_0|qspi_controller2_0|generic_quad_spi_controller2_0|asmi2_inst_qspi_ctrl|asmi2_qspi_interface_0|i292}] -to [get_ports {qspi_data[1]}] 10.000
set_max_delay -from [get_keepers {mcu_0|qspi_controller2_0|generic_quad_spi_controller2_0|asmi2_inst_qspi_ctrl|asmi2_qspi_interface_0|outgoing_data[1]}] -to [get_ports {qspi_data[1]}] 10.000
set_max_delay -from [get_keepers {mcu_0|qspi_controller2_0|generic_quad_spi_controller2_0|asmi2_inst_qspi_ctrl|csr_controller|csr_control_data_reg[0]}] -to [get_ports {qspi_data[1]}] 10.000
set_max_delay -from [get_keepers {mcu_0|qspi_controller2_0|generic_quad_spi_controller2_0|asmi2_inst_qspi_ctrl|asmi2_qspi_interface_0|dataoe_reg[3]}] -to [get_ports {qspi_data[2]}] 10.000
set_max_delay -from [get_keepers {mcu_0|qspi_controller2_0|generic_quad_spi_controller2_0|asmi2_inst_qspi_ctrl|asmi2_qspi_interface_0|outgoing_data[2]}] -to [get_ports {qspi_data[2]}] 10.000
set_max_delay -from [get_keepers {mcu_0|qspi_controller2_0|generic_quad_spi_controller2_0|asmi2_inst_qspi_ctrl|csr_controller|csr_control_data_reg[0]}] -to [get_ports {qspi_data[2]}] 10.000
set_max_delay -from [get_keepers {mcu_0|qspi_controller2_0|generic_quad_spi_controller2_0|asmi2_inst_qspi_ctrl|asmi2_qspi_interface_0|dataoe_reg[3]}] -to [get_ports {qspi_data[3]}] 10.000
set_max_delay -from [get_keepers {mcu_0|qspi_controller2_0|generic_quad_spi_controller2_0|asmi2_inst_qspi_ctrl|asmi2_qspi_interface_0|outgoing_data[3]}] -to [get_ports {qspi_data[3]}] 10.000
set_max_delay -from [get_keepers {mcu_0|qspi_controller2_0|generic_quad_spi_controller2_0|asmi2_inst_qspi_ctrl|csr_controller|csr_control_data_reg[0]}] -to [get_ports {qspi_data[3]}] 10.000
set_max_delay -from [get_keepers {mcu_0|ad9680_jesd204|ad9680_jesd204|jesd204_rx|i_rx_ctrl|sync_n[0]}] -to [get_ports {rx_sync}] 1.000
set_max_delay -from [get_keepers {mcu_0|ad9680_jesd204|ad9680_jesd204|jesd204_rx|i_rx_ctrl|sync_n[0]}] -to [get_ports {rx_sync(n)}] 1.000
set_max_delay -from [get_keepers {mcu_0|spi|spi|SSO_reg}] -to [get_ports {spi_sdio}] 10.000
set_max_delay -from [get_keepers {mcu_0|spi|spi|shift_reg[7]}] -to [get_ports {spi_sdio}] 10.000
set_max_delay -from [get_keepers {mcu_0|spi|spi|spi_slave_select_reg[0]}] -to [get_ports {spi_sdio}] 10.000
set_max_delay -from [get_keepers {mcu_0|spi|spi|spi_slave_select_reg[1]}] -to [get_ports {spi_sdio}] 10.000
set_max_delay -from [get_keepers {mcu_0|spi|spi|spi_slave_select_reg[2]}] -to [get_ports {spi_sdio}] 10.000
set_max_delay -from [get_keepers {mcu_0|spi|spi|stateZero}] -to [get_ports {spi_sdio}] 10.000
set_max_delay -from [get_keepers {mcu_0|spi|spi|transmitting}] -to [get_ports {spi_sdio}] 10.000
set_max_delay -from [get_registers {*altera_avalon_st_clock_crosser:*|in_data_buffer*}] -to [get_registers {*altera_avalon_st_clock_crosser:*|out_data_buffer*}] 100.000
set_max_delay -from [get_registers {*altera_avalon_st_clock_crosser:*}] -to [get_registers {*altera_avalon_st_clock_crosser:*|altera_std_synchronizer_nocut:*|din_s1}] 100.000
set_max_delay -from [get_registers {*|in_wr_ptr_gray[*]}] -to [get_registers {*|altera_dcfifo_synchronizer_bundle:write_crosser|altera_std_synchronizer_nocut:sync[*].u|din_s1}] 200.000
set_max_delay -from [get_registers {*|out_rd_ptr_gray[*]}] -to [get_registers {*|altera_dcfifo_synchronizer_bundle:read_crosser|altera_std_synchronizer_nocut:sync[*].u|din_s1}] 200.000
set_max_delay -to [get_pins -compatibility_mode {*twentynm_xcvr_native_inst|*inst_twentynm_pcs|*twentynm_hssi_*_pld_pcs_interface*|pld_pmaif_tx_pld_rst_n}] 50.000
set_max_delay -to [get_pins -compatibility_mode {*twentynm_xcvr_native_inst|*inst_twentynm_pcs|*twentynm_hssi_*_pld_pcs_interface*|pld_8g_g3_tx_pld_rst_n}] 50.000
set_max_delay -to [get_pins -compatibility_mode {*twentynm_xcvr_native_inst|*inst_twentynm_pcs|*twentynm_hssi_*_pld_pcs_interface*|pld_10g_krfec_tx_pld_rst_n}] 50.000
set_max_delay -to [get_pins -compatibility_mode {*twentynm_xcvr_native_inst|*inst_twentynm_pcs|*twentynm_hssi_*_pld_pcs_interface*|pld_pma_txpma_rstb}] 20.000
set_max_delay -to [get_pins -compatibility_mode {*twentynm_xcvr_native_inst|*inst_twentynm_pcs|*twentynm_hssi_*_pld_pcs_interface*|pld_pma_rxpma_rstb}] 20.000
set_max_delay -to [get_pins -compatibility_mode {*twentynm_xcvr_native_inst|*inst_twentynm_pcs|*twentynm_hssi_*_pld_pcs_interface*|pld_10g_tx_burst_en*}] 20.000
set_max_delay -from [get_ports {altera_reserved_tdi}] -to [get_keepers {altera_reserved_tdo}] 10.000
set_max_delay -from [get_keepers {mcu_0|spi|spi|SSO_reg}] -to [get_ports {spi_sdio}] 5.000
set_max_delay -from [get_keepers {mcu_0|spi|spi|shift_reg[7]}] -to [get_ports {spi_sdio}] 5.000
set_max_delay -from [get_keepers {mcu_0|qspi_controller2_0|generic_quad_spi_controller2_0|asmi2_inst_qspi_ctrl|asmi2_qspi_interface_0|dataoe_reg[1]}] -to [get_ports {qspi_data[1]}] 5.000
set_max_delay -from [get_keepers {mcu_0|qspi_controller2_0|generic_quad_spi_controller2_0|asmi2_inst_qspi_ctrl|asmi2_qspi_interface_0|i292}] -to [get_ports {qspi_data[1]}] 5.000
set_max_delay -from [get_keepers {mcu_0|qspi_controller2_0|generic_quad_spi_controller2_0|asmi2_inst_qspi_ctrl|asmi2_qspi_interface_0|outgoing_data[1]}] -to [get_ports {qspi_data[1]}] 5.000
set_max_delay -from [get_keepers {mcu_0|qspi_controller2_0|generic_quad_spi_controller2_0|asmi2_inst_qspi_ctrl|csr_controller|csr_control_data_reg[0]}] -to [get_ports {qspi_data[1]}] 5.000
set_max_delay -from [get_keepers {mcu_0|qspi_controller2_0|generic_quad_spi_controller2_0|asmi2_inst_qspi_ctrl|asmi2_qspi_interface_0|dataoe_reg[3]}] -to [get_ports {qspi_data[3]}] 5.000
set_max_delay -from [get_keepers {i_daq2_spi|spi_enable}] -to [get_ports {spi_sdio}] 5.000


#**************************************************************
# Set Minimum Delay
#**************************************************************

set_min_delay -from [get_registers {*altera_avalon_st_clock_crosser:*|in_data_buffer*}] -to [get_registers {*altera_avalon_st_clock_crosser:*|out_data_buffer*}] -100.000
set_min_delay -from [get_registers {*altera_avalon_st_clock_crosser:*}] -to [get_registers {*altera_avalon_st_clock_crosser:*|altera_std_synchronizer_nocut:*|din_s1}] -100.000
set_min_delay -from [get_registers {*|in_wr_ptr_gray[*]}] -to [get_registers {*|altera_dcfifo_synchronizer_bundle:write_crosser|altera_std_synchronizer_nocut:sync[*].u|din_s1}] -200.000
set_min_delay -from [get_registers {*|out_rd_ptr_gray[*]}] -to [get_registers {*|altera_dcfifo_synchronizer_bundle:read_crosser|altera_std_synchronizer_nocut:sync[*].u|din_s1}] -200.000
set_min_delay -to [get_pins -compatibility_mode {*twentynm_xcvr_native_inst|*inst_twentynm_pcs|*twentynm_hssi_*_pld_pcs_interface*|pld_pmaif_tx_pld_rst_n}] -50.000
set_min_delay -to [get_pins -compatibility_mode {*twentynm_xcvr_native_inst|*inst_twentynm_pcs|*twentynm_hssi_*_pld_pcs_interface*|pld_8g_g3_tx_pld_rst_n}] -50.000
set_min_delay -to [get_pins -compatibility_mode {*twentynm_xcvr_native_inst|*inst_twentynm_pcs|*twentynm_hssi_*_pld_pcs_interface*|pld_10g_krfec_tx_pld_rst_n}] -50.000
set_min_delay -to [get_pins -compatibility_mode {*twentynm_xcvr_native_inst|*inst_twentynm_pcs|*twentynm_hssi_*_pld_pcs_interface*|pld_pma_txpma_rstb}] -10.000
set_min_delay -to [get_pins -compatibility_mode {*twentynm_xcvr_native_inst|*inst_twentynm_pcs|*twentynm_hssi_*_pld_pcs_interface*|pld_pma_rxpma_rstb}] -10.000
set_min_delay -to [get_pins -compatibility_mode {*twentynm_xcvr_native_inst|*inst_twentynm_pcs|*twentynm_hssi_*_pld_pcs_interface*|pld_10g_tx_burst_en*}] -20.000


#**************************************************************
# Set Input Transition
#**************************************************************



#**************************************************************
# Set Net Delay
#**************************************************************

set_net_delay -max -value_multiplier 0.800 -get_value_from_clock_period dst_clock_period -from [get_registers {*altera_avalon_st_clock_crosser:*|in_data_buffer*}] -to [get_registers {mcu_0|mm_interconnect_0|crosser_003|async_clock_crosser.clock_xer|out_data_buffer*}]
set_net_delay -max -value_multiplier 0.800 -get_value_from_clock_period dst_clock_period -from [get_registers {*altera_avalon_st_clock_crosser:*|in_data_buffer*}] -to [get_registers {mcu_0|mm_interconnect_0|crosser_005|async_clock_crosser.clock_xer|out_data_buffer*}]
set_net_delay -max -value_multiplier 0.800 -get_value_from_clock_period dst_clock_period -from [get_registers {*altera_avalon_st_clock_crosser:*|in_data_buffer*}] -to [get_registers {mcu_0|mm_interconnect_1|crosser|async_clock_crosser.clock_xer|out_data_buffer*}]
set_net_delay -max -value_multiplier 0.800 -get_value_from_clock_period dst_clock_period -from [get_registers {*altera_avalon_st_clock_crosser:*|in_data_buffer*}] -to [get_registers {mcu_0|mm_interconnect_0|crosser_004|async_clock_crosser.clock_xer|out_data_buffer*}]
set_net_delay -max -value_multiplier 0.800 -get_value_from_clock_period dst_clock_period -from [get_registers {*altera_avalon_st_clock_crosser:*|in_data_buffer*}] -to [get_registers {mcu_0|mm_interconnect_1|crosser_001|async_clock_crosser.clock_xer|out_data_buffer*}]
set_net_delay -max -value_multiplier 0.800 -get_value_from_clock_period dst_clock_period -from [get_registers {*altera_avalon_st_clock_crosser:*|in_data_buffer*}] -to [get_registers {mcu_0|mm_interconnect_0|crosser_001|async_clock_crosser.clock_xer|out_data_buffer*}]
set_net_delay -max -value_multiplier 0.800 -get_value_from_clock_period dst_clock_period -from [get_registers {*altera_avalon_st_clock_crosser:*|in_data_buffer*}] -to [get_registers {mcu_0|mm_interconnect_0|crosser|async_clock_crosser.clock_xer|out_data_buffer*}]
set_net_delay -max -value_multiplier 0.800 -get_value_from_clock_period dst_clock_period -from [get_registers {mcu_0|mm_interconnect_0|crosser|async_clock_crosser.clock_xer|in_data_toggle}] -to [get_registers {mcu_0|mm_interconnect_0|crosser|async_clock_crosser.clock_xer|in_to_out_synchronizer|din_s1}]
set_net_delay -max -value_multiplier 0.800 -get_value_from_clock_period dst_clock_period -from [get_registers {mcu_0|mm_interconnect_0|crosser_001|async_clock_crosser.clock_xer|in_data_toggle}] -to [get_registers {mcu_0|mm_interconnect_0|crosser_001|async_clock_crosser.clock_xer|in_to_out_synchronizer|din_s1}]
set_net_delay -max -value_multiplier 0.800 -get_value_from_clock_period dst_clock_period -from [get_registers {mcu_0|mm_interconnect_0|crosser_002|async_clock_crosser.clock_xer|in_data_toggle}] -to [get_registers {mcu_0|mm_interconnect_0|crosser_002|async_clock_crosser.clock_xer|in_to_out_synchronizer|din_s1}]
set_net_delay -max -value_multiplier 0.800 -get_value_from_clock_period dst_clock_period -from [get_registers {mcu_0|mm_interconnect_0|crosser_003|async_clock_crosser.clock_xer|in_data_toggle}] -to [get_registers {mcu_0|mm_interconnect_0|crosser_003|async_clock_crosser.clock_xer|in_to_out_synchronizer|din_s1}]
set_net_delay -max -value_multiplier 0.800 -get_value_from_clock_period dst_clock_period -from [get_registers {mcu_0|mm_interconnect_0|crosser_005|async_clock_crosser.clock_xer|in_data_toggle}] -to [get_registers {mcu_0|mm_interconnect_0|crosser_005|async_clock_crosser.clock_xer|in_to_out_synchronizer|din_s1}]
set_net_delay -max -value_multiplier 0.800 -get_value_from_clock_period dst_clock_period -from [get_registers {mcu_0|mm_interconnect_0|crosser_004|async_clock_crosser.clock_xer|in_data_toggle}] -to [get_registers {mcu_0|mm_interconnect_0|crosser_004|async_clock_crosser.clock_xer|in_to_out_synchronizer|din_s1}]
set_net_delay -max -value_multiplier 0.800 -get_value_from_clock_period dst_clock_period -from [get_registers {mcu_0|mm_interconnect_1|crosser_001|async_clock_crosser.clock_xer|in_data_toggle}] -to [get_registers {mcu_0|mm_interconnect_1|crosser_001|async_clock_crosser.clock_xer|in_to_out_synchronizer|din_s1}]
set_net_delay -max -value_multiplier 0.800 -get_value_from_clock_period dst_clock_period -from [get_registers {mcu_0|mm_interconnect_1|crosser|async_clock_crosser.clock_xer|in_data_toggle}] -to [get_registers {mcu_0|mm_interconnect_1|crosser|async_clock_crosser.clock_xer|in_to_out_synchronizer|din_s1}]
set_net_delay -max -value_multiplier 0.800 -get_value_from_clock_period dst_clock_period -from [get_registers {mcu_0|mm_interconnect_0|crosser_003|async_clock_crosser.clock_xer|out_data_toggle_flopped}] -to [get_registers {mcu_0|mm_interconnect_0|crosser_003|async_clock_crosser.clock_xer|out_to_in_synchronizer|din_s1}]
set_net_delay -max -value_multiplier 0.800 -get_value_from_clock_period dst_clock_period -from [get_registers {mcu_0|mm_interconnect_0|crosser_005|async_clock_crosser.clock_xer|out_data_toggle_flopped}] -to [get_registers {mcu_0|mm_interconnect_0|crosser_005|async_clock_crosser.clock_xer|out_to_in_synchronizer|din_s1}]
set_net_delay -max -value_multiplier 0.800 -get_value_from_clock_period dst_clock_period -from [get_registers {mcu_0|mm_interconnect_0|crosser_004|async_clock_crosser.clock_xer|out_data_toggle_flopped}] -to [get_registers {mcu_0|mm_interconnect_0|crosser_004|async_clock_crosser.clock_xer|out_to_in_synchronizer|din_s1}]
set_net_delay -max -value_multiplier 0.800 -get_value_from_clock_period dst_clock_period -from [get_registers {mcu_0|mm_interconnect_0|crosser|async_clock_crosser.clock_xer|out_data_toggle_flopped}] -to [get_registers {mcu_0|mm_interconnect_0|crosser|async_clock_crosser.clock_xer|out_to_in_synchronizer|din_s1}]
set_net_delay -max -value_multiplier 0.800 -get_value_from_clock_period dst_clock_period -from [get_registers {mcu_0|mm_interconnect_0|crosser_001|async_clock_crosser.clock_xer|out_data_toggle_flopped}] -to [get_registers {mcu_0|mm_interconnect_0|crosser_001|async_clock_crosser.clock_xer|out_to_in_synchronizer|din_s1}]
set_net_delay -max -value_multiplier 0.800 -get_value_from_clock_period dst_clock_period -from [get_registers {mcu_0|mm_interconnect_1|crosser|async_clock_crosser.clock_xer|out_data_toggle_flopped}] -to [get_registers {mcu_0|mm_interconnect_1|crosser|async_clock_crosser.clock_xer|out_to_in_synchronizer|din_s1}]
set_net_delay -max -value_multiplier 0.800 -get_value_from_clock_period dst_clock_period -from [get_registers {mcu_0|mm_interconnect_0|crosser_002|async_clock_crosser.clock_xer|out_data_toggle_flopped}] -to [get_registers {mcu_0|mm_interconnect_0|crosser_002|async_clock_crosser.clock_xer|out_to_in_synchronizer|din_s1}]
set_net_delay -max -value_multiplier 0.800 -get_value_from_clock_period dst_clock_period -from [get_registers {mcu_0|mm_interconnect_1|crosser_001|async_clock_crosser.clock_xer|out_data_toggle_flopped}] -to [get_registers {mcu_0|mm_interconnect_1|crosser_001|async_clock_crosser.clock_xer|out_to_in_synchronizer|din_s1}]
set_net_delay -max -value_multiplier 0.800 -get_value_from_clock_period dst_clock_period -from [get_pins -compatibility_mode {*|in_wr_ptr_gray[*]*}] -to [get_registers {*|altera_dcfifo_synchronizer_bundle:write_crosser|altera_std_synchronizer_nocut:sync[*].u|din_s1}]
set_net_delay -max -value_multiplier 0.800 -get_value_from_clock_period dst_clock_period -from [get_pins -compatibility_mode {*|out_rd_ptr_gray[*]*}] -to [get_registers {*|altera_dcfifo_synchronizer_bundle:read_crosser|altera_std_synchronizer_nocut:sync[*].u|din_s1}]


#**************************************************************
# Set Max Skew
#**************************************************************

set_max_skew -from [get_registers {mcu_0|bridge_0|mm_clock_crossing_bridge_0|cmd_fifo|in_wr_ptr_gray[*]}] -to [get_registers {mcu_0|bridge_0|mm_clock_crossing_bridge_0|cmd_fifo|write_crosser|sync[*].u|din_s1}] -get_skew_value_from_clock_period src_clock_period -skew_value_multiplier 0.800 
set_max_skew -from [get_registers {mcu_0|bridge_0|mm_clock_crossing_bridge_0|cmd_fifo|out_rd_ptr_gray[*]}] -to [get_registers {mcu_0|bridge_0|mm_clock_crossing_bridge_0|cmd_fifo|read_crosser|sync[*].u|din_s1}] -get_skew_value_from_clock_period src_clock_period -skew_value_multiplier 0.800 
set_max_skew -from [get_registers {mcu_0|bridge_0|mm_clock_crossing_bridge_0|rsp_fifo|in_wr_ptr_gray[*]}] -to [get_registers {mcu_0|bridge_0|mm_clock_crossing_bridge_0|rsp_fifo|write_crosser|sync[*].u|din_s1}] -get_skew_value_from_clock_period src_clock_period -skew_value_multiplier 0.800 
set_max_skew -from [get_registers {mcu_0|bridge_0|mm_clock_crossing_bridge_0|rsp_fifo|out_rd_ptr_gray[*]}] -to [get_registers {mcu_0|bridge_0|mm_clock_crossing_bridge_0|rsp_fifo|read_crosser|sync[*].u|din_s1}] -get_skew_value_from_clock_period src_clock_period -skew_value_multiplier 0.800 
set_max_skew -from [get_registers {mcu_0|bridge_1|mm_clock_crossing_bridge_1|cmd_fifo|in_wr_ptr_gray[*]}] -to [get_registers {mcu_0|bridge_1|mm_clock_crossing_bridge_1|cmd_fifo|write_crosser|sync[*].u|din_s1}] -get_skew_value_from_clock_period src_clock_period -skew_value_multiplier 0.800 
set_max_skew -from [get_registers {mcu_0|bridge_1|mm_clock_crossing_bridge_1|cmd_fifo|out_rd_ptr_gray[*]}] -to [get_registers {mcu_0|bridge_1|mm_clock_crossing_bridge_1|cmd_fifo|read_crosser|sync[*].u|din_s1}] -get_skew_value_from_clock_period src_clock_period -skew_value_multiplier 0.800 
set_max_skew -from [get_registers {mcu_0|bridge_1|mm_clock_crossing_bridge_1|rsp_fifo|in_wr_ptr_gray[*]}] -to [get_registers {mcu_0|bridge_1|mm_clock_crossing_bridge_1|rsp_fifo|write_crosser|sync[*].u|din_s1}] -get_skew_value_from_clock_period src_clock_period -skew_value_multiplier 0.800 
set_max_skew -from [get_registers {mcu_0|bridge_1|mm_clock_crossing_bridge_1|rsp_fifo|out_rd_ptr_gray[*]}] -to [get_registers {mcu_0|bridge_1|mm_clock_crossing_bridge_1|rsp_fifo|read_crosser|sync[*].u|din_s1}] -get_skew_value_from_clock_period src_clock_period -skew_value_multiplier 0.800 
set_max_skew -from [get_registers {mcu_0|bridge_2|mm_clock_crossing_bridge_2|cmd_fifo|in_wr_ptr_gray[*]}] -to [get_registers {mcu_0|bridge_2|mm_clock_crossing_bridge_2|cmd_fifo|write_crosser|sync[*].u|din_s1}] -get_skew_value_from_clock_period src_clock_period -skew_value_multiplier 0.800 
set_max_skew -from [get_registers {mcu_0|bridge_2|mm_clock_crossing_bridge_2|cmd_fifo|out_rd_ptr_gray[*]}] -to [get_registers {mcu_0|bridge_2|mm_clock_crossing_bridge_2|cmd_fifo|read_crosser|sync[*].u|din_s1}] -get_skew_value_from_clock_period src_clock_period -skew_value_multiplier 0.800 
set_max_skew -from [get_registers {mcu_0|bridge_2|mm_clock_crossing_bridge_2|rsp_fifo|in_wr_ptr_gray[*]}] -to [get_registers {mcu_0|bridge_2|mm_clock_crossing_bridge_2|rsp_fifo|write_crosser|sync[*].u|din_s1}] -get_skew_value_from_clock_period src_clock_period -skew_value_multiplier 0.800 
set_max_skew -from [get_registers {mcu_0|bridge_2|mm_clock_crossing_bridge_2|rsp_fifo|out_rd_ptr_gray[*]}] -to [get_registers {mcu_0|bridge_2|mm_clock_crossing_bridge_2|rsp_fifo|read_crosser|sync[*].u|din_s1}] -get_skew_value_from_clock_period src_clock_period -skew_value_multiplier 0.800 
set_max_skew -from [get_registers {mcu_0|bridge_3|mm_clock_crossing_bridge_3|cmd_fifo|in_wr_ptr_gray[*]}] -to [get_registers {mcu_0|bridge_3|mm_clock_crossing_bridge_3|cmd_fifo|write_crosser|sync[*].u|din_s1}] -get_skew_value_from_clock_period src_clock_period -skew_value_multiplier 0.800 
set_max_skew -from [get_registers {mcu_0|bridge_3|mm_clock_crossing_bridge_3|cmd_fifo|out_rd_ptr_gray[*]}] -to [get_registers {mcu_0|bridge_3|mm_clock_crossing_bridge_3|cmd_fifo|read_crosser|sync[*].u|din_s1}] -get_skew_value_from_clock_period src_clock_period -skew_value_multiplier 0.800 
set_max_skew -from [get_registers {mcu_0|bridge_3|mm_clock_crossing_bridge_3|rsp_fifo|in_wr_ptr_gray[*]}] -to [get_registers {mcu_0|bridge_3|mm_clock_crossing_bridge_3|rsp_fifo|write_crosser|sync[*].u|din_s1}] -get_skew_value_from_clock_period src_clock_period -skew_value_multiplier 0.800 
set_max_skew -from [get_registers {mcu_0|bridge_3|mm_clock_crossing_bridge_3|rsp_fifo|out_rd_ptr_gray[*]}] -to [get_registers {mcu_0|bridge_3|mm_clock_crossing_bridge_3|rsp_fifo|read_crosser|sync[*].u|din_s1}] -get_skew_value_from_clock_period src_clock_period -skew_value_multiplier 0.800 
