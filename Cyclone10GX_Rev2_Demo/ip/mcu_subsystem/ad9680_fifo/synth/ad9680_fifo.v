// ad9680_fifo.v

// Generated using ACDS version 18.1.2 277

`timescale 1 ps / 1 ps
module ad9680_fifo (
		input  wire         adc_clk,         //         if_adc_clk.clk
		input  wire         adc_rst,         //         if_adc_rst.reset
		input  wire         adc_wr,          //          if_adc_wr.valid
		input  wire [127:0] adc_wdata,       //       if_adc_wdata.data
		output wire         adc_wovf,        //        if_adc_wovf.ovf
		input  wire         dma_clk,         //         if_dma_clk.clk
		output wire         dma_wr,          //          if_dma_wr.valid
		output wire [127:0] dma_wdata,       //       if_dma_wdata.data
		input  wire         dma_wready,      //      if_dma_wready.ready
		input  wire         dma_xfer_req,    //    if_dma_xfer_req.xfer_req
		output wire [3:0]   dma_xfer_status  // if_dma_xfer_status.xfer_status
	);

	util_adcfifo #(
		.DEVICE_TYPE       (1),
		.ADC_DATA_WIDTH    (128),
		.DMA_DATA_WIDTH    (128),
		.DMA_READY_ENABLE  (1),
		.DMA_ADDRESS_WIDTH (10)
	) ad9680_fifo (
		.adc_clk         (adc_clk),         //   input,    width = 1,         if_adc_clk.clk
		.adc_rst         (adc_rst),         //   input,    width = 1,         if_adc_rst.reset
		.adc_wr          (adc_wr),          //   input,    width = 1,          if_adc_wr.valid
		.adc_wdata       (adc_wdata),       //   input,  width = 128,       if_adc_wdata.data
		.adc_wovf        (adc_wovf),        //  output,    width = 1,        if_adc_wovf.ovf
		.dma_clk         (dma_clk),         //   input,    width = 1,         if_dma_clk.clk
		.dma_wr          (dma_wr),          //  output,    width = 1,          if_dma_wr.valid
		.dma_wdata       (dma_wdata),       //  output,  width = 128,       if_dma_wdata.data
		.dma_wready      (dma_wready),      //   input,    width = 1,      if_dma_wready.ready
		.dma_xfer_req    (dma_xfer_req),    //   input,    width = 1,    if_dma_xfer_req.xfer_req
		.dma_xfer_status (dma_xfer_status)  //  output,    width = 4, if_dma_xfer_status.xfer_status
	);

endmodule
