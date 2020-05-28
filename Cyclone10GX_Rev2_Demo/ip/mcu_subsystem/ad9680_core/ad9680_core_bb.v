module ad9680_core (
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
		input  wire         rx_clk,        //   if_rx_clk.clk
		input  wire [3:0]   rx_sof,        //   if_rx_sof.export
		input  wire [127:0] rx_data,       //  if_rx_data.data
		input  wire         rx_valid,      //            .valid
		output wire         rx_ready,      //            .ready
		output wire         adc_clk,       //  if_adc_clk.clk
		output wire         adc_enable_0,  //    adc_ch_0.enable
		output wire         adc_valid_0,   //            .valid
		output wire [63:0]  adc_data_0,    //            .data
		output wire         adc_enable_1,  //    adc_ch_1.enable
		output wire         adc_valid_1,   //            .valid
		output wire [63:0]  adc_data_1,    //            .data
		input  wire         adc_dovf       // if_adc_dovf.ovf
	);
endmodule

