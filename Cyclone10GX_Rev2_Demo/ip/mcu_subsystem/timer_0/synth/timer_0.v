// timer_0.v

// Generated using ACDS version 18.1.2 277

`timescale 1 ps / 1 ps
module timer_0 (
		input  wire        clk,        //   clk.clk
		input  wire        reset_n,    // reset.reset_n
		input  wire [3:0]  address,    //    s1.address
		input  wire [15:0] writedata,  //      .writedata
		output wire [15:0] readdata,   //      .readdata
		input  wire        chipselect, //      .chipselect
		input  wire        write_n,    //      .write_n
		output wire        irq         //   irq.irq
	);

	timer_0_altera_avalon_timer_181_fle3u4q timer_0 (
		.clk        (clk),        //   input,   width = 1,   clk.clk
		.reset_n    (reset_n),    //   input,   width = 1, reset.reset_n
		.address    (address),    //   input,   width = 4,    s1.address
		.writedata  (writedata),  //   input,  width = 16,      .writedata
		.readdata   (readdata),   //  output,  width = 16,      .readdata
		.chipselect (chipselect), //   input,   width = 1,      .chipselect
		.write_n    (write_n),    //   input,   width = 1,      .write_n
		.irq        (irq)         //  output,   width = 1,   irq.irq
	);

endmodule
