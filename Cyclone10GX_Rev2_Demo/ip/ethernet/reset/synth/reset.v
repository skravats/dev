// reset.v

// Generated using ACDS version 18.1.2 277

`timescale 1 ps / 1 ps
module reset (
		input  wire  in_reset_n,  //  in_reset.reset_n
		output wire  out_reset_n  // out_reset.reset_n
	);

	assign out_reset_n = in_reset_n;

endmodule
