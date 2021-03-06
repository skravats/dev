// ad9680_dma.v

// Generated using ACDS version 18.1.2 277

`timescale 1 ps / 1 ps
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

	axi_dmac #(
		.ID                    (0),
		.DMA_LENGTH_WIDTH      (24),
		.FIFO_SIZE             (8),
		.MAX_BYTES_PER_BURST   (128),
		.DMA_TYPE_SRC          (1),
		.DMA_AXI_PROTOCOL_SRC  (1),
		.DMA_DATA_WIDTH_SRC    (128),
		.AXI_SLICE_SRC         (0),
		.DMA_TYPE_DEST         (0),
		.DMA_AXI_PROTOCOL_DEST (0),
		.DMA_DATA_WIDTH_DEST   (128),
		.AXI_SLICE_DEST        (0),
		.CYCLIC                (0),
		.DMA_2D_TRANSFER       (0),
		.SYNC_TRANSFER_START   (0),
		.ASYNC_CLK_REQ_SRC     (1),
		.ASYNC_CLK_SRC_DEST    (1),
		.ASYNC_CLK_DEST_REQ    (0),
		.ENABLE_DIAGNOSTICS_IF (0)
	) ad9680_dma (
		.s_axi_aclk             (s_axi_aclk),                                                                                                                            //   input,    width = 1,        s_axi_clock.clk
		.s_axi_aresetn          (s_axi_aresetn),                                                                                                                         //   input,    width = 1,        s_axi_reset.reset_n
		.s_axi_awvalid          (s_axi_awvalid),                                                                                                                         //   input,    width = 1,              s_axi.awvalid
		.s_axi_awaddr           (s_axi_awaddr),                                                                                                                          //   input,   width = 12,                   .awaddr
		.s_axi_awprot           (s_axi_awprot),                                                                                                                          //   input,    width = 3,                   .awprot
		.s_axi_awready          (s_axi_awready),                                                                                                                         //  output,    width = 1,                   .awready
		.s_axi_wvalid           (s_axi_wvalid),                                                                                                                          //   input,    width = 1,                   .wvalid
		.s_axi_wdata            (s_axi_wdata),                                                                                                                           //   input,   width = 32,                   .wdata
		.s_axi_wstrb            (s_axi_wstrb),                                                                                                                           //   input,    width = 4,                   .wstrb
		.s_axi_wready           (s_axi_wready),                                                                                                                          //  output,    width = 1,                   .wready
		.s_axi_bvalid           (s_axi_bvalid),                                                                                                                          //  output,    width = 1,                   .bvalid
		.s_axi_bresp            (s_axi_bresp),                                                                                                                           //  output,    width = 2,                   .bresp
		.s_axi_bready           (s_axi_bready),                                                                                                                          //   input,    width = 1,                   .bready
		.s_axi_arvalid          (s_axi_arvalid),                                                                                                                         //   input,    width = 1,                   .arvalid
		.s_axi_araddr           (s_axi_araddr),                                                                                                                          //   input,   width = 12,                   .araddr
		.s_axi_arprot           (s_axi_arprot),                                                                                                                          //   input,    width = 3,                   .arprot
		.s_axi_arready          (s_axi_arready),                                                                                                                         //  output,    width = 1,                   .arready
		.s_axi_rvalid           (s_axi_rvalid),                                                                                                                          //  output,    width = 1,                   .rvalid
		.s_axi_rresp            (s_axi_rresp),                                                                                                                           //  output,    width = 2,                   .rresp
		.s_axi_rdata            (s_axi_rdata),                                                                                                                           //  output,   width = 32,                   .rdata
		.s_axi_rready           (s_axi_rready),                                                                                                                          //   input,    width = 1,                   .rready
		.irq                    (irq),                                                                                                                                   //  output,    width = 1,   interrupt_sender.irq
		.m_dest_axi_aclk        (m_dest_axi_aclk),                                                                                                                       //   input,    width = 1,   m_dest_axi_clock.clk
		.m_dest_axi_aresetn     (m_dest_axi_aresetn),                                                                                                                    //   input,    width = 1,   m_dest_axi_reset.reset_n
		.s_axis_aclk            (s_axis_aclk),                                                                                                                           //   input,    width = 1,     if_s_axis_aclk.clk
		.s_axis_valid           (s_axis_valid),                                                                                                                          //   input,    width = 1,    if_s_axis_valid.valid
		.s_axis_data            (s_axis_data),                                                                                                                           //   input,  width = 128,     if_s_axis_data.data
		.s_axis_ready           (s_axis_ready),                                                                                                                          //  output,    width = 1,    if_s_axis_ready.ready
		.s_axis_xfer_req        (s_axis_xfer_req),                                                                                                                       //  output,    width = 1, if_s_axis_xfer_req.xfer_req
		.m_dest_axi_awvalid     (m_dest_axi_awvalid),                                                                                                                    //  output,    width = 1,         m_dest_axi.awvalid
		.m_dest_axi_awaddr      (m_dest_axi_awaddr),                                                                                                                     //  output,   width = 32,                   .awaddr
		.m_dest_axi_awready     (m_dest_axi_awready),                                                                                                                    //   input,    width = 1,                   .awready
		.m_dest_axi_wvalid      (m_dest_axi_wvalid),                                                                                                                     //  output,    width = 1,                   .wvalid
		.m_dest_axi_wdata       (m_dest_axi_wdata),                                                                                                                      //  output,  width = 128,                   .wdata
		.m_dest_axi_wstrb       (m_dest_axi_wstrb),                                                                                                                      //  output,   width = 16,                   .wstrb
		.m_dest_axi_wready      (m_dest_axi_wready),                                                                                                                     //   input,    width = 1,                   .wready
		.m_dest_axi_bvalid      (m_dest_axi_bvalid),                                                                                                                     //   input,    width = 1,                   .bvalid
		.m_dest_axi_bresp       (m_dest_axi_bresp),                                                                                                                      //   input,    width = 2,                   .bresp
		.m_dest_axi_bready      (m_dest_axi_bready),                                                                                                                     //  output,    width = 1,                   .bready
		.m_dest_axi_arvalid     (m_dest_axi_arvalid),                                                                                                                    //  output,    width = 1,                   .arvalid
		.m_dest_axi_araddr      (m_dest_axi_araddr),                                                                                                                     //  output,   width = 32,                   .araddr
		.m_dest_axi_arready     (m_dest_axi_arready),                                                                                                                    //   input,    width = 1,                   .arready
		.m_dest_axi_rvalid      (m_dest_axi_rvalid),                                                                                                                     //   input,    width = 1,                   .rvalid
		.m_dest_axi_rresp       (m_dest_axi_rresp),                                                                                                                      //   input,    width = 2,                   .rresp
		.m_dest_axi_rdata       (m_dest_axi_rdata),                                                                                                                      //   input,  width = 128,                   .rdata
		.m_dest_axi_rready      (m_dest_axi_rready),                                                                                                                     //  output,    width = 1,                   .rready
		.m_dest_axi_awlen       (m_dest_axi_awlen),                                                                                                                      //  output,    width = 8,                   .awlen
		.m_dest_axi_awsize      (m_dest_axi_awsize),                                                                                                                     //  output,    width = 3,                   .awsize
		.m_dest_axi_awburst     (m_dest_axi_awburst),                                                                                                                    //  output,    width = 2,                   .awburst
		.m_dest_axi_awcache     (m_dest_axi_awcache),                                                                                                                    //  output,    width = 4,                   .awcache
		.m_dest_axi_awprot      (m_dest_axi_awprot),                                                                                                                     //  output,    width = 3,                   .awprot
		.m_dest_axi_wlast       (m_dest_axi_wlast),                                                                                                                      //  output,    width = 1,                   .wlast
		.m_dest_axi_arlen       (m_dest_axi_arlen),                                                                                                                      //  output,    width = 8,                   .arlen
		.m_dest_axi_arsize      (m_dest_axi_arsize),                                                                                                                     //  output,    width = 3,                   .arsize
		.m_dest_axi_arburst     (m_dest_axi_arburst),                                                                                                                    //  output,    width = 2,                   .arburst
		.m_dest_axi_arcache     (m_dest_axi_arcache),                                                                                                                    //  output,    width = 4,                   .arcache
		.m_dest_axi_arprot      (m_dest_axi_arprot),                                                                                                                     //  output,    width = 3,                   .arprot
		.s_axis_last            (1'b0),                                                                                                                                  // (terminated),                                  
		.s_axis_user            (1'b1),                                                                                                                                  // (terminated),                                  
		.m_dest_axi_awid        (),                                                                                                                                      // (terminated),                                  
		.m_dest_axi_awlock      (),                                                                                                                                      // (terminated),                                  
		.m_dest_axi_wid         (),                                                                                                                                      // (terminated),                                  
		.m_dest_axi_arid        (),                                                                                                                                      // (terminated),                                  
		.m_dest_axi_arlock      (),                                                                                                                                      // (terminated),                                  
		.m_dest_axi_rid         (1'b0),                                                                                                                                  // (terminated),                                  
		.m_dest_axi_bid         (1'b0),                                                                                                                                  // (terminated),                                  
		.m_dest_axi_rlast       (1'b0),                                                                                                                                  // (terminated),                                  
		.m_src_axi_aclk         (1'b0),                                                                                                                                  // (terminated),                                  
		.m_src_axi_aresetn      (1'b1),                                                                                                                                  // (terminated),                                  
		.m_axis_aclk            (1'b0),                                                                                                                                  // (terminated),                                  
		.m_axis_valid           (),                                                                                                                                      // (terminated),                                  
		.m_axis_data            (),                                                                                                                                      // (terminated),                                  
		.m_axis_ready           (1'b0),                                                                                                                                  // (terminated),                                  
		.m_axis_last            (),                                                                                                                                      // (terminated),                                  
		.m_axis_xfer_req        (),                                                                                                                                      // (terminated),                                  
		.fifo_rd_clk            (1'b0),                                                                                                                                  // (terminated),                                  
		.fifo_rd_en             (1'b0),                                                                                                                                  // (terminated),                                  
		.fifo_rd_valid          (),                                                                                                                                      // (terminated),                                  
		.fifo_rd_dout           (),                                                                                                                                      // (terminated),                                  
		.fifo_rd_underflow      (),                                                                                                                                      // (terminated),                                  
		.fifo_rd_xfer_req       (),                                                                                                                                      // (terminated),                                  
		.fifo_wr_clk            (1'b0),                                                                                                                                  // (terminated),                                  
		.fifo_wr_en             (1'b0),                                                                                                                                  // (terminated),                                  
		.fifo_wr_din            (128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000), // (terminated),                                  
		.fifo_wr_overflow       (),                                                                                                                                      // (terminated),                                  
		.fifo_wr_sync           (1'b0),                                                                                                                                  // (terminated),                                  
		.fifo_wr_xfer_req       (),                                                                                                                                      // (terminated),                                  
		.dest_diag_level_bursts (),                                                                                                                                      // (terminated),                                  
		.m_src_axi_awvalid      (),                                                                                                                                      // (terminated),                                  
		.m_src_axi_awaddr       (),                                                                                                                                      // (terminated),                                  
		.m_src_axi_awready      (1'b0),                                                                                                                                  // (terminated),                                  
		.m_src_axi_wvalid       (),                                                                                                                                      // (terminated),                                  
		.m_src_axi_wdata        (),                                                                                                                                      // (terminated),                                  
		.m_src_axi_wstrb        (),                                                                                                                                      // (terminated),                                  
		.m_src_axi_wready       (1'b0),                                                                                                                                  // (terminated),                                  
		.m_src_axi_bvalid       (1'b0),                                                                                                                                  // (terminated),                                  
		.m_src_axi_bresp        (2'b00),                                                                                                                                 // (terminated),                                  
		.m_src_axi_bready       (),                                                                                                                                      // (terminated),                                  
		.m_src_axi_arvalid      (),                                                                                                                                      // (terminated),                                  
		.m_src_axi_araddr       (),                                                                                                                                      // (terminated),                                  
		.m_src_axi_arready      (1'b0),                                                                                                                                  // (terminated),                                  
		.m_src_axi_rvalid       (1'b0),                                                                                                                                  // (terminated),                                  
		.m_src_axi_rresp        (2'b00),                                                                                                                                 // (terminated),                                  
		.m_src_axi_rdata        (128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000), // (terminated),                                  
		.m_src_axi_rready       (),                                                                                                                                      // (terminated),                                  
		.m_src_axi_awlen        (),                                                                                                                                      // (terminated),                                  
		.m_src_axi_awsize       (),                                                                                                                                      // (terminated),                                  
		.m_src_axi_awburst      (),                                                                                                                                      // (terminated),                                  
		.m_src_axi_awcache      (),                                                                                                                                      // (terminated),                                  
		.m_src_axi_awprot       (),                                                                                                                                      // (terminated),                                  
		.m_src_axi_wlast        (),                                                                                                                                      // (terminated),                                  
		.m_src_axi_arlen        (),                                                                                                                                      // (terminated),                                  
		.m_src_axi_arsize       (),                                                                                                                                      // (terminated),                                  
		.m_src_axi_arburst      (),                                                                                                                                      // (terminated),                                  
		.m_src_axi_arcache      (),                                                                                                                                      // (terminated),                                  
		.m_src_axi_arprot       (),                                                                                                                                      // (terminated),                                  
		.m_src_axi_awid         (),                                                                                                                                      // (terminated),                                  
		.m_src_axi_awlock       (),                                                                                                                                      // (terminated),                                  
		.m_src_axi_wid          (),                                                                                                                                      // (terminated),                                  
		.m_src_axi_arid         (),                                                                                                                                      // (terminated),                                  
		.m_src_axi_arlock       (),                                                                                                                                      // (terminated),                                  
		.m_src_axi_rid          (1'b0),                                                                                                                                  // (terminated),                                  
		.m_src_axi_bid          (1'b0),                                                                                                                                  // (terminated),                                  
		.m_src_axi_rlast        (1'b0)                                                                                                                                   // (terminated),                                  
	);

endmodule
