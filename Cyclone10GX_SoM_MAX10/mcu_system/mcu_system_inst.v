	mcu_system u0 (
		.clk_clk       (<connected-to-clk_clk>),       //    clk.clk
		.reset_reset_n (<connected-to-reset_reset_n>), //  reset.reset_n
		.serial_sda_in (<connected-to-serial_sda_in>), // serial.sda_in
		.serial_scl_in (<connected-to-serial_scl_in>), //       .scl_in
		.serial_sda_oe (<connected-to-serial_sda_oe>), //       .sda_oe
		.serial_scl_oe (<connected-to-serial_scl_oe>)  //       .scl_oe
	);

