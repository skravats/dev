module mcu_subsystem_util_dacfifo_0 (
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
endmodule

