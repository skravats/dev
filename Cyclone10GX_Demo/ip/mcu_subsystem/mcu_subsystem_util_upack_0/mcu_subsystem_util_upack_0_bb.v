module mcu_subsystem_util_upack_0 (
		input  wire         dac_clk,         //   if_dac_clk.clk
		output wire         dac_valid,       // if_dac_valid.valid
		output wire         dac_sync,        //  if_dac_sync.sync
		input  wire [127:0] dac_data,        //  if_dac_data.data
		input  wire         dac_enable_0,    //     dac_ch_0.enable
		input  wire         dac_valid_0,     //             .valid
		output wire         dac_valid_out_0, //             .data_valid
		output wire [63:0]  dac_data_0,      //             .data
		input  wire         dac_enable_1,    //     dac_ch_1.enable
		input  wire         dac_valid_1,     //             .valid
		output wire         dac_valid_out_1, //             .data_valid
		output wire [63:0]  dac_data_1       //             .data
	);
endmodule

