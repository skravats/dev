module avl_adxcfg_0 (
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
endmodule

