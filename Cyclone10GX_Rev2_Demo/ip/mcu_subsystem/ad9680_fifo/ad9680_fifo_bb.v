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
endmodule

