// ad9144_upack.v

// Generated using ACDS version 18.1.2 277

`timescale 1 ps / 1 ps
module ad9144_upack (
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

	util_upack #(
		.CHANNEL_DATA_WIDTH (64),
		.NUM_OF_CHANNELS    (2)
	) ad9144_upack (
		.dac_clk         (dac_clk),         //   input,    width = 1,   if_dac_clk.clk
		.dac_valid       (dac_valid),       //  output,    width = 1, if_dac_valid.valid
		.dac_sync        (dac_sync),        //  output,    width = 1,  if_dac_sync.sync
		.dac_data        (dac_data),        //   input,  width = 128,  if_dac_data.data
		.dac_enable_0    (dac_enable_0),    //   input,    width = 1,     dac_ch_0.enable
		.dac_valid_0     (dac_valid_0),     //   input,    width = 1,             .valid
		.dac_valid_out_0 (dac_valid_out_0), //  output,    width = 1,             .data_valid
		.dac_data_0      (dac_data_0),      //  output,   width = 64,             .data
		.dac_enable_1    (dac_enable_1),    //   input,    width = 1,     dac_ch_1.enable
		.dac_valid_1     (dac_valid_1),     //   input,    width = 1,             .valid
		.dac_valid_out_1 (dac_valid_out_1), //  output,    width = 1,             .data_valid
		.dac_data_1      (dac_data_1),      //  output,   width = 64,             .data
		.dac_enable_2    (1'b0),            // (terminated),                            
		.dac_valid_2     (1'b0),            // (terminated),                            
		.dac_valid_out_2 (),                // (terminated),                            
		.dac_data_2      (),                // (terminated),                            
		.dac_enable_3    (1'b0),            // (terminated),                            
		.dac_valid_3     (1'b0),            // (terminated),                            
		.dac_valid_out_3 (),                // (terminated),                            
		.dac_data_3      (),                // (terminated),                            
		.dac_enable_4    (1'b0),            // (terminated),                            
		.dac_valid_4     (1'b0),            // (terminated),                            
		.dac_valid_out_4 (),                // (terminated),                            
		.dac_data_4      (),                // (terminated),                            
		.dac_enable_5    (1'b0),            // (terminated),                            
		.dac_valid_5     (1'b0),            // (terminated),                            
		.dac_valid_out_5 (),                // (terminated),                            
		.dac_data_5      (),                // (terminated),                            
		.dac_enable_6    (1'b0),            // (terminated),                            
		.dac_valid_6     (1'b0),            // (terminated),                            
		.dac_valid_out_6 (),                // (terminated),                            
		.dac_data_6      (),                // (terminated),                            
		.dac_enable_7    (1'b0),            // (terminated),                            
		.dac_valid_7     (1'b0),            // (terminated),                            
		.dac_valid_out_7 (),                // (terminated),                            
		.dac_data_7      ()                 // (terminated),                            
	);

endmodule
