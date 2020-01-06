module spi (
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
endmodule

