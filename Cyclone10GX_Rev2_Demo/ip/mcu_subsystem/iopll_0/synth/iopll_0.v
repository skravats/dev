// iopll_0.v

// Generated using ACDS version 18.1.2 277

`timescale 1 ps / 1 ps
module iopll_0 (
		input  wire  rst,      //   reset.reset
		input  wire  refclk,   //  refclk.clk
		output wire  locked,   //  locked.export
		output wire  outclk_0, // outclk0.clk
		output wire  outclk_1, // outclk1.clk
		output wire  outclk_2  // outclk2.clk
	);

	iopll_0_altera_iopll_181_z3743by iopll_0 (
		.rst      (rst),      //   input,  width = 1,   reset.reset
		.refclk   (refclk),   //   input,  width = 1,  refclk.clk
		.locked   (locked),   //  output,  width = 1,  locked.export
		.outclk_0 (outclk_0), //  output,  width = 1, outclk0.clk
		.outclk_1 (outclk_1), //  output,  width = 1, outclk1.clk
		.outclk_2 (outclk_2)  //  output,  width = 1, outclk2.clk
	);

endmodule
