// mcu_subsystem_spi_0.v

// Generated using ACDS version 18.1.2 277

`timescale 1 ps / 1 ps
module mcu_subsystem_spi_0 (
		input  wire        clk,           //              clk.clk
		input  wire        reset_n,       //            reset.reset_n
		input  wire [15:0] data_from_cpu, // spi_control_port.writedata
		output wire [15:0] data_to_cpu,   //                 .readdata
		input  wire [2:0]  mem_addr,      //                 .address
		input  wire        read_n,        //                 .read_n
		input  wire        spi_select,    //                 .chipselect
		input  wire        write_n,       //                 .write_n
		output wire        irq,           //              irq.irq
		input  wire        MISO,          //         external.MISO
		output wire        MOSI,          //                 .MOSI
		output wire        SCLK,          //                 .SCLK
		output wire [7:0]  SS_n           //                 .SS_n
	);

	mcu_subsystem_spi_0_altera_avalon_spi_181_wm74tvy spi_0 (
		.clk           (clk),           //   input,   width = 1,              clk.clk
		.reset_n       (reset_n),       //   input,   width = 1,            reset.reset_n
		.data_from_cpu (data_from_cpu), //   input,  width = 16, spi_control_port.writedata
		.data_to_cpu   (data_to_cpu),   //  output,  width = 16,                 .readdata
		.mem_addr      (mem_addr),      //   input,   width = 3,                 .address
		.read_n        (read_n),        //   input,   width = 1,                 .read_n
		.spi_select    (spi_select),    //   input,   width = 1,                 .chipselect
		.write_n       (write_n),       //   input,   width = 1,                 .write_n
		.irq           (irq),           //  output,   width = 1,              irq.irq
		.MISO          (MISO),          //   input,   width = 1,         external.export
		.MOSI          (MOSI),          //  output,   width = 1,                 .export
		.SCLK          (SCLK),          //  output,   width = 1,                 .export
		.SS_n          (SS_n)           //  output,   width = 8,                 .export
	);

endmodule