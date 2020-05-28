// dma_tx_altera_msgdma_181_kckrdxy.v

// This file was auto-generated from altera_msgdma_hw.tcl.  If you edit it your changes
// will probably be lost.
// 
// Generated using ACDS version 18.1.2 277

`timescale 1 ps / 1 ps
module dma_tx_altera_msgdma_181_kckrdxy (
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
		output wire         csr_irq_irq,                  //          csr_irq.irq
		output wire [31:0]  mm_read_address,              //          mm_read.address
		output wire         mm_read_read,                 //                 .read
		output wire [31:0]  mm_read_byteenable,           //                 .byteenable
		input  wire [255:0] mm_read_readdata,             //                 .readdata
		input  wire         mm_read_waitrequest,          //                 .waitrequest
		input  wire         mm_read_readdatavalid,        //                 .readdatavalid
		output wire [10:0]  mm_read_burstcount,           //                 .burstcount
		output wire [255:0] st_source_data,               //        st_source.data
		output wire         st_source_valid,              //                 .valid
		input  wire         st_source_ready,              //                 .ready
		output wire         st_source_startofpacket,      //                 .startofpacket
		output wire         st_source_endofpacket,        //                 .endofpacket
		output wire [4:0]   st_source_empty,              //                 .empty
		output wire [7:0]   st_source_error,              //                 .error
		output wire [7:0]   st_source_channel             //                 .channel
	);

	wire          dispatcher_internal_read_command_source_valid; // dispatcher_internal:src_read_master_valid -> read_mstr_internal:snk_command_valid
	wire  [255:0] dispatcher_internal_read_command_source_data;  // dispatcher_internal:src_read_master_data -> read_mstr_internal:snk_command_data
	wire          dispatcher_internal_read_command_source_ready; // read_mstr_internal:snk_command_ready -> dispatcher_internal:src_read_master_ready
	wire          read_mstr_internal_response_source_valid;      // read_mstr_internal:src_response_valid -> dispatcher_internal:snk_read_master_valid
	wire  [255:0] read_mstr_internal_response_source_data;       // read_mstr_internal:src_response_data -> dispatcher_internal:snk_read_master_data
	wire          read_mstr_internal_response_source_ready;      // dispatcher_internal:snk_read_master_ready -> read_mstr_internal:src_response_ready

	dispatcher #(
		.PREFETCHER_USE_CASE           (0),
		.MODE                          (1),
		.RESPONSE_PORT                 (2),
		.DESCRIPTOR_INTERFACE          (0),
		.DESCRIPTOR_FIFO_DEPTH         (128),
		.ENHANCED_FEATURES             (1),
		.DESCRIPTOR_WIDTH              (256),
		.DESCRIPTOR_BYTEENABLE_WIDTH   (32),
		.DATA_WIDTH_DERIVED            (5),
		.DATA_FIFO_DEPTH_DERIVED       (8),
		.MAX_BYTE_DERIVED              (4),
		.TRANSFER_TYPE_DERIVED         (2),
		.BURST_ENABLE                  (1),
		.MAX_BURST_COUNT_DERIVED       (9),
		.BURST_WRAPPING_SUPPORT        (0),
		.STRIDE_ENABLE_DERIVED         (0),
		.MAX_STRIDE_DERIVED            (0),
		.PROGRAMMABLE_BURST_ENABLE     (1),
		.CHANNEL_ENABLE                (1),
		.CHANNEL_WIDTH_DERIVED         (7),
		.ERROR_ENABLE                  (1),
		.ERROR_WIDTH_DERIVED           (7),
		.PACKET_ENABLE                 (1),
		.DESCRIPTOR_FIFO_DEPTH_DERIVED (4)
	) dispatcher_internal (
		.clk                     (clock_clk),                                                                                                                                                                                                                                                             //   input,    width = 1,               clock.clk
		.reset                   (~reset_n_reset_n),                                                                                                                                                                                                                                                      //   input,    width = 1,         clock_reset.reset
		.csr_writedata           (csr_writedata),                                                                                                                                                                                                                                                         //   input,   width = 32,                 CSR.writedata
		.csr_write               (csr_write),                                                                                                                                                                                                                                                             //   input,    width = 1,                    .write
		.csr_byteenable          (csr_byteenable),                                                                                                                                                                                                                                                        //   input,    width = 4,                    .byteenable
		.csr_readdata            (csr_readdata),                                                                                                                                                                                                                                                          //  output,   width = 32,                    .readdata
		.csr_read                (csr_read),                                                                                                                                                                                                                                                              //   input,    width = 1,                    .read
		.csr_address             (csr_address),                                                                                                                                                                                                                                                           //   input,    width = 3,                    .address
		.descriptor_write        (descriptor_slave_write),                                                                                                                                                                                                                                                //   input,    width = 1,    Descriptor_Slave.write
		.descriptor_waitrequest  (descriptor_slave_waitrequest),                                                                                                                                                                                                                                          //  output,    width = 1,                    .waitrequest
		.descriptor_writedata    (descriptor_slave_writedata),                                                                                                                                                                                                                                            //   input,  width = 256,                    .writedata
		.descriptor_byteenable   (descriptor_slave_byteenable),                                                                                                                                                                                                                                           //   input,   width = 32,                    .byteenable
		.src_read_master_data    (dispatcher_internal_read_command_source_data),                                                                                                                                                                                                                          //  output,  width = 256, Read_Command_Source.data
		.src_read_master_valid   (dispatcher_internal_read_command_source_valid),                                                                                                                                                                                                                         //  output,    width = 1,                    .valid
		.src_read_master_ready   (dispatcher_internal_read_command_source_ready),                                                                                                                                                                                                                         //   input,    width = 1,                    .ready
		.snk_read_master_data    (read_mstr_internal_response_source_data),                                                                                                                                                                                                                               //   input,  width = 256,  Read_Response_Sink.data
		.snk_read_master_valid   (read_mstr_internal_response_source_valid),                                                                                                                                                                                                                              //   input,    width = 1,                    .valid
		.snk_read_master_ready   (read_mstr_internal_response_source_ready),                                                                                                                                                                                                                              //  output,    width = 1,                    .ready
		.csr_irq                 (csr_irq_irq),                                                                                                                                                                                                                                                           //  output,    width = 1,             csr_irq.irq
		.src_response_data       (),                                                                                                                                                                                                                                                                      // (terminated),                                   
		.src_response_valid      (),                                                                                                                                                                                                                                                                      // (terminated),                                   
		.src_response_ready      (1'b0),                                                                                                                                                                                                                                                                  // (terminated),                                   
		.snk_descriptor_data     (256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000), // (terminated),                                   
		.snk_descriptor_valid    (1'b0),                                                                                                                                                                                                                                                                  // (terminated),                                   
		.snk_descriptor_ready    (),                                                                                                                                                                                                                                                                      // (terminated),                                   
		.mm_response_waitrequest (),                                                                                                                                                                                                                                                                      // (terminated),                                   
		.mm_response_byteenable  (4'b0000),                                                                                                                                                                                                                                                               // (terminated),                                   
		.mm_response_address     (1'b0),                                                                                                                                                                                                                                                                  // (terminated),                                   
		.mm_response_readdata    (),                                                                                                                                                                                                                                                                      // (terminated),                                   
		.mm_response_read        (1'b0),                                                                                                                                                                                                                                                                  // (terminated),                                   
		.src_write_master_data   (),                                                                                                                                                                                                                                                                      // (terminated),                                   
		.src_write_master_valid  (),                                                                                                                                                                                                                                                                      // (terminated),                                   
		.src_write_master_ready  (1'b0),                                                                                                                                                                                                                                                                  // (terminated),                                   
		.snk_write_master_data   (256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000), // (terminated),                                   
		.snk_write_master_valid  (1'b0),                                                                                                                                                                                                                                                                  // (terminated),                                   
		.snk_write_master_ready  ()                                                                                                                                                                                                                                                                       // (terminated),                                   
	);

	read_master #(
		.DATA_WIDTH                (256),
		.LENGTH_WIDTH              (15),
		.FIFO_DEPTH                (4096),
		.STRIDE_ENABLE             (0),
		.BURST_ENABLE              (1),
		.PACKET_ENABLE             (1),
		.ERROR_ENABLE              (1),
		.ERROR_WIDTH               (8),
		.CHANNEL_ENABLE            (1),
		.CHANNEL_WIDTH             (8),
		.BYTE_ENABLE_WIDTH         (32),
		.BYTE_ENABLE_WIDTH_LOG2    (5),
		.ADDRESS_WIDTH             (32),
		.FIFO_DEPTH_LOG2           (12),
		.SYMBOL_WIDTH              (8),
		.NUMBER_OF_SYMBOLS         (32),
		.NUMBER_OF_SYMBOLS_LOG2    (5),
		.MAX_BURST_COUNT_WIDTH     (11),
		.UNALIGNED_ACCESSES_ENABLE (1),
		.ONLY_FULL_ACCESS_ENABLE   (0),
		.BURST_WRAPPING_SUPPORT    (0),
		.PROGRAMMABLE_BURST_ENABLE (1),
		.MAX_BURST_COUNT           (1024),
		.FIFO_SPEED_OPTIMIZATION   (1),
		.STRIDE_WIDTH              (1)
	) read_mstr_internal (
		.clk                  (clock_clk),                                     //   input,    width = 1,            Clock.clk
		.reset                (~reset_n_reset_n),                              //   input,    width = 1,      Clock_reset.reset
		.master_address       (mm_read_address),                               //  output,   width = 32, Data_Read_Master.address
		.master_read          (mm_read_read),                                  //  output,    width = 1,                 .read
		.master_byteenable    (mm_read_byteenable),                            //  output,   width = 32,                 .byteenable
		.master_readdata      (mm_read_readdata),                              //   input,  width = 256,                 .readdata
		.master_waitrequest   (mm_read_waitrequest),                           //   input,    width = 1,                 .waitrequest
		.master_readdatavalid (mm_read_readdatavalid),                         //   input,    width = 1,                 .readdatavalid
		.master_burstcount    (mm_read_burstcount),                            //  output,   width = 11,                 .burstcount
		.src_data             (st_source_data),                                //  output,  width = 256,      Data_Source.data
		.src_valid            (st_source_valid),                               //  output,    width = 1,                 .valid
		.src_ready            (st_source_ready),                               //   input,    width = 1,                 .ready
		.src_sop              (st_source_startofpacket),                       //  output,    width = 1,                 .startofpacket
		.src_eop              (st_source_endofpacket),                         //  output,    width = 1,                 .endofpacket
		.src_empty            (st_source_empty),                               //  output,    width = 5,                 .empty
		.src_error            (st_source_error),                               //  output,    width = 8,                 .error
		.src_channel          (st_source_channel),                             //  output,    width = 8,                 .channel
		.snk_command_data     (dispatcher_internal_read_command_source_data),  //   input,  width = 256,     Command_Sink.data
		.snk_command_valid    (dispatcher_internal_read_command_source_valid), //   input,    width = 1,                 .valid
		.snk_command_ready    (dispatcher_internal_read_command_source_ready), //  output,    width = 1,                 .ready
		.src_response_data    (read_mstr_internal_response_source_data),       //  output,  width = 256,  Response_Source.data
		.src_response_valid   (read_mstr_internal_response_source_valid),      //  output,    width = 1,                 .valid
		.src_response_ready   (read_mstr_internal_response_source_ready)       //   input,    width = 1,                 .ready
	);

endmodule
