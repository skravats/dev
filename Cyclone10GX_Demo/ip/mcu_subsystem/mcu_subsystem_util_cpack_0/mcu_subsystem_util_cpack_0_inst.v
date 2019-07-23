	mcu_subsystem_util_cpack_0 u0 (
		.adc_clk      (_connected_to_adc_clk_),      //   input,    width = 1,   if_adc_clk.clk
		.adc_rst      (_connected_to_adc_rst_),      //   input,    width = 1,   if_adc_rst.reset
		.adc_valid    (_connected_to_adc_valid_),    //  output,    width = 1, if_adc_valid.valid
		.adc_sync     (_connected_to_adc_sync_),     //  output,    width = 1,  if_adc_sync.sync
		.adc_data     (_connected_to_adc_data_),     //  output,  width = 128,  if_adc_data.data
		.adc_enable_0 (_connected_to_adc_enable_0_), //   input,    width = 1,     adc_ch_0.enable
		.adc_valid_0  (_connected_to_adc_valid_0_),  //   input,    width = 1,             .valid
		.adc_data_0   (_connected_to_adc_data_0_),   //   input,   width = 64,             .data
		.adc_enable_1 (_connected_to_adc_enable_1_), //   input,    width = 1,     adc_ch_1.enable
		.adc_valid_1  (_connected_to_adc_valid_1_),  //   input,    width = 1,             .valid
		.adc_data_1   (_connected_to_adc_data_1_)    //   input,   width = 64,             .data
	);

