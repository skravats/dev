// system_bd_altera_emif_cal_slave_nf_181_c5oooyy.v

// This file was auto-generated from altera_emif_cal_slave_nf_hw.tcl.  If you edit it your changes
// will probably be lost.
// 
// Generated using ACDS version 18.1 625

`timescale 1 ps / 1 ps
module system_bd_altera_emif_cal_slave_nf_181_c5oooyy (
		input  wire        clk_clk,           // clk.clk
		input  wire        rst_reset,         // rst.reset
		output wire        avl_waitrequest,   // avl.waitrequest
		output wire [31:0] avl_readdata,      //    .readdata
		output wire        avl_readdatavalid, //    .readdatavalid
		input  wire [0:0]  avl_burstcount,    //    .burstcount
		input  wire [31:0] avl_writedata,     //    .writedata
		input  wire [15:0] avl_address,       //    .address
		input  wire        avl_write,         //    .write
		input  wire        avl_read,          //    .read
		input  wire [3:0]  avl_byteenable,    //    .byteenable
		input  wire        avl_debugaccess    //    .debugaccess
	);

	wire         ioaux_master_bridge_m0_waitrequest;              // mm_interconnect_0:ioaux_master_bridge_m0_waitrequest -> ioaux_master_bridge:m0_waitrequest
	wire  [31:0] ioaux_master_bridge_m0_readdata;                 // mm_interconnect_0:ioaux_master_bridge_m0_readdata -> ioaux_master_bridge:m0_readdata
	wire         ioaux_master_bridge_m0_debugaccess;              // ioaux_master_bridge:m0_debugaccess -> mm_interconnect_0:ioaux_master_bridge_m0_debugaccess
	wire  [15:0] ioaux_master_bridge_m0_address;                  // ioaux_master_bridge:m0_address -> mm_interconnect_0:ioaux_master_bridge_m0_address
	wire         ioaux_master_bridge_m0_read;                     // ioaux_master_bridge:m0_read -> mm_interconnect_0:ioaux_master_bridge_m0_read
	wire   [3:0] ioaux_master_bridge_m0_byteenable;               // ioaux_master_bridge:m0_byteenable -> mm_interconnect_0:ioaux_master_bridge_m0_byteenable
	wire         ioaux_master_bridge_m0_readdatavalid;            // mm_interconnect_0:ioaux_master_bridge_m0_readdatavalid -> ioaux_master_bridge:m0_readdatavalid
	wire  [31:0] ioaux_master_bridge_m0_writedata;                // ioaux_master_bridge:m0_writedata -> mm_interconnect_0:ioaux_master_bridge_m0_writedata
	wire         ioaux_master_bridge_m0_write;                    // ioaux_master_bridge:m0_write -> mm_interconnect_0:ioaux_master_bridge_m0_write
	wire   [0:0] ioaux_master_bridge_m0_burstcount;               // ioaux_master_bridge:m0_burstcount -> mm_interconnect_0:ioaux_master_bridge_m0_burstcount
	wire         mm_interconnect_0_ioaux_soft_ram_s1_chipselect;  // mm_interconnect_0:ioaux_soft_ram_s1_chipselect -> ioaux_soft_ram:chipselect
	wire  [31:0] mm_interconnect_0_ioaux_soft_ram_s1_readdata;    // ioaux_soft_ram:readdata -> mm_interconnect_0:ioaux_soft_ram_s1_readdata
	wire         mm_interconnect_0_ioaux_soft_ram_s1_debugaccess; // mm_interconnect_0:ioaux_soft_ram_s1_debugaccess -> ioaux_soft_ram:debugaccess
	wire  [11:0] mm_interconnect_0_ioaux_soft_ram_s1_address;     // mm_interconnect_0:ioaux_soft_ram_s1_address -> ioaux_soft_ram:address
	wire   [3:0] mm_interconnect_0_ioaux_soft_ram_s1_byteenable;  // mm_interconnect_0:ioaux_soft_ram_s1_byteenable -> ioaux_soft_ram:byteenable
	wire         mm_interconnect_0_ioaux_soft_ram_s1_write;       // mm_interconnect_0:ioaux_soft_ram_s1_write -> ioaux_soft_ram:write
	wire  [31:0] mm_interconnect_0_ioaux_soft_ram_s1_writedata;   // mm_interconnect_0:ioaux_soft_ram_s1_writedata -> ioaux_soft_ram:writedata
	wire         mm_interconnect_0_ioaux_soft_ram_s1_clken;       // mm_interconnect_0:ioaux_soft_ram_s1_clken -> ioaux_soft_ram:clken
	wire         rst_controller_reset_out_reset;                  // rst_controller:reset_out -> [ioaux_master_bridge:reset, ioaux_soft_ram:reset, mm_interconnect_0:ioaux_master_bridge_reset_reset_bridge_in_reset_reset]

	altera_avalon_mm_bridge #(
		.DATA_WIDTH        (32),
		.SYMBOL_WIDTH      (8),
		.HDL_ADDR_WIDTH    (16),
		.BURSTCOUNT_WIDTH  (1),
		.PIPELINE_COMMAND  (1),
		.PIPELINE_RESPONSE (1)
	) ioaux_master_bridge (
		.clk              (clk_clk),                              //   clk.clk
		.reset            (rst_controller_reset_out_reset),       // reset.reset
		.s0_waitrequest   (avl_waitrequest),                      //    s0.waitrequest
		.s0_readdata      (avl_readdata),                         //      .readdata
		.s0_readdatavalid (avl_readdatavalid),                    //      .readdatavalid
		.s0_burstcount    (avl_burstcount),                       //      .burstcount
		.s0_writedata     (avl_writedata),                        //      .writedata
		.s0_address       (avl_address),                          //      .address
		.s0_write         (avl_write),                            //      .write
		.s0_read          (avl_read),                             //      .read
		.s0_byteenable    (avl_byteenable),                       //      .byteenable
		.s0_debugaccess   (avl_debugaccess),                      //      .debugaccess
		.m0_waitrequest   (ioaux_master_bridge_m0_waitrequest),   //    m0.waitrequest
		.m0_readdata      (ioaux_master_bridge_m0_readdata),      //      .readdata
		.m0_readdatavalid (ioaux_master_bridge_m0_readdatavalid), //      .readdatavalid
		.m0_burstcount    (ioaux_master_bridge_m0_burstcount),    //      .burstcount
		.m0_writedata     (ioaux_master_bridge_m0_writedata),     //      .writedata
		.m0_address       (ioaux_master_bridge_m0_address),       //      .address
		.m0_write         (ioaux_master_bridge_m0_write),         //      .write
		.m0_read          (ioaux_master_bridge_m0_read),          //      .read
		.m0_byteenable    (ioaux_master_bridge_m0_byteenable),    //      .byteenable
		.m0_debugaccess   (ioaux_master_bridge_m0_debugaccess),   //      .debugaccess
		.s0_response      (),                                     // (terminated)
		.m0_response      (2'b00)                                 // (terminated)
	);

	system_bd_altera_avalon_onchip_memory2_181_76knrqa ioaux_soft_ram (
		.clk         (clk_clk),                                         //   clk1.clk
		.address     (mm_interconnect_0_ioaux_soft_ram_s1_address),     //     s1.address
		.debugaccess (mm_interconnect_0_ioaux_soft_ram_s1_debugaccess), //       .debugaccess
		.clken       (mm_interconnect_0_ioaux_soft_ram_s1_clken),       //       .clken
		.chipselect  (mm_interconnect_0_ioaux_soft_ram_s1_chipselect),  //       .chipselect
		.write       (mm_interconnect_0_ioaux_soft_ram_s1_write),       //       .write
		.readdata    (mm_interconnect_0_ioaux_soft_ram_s1_readdata),    //       .readdata
		.writedata   (mm_interconnect_0_ioaux_soft_ram_s1_writedata),   //       .writedata
		.byteenable  (mm_interconnect_0_ioaux_soft_ram_s1_byteenable),  //       .byteenable
		.reset       (rst_controller_reset_out_reset),                  // reset1.reset
		.reset_req   (1'b0),                                            // (terminated)
		.freeze      (1'b0)                                             // (terminated)
	);

	system_bd_altera_mm_interconnect_181_cazrnua mm_interconnect_0 (
		.clk_bridge_out_clk_clk                                (clk_clk),                                         //                              clk_bridge_out_clk.clk
		.ioaux_master_bridge_reset_reset_bridge_in_reset_reset (rst_controller_reset_out_reset),                  // ioaux_master_bridge_reset_reset_bridge_in_reset.reset
		.ioaux_master_bridge_m0_address                        (ioaux_master_bridge_m0_address),                  //                          ioaux_master_bridge_m0.address
		.ioaux_master_bridge_m0_waitrequest                    (ioaux_master_bridge_m0_waitrequest),              //                                                .waitrequest
		.ioaux_master_bridge_m0_burstcount                     (ioaux_master_bridge_m0_burstcount),               //                                                .burstcount
		.ioaux_master_bridge_m0_byteenable                     (ioaux_master_bridge_m0_byteenable),               //                                                .byteenable
		.ioaux_master_bridge_m0_read                           (ioaux_master_bridge_m0_read),                     //                                                .read
		.ioaux_master_bridge_m0_readdata                       (ioaux_master_bridge_m0_readdata),                 //                                                .readdata
		.ioaux_master_bridge_m0_readdatavalid                  (ioaux_master_bridge_m0_readdatavalid),            //                                                .readdatavalid
		.ioaux_master_bridge_m0_write                          (ioaux_master_bridge_m0_write),                    //                                                .write
		.ioaux_master_bridge_m0_writedata                      (ioaux_master_bridge_m0_writedata),                //                                                .writedata
		.ioaux_master_bridge_m0_debugaccess                    (ioaux_master_bridge_m0_debugaccess),              //                                                .debugaccess
		.ioaux_soft_ram_s1_address                             (mm_interconnect_0_ioaux_soft_ram_s1_address),     //                               ioaux_soft_ram_s1.address
		.ioaux_soft_ram_s1_write                               (mm_interconnect_0_ioaux_soft_ram_s1_write),       //                                                .write
		.ioaux_soft_ram_s1_readdata                            (mm_interconnect_0_ioaux_soft_ram_s1_readdata),    //                                                .readdata
		.ioaux_soft_ram_s1_writedata                           (mm_interconnect_0_ioaux_soft_ram_s1_writedata),   //                                                .writedata
		.ioaux_soft_ram_s1_byteenable                          (mm_interconnect_0_ioaux_soft_ram_s1_byteenable),  //                                                .byteenable
		.ioaux_soft_ram_s1_chipselect                          (mm_interconnect_0_ioaux_soft_ram_s1_chipselect),  //                                                .chipselect
		.ioaux_soft_ram_s1_clken                               (mm_interconnect_0_ioaux_soft_ram_s1_clken),       //                                                .clken
		.ioaux_soft_ram_s1_debugaccess                         (mm_interconnect_0_ioaux_soft_ram_s1_debugaccess)  //                                                .debugaccess
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (0),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (rst_reset),                      // reset_in0.reset
		.clk            (clk_clk),                        //       clk.clk
		.reset_out      (rst_controller_reset_out_reset), // reset_out.reset
		.reset_req      (),                               // (terminated)
		.reset_req_in0  (1'b0),                           // (terminated)
		.reset_in1      (1'b0),                           // (terminated)
		.reset_req_in1  (1'b0),                           // (terminated)
		.reset_in2      (1'b0),                           // (terminated)
		.reset_req_in2  (1'b0),                           // (terminated)
		.reset_in3      (1'b0),                           // (terminated)
		.reset_req_in3  (1'b0),                           // (terminated)
		.reset_in4      (1'b0),                           // (terminated)
		.reset_req_in4  (1'b0),                           // (terminated)
		.reset_in5      (1'b0),                           // (terminated)
		.reset_req_in5  (1'b0),                           // (terminated)
		.reset_in6      (1'b0),                           // (terminated)
		.reset_req_in6  (1'b0),                           // (terminated)
		.reset_in7      (1'b0),                           // (terminated)
		.reset_req_in7  (1'b0),                           // (terminated)
		.reset_in8      (1'b0),                           // (terminated)
		.reset_req_in8  (1'b0),                           // (terminated)
		.reset_in9      (1'b0),                           // (terminated)
		.reset_req_in9  (1'b0),                           // (terminated)
		.reset_in10     (1'b0),                           // (terminated)
		.reset_req_in10 (1'b0),                           // (terminated)
		.reset_in11     (1'b0),                           // (terminated)
		.reset_req_in11 (1'b0),                           // (terminated)
		.reset_in12     (1'b0),                           // (terminated)
		.reset_req_in12 (1'b0),                           // (terminated)
		.reset_in13     (1'b0),                           // (terminated)
		.reset_req_in13 (1'b0),                           // (terminated)
		.reset_in14     (1'b0),                           // (terminated)
		.reset_req_in14 (1'b0),                           // (terminated)
		.reset_in15     (1'b0),                           // (terminated)
		.reset_req_in15 (1'b0)                            // (terminated)
	);

endmodule
