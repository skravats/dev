	mcu_subsystem_axi_ad9144_0 u0 (
		.s_axi_aclk    (_connected_to_s_axi_aclk_),    //   input,    width = 1, s_axi_clock.clk
		.s_axi_aresetn (_connected_to_s_axi_aresetn_), //   input,    width = 1, s_axi_reset.reset_n
		.s_axi_awvalid (_connected_to_s_axi_awvalid_), //   input,    width = 1,       s_axi.awvalid
		.s_axi_awaddr  (_connected_to_s_axi_awaddr_),  //   input,   width = 16,            .awaddr
		.s_axi_awprot  (_connected_to_s_axi_awprot_),  //   input,    width = 3,            .awprot
		.s_axi_awready (_connected_to_s_axi_awready_), //  output,    width = 1,            .awready
		.s_axi_wvalid  (_connected_to_s_axi_wvalid_),  //   input,    width = 1,            .wvalid
		.s_axi_wdata   (_connected_to_s_axi_wdata_),   //   input,   width = 32,            .wdata
		.s_axi_wstrb   (_connected_to_s_axi_wstrb_),   //   input,    width = 4,            .wstrb
		.s_axi_wready  (_connected_to_s_axi_wready_),  //  output,    width = 1,            .wready
		.s_axi_bvalid  (_connected_to_s_axi_bvalid_),  //  output,    width = 1,            .bvalid
		.s_axi_bresp   (_connected_to_s_axi_bresp_),   //  output,    width = 2,            .bresp
		.s_axi_bready  (_connected_to_s_axi_bready_),  //   input,    width = 1,            .bready
		.s_axi_arvalid (_connected_to_s_axi_arvalid_), //   input,    width = 1,            .arvalid
		.s_axi_araddr  (_connected_to_s_axi_araddr_),  //   input,   width = 16,            .araddr
		.s_axi_arprot  (_connected_to_s_axi_arprot_),  //   input,    width = 3,            .arprot
		.s_axi_arready (_connected_to_s_axi_arready_), //  output,    width = 1,            .arready
		.s_axi_rvalid  (_connected_to_s_axi_rvalid_),  //  output,    width = 1,            .rvalid
		.s_axi_rresp   (_connected_to_s_axi_rresp_),   //  output,    width = 2,            .rresp
		.s_axi_rdata   (_connected_to_s_axi_rdata_),   //  output,   width = 32,            .rdata
		.s_axi_rready  (_connected_to_s_axi_rready_),  //   input,    width = 1,            .rready
		.tx_clk        (_connected_to_tx_clk_),        //   input,    width = 1,   if_tx_clk.clk
		.tx_data       (_connected_to_tx_data_),       //  output,  width = 128,  if_tx_data.data
		.tx_valid      (_connected_to_tx_valid_),      //  output,    width = 1,            .valid
		.tx_ready      (_connected_to_tx_ready_),      //   input,    width = 1,            .ready
		.dac_clk       (_connected_to_dac_clk_),       //  output,    width = 1,  if_dac_clk.clk
		.dac_enable_0  (_connected_to_dac_enable_0_),  //  output,    width = 1,    dac_ch_0.enable
		.dac_valid_0   (_connected_to_dac_valid_0_),   //  output,    width = 1,            .valid
		.dac_ddata_0   (_connected_to_dac_ddata_0_),   //   input,   width = 64,            .data
		.dac_enable_1  (_connected_to_dac_enable_1_),  //  output,    width = 1,    dac_ch_1.enable
		.dac_valid_1   (_connected_to_dac_valid_1_),   //  output,    width = 1,            .valid
		.dac_ddata_1   (_connected_to_dac_ddata_1_),   //   input,   width = 64,            .data
		.dac_dunf      (_connected_to_dac_dunf_)       //   input,    width = 1, if_dac_dunf.unf
	);

