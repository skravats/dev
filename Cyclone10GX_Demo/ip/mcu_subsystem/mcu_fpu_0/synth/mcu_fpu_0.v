// mcu_fpu_0.v

// Generated using ACDS version 18.1.2 277

`timescale 1 ps / 1 ps
module mcu_fpu_0 (
		input  wire [31:0] s1_dataa,     // s1.dataa
		input  wire [31:0] s1_datab,     //   .datab
		input  wire [3:0]  s1_n,         //   .n
		output wire [31:0] s1_result,    //   .result
		input  wire        s2_clk,       // s2.clk
		input  wire        s2_clk_en,    //   .clk_en
		input  wire [31:0] s2_dataa,     //   .dataa
		input  wire [31:0] s2_datab,     //   .datab
		input  wire [2:0]  s2_n,         //   .n
		input  wire        s2_reset,     //   .reset
		input  wire        s2_reset_req, //   .reset_req
		input  wire        s2_start,     //   .start
		output wire        s2_done,      //   .done
		output wire [31:0] s2_result     //   .result
	);

	mcu_fpu_0_altera_nios_custom_instr_floating_point_2_181_3quluwy #(
		.arithmetic_present (1),
		.root_present       (1),
		.conversion_present (1),
		.comparison_present (1)
	) mcu_fpu_0 (
		.s1_dataa     (s1_dataa),     //   input,  width = 32, s1.dataa
		.s1_datab     (s1_datab),     //   input,  width = 32,   .datab
		.s1_n         (s1_n),         //   input,   width = 4,   .n
		.s1_result    (s1_result),    //  output,  width = 32,   .result
		.s2_clk       (s2_clk),       //   input,   width = 1, s2.clk
		.s2_clk_en    (s2_clk_en),    //   input,   width = 1,   .clk_en
		.s2_dataa     (s2_dataa),     //   input,  width = 32,   .dataa
		.s2_datab     (s2_datab),     //   input,  width = 32,   .datab
		.s2_n         (s2_n),         //   input,   width = 3,   .n
		.s2_reset     (s2_reset),     //   input,   width = 1,   .reset
		.s2_reset_req (s2_reset_req), //   input,   width = 1,   .reset_req
		.s2_start     (s2_start),     //   input,   width = 1,   .start
		.s2_done      (s2_done),      //  output,   width = 1,   .done
		.s2_result    (s2_result)     //  output,  width = 32,   .result
	);

endmodule