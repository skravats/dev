// ad9144_fifo.v

// Generated using ACDS version 18.1.2 277

`timescale 1 ps / 1 ps
module ad9144_fifo (
		input  wire         dma_clk,       //       if_dma_clk.clk
		input  wire         dma_rst,       //       if_dma_rst.reset
		input  wire         dma_valid,     //     if_dma_valid.valid
		input  wire [127:0] dma_data,      //      if_dma_data.data
		output wire         dma_ready,     //     if_dma_ready.ready
		input  wire         dma_xfer_req,  //  if_dma_xfer_req.xfer_req
		input  wire         dma_xfer_last, // if_dma_xfer_last.last
		input  wire         dac_clk,       //       if_dac_clk.clk
		input  wire         dac_rst,       //       if_dac_rst.reset
		input  wire         dac_valid,     //     if_dac_valid.valid
		output wire [127:0] dac_data,      //      if_dac_data.data
		output wire         dac_xfer_out,  //  if_dac_xfer_out.xfer_req
		output wire         dac_dunf,      //      if_dac_dunf.unf
		input  wire         bypass         //        if_bypass.bypass
	);

	util_dacfifo #(
		.ADDRESS_WIDTH (10),
		.DATA_WIDTH    (128)
	) ad9144_fifo (
		.dma_clk       (dma_clk),       //   input,    width = 1,       if_dma_clk.clk
		.dma_rst       (dma_rst),       //   input,    width = 1,       if_dma_rst.reset
		.dma_valid     (dma_valid),     //   input,    width = 1,     if_dma_valid.valid
		.dma_data      (dma_data),      //   input,  width = 128,      if_dma_data.data
		.dma_ready     (dma_ready),     //  output,    width = 1,     if_dma_ready.ready
		.dma_xfer_req  (dma_xfer_req),  //   input,    width = 1,  if_dma_xfer_req.xfer_req
		.dma_xfer_last (dma_xfer_last), //   input,    width = 1, if_dma_xfer_last.last
		.dac_clk       (dac_clk),       //   input,    width = 1,       if_dac_clk.clk
		.dac_rst       (dac_rst),       //   input,    width = 1,       if_dac_rst.reset
		.dac_valid     (dac_valid),     //   input,    width = 1,     if_dac_valid.valid
		.dac_data      (dac_data),      //  output,  width = 128,      if_dac_data.data
		.dac_xfer_out  (dac_xfer_out),  //  output,    width = 1,  if_dac_xfer_out.xfer_req
		.dac_dunf      (dac_dunf),      //  output,    width = 1,      if_dac_dunf.unf
		.bypass        (bypass)         //   input,    width = 1,        if_bypass.bypass
	);

endmodule
