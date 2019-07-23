module mcu_subsystem_axi_ad9144_0 (
		input  wire         s_axi_aclk,    // s_axi_clock.clk
		input  wire         s_axi_aresetn, // s_axi_reset.reset_n
		input  wire         s_axi_awvalid, //       s_axi.awvalid
		input  wire [15:0]  s_axi_awaddr,  //            .awaddr
		input  wire [2:0]   s_axi_awprot,  //            .awprot
		output wire         s_axi_awready, //            .awready
		input  wire         s_axi_wvalid,  //            .wvalid
		input  wire [31:0]  s_axi_wdata,   //            .wdata
		input  wire [3:0]   s_axi_wstrb,   //            .wstrb
		output wire         s_axi_wready,  //            .wready
		output wire         s_axi_bvalid,  //            .bvalid
		output wire [1:0]   s_axi_bresp,   //            .bresp
		input  wire         s_axi_bready,  //            .bready
		input  wire         s_axi_arvalid, //            .arvalid
		input  wire [15:0]  s_axi_araddr,  //            .araddr
		input  wire [2:0]   s_axi_arprot,  //            .arprot
		output wire         s_axi_arready, //            .arready
		output wire         s_axi_rvalid,  //            .rvalid
		output wire [1:0]   s_axi_rresp,   //            .rresp
		output wire [31:0]  s_axi_rdata,   //            .rdata
		input  wire         s_axi_rready,  //            .rready
		input  wire         tx_clk,        //   if_tx_clk.clk
		output wire [127:0] tx_data,       //  if_tx_data.data
		output wire         tx_valid,      //            .valid
		input  wire         tx_ready,      //            .ready
		output wire         dac_clk,       //  if_dac_clk.clk
		output wire         dac_enable_0,  //    dac_ch_0.enable
		output wire         dac_valid_0,   //            .valid
		input  wire [63:0]  dac_ddata_0,   //            .data
		output wire         dac_enable_1,  //    dac_ch_1.enable
		output wire         dac_valid_1,   //            .valid
		input  wire [63:0]  dac_ddata_1,   //            .data
		input  wire         dac_dunf       // if_dac_dunf.unf
	);
endmodule

