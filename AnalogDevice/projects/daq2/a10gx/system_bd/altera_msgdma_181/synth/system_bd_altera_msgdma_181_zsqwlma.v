// system_bd_altera_msgdma_181_zsqwlma.v

// This file was auto-generated from altera_msgdma_hw.tcl.  If you edit it your changes
// will probably be lost.
// 
// Generated using ACDS version 18.1 625

`timescale 1 ps / 1 ps
module system_bd_altera_msgdma_181_zsqwlma (
		output wire [27:0]  mm_write_address,             //         mm_write.address
		output wire         mm_write_write,               //                 .write
		output wire [7:0]   mm_write_byteenable,          //                 .byteenable
		output wire [63:0]  mm_write_writedata,           //                 .writedata
		input  wire         mm_write_waitrequest,         //                 .waitrequest
		output wire [6:0]   mm_write_burstcount,          //                 .burstcount
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
		input  wire [63:0]  st_sink_data,                 //          st_sink.data
		input  wire         st_sink_valid,                //                 .valid
		output wire         st_sink_ready,                //                 .ready
		input  wire         st_sink_startofpacket,        //                 .startofpacket
		input  wire         st_sink_endofpacket,          //                 .endofpacket
		input  wire [2:0]   st_sink_empty,                //                 .empty
		input  wire [5:0]   st_sink_error                 //                 .error
	);

	wire          dispatcher_internal_write_command_source_valid; // dispatcher_internal:src_write_master_valid -> write_mstr_internal:snk_command_valid
	wire  [255:0] dispatcher_internal_write_command_source_data;  // dispatcher_internal:src_write_master_data -> write_mstr_internal:snk_command_data
	wire          dispatcher_internal_write_command_source_ready; // write_mstr_internal:snk_command_ready -> dispatcher_internal:src_write_master_ready
	wire          write_mstr_internal_response_source_valid;      // write_mstr_internal:src_response_valid -> dispatcher_internal:snk_write_master_valid
	wire  [255:0] write_mstr_internal_response_source_data;       // write_mstr_internal:src_response_data -> dispatcher_internal:snk_write_master_data
	wire          write_mstr_internal_response_source_ready;      // dispatcher_internal:snk_write_master_ready -> write_mstr_internal:src_response_ready

	dispatcher #(
		.MODE                        (2),
		.RESPONSE_PORT               (0),
		.DESCRIPTOR_INTERFACE        (0),
		.DESCRIPTOR_FIFO_DEPTH       (512),
		.ENHANCED_FEATURES           (1),
		.DESCRIPTOR_WIDTH            (256),
		.DESCRIPTOR_BYTEENABLE_WIDTH (32)
	) dispatcher_internal (
		.clk                     (clock_clk),                                                                                                                                                                                                                                                             //                clock.clk
		.reset                   (~reset_n_reset_n),                                                                                                                                                                                                                                                      //          clock_reset.reset
		.csr_writedata           (csr_writedata),                                                                                                                                                                                                                                                         //                  CSR.writedata
		.csr_write               (csr_write),                                                                                                                                                                                                                                                             //                     .write
		.csr_byteenable          (csr_byteenable),                                                                                                                                                                                                                                                        //                     .byteenable
		.csr_readdata            (csr_readdata),                                                                                                                                                                                                                                                          //                     .readdata
		.csr_read                (csr_read),                                                                                                                                                                                                                                                              //                     .read
		.csr_address             (csr_address),                                                                                                                                                                                                                                                           //                     .address
		.descriptor_write        (descriptor_slave_write),                                                                                                                                                                                                                                                //     Descriptor_Slave.write
		.descriptor_waitrequest  (descriptor_slave_waitrequest),                                                                                                                                                                                                                                          //                     .waitrequest
		.descriptor_writedata    (descriptor_slave_writedata),                                                                                                                                                                                                                                            //                     .writedata
		.descriptor_byteenable   (descriptor_slave_byteenable),                                                                                                                                                                                                                                           //                     .byteenable
		.mm_response_waitrequest (response_waitrequest),                                                                                                                                                                                                                                                  //       Response_Slave.waitrequest
		.mm_response_byteenable  (response_byteenable),                                                                                                                                                                                                                                                   //                     .byteenable
		.mm_response_address     (response_address),                                                                                                                                                                                                                                                      //                     .address
		.mm_response_readdata    (response_readdata),                                                                                                                                                                                                                                                     //                     .readdata
		.mm_response_read        (response_read),                                                                                                                                                                                                                                                         //                     .read
		.src_write_master_data   (dispatcher_internal_write_command_source_data),                                                                                                                                                                                                                         // Write_Command_Source.data
		.src_write_master_valid  (dispatcher_internal_write_command_source_valid),                                                                                                                                                                                                                        //                     .valid
		.src_write_master_ready  (dispatcher_internal_write_command_source_ready),                                                                                                                                                                                                                        //                     .ready
		.snk_write_master_data   (write_mstr_internal_response_source_data),                                                                                                                                                                                                                              //  Write_Response_Sink.data
		.snk_write_master_valid  (write_mstr_internal_response_source_valid),                                                                                                                                                                                                                             //                     .valid
		.snk_write_master_ready  (write_mstr_internal_response_source_ready),                                                                                                                                                                                                                             //                     .ready
		.csr_irq                 (csr_irq_irq),                                                                                                                                                                                                                                                           //              csr_irq.irq
		.src_response_data       (),                                                                                                                                                                                                                                                                      //          (terminated)
		.src_response_valid      (),                                                                                                                                                                                                                                                                      //          (terminated)
		.src_response_ready      (1'b0),                                                                                                                                                                                                                                                                  //          (terminated)
		.snk_descriptor_data     (256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000), //          (terminated)
		.snk_descriptor_valid    (1'b0),                                                                                                                                                                                                                                                                  //          (terminated)
		.snk_descriptor_ready    (),                                                                                                                                                                                                                                                                      //          (terminated)
		.src_read_master_data    (),                                                                                                                                                                                                                                                                      //          (terminated)
		.src_read_master_valid   (),                                                                                                                                                                                                                                                                      //          (terminated)
		.src_read_master_ready   (1'b0),                                                                                                                                                                                                                                                                  //          (terminated)
		.snk_read_master_data    (256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000), //          (terminated)
		.snk_read_master_valid   (1'b0),                                                                                                                                                                                                                                                                  //          (terminated)
		.snk_read_master_ready   ()                                                                                                                                                                                                                                                                       //          (terminated)
	);

	write_master #(
		.DATA_WIDTH                     (64),
		.LENGTH_WIDTH                   (12),
		.FIFO_DEPTH                     (256),
		.STRIDE_ENABLE                  (0),
		.BURST_ENABLE                   (1),
		.PACKET_ENABLE                  (1),
		.ERROR_ENABLE                   (1),
		.ERROR_WIDTH                    (6),
		.BYTE_ENABLE_WIDTH              (8),
		.BYTE_ENABLE_WIDTH_LOG2         (3),
		.ADDRESS_WIDTH                  (28),
		.FIFO_DEPTH_LOG2                (8),
		.SYMBOL_WIDTH                   (8),
		.NUMBER_OF_SYMBOLS              (8),
		.NUMBER_OF_SYMBOLS_LOG2         (3),
		.MAX_BURST_COUNT_WIDTH          (7),
		.UNALIGNED_ACCESSES_ENABLE      (1),
		.ONLY_FULL_ACCESS_ENABLE        (0),
		.BURST_WRAPPING_SUPPORT         (0),
		.PROGRAMMABLE_BURST_ENABLE      (0),
		.MAX_BURST_COUNT                (64),
		.FIFO_SPEED_OPTIMIZATION        (1),
		.STRIDE_WIDTH                   (1),
		.ACTUAL_BYTES_TRANSFERRED_WIDTH (13)
	) write_mstr_internal (
		.clk                (clock_clk),                                      //             Clock.clk
		.reset              (~reset_n_reset_n),                               //       Clock_reset.reset
		.master_address     (mm_write_address),                               // Data_Write_Master.address
		.master_write       (mm_write_write),                                 //                  .write
		.master_byteenable  (mm_write_byteenable),                            //                  .byteenable
		.master_writedata   (mm_write_writedata),                             //                  .writedata
		.master_waitrequest (mm_write_waitrequest),                           //                  .waitrequest
		.master_burstcount  (mm_write_burstcount),                            //                  .burstcount
		.snk_data           (st_sink_data),                                   //         Data_Sink.data
		.snk_valid          (st_sink_valid),                                  //                  .valid
		.snk_ready          (st_sink_ready),                                  //                  .ready
		.snk_sop            (st_sink_startofpacket),                          //                  .startofpacket
		.snk_eop            (st_sink_endofpacket),                            //                  .endofpacket
		.snk_empty          (st_sink_empty),                                  //                  .empty
		.snk_error          (st_sink_error),                                  //                  .error
		.snk_command_data   (dispatcher_internal_write_command_source_data),  //      Command_Sink.data
		.snk_command_valid  (dispatcher_internal_write_command_source_valid), //                  .valid
		.snk_command_ready  (dispatcher_internal_write_command_source_ready), //                  .ready
		.src_response_data  (write_mstr_internal_response_source_data),       //   Response_Source.data
		.src_response_valid (write_mstr_internal_response_source_valid),      //                  .valid
		.src_response_ready (write_mstr_internal_response_source_ready)       //                  .ready
	);

endmodule
