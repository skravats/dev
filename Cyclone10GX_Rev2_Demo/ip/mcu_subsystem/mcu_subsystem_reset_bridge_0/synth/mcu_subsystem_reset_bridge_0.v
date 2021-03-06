// mcu_subsystem_reset_bridge_0.v

// Generated using ACDS version 18.1.2 277

`timescale 1 ps / 1 ps
module mcu_subsystem_reset_bridge_0 (
		input  wire  clk,       //       clk.clk
		input  wire  in_reset,  //  in_reset.reset
		output wire  out_reset  // out_reset.reset
	);

	assign out_reset = in_reset;

endmodule
