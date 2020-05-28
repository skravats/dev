	avl_adxcfg_2 u0 (
		.rcfg_clk               (_connected_to_rcfg_clk_),               //   input,   width = 1,     rcfg_clk.clk
		.rcfg_reset_n           (_connected_to_rcfg_reset_n_),           //   input,   width = 1, rcfg_reset_n.reset_n
		.rcfg_in_read_0         (_connected_to_rcfg_in_read_0_),         //   input,   width = 1,      rcfg_s0.read
		.rcfg_in_write_0        (_connected_to_rcfg_in_write_0_),        //   input,   width = 1,             .write
		.rcfg_in_address_0      (_connected_to_rcfg_in_address_0_),      //   input,  width = 10,             .address
		.rcfg_in_writedata_0    (_connected_to_rcfg_in_writedata_0_),    //   input,  width = 32,             .writedata
		.rcfg_in_readdata_0     (_connected_to_rcfg_in_readdata_0_),     //  output,  width = 32,             .readdata
		.rcfg_in_waitrequest_0  (_connected_to_rcfg_in_waitrequest_0_),  //  output,   width = 1,             .waitrequest
		.rcfg_out_read_0        (_connected_to_rcfg_out_read_0_),        //  output,   width = 1,      rcfg_m0.read
		.rcfg_out_write_0       (_connected_to_rcfg_out_write_0_),       //  output,   width = 1,             .write
		.rcfg_out_address_0     (_connected_to_rcfg_out_address_0_),     //  output,  width = 10,             .address
		.rcfg_out_writedata_0   (_connected_to_rcfg_out_writedata_0_),   //  output,  width = 32,             .writedata
		.rcfg_out_readdata_0    (_connected_to_rcfg_out_readdata_0_),    //   input,  width = 32,             .readdata
		.rcfg_out_waitrequest_0 (_connected_to_rcfg_out_waitrequest_0_), //   input,   width = 1,             .waitrequest
		.rcfg_in_read_1         (_connected_to_rcfg_in_read_1_),         //   input,   width = 1,      rcfg_s1.read
		.rcfg_in_write_1        (_connected_to_rcfg_in_write_1_),        //   input,   width = 1,             .write
		.rcfg_in_address_1      (_connected_to_rcfg_in_address_1_),      //   input,  width = 10,             .address
		.rcfg_in_writedata_1    (_connected_to_rcfg_in_writedata_1_),    //   input,  width = 32,             .writedata
		.rcfg_in_readdata_1     (_connected_to_rcfg_in_readdata_1_),     //  output,  width = 32,             .readdata
		.rcfg_in_waitrequest_1  (_connected_to_rcfg_in_waitrequest_1_),  //  output,   width = 1,             .waitrequest
		.rcfg_out_read_1        (_connected_to_rcfg_out_read_1_),        //  output,   width = 1,      rcfg_m1.read
		.rcfg_out_write_1       (_connected_to_rcfg_out_write_1_),       //  output,   width = 1,             .write
		.rcfg_out_address_1     (_connected_to_rcfg_out_address_1_),     //  output,  width = 10,             .address
		.rcfg_out_writedata_1   (_connected_to_rcfg_out_writedata_1_),   //  output,  width = 32,             .writedata
		.rcfg_out_readdata_1    (_connected_to_rcfg_out_readdata_1_),    //   input,  width = 32,             .readdata
		.rcfg_out_waitrequest_1 (_connected_to_rcfg_out_waitrequest_1_)  //   input,   width = 1,             .waitrequest
	);

