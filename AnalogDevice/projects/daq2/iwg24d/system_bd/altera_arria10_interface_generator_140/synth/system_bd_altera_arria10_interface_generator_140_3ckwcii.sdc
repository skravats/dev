create_clock -period 5.7142857142857144 [get_pins -compatibility_mode *|fpga_interfaces|s2f_user0_clk*]
create_clock -name hps_i2c_internal -period 2500.000 [get_registers {*~l4_sp_clk.reg}]