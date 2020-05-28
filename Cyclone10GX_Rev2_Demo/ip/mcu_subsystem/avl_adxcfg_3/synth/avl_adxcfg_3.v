// avl_adxcfg_3.v

// Generated using ACDS version 18.1.2 277

`timescale 1 ps / 1 ps
module avl_adxcfg_3 (
		input  wire        rcfg_clk,               //     rcfg_clk.clk
		input  wire        rcfg_reset_n,           // rcfg_reset_n.reset_n
		input  wire        rcfg_in_read_0,         //      rcfg_s0.read
		input  wire        rcfg_in_write_0,        //             .write
		input  wire [9:0]  rcfg_in_address_0,      //             .address
		input  wire [31:0] rcfg_in_writedata_0,    //             .writedata
		output wire [31:0] rcfg_in_readdata_0,     //             .readdata
		output wire        rcfg_in_waitrequest_0,  //             .waitrequest
		output wire        rcfg_out_read_0,        //      rcfg_m0.read
		output wire        rcfg_out_write_0,       //             .write
		output wire [9:0]  rcfg_out_address_0,     //             .address
		output wire [31:0] rcfg_out_writedata_0,   //             .writedata
		input  wire [31:0] rcfg_out_readdata_0,    //             .readdata
		input  wire        rcfg_out_waitrequest_0, //             .waitrequest
		input  wire        rcfg_in_read_1,         //      rcfg_s1.read
		input  wire        rcfg_in_write_1,        //             .write
		input  wire [9:0]  rcfg_in_address_1,      //             .address
		input  wire [31:0] rcfg_in_writedata_1,    //             .writedata
		output wire [31:0] rcfg_in_readdata_1,     //             .readdata
		output wire        rcfg_in_waitrequest_1,  //             .waitrequest
		output wire        rcfg_out_read_1,        //      rcfg_m1.read
		output wire        rcfg_out_write_1,       //             .write
		output wire [9:0]  rcfg_out_address_1,     //             .address
		output wire [31:0] rcfg_out_writedata_1,   //             .writedata
		input  wire [31:0] rcfg_out_readdata_1,    //             .readdata
		input  wire        rcfg_out_waitrequest_1  //             .waitrequest
	);

	avl_adxcfg avl_adxcfg_3 (
		.rcfg_clk               (rcfg_clk),               //   input,   width = 1,     rcfg_clk.clk
		.rcfg_reset_n           (rcfg_reset_n),           //   input,   width = 1, rcfg_reset_n.reset_n
		.rcfg_in_read_0         (rcfg_in_read_0),         //   input,   width = 1,      rcfg_s0.read
		.rcfg_in_write_0        (rcfg_in_write_0),        //   input,   width = 1,             .write
		.rcfg_in_address_0      (rcfg_in_address_0),      //   input,  width = 10,             .address
		.rcfg_in_writedata_0    (rcfg_in_writedata_0),    //   input,  width = 32,             .writedata
		.rcfg_in_readdata_0     (rcfg_in_readdata_0),     //  output,  width = 32,             .readdata
		.rcfg_in_waitrequest_0  (rcfg_in_waitrequest_0),  //  output,   width = 1,             .waitrequest
		.rcfg_out_read_0        (rcfg_out_read_0),        //  output,   width = 1,      rcfg_m0.read
		.rcfg_out_write_0       (rcfg_out_write_0),       //  output,   width = 1,             .write
		.rcfg_out_address_0     (rcfg_out_address_0),     //  output,  width = 10,             .address
		.rcfg_out_writedata_0   (rcfg_out_writedata_0),   //  output,  width = 32,             .writedata
		.rcfg_out_readdata_0    (rcfg_out_readdata_0),    //   input,  width = 32,             .readdata
		.rcfg_out_waitrequest_0 (rcfg_out_waitrequest_0), //   input,   width = 1,             .waitrequest
		.rcfg_in_read_1         (rcfg_in_read_1),         //   input,   width = 1,      rcfg_s1.read
		.rcfg_in_write_1        (rcfg_in_write_1),        //   input,   width = 1,             .write
		.rcfg_in_address_1      (rcfg_in_address_1),      //   input,  width = 10,             .address
		.rcfg_in_writedata_1    (rcfg_in_writedata_1),    //   input,  width = 32,             .writedata
		.rcfg_in_readdata_1     (rcfg_in_readdata_1),     //  output,  width = 32,             .readdata
		.rcfg_in_waitrequest_1  (rcfg_in_waitrequest_1),  //  output,   width = 1,             .waitrequest
		.rcfg_out_read_1        (rcfg_out_read_1),        //  output,   width = 1,      rcfg_m1.read
		.rcfg_out_write_1       (rcfg_out_write_1),       //  output,   width = 1,             .write
		.rcfg_out_address_1     (rcfg_out_address_1),     //  output,  width = 10,             .address
		.rcfg_out_writedata_1   (rcfg_out_writedata_1),   //  output,  width = 32,             .writedata
		.rcfg_out_readdata_1    (rcfg_out_readdata_1),    //   input,  width = 32,             .readdata
		.rcfg_out_waitrequest_1 (rcfg_out_waitrequest_1)  //   input,   width = 1,             .waitrequest
	);

endmodule
