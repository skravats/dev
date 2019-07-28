	mcu_subsystem_nios_custom_instr_floating_point_2_0 u0 (
		.s1_dataa     (_connected_to_s1_dataa_),     //   input,  width = 32, s1.dataa
		.s1_datab     (_connected_to_s1_datab_),     //   input,  width = 32,   .datab
		.s1_n         (_connected_to_s1_n_),         //   input,   width = 4,   .n
		.s1_result    (_connected_to_s1_result_),    //  output,  width = 32,   .result
		.s2_clk       (_connected_to_s2_clk_),       //   input,   width = 1, s2.clk
		.s2_clk_en    (_connected_to_s2_clk_en_),    //   input,   width = 1,   .clk_en
		.s2_dataa     (_connected_to_s2_dataa_),     //   input,  width = 32,   .dataa
		.s2_datab     (_connected_to_s2_datab_),     //   input,  width = 32,   .datab
		.s2_n         (_connected_to_s2_n_),         //   input,   width = 3,   .n
		.s2_reset     (_connected_to_s2_reset_),     //   input,   width = 1,   .reset
		.s2_reset_req (_connected_to_s2_reset_req_), //   input,   width = 1,   .reset_req
		.s2_start     (_connected_to_s2_start_),     //   input,   width = 1,   .start
		.s2_done      (_connected_to_s2_done_),      //  output,   width = 1,   .done
		.s2_result    (_connected_to_s2_result_)     //  output,  width = 32,   .result
	);

