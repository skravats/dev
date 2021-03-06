// mcu_subsystem_generic_quad_spi_controller2_0.v

// Generated using ACDS version 18.1.2 277

`timescale 1 ps / 1 ps
module mcu_subsystem_generic_quad_spi_controller2_0 (
		input  wire        clk,                  //       clock_sink.clk
		input  wire        reset_n,              //            reset.reset_n
		output wire        qspi_pins_dclk,       //        qspi_pins.dclk
		output wire        qspi_pins_ncs,        //                 .ncs
		inout  wire [3:0]  qspi_pins_data,       //                 .data
		input  wire        avl_csr_read,         //          avl_csr.read
		output wire        avl_csr_waitrequest,  //                 .waitrequest
		input  wire        avl_csr_write,        //                 .write
		input  wire [3:0]  avl_csr_addr,         //                 .address
		input  wire [31:0] avl_csr_wrdata,       //                 .writedata
		output wire [31:0] avl_csr_rddata,       //                 .readdata
		output wire        avl_csr_rddata_valid, //                 .readdatavalid
		input  wire        avl_mem_write,        //          avl_mem.write
		input  wire [6:0]  avl_mem_burstcount,   //                 .burstcount
		output wire        avl_mem_waitrequest,  //                 .waitrequest
		input  wire        avl_mem_read,         //                 .read
		input  wire [24:0] avl_mem_addr,         //                 .address
		input  wire [31:0] avl_mem_wrdata,       //                 .writedata
		output wire [31:0] avl_mem_rddata,       //                 .readdata
		output wire        avl_mem_rddata_valid, //                 .readdatavalid
		input  wire [3:0]  avl_mem_byteenable,   //                 .byteenable
		output wire        irq                   // interrupt_sender.irq
	);

	mcu_subsystem_generic_quad_spi_controller2_0_altera_generic_quad_spi_controller2_181_5xz3lbq #(
		.DEVICE_FAMILY     ("Cyclone 10 GX"),
		.CS_WIDTH          (3),
		.ADDR_WIDTH        (25),
		.ASI_WIDTH         (4),
		.ASMI_ADDR_WIDTH   (32),
		.ENABLE_4BYTE_ADDR (1),
		.IO_MODE           ("QUAD"),
		.CHIP_SELS         (1)
	) generic_quad_spi_controller2_0 (
		.clk                  (clk),                  //   input,   width = 1,       clock_sink.clk
		.reset_n              (reset_n),              //   input,   width = 1,            reset.reset_n
		.qspi_pins_dclk       (qspi_pins_dclk),       //  output,   width = 1,        qspi_pins.dclk
		.qspi_pins_ncs        (qspi_pins_ncs),        //  output,   width = 1,                 .ncs
		.qspi_pins_data       (qspi_pins_data),       //   inout,   width = 4,                 .data
		.avl_csr_read         (avl_csr_read),         //   input,   width = 1,          avl_csr.read
		.avl_csr_waitrequest  (avl_csr_waitrequest),  //  output,   width = 1,                 .waitrequest
		.avl_csr_write        (avl_csr_write),        //   input,   width = 1,                 .write
		.avl_csr_addr         (avl_csr_addr),         //   input,   width = 4,                 .address
		.avl_csr_wrdata       (avl_csr_wrdata),       //   input,  width = 32,                 .writedata
		.avl_csr_rddata       (avl_csr_rddata),       //  output,  width = 32,                 .readdata
		.avl_csr_rddata_valid (avl_csr_rddata_valid), //  output,   width = 1,                 .readdatavalid
		.avl_mem_write        (avl_mem_write),        //   input,   width = 1,          avl_mem.write
		.avl_mem_burstcount   (avl_mem_burstcount),   //   input,   width = 7,                 .burstcount
		.avl_mem_waitrequest  (avl_mem_waitrequest),  //  output,   width = 1,                 .waitrequest
		.avl_mem_read         (avl_mem_read),         //   input,   width = 1,                 .read
		.avl_mem_addr         (avl_mem_addr),         //   input,  width = 25,                 .address
		.avl_mem_wrdata       (avl_mem_wrdata),       //   input,  width = 32,                 .writedata
		.avl_mem_rddata       (avl_mem_rddata),       //  output,  width = 32,                 .readdata
		.avl_mem_rddata_valid (avl_mem_rddata_valid), //  output,   width = 1,                 .readdatavalid
		.avl_mem_byteenable   (avl_mem_byteenable),   //   input,   width = 4,                 .byteenable
		.irq                  (irq)                   //  output,   width = 1, interrupt_sender.irq
	);

endmodule
