	mcu_subsystem_util_dacfifo_0 u0 (
		.dma_clk       (_connected_to_dma_clk_),       //   input,    width = 1,       if_dma_clk.clk
		.dma_rst       (_connected_to_dma_rst_),       //   input,    width = 1,       if_dma_rst.reset
		.dma_valid     (_connected_to_dma_valid_),     //   input,    width = 1,     if_dma_valid.valid
		.dma_data      (_connected_to_dma_data_),      //   input,  width = 128,      if_dma_data.data
		.dma_ready     (_connected_to_dma_ready_),     //  output,    width = 1,     if_dma_ready.ready
		.dma_xfer_req  (_connected_to_dma_xfer_req_),  //   input,    width = 1,  if_dma_xfer_req.xfer_req
		.dma_xfer_last (_connected_to_dma_xfer_last_), //   input,    width = 1, if_dma_xfer_last.last
		.dac_clk       (_connected_to_dac_clk_),       //   input,    width = 1,       if_dac_clk.clk
		.dac_rst       (_connected_to_dac_rst_),       //   input,    width = 1,       if_dac_rst.reset
		.dac_valid     (_connected_to_dac_valid_),     //   input,    width = 1,     if_dac_valid.valid
		.dac_data      (_connected_to_dac_data_),      //  output,  width = 128,      if_dac_data.data
		.dac_xfer_out  (_connected_to_dac_xfer_out_),  //  output,    width = 1,  if_dac_xfer_out.xfer_req
		.dac_dunf      (_connected_to_dac_dunf_),      //  output,    width = 1,      if_dac_dunf.unf
		.bypass        (_connected_to_bypass_)         //   input,    width = 1,        if_bypass.bypass
	);

