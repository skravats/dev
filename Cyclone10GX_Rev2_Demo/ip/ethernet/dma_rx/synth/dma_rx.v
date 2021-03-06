// dma_rx.v

// Generated using ACDS version 18.1.2 277

`timescale 1 ps / 1 ps
module dma_rx (
		input  wire         clock_clk,                    //            clock.clk
		input  wire         reset_n_reset_n,              //          reset_n.reset_n
		input  wire [31:0]  csr_writedata,                //              csr.writedata
		input  wire         csr_write,                    //                 .write
		input  wire [3:0]   csr_byteenable,               //                 .byteenable
		output wire [31:0]  csr_readdata,                 //                 .readdata
		input  wire         csr_read,                     //                 .read
		input  wire [2:0]   csr_address,                  //                 .address
		input  wire         descriptor_slave_write,       // descriptor_slave.write
		output wire         descriptor_slave_waitrequest, //                 .waitrequest
		input  wire [255:0] descriptor_slave_writedata,   //                 .writedata
		input  wire [31:0]  descriptor_slave_byteenable,  //                 .byteenable
		output wire         response_waitrequest,         //         response.waitrequest
		input  wire [3:0]   response_byteenable,          //                 .byteenable
		input  wire         response_address,             //                 .address
		output wire [31:0]  response_readdata,            //                 .readdata
		input  wire         response_read,                //                 .read
		output wire         csr_irq_irq,                  //          csr_irq.irq
		output wire [31:0]  mm_write_address,             //         mm_write.address
		output wire         mm_write_write,               //                 .write
		output wire [31:0]  mm_write_byteenable,          //                 .byteenable
		output wire [255:0] mm_write_writedata,           //                 .writedata
		input  wire         mm_write_waitrequest,         //                 .waitrequest
		output wire [7:0]   mm_write_burstcount,          //                 .burstcount
		input  wire [255:0] st_sink_data,                 //          st_sink.data
		input  wire         st_sink_valid,                //                 .valid
		output wire         st_sink_ready,                //                 .ready
		input  wire         st_sink_startofpacket,        //                 .startofpacket
		input  wire         st_sink_endofpacket,          //                 .endofpacket
		input  wire [4:0]   st_sink_empty,                //                 .empty
		input  wire [7:0]   st_sink_error                 //                 .error
	);

	dma_rx_altera_msgdma_181_sblzwoi dma_rx (
		.clock_clk                    (clock_clk),                    //   input,    width = 1,            clock.clk
		.reset_n_reset_n              (reset_n_reset_n),              //   input,    width = 1,          reset_n.reset_n
		.csr_writedata                (csr_writedata),                //   input,   width = 32,              csr.writedata
		.csr_write                    (csr_write),                    //   input,    width = 1,                 .write
		.csr_byteenable               (csr_byteenable),               //   input,    width = 4,                 .byteenable
		.csr_readdata                 (csr_readdata),                 //  output,   width = 32,                 .readdata
		.csr_read                     (csr_read),                     //   input,    width = 1,                 .read
		.csr_address                  (csr_address),                  //   input,    width = 3,                 .address
		.descriptor_slave_write       (descriptor_slave_write),       //   input,    width = 1, descriptor_slave.write
		.descriptor_slave_waitrequest (descriptor_slave_waitrequest), //  output,    width = 1,                 .waitrequest
		.descriptor_slave_writedata   (descriptor_slave_writedata),   //   input,  width = 256,                 .writedata
		.descriptor_slave_byteenable  (descriptor_slave_byteenable),  //   input,   width = 32,                 .byteenable
		.response_waitrequest         (response_waitrequest),         //  output,    width = 1,         response.waitrequest
		.response_byteenable          (response_byteenable),          //   input,    width = 4,                 .byteenable
		.response_address             (response_address),             //   input,    width = 1,                 .address
		.response_readdata            (response_readdata),            //  output,   width = 32,                 .readdata
		.response_read                (response_read),                //   input,    width = 1,                 .read
		.csr_irq_irq                  (csr_irq_irq),                  //  output,    width = 1,          csr_irq.irq
		.mm_write_address             (mm_write_address),             //  output,   width = 32,         mm_write.address
		.mm_write_write               (mm_write_write),               //  output,    width = 1,                 .write
		.mm_write_byteenable          (mm_write_byteenable),          //  output,   width = 32,                 .byteenable
		.mm_write_writedata           (mm_write_writedata),           //  output,  width = 256,                 .writedata
		.mm_write_waitrequest         (mm_write_waitrequest),         //   input,    width = 1,                 .waitrequest
		.mm_write_burstcount          (mm_write_burstcount),          //  output,    width = 8,                 .burstcount
		.st_sink_data                 (st_sink_data),                 //   input,  width = 256,          st_sink.data
		.st_sink_valid                (st_sink_valid),                //   input,    width = 1,                 .valid
		.st_sink_ready                (st_sink_ready),                //  output,    width = 1,                 .ready
		.st_sink_startofpacket        (st_sink_startofpacket),        //   input,    width = 1,                 .startofpacket
		.st_sink_endofpacket          (st_sink_endofpacket),          //   input,    width = 1,                 .endofpacket
		.st_sink_empty                (st_sink_empty),                //   input,    width = 5,                 .empty
		.st_sink_error                (st_sink_error)                 //   input,    width = 8,                 .error
	);

endmodule
