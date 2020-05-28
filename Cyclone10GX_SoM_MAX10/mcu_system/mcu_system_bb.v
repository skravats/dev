
module mcu_system (
	clk_clk,
	reset_reset_n,
	serial_sda_in,
	serial_scl_in,
	serial_sda_oe,
	serial_scl_oe);	

	input		clk_clk;
	input		reset_reset_n;
	input		serial_sda_in;
	input		serial_scl_in;
	output		serial_sda_oe;
	output		serial_scl_oe;
endmodule
