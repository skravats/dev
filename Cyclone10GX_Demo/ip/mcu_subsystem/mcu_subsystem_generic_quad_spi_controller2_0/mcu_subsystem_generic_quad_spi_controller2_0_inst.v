	mcu_subsystem_generic_quad_spi_controller2_0 u0 (
		.clk                  (_connected_to_clk_),                  //   input,   width = 1,       clock_sink.clk
		.reset_n              (_connected_to_reset_n_),              //   input,   width = 1,            reset.reset_n
		.qspi_pins_dclk       (_connected_to_qspi_pins_dclk_),       //  output,   width = 1,        qspi_pins.dclk
		.qspi_pins_ncs        (_connected_to_qspi_pins_ncs_),        //  output,   width = 1,                 .ncs
		.qspi_pins_data       (_connected_to_qspi_pins_data_),       //   inout,   width = 4,                 .data
		.avl_csr_read         (_connected_to_avl_csr_read_),         //   input,   width = 1,          avl_csr.read
		.avl_csr_waitrequest  (_connected_to_avl_csr_waitrequest_),  //  output,   width = 1,                 .waitrequest
		.avl_csr_write        (_connected_to_avl_csr_write_),        //   input,   width = 1,                 .write
		.avl_csr_addr         (_connected_to_avl_csr_addr_),         //   input,   width = 4,                 .address
		.avl_csr_wrdata       (_connected_to_avl_csr_wrdata_),       //   input,  width = 32,                 .writedata
		.avl_csr_rddata       (_connected_to_avl_csr_rddata_),       //  output,  width = 32,                 .readdata
		.avl_csr_rddata_valid (_connected_to_avl_csr_rddata_valid_), //  output,   width = 1,                 .readdatavalid
		.avl_mem_write        (_connected_to_avl_mem_write_),        //   input,   width = 1,          avl_mem.write
		.avl_mem_burstcount   (_connected_to_avl_mem_burstcount_),   //   input,   width = 7,                 .burstcount
		.avl_mem_waitrequest  (_connected_to_avl_mem_waitrequest_),  //  output,   width = 1,                 .waitrequest
		.avl_mem_read         (_connected_to_avl_mem_read_),         //   input,   width = 1,                 .read
		.avl_mem_addr         (_connected_to_avl_mem_addr_),         //   input,  width = 25,                 .address
		.avl_mem_wrdata       (_connected_to_avl_mem_wrdata_),       //   input,  width = 32,                 .writedata
		.avl_mem_rddata       (_connected_to_avl_mem_rddata_),       //  output,  width = 32,                 .readdata
		.avl_mem_rddata_valid (_connected_to_avl_mem_rddata_valid_), //  output,   width = 1,                 .readdatavalid
		.avl_mem_byteenable   (_connected_to_avl_mem_byteenable_),   //   input,   width = 4,                 .byteenable
		.irq                  (_connected_to_irq_)                   //  output,   width = 1, interrupt_sender.irq
	);

