module ad9680_dma (
		input  wire         s_axi_aclk,         //        s_axi_clock.clk
		input  wire         s_axi_aresetn,      //        s_axi_reset.reset_n
		input  wire         s_axi_awvalid,      //              s_axi.awvalid
		input  wire [11:0]  s_axi_awaddr,       //                   .awaddr
		input  wire [2:0]   s_axi_awprot,       //                   .awprot
		output wire         s_axi_awready,      //                   .awready
		input  wire         s_axi_wvalid,       //                   .wvalid
		input  wire [31:0]  s_axi_wdata,        //                   .wdata
		input  wire [3:0]   s_axi_wstrb,        //                   .wstrb
		output wire         s_axi_wready,       //                   .wready
		output wire         s_axi_bvalid,       //                   .bvalid
		output wire [1:0]   s_axi_bresp,        //                   .bresp
		input  wire         s_axi_bready,       //                   .bready
		input  wire         s_axi_arvalid,      //                   .arvalid
		input  wire [11:0]  s_axi_araddr,       //                   .araddr
		input  wire [2:0]   s_axi_arprot,       //                   .arprot
		output wire         s_axi_arready,      //                   .arready
		output wire         s_axi_rvalid,       //                   .rvalid
		output wire [1:0]   s_axi_rresp,        //                   .rresp
		output wire [31:0]  s_axi_rdata,        //                   .rdata
		input  wire         s_axi_rready,       //                   .rready
		output wire         irq,                //   interrupt_sender.irq
		input  wire         m_dest_axi_aclk,    //   m_dest_axi_clock.clk
		input  wire         m_dest_axi_aresetn, //   m_dest_axi_reset.reset_n
		input  wire         s_axis_aclk,        //     if_s_axis_aclk.clk
		input  wire         s_axis_valid,       //    if_s_axis_valid.valid
		input  wire [127:0] s_axis_data,        //     if_s_axis_data.data
		output wire         s_axis_ready,       //    if_s_axis_ready.ready
		output wire         s_axis_xfer_req,    // if_s_axis_xfer_req.xfer_req
		output wire         m_dest_axi_awvalid, //         m_dest_axi.awvalid
		output wire [31:0]  m_dest_axi_awaddr,  //                   .awaddr
		input  wire         m_dest_axi_awready, //                   .awready
		output wire         m_dest_axi_wvalid,  //                   .wvalid
		output wire [127:0] m_dest_axi_wdata,   //                   .wdata
		output wire [15:0]  m_dest_axi_wstrb,   //                   .wstrb
		input  wire         m_dest_axi_wready,  //                   .wready
		input  wire         m_dest_axi_bvalid,  //                   .bvalid
		input  wire [1:0]   m_dest_axi_bresp,   //                   .bresp
		output wire         m_dest_axi_bready,  //                   .bready
		output wire         m_dest_axi_arvalid, //                   .arvalid
		output wire [31:0]  m_dest_axi_araddr,  //                   .araddr
		input  wire         m_dest_axi_arready, //                   .arready
		input  wire         m_dest_axi_rvalid,  //                   .rvalid
		input  wire [1:0]   m_dest_axi_rresp,   //                   .rresp
		input  wire [127:0] m_dest_axi_rdata,   //                   .rdata
		output wire         m_dest_axi_rready,  //                   .rready
		output wire [7:0]   m_dest_axi_awlen,   //                   .awlen
		output wire [2:0]   m_dest_axi_awsize,  //                   .awsize
		output wire [1:0]   m_dest_axi_awburst, //                   .awburst
		output wire [3:0]   m_dest_axi_awcache, //                   .awcache
		output wire [2:0]   m_dest_axi_awprot,  //                   .awprot
		output wire         m_dest_axi_wlast,   //                   .wlast
		output wire [7:0]   m_dest_axi_arlen,   //                   .arlen
		output wire [2:0]   m_dest_axi_arsize,  //                   .arsize
		output wire [1:0]   m_dest_axi_arburst, //                   .arburst
		output wire [3:0]   m_dest_axi_arcache, //                   .arcache
		output wire [2:0]   m_dest_axi_arprot   //                   .arprot
	);
endmodule

