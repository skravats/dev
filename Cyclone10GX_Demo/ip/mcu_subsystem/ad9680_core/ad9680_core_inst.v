	ad9680_core u0 (
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
		.rx_clk        (_connected_to_rx_clk_),        //   input,    width = 1,   if_rx_clk.clk
		.rx_sof        (_connected_to_rx_sof_),        //   input,    width = 4,   if_rx_sof.export
		.rx_data       (_connected_to_rx_data_),       //   input,  width = 128,  if_rx_data.data
		.rx_valid      (_connected_to_rx_valid_),      //   input,    width = 1,            .valid
		.rx_ready      (_connected_to_rx_ready_),      //  output,    width = 1,            .ready
		.adc_clk       (_connected_to_adc_clk_),       //  output,    width = 1,  if_adc_clk.clk
		.adc_enable_0  (_connected_to_adc_enable_0_),  //  output,    width = 1,    adc_ch_0.enable
		.adc_valid_0   (_connected_to_adc_valid_0_),   //  output,    width = 1,            .valid
		.adc_data_0    (_connected_to_adc_data_0_),    //  output,   width = 64,            .data
		.adc_enable_1  (_connected_to_adc_enable_1_),  //  output,    width = 1,    adc_ch_1.enable
		.adc_valid_1   (_connected_to_adc_valid_1_),   //  output,    width = 1,            .valid
		.adc_data_1    (_connected_to_adc_data_1_),    //  output,   width = 64,            .data
		.adc_dovf      (_connected_to_adc_dovf_)       //   input,    width = 1, if_adc_dovf.ovf
	);

