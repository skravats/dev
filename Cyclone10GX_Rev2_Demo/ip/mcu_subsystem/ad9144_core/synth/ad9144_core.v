// ad9144_core.v

// Generated using ACDS version 18.1.2 277

`timescale 1 ps / 1 ps
module ad9144_core (
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

	axi_ad9144 #(
		.ID             (0),
		.QUAD_OR_DUAL_N (0)
	) ad9144_core (
		.s_axi_aclk    (s_axi_aclk),                                                           //   input,    width = 1, s_axi_clock.clk
		.s_axi_aresetn (s_axi_aresetn),                                                        //   input,    width = 1, s_axi_reset.reset_n
		.s_axi_awvalid (s_axi_awvalid),                                                        //   input,    width = 1,       s_axi.awvalid
		.s_axi_awaddr  (s_axi_awaddr),                                                         //   input,   width = 16,            .awaddr
		.s_axi_awprot  (s_axi_awprot),                                                         //   input,    width = 3,            .awprot
		.s_axi_awready (s_axi_awready),                                                        //  output,    width = 1,            .awready
		.s_axi_wvalid  (s_axi_wvalid),                                                         //   input,    width = 1,            .wvalid
		.s_axi_wdata   (s_axi_wdata),                                                          //   input,   width = 32,            .wdata
		.s_axi_wstrb   (s_axi_wstrb),                                                          //   input,    width = 4,            .wstrb
		.s_axi_wready  (s_axi_wready),                                                         //  output,    width = 1,            .wready
		.s_axi_bvalid  (s_axi_bvalid),                                                         //  output,    width = 1,            .bvalid
		.s_axi_bresp   (s_axi_bresp),                                                          //  output,    width = 2,            .bresp
		.s_axi_bready  (s_axi_bready),                                                         //   input,    width = 1,            .bready
		.s_axi_arvalid (s_axi_arvalid),                                                        //   input,    width = 1,            .arvalid
		.s_axi_araddr  (s_axi_araddr),                                                         //   input,   width = 16,            .araddr
		.s_axi_arprot  (s_axi_arprot),                                                         //   input,    width = 3,            .arprot
		.s_axi_arready (s_axi_arready),                                                        //  output,    width = 1,            .arready
		.s_axi_rvalid  (s_axi_rvalid),                                                         //  output,    width = 1,            .rvalid
		.s_axi_rresp   (s_axi_rresp),                                                          //  output,    width = 2,            .rresp
		.s_axi_rdata   (s_axi_rdata),                                                          //  output,   width = 32,            .rdata
		.s_axi_rready  (s_axi_rready),                                                         //   input,    width = 1,            .rready
		.tx_clk        (tx_clk),                                                               //   input,    width = 1,   if_tx_clk.clk
		.tx_data       (tx_data),                                                              //  output,  width = 128,  if_tx_data.data
		.tx_valid      (tx_valid),                                                             //  output,    width = 1,            .valid
		.tx_ready      (tx_ready),                                                             //   input,    width = 1,            .ready
		.dac_clk       (dac_clk),                                                              //  output,    width = 1,  if_dac_clk.clk
		.dac_enable_0  (dac_enable_0),                                                         //  output,    width = 1,    dac_ch_0.enable
		.dac_valid_0   (dac_valid_0),                                                          //  output,    width = 1,            .valid
		.dac_ddata_0   (dac_ddata_0),                                                          //   input,   width = 64,            .data
		.dac_enable_1  (dac_enable_1),                                                         //  output,    width = 1,    dac_ch_1.enable
		.dac_valid_1   (dac_valid_1),                                                          //  output,    width = 1,            .valid
		.dac_ddata_1   (dac_ddata_1),                                                          //   input,   width = 64,            .data
		.dac_dunf      (dac_dunf),                                                             //   input,    width = 1, if_dac_dunf.unf
		.dac_enable_2  (),                                                                     // (terminated),                           
		.dac_valid_2   (),                                                                     // (terminated),                           
		.dac_ddata_2   (64'b0000000000000000000000000000000000000000000000000000000000000000), // (terminated),                           
		.dac_enable_3  (),                                                                     // (terminated),                           
		.dac_valid_3   (),                                                                     // (terminated),                           
		.dac_ddata_3   (64'b0000000000000000000000000000000000000000000000000000000000000000)  // (terminated),                           
	);

endmodule
