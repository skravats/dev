// system_bd_altera_mm_interconnect_181_cazrnua.v

// This file was auto-generated from altera_mm_interconnect_hw.tcl.  If you edit it your changes
// will probably be lost.
// 
// Generated using ACDS version 18.1 625

`timescale 1 ps / 1 ps
module system_bd_altera_mm_interconnect_181_cazrnua (
		input  wire        clk_bridge_out_clk_clk,                                //                              clk_bridge_out_clk.clk
		input  wire        ioaux_master_bridge_reset_reset_bridge_in_reset_reset, // ioaux_master_bridge_reset_reset_bridge_in_reset.reset
		input  wire [15:0] ioaux_master_bridge_m0_address,                        //                          ioaux_master_bridge_m0.address
		output wire        ioaux_master_bridge_m0_waitrequest,                    //                                                .waitrequest
		input  wire [0:0]  ioaux_master_bridge_m0_burstcount,                     //                                                .burstcount
		input  wire [3:0]  ioaux_master_bridge_m0_byteenable,                     //                                                .byteenable
		input  wire        ioaux_master_bridge_m0_read,                           //                                                .read
		output wire [31:0] ioaux_master_bridge_m0_readdata,                       //                                                .readdata
		output wire        ioaux_master_bridge_m0_readdatavalid,                  //                                                .readdatavalid
		input  wire        ioaux_master_bridge_m0_write,                          //                                                .write
		input  wire [31:0] ioaux_master_bridge_m0_writedata,                      //                                                .writedata
		input  wire        ioaux_master_bridge_m0_debugaccess,                    //                                                .debugaccess
		output wire [11:0] ioaux_soft_ram_s1_address,                             //                               ioaux_soft_ram_s1.address
		output wire        ioaux_soft_ram_s1_write,                               //                                                .write
		input  wire [31:0] ioaux_soft_ram_s1_readdata,                            //                                                .readdata
		output wire [31:0] ioaux_soft_ram_s1_writedata,                           //                                                .writedata
		output wire [3:0]  ioaux_soft_ram_s1_byteenable,                          //                                                .byteenable
		output wire        ioaux_soft_ram_s1_chipselect,                          //                                                .chipselect
		output wire        ioaux_soft_ram_s1_clken,                               //                                                .clken
		output wire        ioaux_soft_ram_s1_debugaccess                          //                                                .debugaccess
	);

	wire         ioaux_master_bridge_m0_translator_avalon_universal_master_0_waitrequest;   // ioaux_soft_ram_s1_translator:uav_waitrequest -> ioaux_master_bridge_m0_translator:uav_waitrequest
	wire  [31:0] ioaux_master_bridge_m0_translator_avalon_universal_master_0_readdata;      // ioaux_soft_ram_s1_translator:uav_readdata -> ioaux_master_bridge_m0_translator:uav_readdata
	wire         ioaux_master_bridge_m0_translator_avalon_universal_master_0_debugaccess;   // ioaux_master_bridge_m0_translator:uav_debugaccess -> ioaux_soft_ram_s1_translator:uav_debugaccess
	wire  [15:0] ioaux_master_bridge_m0_translator_avalon_universal_master_0_address;       // ioaux_master_bridge_m0_translator:uav_address -> ioaux_soft_ram_s1_translator:uav_address
	wire         ioaux_master_bridge_m0_translator_avalon_universal_master_0_read;          // ioaux_master_bridge_m0_translator:uav_read -> ioaux_soft_ram_s1_translator:uav_read
	wire   [3:0] ioaux_master_bridge_m0_translator_avalon_universal_master_0_byteenable;    // ioaux_master_bridge_m0_translator:uav_byteenable -> ioaux_soft_ram_s1_translator:uav_byteenable
	wire         ioaux_master_bridge_m0_translator_avalon_universal_master_0_readdatavalid; // ioaux_soft_ram_s1_translator:uav_readdatavalid -> ioaux_master_bridge_m0_translator:uav_readdatavalid
	wire         ioaux_master_bridge_m0_translator_avalon_universal_master_0_lock;          // ioaux_master_bridge_m0_translator:uav_lock -> ioaux_soft_ram_s1_translator:uav_lock
	wire         ioaux_master_bridge_m0_translator_avalon_universal_master_0_write;         // ioaux_master_bridge_m0_translator:uav_write -> ioaux_soft_ram_s1_translator:uav_write
	wire  [31:0] ioaux_master_bridge_m0_translator_avalon_universal_master_0_writedata;     // ioaux_master_bridge_m0_translator:uav_writedata -> ioaux_soft_ram_s1_translator:uav_writedata
	wire   [2:0] ioaux_master_bridge_m0_translator_avalon_universal_master_0_burstcount;    // ioaux_master_bridge_m0_translator:uav_burstcount -> ioaux_soft_ram_s1_translator:uav_burstcount

	altera_merlin_master_translator #(
		.AV_ADDRESS_W                (16),
		.AV_DATA_W                   (32),
		.AV_BURSTCOUNT_W             (1),
		.AV_BYTEENABLE_W             (4),
		.UAV_ADDRESS_W               (16),
		.UAV_BURSTCOUNT_W            (3),
		.USE_READ                    (1),
		.USE_WRITE                   (1),
		.USE_BEGINBURSTTRANSFER      (0),
		.USE_BEGINTRANSFER           (0),
		.USE_CHIPSELECT              (0),
		.USE_BURSTCOUNT              (1),
		.USE_READDATAVALID           (1),
		.USE_WAITREQUEST             (1),
		.USE_READRESPONSE            (0),
		.USE_WRITERESPONSE           (0),
		.AV_SYMBOLS_PER_WORD         (4),
		.AV_ADDRESS_SYMBOLS          (1),
		.AV_BURSTCOUNT_SYMBOLS       (0),
		.AV_CONSTANT_BURST_BEHAVIOR  (0),
		.UAV_CONSTANT_BURST_BEHAVIOR (0),
		.AV_LINEWRAPBURSTS           (0),
		.AV_REGISTERINCOMINGSIGNALS  (0)
	) ioaux_master_bridge_m0_translator (
		.clk                    (clk_bridge_out_clk_clk),                                                    //                       clk.clk
		.reset                  (ioaux_master_bridge_reset_reset_bridge_in_reset_reset),                     //                     reset.reset
		.uav_address            (ioaux_master_bridge_m0_translator_avalon_universal_master_0_address),       // avalon_universal_master_0.address
		.uav_burstcount         (ioaux_master_bridge_m0_translator_avalon_universal_master_0_burstcount),    //                          .burstcount
		.uav_read               (ioaux_master_bridge_m0_translator_avalon_universal_master_0_read),          //                          .read
		.uav_write              (ioaux_master_bridge_m0_translator_avalon_universal_master_0_write),         //                          .write
		.uav_waitrequest        (ioaux_master_bridge_m0_translator_avalon_universal_master_0_waitrequest),   //                          .waitrequest
		.uav_readdatavalid      (ioaux_master_bridge_m0_translator_avalon_universal_master_0_readdatavalid), //                          .readdatavalid
		.uav_byteenable         (ioaux_master_bridge_m0_translator_avalon_universal_master_0_byteenable),    //                          .byteenable
		.uav_readdata           (ioaux_master_bridge_m0_translator_avalon_universal_master_0_readdata),      //                          .readdata
		.uav_writedata          (ioaux_master_bridge_m0_translator_avalon_universal_master_0_writedata),     //                          .writedata
		.uav_lock               (ioaux_master_bridge_m0_translator_avalon_universal_master_0_lock),          //                          .lock
		.uav_debugaccess        (ioaux_master_bridge_m0_translator_avalon_universal_master_0_debugaccess),   //                          .debugaccess
		.av_address             (ioaux_master_bridge_m0_address),                                            //      avalon_anti_master_0.address
		.av_waitrequest         (ioaux_master_bridge_m0_waitrequest),                                        //                          .waitrequest
		.av_burstcount          (ioaux_master_bridge_m0_burstcount),                                         //                          .burstcount
		.av_byteenable          (ioaux_master_bridge_m0_byteenable),                                         //                          .byteenable
		.av_read                (ioaux_master_bridge_m0_read),                                               //                          .read
		.av_readdata            (ioaux_master_bridge_m0_readdata),                                           //                          .readdata
		.av_readdatavalid       (ioaux_master_bridge_m0_readdatavalid),                                      //                          .readdatavalid
		.av_write               (ioaux_master_bridge_m0_write),                                              //                          .write
		.av_writedata           (ioaux_master_bridge_m0_writedata),                                          //                          .writedata
		.av_debugaccess         (ioaux_master_bridge_m0_debugaccess),                                        //                          .debugaccess
		.av_beginbursttransfer  (1'b0),                                                                      //               (terminated)
		.av_begintransfer       (1'b0),                                                                      //               (terminated)
		.av_chipselect          (1'b0),                                                                      //               (terminated)
		.av_lock                (1'b0),                                                                      //               (terminated)
		.uav_clken              (),                                                                          //               (terminated)
		.av_clken               (1'b1),                                                                      //               (terminated)
		.uav_response           (2'b00),                                                                     //               (terminated)
		.av_response            (),                                                                          //               (terminated)
		.uav_writeresponsevalid (1'b0),                                                                      //               (terminated)
		.av_writeresponsevalid  ()                                                                           //               (terminated)
	);

	altera_merlin_slave_translator #(
		.AV_ADDRESS_W                   (12),
		.AV_DATA_W                      (32),
		.UAV_DATA_W                     (32),
		.AV_BURSTCOUNT_W                (1),
		.AV_BYTEENABLE_W                (4),
		.UAV_BYTEENABLE_W               (4),
		.UAV_ADDRESS_W                  (16),
		.UAV_BURSTCOUNT_W               (3),
		.AV_READLATENCY                 (1),
		.USE_READDATAVALID              (0),
		.USE_WAITREQUEST                (0),
		.USE_UAV_CLKEN                  (0),
		.USE_READRESPONSE               (0),
		.USE_WRITERESPONSE              (0),
		.AV_SYMBOLS_PER_WORD            (4),
		.AV_ADDRESS_SYMBOLS             (0),
		.AV_BURSTCOUNT_SYMBOLS          (0),
		.AV_CONSTANT_BURST_BEHAVIOR     (0),
		.UAV_CONSTANT_BURST_BEHAVIOR    (0),
		.AV_REQUIRE_UNALIGNED_ADDRESSES (0),
		.CHIPSELECT_THROUGH_READLATENCY (0),
		.AV_READ_WAIT_CYCLES            (0),
		.AV_WRITE_WAIT_CYCLES           (0),
		.AV_SETUP_WAIT_CYCLES           (0),
		.AV_DATA_HOLD_CYCLES            (0)
	) ioaux_soft_ram_s1_translator (
		.clk                    (clk_bridge_out_clk_clk),                                                    //                      clk.clk
		.reset                  (ioaux_master_bridge_reset_reset_bridge_in_reset_reset),                     //                    reset.reset
		.uav_address            (ioaux_master_bridge_m0_translator_avalon_universal_master_0_address),       // avalon_universal_slave_0.address
		.uav_burstcount         (ioaux_master_bridge_m0_translator_avalon_universal_master_0_burstcount),    //                         .burstcount
		.uav_read               (ioaux_master_bridge_m0_translator_avalon_universal_master_0_read),          //                         .read
		.uav_write              (ioaux_master_bridge_m0_translator_avalon_universal_master_0_write),         //                         .write
		.uav_waitrequest        (ioaux_master_bridge_m0_translator_avalon_universal_master_0_waitrequest),   //                         .waitrequest
		.uav_readdatavalid      (ioaux_master_bridge_m0_translator_avalon_universal_master_0_readdatavalid), //                         .readdatavalid
		.uav_byteenable         (ioaux_master_bridge_m0_translator_avalon_universal_master_0_byteenable),    //                         .byteenable
		.uav_readdata           (ioaux_master_bridge_m0_translator_avalon_universal_master_0_readdata),      //                         .readdata
		.uav_writedata          (ioaux_master_bridge_m0_translator_avalon_universal_master_0_writedata),     //                         .writedata
		.uav_lock               (ioaux_master_bridge_m0_translator_avalon_universal_master_0_lock),          //                         .lock
		.uav_debugaccess        (ioaux_master_bridge_m0_translator_avalon_universal_master_0_debugaccess),   //                         .debugaccess
		.av_address             (ioaux_soft_ram_s1_address),                                                 //      avalon_anti_slave_0.address
		.av_write               (ioaux_soft_ram_s1_write),                                                   //                         .write
		.av_readdata            (ioaux_soft_ram_s1_readdata),                                                //                         .readdata
		.av_writedata           (ioaux_soft_ram_s1_writedata),                                               //                         .writedata
		.av_byteenable          (ioaux_soft_ram_s1_byteenable),                                              //                         .byteenable
		.av_chipselect          (ioaux_soft_ram_s1_chipselect),                                              //                         .chipselect
		.av_clken               (ioaux_soft_ram_s1_clken),                                                   //                         .clken
		.av_debugaccess         (ioaux_soft_ram_s1_debugaccess),                                             //                         .debugaccess
		.av_read                (),                                                                          //              (terminated)
		.av_begintransfer       (),                                                                          //              (terminated)
		.av_beginbursttransfer  (),                                                                          //              (terminated)
		.av_burstcount          (),                                                                          //              (terminated)
		.av_readdatavalid       (1'b0),                                                                      //              (terminated)
		.av_waitrequest         (1'b0),                                                                      //              (terminated)
		.av_writebyteenable     (),                                                                          //              (terminated)
		.av_lock                (),                                                                          //              (terminated)
		.uav_clken              (1'b0),                                                                      //              (terminated)
		.av_outputenable        (),                                                                          //              (terminated)
		.uav_response           (),                                                                          //              (terminated)
		.av_response            (2'b00),                                                                     //              (terminated)
		.uav_writeresponsevalid (),                                                                          //              (terminated)
		.av_writeresponsevalid  (1'b0)                                                                       //              (terminated)
	);

endmodule
