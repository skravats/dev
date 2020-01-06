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
endmodule

