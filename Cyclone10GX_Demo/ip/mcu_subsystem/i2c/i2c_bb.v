module i2c #(
		parameter FIFO_DEPTH      = 4,
		parameter FIFO_DEPTH_LOG2 = 2
	) (
		input  wire        clk,       //            clock.clk
		input  wire        rst_n,     //       reset_sink.reset_n
		output wire        intr,      // interrupt_sender.irq
		input  wire [3:0]  addr,      //              csr.address
		input  wire        read,      //                 .read
		input  wire        write,     //                 .write
		input  wire [31:0] writedata, //                 .writedata
		output wire [31:0] readdata,  //                 .readdata
		input  wire        sda_in,    //       i2c_serial.sda_in
		input  wire        scl_in,    //                 .scl_in
		output wire        sda_oe,    //                 .sda_oe
		output wire        scl_oe     //                 .scl_oe
	);
endmodule

