	ad9144_upack u0 (
		.dac_clk         (_connected_to_dac_clk_),         //   input,    width = 1,   if_dac_clk.clk
		.dac_valid       (_connected_to_dac_valid_),       //  output,    width = 1, if_dac_valid.valid
		.dac_sync        (_connected_to_dac_sync_),        //  output,    width = 1,  if_dac_sync.sync
		.dac_data        (_connected_to_dac_data_),        //   input,  width = 128,  if_dac_data.data
		.dac_enable_0    (_connected_to_dac_enable_0_),    //   input,    width = 1,     dac_ch_0.enable
		.dac_valid_0     (_connected_to_dac_valid_0_),     //   input,    width = 1,             .valid
		.dac_valid_out_0 (_connected_to_dac_valid_out_0_), //  output,    width = 1,             .data_valid
		.dac_data_0      (_connected_to_dac_data_0_),      //  output,   width = 64,             .data
		.dac_enable_1    (_connected_to_dac_enable_1_),    //   input,    width = 1,     dac_ch_1.enable
		.dac_valid_1     (_connected_to_dac_valid_1_),     //   input,    width = 1,             .valid
		.dac_valid_out_1 (_connected_to_dac_valid_out_1_), //  output,    width = 1,             .data_valid
		.dac_data_1      (_connected_to_dac_data_1_)       //  output,   width = 64,             .data
	);

