// mcu_subsystem_cpu_0_altera_nios2_gen2_181_7fscvgi.v

// This file was auto-generated from altera_nios2_hw.tcl.  If you edit it your changes
// will probably be lost.
// 
// Generated using ACDS version 18.1.2 277

`timescale 1 ps / 1 ps
module mcu_subsystem_cpu_0_altera_nios2_gen2_181_7fscvgi (
		input  wire        clk,                                 //                       clk.clk
		input  wire        reset_n,                             //                     reset.reset_n
		input  wire        reset_req,                           //                          .reset_req
		output wire [31:0] d_address,                           //               data_master.address
		output wire [3:0]  d_byteenable,                        //                          .byteenable
		output wire        d_read,                              //                          .read
		input  wire [31:0] d_readdata,                          //                          .readdata
		input  wire        d_waitrequest,                       //                          .waitrequest
		output wire        d_write,                             //                          .write
		output wire [31:0] d_writedata,                         //                          .writedata
		input  wire        d_readdatavalid,                     //                          .readdatavalid
		output wire        debug_mem_slave_debugaccess_to_roms, //                          .debugaccess
		output wire [31:0] i_address,                           //        instruction_master.address
		output wire        i_read,                              //                          .read
		input  wire [31:0] i_readdata,                          //                          .readdata
		input  wire        i_waitrequest,                       //                          .waitrequest
		input  wire        i_readdatavalid,                     //                          .readdatavalid
		input  wire [31:0] irq,                                 //                       irq.irq
		output wire        debug_reset_request,                 //       debug_reset_request.reset
		input  wire [8:0]  debug_mem_slave_address,             //           debug_mem_slave.address
		input  wire [3:0]  debug_mem_slave_byteenable,          //                          .byteenable
		input  wire        debug_mem_slave_debugaccess,         //                          .debugaccess
		input  wire        debug_mem_slave_read,                //                          .read
		output wire [31:0] debug_mem_slave_readdata,            //                          .readdata
		output wire        debug_mem_slave_waitrequest,         //                          .waitrequest
		input  wire        debug_mem_slave_write,               //                          .write
		input  wire [31:0] debug_mem_slave_writedata,           //                          .writedata
		output wire        dummy_ci_port                        // custom_instruction_master.readra
	);

	mcu_subsystem_cpu_0_altera_nios2_gen2_unit_181_5atbqqa cpu (
		.clk                                 (clk),                                 //   input,   width = 1,                       clk.clk
		.reset_n                             (reset_n),                             //   input,   width = 1,                     reset.reset_n
		.reset_req                           (reset_req),                           //   input,   width = 1,                          .reset_req
		.d_address                           (d_address),                           //  output,  width = 32,               data_master.address
		.d_byteenable                        (d_byteenable),                        //  output,   width = 4,                          .byteenable
		.d_read                              (d_read),                              //  output,   width = 1,                          .read
		.d_readdata                          (d_readdata),                          //   input,  width = 32,                          .readdata
		.d_waitrequest                       (d_waitrequest),                       //   input,   width = 1,                          .waitrequest
		.d_write                             (d_write),                             //  output,   width = 1,                          .write
		.d_writedata                         (d_writedata),                         //  output,  width = 32,                          .writedata
		.d_readdatavalid                     (d_readdatavalid),                     //   input,   width = 1,                          .readdatavalid
		.debug_mem_slave_debugaccess_to_roms (debug_mem_slave_debugaccess_to_roms), //  output,   width = 1,                          .debugaccess
		.i_address                           (i_address),                           //  output,  width = 32,        instruction_master.address
		.i_read                              (i_read),                              //  output,   width = 1,                          .read
		.i_readdata                          (i_readdata),                          //   input,  width = 32,                          .readdata
		.i_waitrequest                       (i_waitrequest),                       //   input,   width = 1,                          .waitrequest
		.i_readdatavalid                     (i_readdatavalid),                     //   input,   width = 1,                          .readdatavalid
		.irq                                 (irq),                                 //   input,  width = 32,                       irq.irq
		.debug_reset_request                 (debug_reset_request),                 //  output,   width = 1,       debug_reset_request.reset
		.debug_mem_slave_address             (debug_mem_slave_address),             //   input,   width = 9,           debug_mem_slave.address
		.debug_mem_slave_byteenable          (debug_mem_slave_byteenable),          //   input,   width = 4,                          .byteenable
		.debug_mem_slave_debugaccess         (debug_mem_slave_debugaccess),         //   input,   width = 1,                          .debugaccess
		.debug_mem_slave_read                (debug_mem_slave_read),                //   input,   width = 1,                          .read
		.debug_mem_slave_readdata            (debug_mem_slave_readdata),            //  output,  width = 32,                          .readdata
		.debug_mem_slave_waitrequest         (debug_mem_slave_waitrequest),         //  output,   width = 1,                          .waitrequest
		.debug_mem_slave_write               (debug_mem_slave_write),               //   input,   width = 1,                          .write
		.debug_mem_slave_writedata           (debug_mem_slave_writedata),           //   input,  width = 32,                          .writedata
		.dummy_ci_port                       (dummy_ci_port)                        //  output,   width = 1, custom_instruction_master.readra
	);

endmodule