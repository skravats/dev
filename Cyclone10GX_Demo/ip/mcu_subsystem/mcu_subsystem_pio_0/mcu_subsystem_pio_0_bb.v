module mcu_subsystem_pio_0 (
		input  wire        clk,        //                 clk.clk
		input  wire        reset_n,    //               reset.reset_n
		input  wire [2:0]  address,    //                  s1.address
		input  wire        write_n,    //                    .write_n
		input  wire [31:0] writedata,  //                    .writedata
		input  wire        chipselect, //                    .chipselect
		output wire [31:0] readdata,   //                    .readdata
		input  wire [31:0] in_port,    // external_connection.in_port
		output wire [31:0] out_port,   //                    .out_port
		output wire        irq         //                 irq.irq
	);
endmodule

