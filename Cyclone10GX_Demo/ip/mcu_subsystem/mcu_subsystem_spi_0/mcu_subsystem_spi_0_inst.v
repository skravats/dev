	mcu_subsystem_spi_0 u0 (
		.clk           (_connected_to_clk_),           //   input,   width = 1,              clk.clk
		.reset_n       (_connected_to_reset_n_),       //   input,   width = 1,            reset.reset_n
		.data_from_cpu (_connected_to_data_from_cpu_), //   input,  width = 16, spi_control_port.writedata
		.data_to_cpu   (_connected_to_data_to_cpu_),   //  output,  width = 16,                 .readdata
		.mem_addr      (_connected_to_mem_addr_),      //   input,   width = 3,                 .address
		.read_n        (_connected_to_read_n_),        //   input,   width = 1,                 .read_n
		.spi_select    (_connected_to_spi_select_),    //   input,   width = 1,                 .chipselect
		.write_n       (_connected_to_write_n_),       //   input,   width = 1,                 .write_n
		.irq           (_connected_to_irq_),           //  output,   width = 1,              irq.irq
		.MISO          (_connected_to_MISO_),          //   input,   width = 1,         external.MISO
		.MOSI          (_connected_to_MOSI_),          //  output,   width = 1,                 .MOSI
		.SCLK          (_connected_to_SCLK_),          //  output,   width = 1,                 .SCLK
		.SS_n          (_connected_to_SS_n_)           //  output,   width = 8,                 .SS_n
	);

