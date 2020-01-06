	i2c #(
		.FIFO_DEPTH      (INTEGER_VALUE_FOR_FIFO_DEPTH),
		.FIFO_DEPTH_LOG2 (INTEGER_VALUE_FOR_FIFO_DEPTH_LOG2)
	) u0 (
		.clk       (_connected_to_clk_),       //   input,   width = 1,            clock.clk
		.rst_n     (_connected_to_rst_n_),     //   input,   width = 1,       reset_sink.reset_n
		.intr      (_connected_to_intr_),      //  output,   width = 1, interrupt_sender.irq
		.addr      (_connected_to_addr_),      //   input,   width = 4,              csr.address
		.read      (_connected_to_read_),      //   input,   width = 1,                 .read
		.write     (_connected_to_write_),     //   input,   width = 1,                 .write
		.writedata (_connected_to_writedata_), //   input,  width = 32,                 .writedata
		.readdata  (_connected_to_readdata_),  //  output,  width = 32,                 .readdata
		.sda_in    (_connected_to_sda_in_),    //   input,   width = 1,       i2c_serial.sda_in
		.scl_in    (_connected_to_scl_in_),    //   input,   width = 1,                 .scl_in
		.sda_oe    (_connected_to_sda_oe_),    //  output,   width = 1,                 .sda_oe
		.scl_oe    (_connected_to_scl_oe_)     //  output,   width = 1,                 .scl_oe
	);

