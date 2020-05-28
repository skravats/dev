// mcu_subsystem_altera_merlin_traffic_limiter_181_ixrjm2i.v

// Generated using ACDS version 18.1.2 277

`timescale 1 ps / 1 ps
module mcu_subsystem_altera_merlin_traffic_limiter_181_ixrjm2i #(
		parameter IMPL                  = "reg",
		parameter SYMBOLS_PER_BEAT      = 1,
		parameter BITS_PER_SYMBOL       = 9,
		parameter FIFO_DEPTH            = 131,
		parameter CHANNEL_WIDTH         = 0,
		parameter ERROR_WIDTH           = 0,
		parameter USE_PACKETS           = 0,
		parameter EMPTY_LATENCY         = 1,
		parameter ALMOST_FULL_THRESHOLD = 131,
		parameter SHOWAHEAD             = 1
	) (
		input  wire       clk,       //       clk.clk
		input  wire       reset,     // clk_reset.reset
		input  wire [8:0] in_data,   //        in.data
		input  wire       in_valid,  //          .valid
		output wire       in_ready,  //          .ready
		output wire [8:0] out_data,  //       out.data
		output wire       out_valid, //          .valid
		input  wire       out_ready  //          .ready
	);

	mcu_subsystem_alt_hiconnect_sc_fifo_181_cjmuh4a #(
		.IMPL                  (IMPL),
		.SYMBOLS_PER_BEAT      (SYMBOLS_PER_BEAT),
		.BITS_PER_SYMBOL       (BITS_PER_SYMBOL),
		.FIFO_DEPTH            (FIFO_DEPTH),
		.CHANNEL_WIDTH         (CHANNEL_WIDTH),
		.ERROR_WIDTH           (ERROR_WIDTH),
		.USE_PACKETS           (USE_PACKETS),
		.EMPTY_LATENCY         (EMPTY_LATENCY),
		.ALMOST_FULL_THRESHOLD (ALMOST_FULL_THRESHOLD),
		.SHOWAHEAD             (SHOWAHEAD)
	) my_alt_hiconnect_sc_fifo_dest_id_fifo (
		.clk               (clk),       //   input,  width = 1,       clk.clk
		.reset             (reset),     //   input,  width = 1, clk_reset.reset
		.in_data           (in_data),   //   input,  width = 9,        in.data
		.in_valid          (in_valid),  //   input,  width = 1,          .valid
		.in_ready          (in_ready),  //  output,  width = 1,          .ready
		.out_data          (out_data),  //  output,  width = 9,       out.data
		.out_valid         (out_valid), //  output,  width = 1,          .valid
		.out_ready         (out_ready), //   input,  width = 1,          .ready
		.in_startofpacket  (1'b0),      // (terminated),                       
		.in_endofpacket    (1'b0),      // (terminated),                       
		.out_startofpacket (),          // (terminated),                       
		.out_endofpacket   (),          // (terminated),                       
		.in_empty          (1'b0),      // (terminated),                       
		.out_empty         (),          // (terminated),                       
		.in_error          (1'b0),      // (terminated),                       
		.out_error         (),          // (terminated),                       
		.in_channel        (1'b0),      // (terminated),                       
		.out_channel       ()           // (terminated),                       
	);

endmodule
