	ad9680_fifo u0 (
		.adc_clk         (_connected_to_adc_clk_),         //   input,    width = 1,         if_adc_clk.clk
		.adc_rst         (_connected_to_adc_rst_),         //   input,    width = 1,         if_adc_rst.reset
		.adc_wr          (_connected_to_adc_wr_),          //   input,    width = 1,          if_adc_wr.valid
		.adc_wdata       (_connected_to_adc_wdata_),       //   input,  width = 128,       if_adc_wdata.data
		.adc_wovf        (_connected_to_adc_wovf_),        //  output,    width = 1,        if_adc_wovf.ovf
		.dma_clk         (_connected_to_dma_clk_),         //   input,    width = 1,         if_dma_clk.clk
		.dma_wr          (_connected_to_dma_wr_),          //  output,    width = 1,          if_dma_wr.valid
		.dma_wdata       (_connected_to_dma_wdata_),       //  output,  width = 128,       if_dma_wdata.data
		.dma_wready      (_connected_to_dma_wready_),      //   input,    width = 1,      if_dma_wready.ready
		.dma_xfer_req    (_connected_to_dma_xfer_req_),    //   input,    width = 1,    if_dma_xfer_req.xfer_req
		.dma_xfer_status (_connected_to_dma_xfer_status_)  //  output,    width = 4, if_dma_xfer_status.xfer_status
	);

