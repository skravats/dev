// interlaken_phy.v

// Generated using ACDS version 18.1.2 277

`timescale 1 ps / 1 ps
module interlaken_phy (
		input  wire        clk125_clk,                           //                   clk125.clk
		input  wire [7:0]  phy_data_ctrl_csr_s0_address,         //     phy_data_ctrl_csr_s0.address
		input  wire        phy_data_ctrl_csr_s0_read,            //                         .read
		output wire [31:0] phy_data_ctrl_csr_s0_readdata,        //                         .readdata
		output wire        phy_data_ctrl_csr_s0_readdatavalid,   //                         .readdatavalid
		input  wire        phy_data_ctrl_csr_s0_write,           //                         .write
		input  wire [31:0] phy_data_ctrl_csr_s0_writedata,       //                         .writedata
		output wire        phy_data_ctrl_csr_s0_waitrequest,     //                         .waitrequest
		output wire [31:0] phy_data_ctrl_m0_address,             //         phy_data_ctrl_m0.address
		output wire        phy_data_ctrl_m0_read,                //                         .read
		input  wire        phy_data_ctrl_m0_waitrequest,         //                         .waitrequest
		input  wire [31:0] phy_data_ctrl_m0_readdata,            //                         .readdata
		input  wire        phy_data_ctrl_m0_readdatavalid,       //                         .readdatavalid
		output wire        phy_data_ctrl_m0_write,               //                         .write
		output wire [31:0] phy_data_ctrl_m0_writedata,           //                         .writedata
		output wire        phy_data_irq_rx_irq,                  //          phy_data_irq_rx.irq
		output wire        phy_data_irq_tx_irq,                  //          phy_data_irq_tx.irq
		output wire [0:0]  tx_serial_data_tx_serial_data,        //           tx_serial_data.tx_serial_data
		input  wire [0:0]  rx_serial_data_rx_serial_data,        //           rx_serial_data.rx_serial_data
		input  wire        reset_reset,                          //                    reset.reset
		input  wire        serial_clock_reconfig_s0_write,       // serial_clock_reconfig_s0.write
		input  wire        serial_clock_reconfig_s0_read,        //                         .read
		input  wire [9:0]  serial_clock_reconfig_s0_address,     //                         .address
		input  wire [31:0] serial_clock_reconfig_s0_writedata,   //                         .writedata
		output wire [31:0] serial_clock_reconfig_s0_readdata,    //                         .readdata
		output wire        serial_clock_reconfig_s0_waitrequest  //                         .waitrequest
	);

	wire         clock_in_out_clk_clk;                                               // clock_in:out_clk -> [phy_data_ctrl:clock, phy_interconnect:rx_cdr_refclk0, phy_reset_ctrl:clock, reset_in:clk, serial_clock:pll_refclk0, serial_clock:reconfig_clk0]
	wire   [0:0] phy_interconnect_rx_clkout_clk;                                     // phy_interconnect:rx_clkout -> [phy_data_ctrl:rx_coreclkin, phy_interconnect:rx_coreclkin]
	wire   [0:0] phy_interconnect_tx_clkout_clk;                                     // phy_interconnect:tx_clkout -> [phy_data_ctrl:tx_coreclkin, phy_interconnect:tx_coreclkin]
	wire         serial_clock_pll_locked_pll_locked;                                 // serial_clock:pll_locked -> phy_data_ctrl:atx_pll_locked
	wire         serial_clock_pll_cal_busy_pll_cal_busy;                             // serial_clock:pll_cal_busy -> phy_reset_ctrl:pll_cal_busy
	wire         phy_data_ctrl_pll_locked_out_pll_locked;                            // phy_data_ctrl:pll_locked_out -> phy_reset_ctrl:pll_locked
	wire         phy_data_ctrl_atx_pll_powerdown_pll_powerdown;                      // phy_data_ctrl:atx_pll_powerdown -> serial_clock:pll_powerdown
	wire   [0:0] phy_reset_ctrl_pll_powerdown_pll_powerdown;                         // phy_reset_ctrl:pll_powerdown -> phy_data_ctrl:pll_powerdown_input
	wire         phy_data_ctrl_pll_select_pll_select;                                // phy_data_ctrl:pll_select -> phy_reset_ctrl:pll_select
	wire   [0:0] phy_reset_ctrl_rx_analogreset_rx_analogreset;                       // phy_reset_ctrl:rx_analogreset -> phy_interconnect:rx_analogreset
	wire   [0:0] phy_interconnect_rx_cal_busy_rx_cal_busy;                           // phy_interconnect:rx_cal_busy -> phy_reset_ctrl:rx_cal_busy
	wire   [9:0] phy_interconnect_rx_control_rx_control;                             // phy_interconnect:rx_control -> phy_data_ctrl:rx_control
	wire   [0:0] phy_reset_ctrl_rx_digitalreset_rx_digitalreset;                     // phy_reset_ctrl:rx_digitalreset -> phy_interconnect:rx_digitalreset
	wire   [0:0] phy_interconnect_rx_enh_fifo_empty_rx_enh_fifo_empty;               // phy_interconnect:rx_enh_fifo_empty -> phy_data_ctrl:rx_enh_fifo_empty
	wire   [0:0] phy_interconnect_rx_enh_fifo_full_rx_enh_fifo_full;                 // phy_interconnect:rx_enh_fifo_full -> phy_data_ctrl:rx_enh_fifo_full
	wire   [0:0] phy_interconnect_rx_enh_fifo_pempty_rx_enh_fifo_pempty;             // phy_interconnect:rx_enh_fifo_pempty -> phy_data_ctrl:rx_enh_fifo_pempty
	wire   [0:0] phy_interconnect_rx_enh_fifo_pfull_rx_enh_fifo_pfull;               // phy_interconnect:rx_enh_fifo_pfull -> phy_data_ctrl:rx_enh_fifo_pfull
	wire         phy_data_ctrl_rx_enh_fifo_rd_en_rx_enh_fifo_rd_en;                  // phy_data_ctrl:rx_enh_fifo_rd_en -> phy_interconnect:rx_enh_fifo_rd_en
	wire   [1:0] phy_interconnect_rx_enh_frame_diag_status_rx_enh_frame_diag_status; // phy_interconnect:rx_enh_frame_diag_status -> phy_data_ctrl:rx_enh_frame_diag_status
	wire   [0:0] phy_interconnect_rx_is_lockedtodata_rx_is_lockedtodata;             // phy_interconnect:rx_is_lockedtodata -> phy_reset_ctrl:rx_is_lockedtodata
	wire  [63:0] phy_interconnect_rx_parallel_data_rx_parallel_data;                 // phy_interconnect:rx_parallel_data -> phy_data_ctrl:rx_parallel_data
	wire   [0:0] phy_reset_ctrl_rx_ready_rx_ready;                                   // phy_reset_ctrl:rx_ready -> phy_data_ctrl:rx_ready
	wire         phy_data_ctrl_rx_seriallpbken_rx_seriallpbken;                      // phy_data_ctrl:rx_seriallpbken -> phy_interconnect:rx_seriallpbken
	wire         phy_data_ctrl_rx_set_locktodata_rx_set_locktodata;                  // phy_data_ctrl:rx_set_locktodata -> phy_interconnect:rx_set_locktodata
	wire         phy_data_ctrl_rx_set_locktoref_rx_set_locktoref;                    // phy_data_ctrl:rx_set_locktoref -> phy_interconnect:rx_set_locktoref
	wire   [0:0] phy_reset_ctrl_tx_analogreset_tx_analogreset;                       // phy_reset_ctrl:tx_analogreset -> phy_interconnect:tx_analogreset
	wire   [0:0] phy_interconnect_tx_cal_busy_tx_cal_busy;                           // phy_interconnect:tx_cal_busy -> phy_reset_ctrl:tx_cal_busy
	wire   [2:0] phy_data_ctrl_tx_control_tx_control;                                // phy_data_ctrl:tx_control -> phy_interconnect:tx_control
	wire   [0:0] phy_reset_ctrl_tx_digitalreset_tx_digitalreset;                     // phy_reset_ctrl:tx_digitalreset -> phy_interconnect:tx_digitalreset
	wire         phy_data_ctrl_tx_enh_data_valid_tx_enh_data_valid;                  // phy_data_ctrl:tx_enh_data_valid -> phy_interconnect:tx_enh_data_valid
	wire   [0:0] phy_interconnect_tx_enh_fifo_empty_tx_enh_fifo_empty;               // phy_interconnect:tx_enh_fifo_empty -> phy_data_ctrl:tx_enh_fifo_empty
	wire   [0:0] phy_interconnect_tx_enh_fifo_full_tx_enh_fifo_full;                 // phy_interconnect:tx_enh_fifo_full -> phy_data_ctrl:tx_enh_fifo_full
	wire   [0:0] phy_interconnect_tx_enh_fifo_pempty_tx_enh_fifo_pempty;             // phy_interconnect:tx_enh_fifo_pempty -> phy_data_ctrl:tx_enh_fifo_pempty
	wire   [0:0] phy_interconnect_tx_enh_fifo_pfull_tx_enh_fifo_pfull;               // phy_interconnect:tx_enh_fifo_pfull -> phy_data_ctrl:tx_enh_fifo_pfull
	wire         phy_data_ctrl_tx_enh_frame_burst_en_tx_enh_frame_burst_en;          // phy_data_ctrl:tx_enh_frame_burst_en -> phy_interconnect:tx_enh_frame_burst_en
	wire   [1:0] phy_data_ctrl_tx_enh_frame_diag_status_tx_enh_frame_diag_status;    // phy_data_ctrl:tx_enh_frame_diag_status -> phy_interconnect:tx_enh_frame_diag_status
	wire         phy_data_ctrl_tx_err_ins_tx_err_ins;                                // phy_data_ctrl:tx_err_ins -> phy_interconnect:tx_err_ins
	wire  [63:0] phy_data_ctrl_tx_parallel_data_tx_parallel_data;                    // phy_data_ctrl:tx_parallel_data -> phy_interconnect:tx_parallel_data
	wire   [0:0] phy_reset_ctrl_tx_ready_tx_ready;                                   // phy_reset_ctrl:tx_ready -> phy_data_ctrl:tx_ready
	wire  [13:0] phy_data_ctrl_unused_tx_control_unused_tx_control;                  // phy_data_ctrl:unused_tx_control -> phy_interconnect:unused_tx_control
	wire  [63:0] phy_data_ctrl_unused_tx_parallel_data_unused_tx_parallel_data;      // phy_data_ctrl:unused_tx_parallel_data -> phy_interconnect:unused_tx_parallel_data
	wire         serial_clock_tx_serial_clk_clk;                                     // serial_clock:tx_serial_clk -> phy_interconnect:tx_serial_clk0
	wire         reset_in_out_reset_reset;                                           // reset_in:out_reset -> [phy_data_ctrl:reset, serial_clock:reconfig_reset0]
	wire         phy_data_ctrl_reset_phy_reset;                                      // phy_data_ctrl:reset_phy -> phy_reset_ctrl:reset

	interlaken_phy_clock_bridge_0 clock_in (
		.in_clk  (clk125_clk),           //   input,  width = 1,  in_clk.clk
		.out_clk (clock_in_out_clk_clk)  //  output,  width = 1, out_clk.clk
	);

	interlaken_phy_xcvr_data_flow_controller_0 phy_data_ctrl (
		.csr_s0_address           (phy_data_ctrl_csr_s0_address),                                       //   input,   width = 8,                   csr_s0.address
		.csr_s0_read              (phy_data_ctrl_csr_s0_read),                                          //   input,   width = 1,                         .read
		.csr_s0_readdata          (phy_data_ctrl_csr_s0_readdata),                                      //  output,  width = 32,                         .readdata
		.csr_s0_readdatavalid     (phy_data_ctrl_csr_s0_readdatavalid),                                 //  output,   width = 1,                         .readdatavalid
		.csr_s0_write             (phy_data_ctrl_csr_s0_write),                                         //   input,   width = 1,                         .write
		.csr_s0_writedata         (phy_data_ctrl_csr_s0_writedata),                                     //   input,  width = 32,                         .writedata
		.csr_s0_waitrequest       (phy_data_ctrl_csr_s0_waitrequest),                                   //  output,   width = 1,                         .waitrequest
		.rx_parallel_data         (phy_interconnect_rx_parallel_data_rx_parallel_data),                 //   input,  width = 64,         rx_parallel_data.rx_parallel_data
		.tx_parallel_data         (phy_data_ctrl_tx_parallel_data_tx_parallel_data),                    //  output,  width = 64,         tx_parallel_data.tx_parallel_data
		.rx_enh_fifo_full         (phy_interconnect_rx_enh_fifo_full_rx_enh_fifo_full),                 //   input,   width = 1,         rx_enh_fifo_full.rx_enh_fifo_full
		.rx_enh_fifo_pfull        (phy_interconnect_rx_enh_fifo_pfull_rx_enh_fifo_pfull),               //   input,   width = 1,        rx_enh_fifo_pfull.rx_enh_fifo_pfull
		.rx_enh_fifo_empty        (phy_interconnect_rx_enh_fifo_empty_rx_enh_fifo_empty),               //   input,   width = 1,        rx_enh_fifo_empty.rx_enh_fifo_empty
		.rx_enh_fifo_pempty       (phy_interconnect_rx_enh_fifo_pempty_rx_enh_fifo_pempty),             //   input,   width = 1,       rx_enh_fifo_pempty.rx_enh_fifo_pempty
		.tx_enh_fifo_pempty       (phy_interconnect_tx_enh_fifo_pempty_tx_enh_fifo_pempty),             //   input,   width = 1,       tx_enh_fifo_pempty.tx_enh_fifo_pempty
		.tx_enh_fifo_empty        (phy_interconnect_tx_enh_fifo_empty_tx_enh_fifo_empty),               //   input,   width = 1,        tx_enh_fifo_empty.tx_enh_fifo_empty
		.tx_enh_fifo_pfull        (phy_interconnect_tx_enh_fifo_pfull_tx_enh_fifo_pfull),               //   input,   width = 1,        tx_enh_fifo_pfull.tx_enh_fifo_pfull
		.tx_enh_fifo_full         (phy_interconnect_tx_enh_fifo_full_tx_enh_fifo_full),                 //   input,   width = 1,         tx_enh_fifo_full.tx_enh_fifo_full
		.avm_m0_address           (phy_data_ctrl_m0_address),                                           //  output,  width = 32,                   avm_m0.address
		.avm_m0_read              (phy_data_ctrl_m0_read),                                              //  output,   width = 1,                         .read
		.avm_m0_waitrequest       (phy_data_ctrl_m0_waitrequest),                                       //   input,   width = 1,                         .waitrequest
		.avm_m0_readdata          (phy_data_ctrl_m0_readdata),                                          //   input,  width = 32,                         .readdata
		.avm_m0_readdatavalid     (phy_data_ctrl_m0_readdatavalid),                                     //   input,   width = 1,                         .readdatavalid
		.avm_m0_write             (phy_data_ctrl_m0_write),                                             //  output,   width = 1,                         .write
		.avm_m0_writedata         (phy_data_ctrl_m0_writedata),                                         //  output,  width = 32,                         .writedata
		.tx_control               (phy_data_ctrl_tx_control_tx_control),                                //  output,   width = 3,               tx_control.tx_control
		.rx_control               (phy_interconnect_rx_control_rx_control),                             //   input,  width = 10,               rx_control.rx_control
		.reset                    (reset_in_out_reset_reset),                                           //   input,   width = 1,                      rst.reset
		.clock                    (clock_in_out_clk_clk),                                               //   input,   width = 1,                      clk.clk
		.tx_ready                 (phy_reset_ctrl_tx_ready_tx_ready),                                   //   input,   width = 1,                 tx_ready.tx_ready
		.rx_ready                 (phy_reset_ctrl_rx_ready_rx_ready),                                   //   input,   width = 1,                 rx_ready.rx_ready
		.rx_irq                   (phy_data_irq_rx_irq),                                                //  output,   width = 1,                   irq_rx.irq
		.tx_enh_data_valid        (phy_data_ctrl_tx_enh_data_valid_tx_enh_data_valid),                  //  output,   width = 1,        tx_enh_data_valid.tx_enh_data_valid
		.tx_irq                   (phy_data_irq_tx_irq),                                                //  output,   width = 1,                   irq_tx.irq
		.tx_coreclkin             (phy_interconnect_tx_clkout_clk),                                     //   input,   width = 1,             tx_coreclkin.clk
		.rx_coreclkin             (phy_interconnect_rx_clkout_clk),                                     //   input,   width = 1,             rx_coreclkin.clk
		.rx_enh_fifo_rd_en        (phy_data_ctrl_rx_enh_fifo_rd_en_rx_enh_fifo_rd_en),                  //  output,   width = 1,        rx_enh_fifo_rd_en.rx_enh_fifo_rd_en
		.tx_err_ins               (phy_data_ctrl_tx_err_ins_tx_err_ins),                                //  output,   width = 1,               tx_err_ins.tx_err_ins
		.reset_phy                (phy_data_ctrl_reset_phy_reset),                                      //  output,   width = 1,                reset_phy.reset
		.pll_locked_out           (phy_data_ctrl_pll_locked_out_pll_locked),                            //  output,   width = 1,           pll_locked_out.pll_locked
		.pll_powerdown_input      (phy_reset_ctrl_pll_powerdown_pll_powerdown),                         //   input,   width = 1,      pll_powerdown_input.pll_powerdown
		.atx_pll_powerdown        (phy_data_ctrl_atx_pll_powerdown_pll_powerdown),                      //  output,   width = 1,        atx_pll_powerdown.pll_powerdown
		.atx_pll_locked           (serial_clock_pll_locked_pll_locked),                                 //   input,   width = 1,           atx_pll_locked.pll_locked
		.rx_set_locktodata        (phy_data_ctrl_rx_set_locktodata_rx_set_locktodata),                  //  output,   width = 1,        rx_set_locktodata.rx_set_locktodata
		.rx_set_locktoref         (phy_data_ctrl_rx_set_locktoref_rx_set_locktoref),                    //  output,   width = 1,         rx_set_locktoref.rx_set_locktoref
		.tx_enh_frame_burst_en    (phy_data_ctrl_tx_enh_frame_burst_en_tx_enh_frame_burst_en),          //  output,   width = 1,    tx_enh_frame_burst_en.tx_enh_frame_burst_en
		.tx_enh_frame_diag_status (phy_data_ctrl_tx_enh_frame_diag_status_tx_enh_frame_diag_status),    //  output,   width = 2, tx_enh_frame_diag_status.tx_enh_frame_diag_status
		.unused_tx_control        (phy_data_ctrl_unused_tx_control_unused_tx_control),                  //  output,  width = 14,        unused_tx_control.unused_tx_control
		.unused_tx_parallel_data  (phy_data_ctrl_unused_tx_parallel_data_unused_tx_parallel_data),      //  output,  width = 64,  unused_tx_parallel_data.unused_tx_parallel_data
		.rx_seriallpbken          (phy_data_ctrl_rx_seriallpbken_rx_seriallpbken),                      //  output,   width = 1,          rx_seriallpbken.rx_seriallpbken
		.pll_select               (phy_data_ctrl_pll_select_pll_select),                                //  output,   width = 1,               pll_select.pll_select
		.rx_enh_frame_diag_status (phy_interconnect_rx_enh_frame_diag_status_rx_enh_frame_diag_status)  //   input,   width = 2, rx_enh_frame_diag_status.rx_enh_frame_diag_status
	);

	interlaken_phy_xcvr_native_a10_0 phy_interconnect (
		.tx_analogreset           (phy_reset_ctrl_tx_analogreset_tx_analogreset),                       //   input,   width = 1,           tx_analogreset.tx_analogreset
		.tx_digitalreset          (phy_reset_ctrl_tx_digitalreset_tx_digitalreset),                     //   input,   width = 1,          tx_digitalreset.tx_digitalreset
		.rx_analogreset           (phy_reset_ctrl_rx_analogreset_rx_analogreset),                       //   input,   width = 1,           rx_analogreset.rx_analogreset
		.rx_digitalreset          (phy_reset_ctrl_rx_digitalreset_rx_digitalreset),                     //   input,   width = 1,          rx_digitalreset.rx_digitalreset
		.tx_cal_busy              (phy_interconnect_tx_cal_busy_tx_cal_busy),                           //  output,   width = 1,              tx_cal_busy.tx_cal_busy
		.rx_cal_busy              (phy_interconnect_rx_cal_busy_rx_cal_busy),                           //  output,   width = 1,              rx_cal_busy.rx_cal_busy
		.tx_serial_clk0           (serial_clock_tx_serial_clk_clk),                                     //   input,   width = 1,           tx_serial_clk0.clk
		.rx_cdr_refclk0           (clock_in_out_clk_clk),                                               //   input,   width = 1,           rx_cdr_refclk0.clk
		.tx_serial_data           (tx_serial_data_tx_serial_data),                                      //  output,   width = 1,           tx_serial_data.tx_serial_data
		.rx_serial_data           (rx_serial_data_rx_serial_data),                                      //   input,   width = 1,           rx_serial_data.rx_serial_data
		.rx_seriallpbken          (phy_data_ctrl_rx_seriallpbken_rx_seriallpbken),                      //   input,   width = 1,          rx_seriallpbken.rx_seriallpbken
		.rx_set_locktodata        (phy_data_ctrl_rx_set_locktodata_rx_set_locktodata),                  //   input,   width = 1,        rx_set_locktodata.rx_set_locktodata
		.rx_set_locktoref         (phy_data_ctrl_rx_set_locktoref_rx_set_locktoref),                    //   input,   width = 1,         rx_set_locktoref.rx_set_locktoref
		.rx_is_lockedtoref        (),                                                                   //  output,   width = 1,        rx_is_lockedtoref.rx_is_lockedtoref
		.rx_is_lockedtodata       (phy_interconnect_rx_is_lockedtodata_rx_is_lockedtodata),             //  output,   width = 1,       rx_is_lockedtodata.rx_is_lockedtodata
		.tx_coreclkin             (phy_interconnect_tx_clkout_clk),                                     //   input,   width = 1,             tx_coreclkin.clk
		.rx_coreclkin             (phy_interconnect_rx_clkout_clk),                                     //   input,   width = 1,             rx_coreclkin.clk
		.tx_clkout                (phy_interconnect_tx_clkout_clk),                                     //  output,   width = 1,                tx_clkout.clk
		.rx_clkout                (phy_interconnect_rx_clkout_clk),                                     //  output,   width = 1,                rx_clkout.clk
		.tx_parallel_data         (phy_data_ctrl_tx_parallel_data_tx_parallel_data),                    //   input,  width = 64,         tx_parallel_data.tx_parallel_data
		.tx_control               (phy_data_ctrl_tx_control_tx_control),                                //   input,   width = 3,               tx_control.tx_control
		.tx_err_ins               (phy_data_ctrl_tx_err_ins_tx_err_ins),                                //   input,   width = 1,               tx_err_ins.tx_err_ins
		.unused_tx_parallel_data  (phy_data_ctrl_unused_tx_parallel_data_unused_tx_parallel_data),      //   input,  width = 64,  unused_tx_parallel_data.unused_tx_parallel_data
		.unused_tx_control        (phy_data_ctrl_unused_tx_control_unused_tx_control),                  //   input,  width = 14,        unused_tx_control.unused_tx_control
		.rx_parallel_data         (phy_interconnect_rx_parallel_data_rx_parallel_data),                 //  output,  width = 64,         rx_parallel_data.rx_parallel_data
		.rx_control               (phy_interconnect_rx_control_rx_control),                             //  output,  width = 10,               rx_control.rx_control
		.unused_rx_parallel_data  (),                                                                   //  output,  width = 64,  unused_rx_parallel_data.unused_rx_parallel_data
		.unused_rx_control        (),                                                                   //  output,  width = 10,        unused_rx_control.unused_rx_control
		.tx_enh_data_valid        (phy_data_ctrl_tx_enh_data_valid_tx_enh_data_valid),                  //   input,   width = 1,        tx_enh_data_valid.tx_enh_data_valid
		.tx_enh_fifo_full         (phy_interconnect_tx_enh_fifo_full_tx_enh_fifo_full),                 //  output,   width = 1,         tx_enh_fifo_full.tx_enh_fifo_full
		.tx_enh_fifo_pfull        (phy_interconnect_tx_enh_fifo_pfull_tx_enh_fifo_pfull),               //  output,   width = 1,        tx_enh_fifo_pfull.tx_enh_fifo_pfull
		.tx_enh_fifo_empty        (phy_interconnect_tx_enh_fifo_empty_tx_enh_fifo_empty),               //  output,   width = 1,        tx_enh_fifo_empty.tx_enh_fifo_empty
		.tx_enh_fifo_pempty       (phy_interconnect_tx_enh_fifo_pempty_tx_enh_fifo_pempty),             //  output,   width = 1,       tx_enh_fifo_pempty.tx_enh_fifo_pempty
		.rx_enh_fifo_rd_en        (phy_data_ctrl_rx_enh_fifo_rd_en_rx_enh_fifo_rd_en),                  //   input,   width = 1,        rx_enh_fifo_rd_en.rx_enh_fifo_rd_en
		.rx_enh_fifo_full         (phy_interconnect_rx_enh_fifo_full_rx_enh_fifo_full),                 //  output,   width = 1,         rx_enh_fifo_full.rx_enh_fifo_full
		.rx_enh_fifo_pfull        (phy_interconnect_rx_enh_fifo_pfull_rx_enh_fifo_pfull),               //  output,   width = 1,        rx_enh_fifo_pfull.rx_enh_fifo_pfull
		.rx_enh_fifo_empty        (phy_interconnect_rx_enh_fifo_empty_rx_enh_fifo_empty),               //  output,   width = 1,        rx_enh_fifo_empty.rx_enh_fifo_empty
		.rx_enh_fifo_pempty       (phy_interconnect_rx_enh_fifo_pempty_rx_enh_fifo_pempty),             //  output,   width = 1,       rx_enh_fifo_pempty.rx_enh_fifo_pempty
		.tx_enh_frame_burst_en    (phy_data_ctrl_tx_enh_frame_burst_en_tx_enh_frame_burst_en),          //   input,   width = 1,          tx_enh_burst_en.tx_enh_frame_burst_en
		.tx_enh_frame_diag_status (phy_data_ctrl_tx_enh_frame_diag_status_tx_enh_frame_diag_status),    //   input,   width = 2, tx_enh_frame_diag_status.tx_enh_frame_diag_status
		.rx_enh_frame_diag_status (phy_interconnect_rx_enh_frame_diag_status_rx_enh_frame_diag_status)  //  output,   width = 2, rx_enh_frame_diag_status.rx_enh_frame_diag_status
	);

	interlaken_phy_xcvr_reset_control_0 phy_reset_ctrl (
		.clock              (clock_in_out_clk_clk),                                   //   input,  width = 1,              clock.clk
		.reset              (phy_data_ctrl_reset_phy_reset),                          //   input,  width = 1,              reset.reset
		.pll_powerdown      (phy_reset_ctrl_pll_powerdown_pll_powerdown),             //  output,  width = 1,      pll_powerdown.pll_powerdown
		.tx_analogreset     (phy_reset_ctrl_tx_analogreset_tx_analogreset),           //  output,  width = 1,     tx_analogreset.tx_analogreset
		.tx_digitalreset    (phy_reset_ctrl_tx_digitalreset_tx_digitalreset),         //  output,  width = 1,    tx_digitalreset.tx_digitalreset
		.tx_ready           (phy_reset_ctrl_tx_ready_tx_ready),                       //  output,  width = 1,           tx_ready.tx_ready
		.pll_locked         (phy_data_ctrl_pll_locked_out_pll_locked),                //   input,  width = 1,         pll_locked.pll_locked
		.pll_select         (phy_data_ctrl_pll_select_pll_select),                    //   input,  width = 1,         pll_select.pll_select
		.tx_cal_busy        (phy_interconnect_tx_cal_busy_tx_cal_busy),               //   input,  width = 1,        tx_cal_busy.tx_cal_busy
		.pll_cal_busy       (serial_clock_pll_cal_busy_pll_cal_busy),                 //   input,  width = 1,       pll_cal_busy.pll_cal_busy
		.rx_analogreset     (phy_reset_ctrl_rx_analogreset_rx_analogreset),           //  output,  width = 1,     rx_analogreset.rx_analogreset
		.rx_digitalreset    (phy_reset_ctrl_rx_digitalreset_rx_digitalreset),         //  output,  width = 1,    rx_digitalreset.rx_digitalreset
		.rx_ready           (phy_reset_ctrl_rx_ready_rx_ready),                       //  output,  width = 1,           rx_ready.rx_ready
		.rx_is_lockedtodata (phy_interconnect_rx_is_lockedtodata_rx_is_lockedtodata), //   input,  width = 1, rx_is_lockedtodata.rx_is_lockedtodata
		.rx_cal_busy        (phy_interconnect_rx_cal_busy_rx_cal_busy)                //   input,  width = 1,        rx_cal_busy.rx_cal_busy
	);

	interlaken_phy_reset_bridge_0 reset_in (
		.clk       (clock_in_out_clk_clk),     //   input,  width = 1,       clk.clk
		.in_reset  (reset_reset),              //   input,  width = 1,  in_reset.reset
		.out_reset (reset_in_out_reset_reset)  //  output,  width = 1, out_reset.reset
	);

	interlaken_phy_xcvr_atx_pll_a10_0 serial_clock (
		.pll_powerdown         (phy_data_ctrl_atx_pll_powerdown_pll_powerdown), //   input,   width = 1,   pll_powerdown.pll_powerdown
		.pll_refclk0           (clock_in_out_clk_clk),                          //   input,   width = 1,     pll_refclk0.clk
		.tx_serial_clk         (serial_clock_tx_serial_clk_clk),                //  output,   width = 1,   tx_serial_clk.clk
		.pll_locked            (serial_clock_pll_locked_pll_locked),            //  output,   width = 1,      pll_locked.pll_locked
		.reconfig_clk0         (clock_in_out_clk_clk),                          //   input,   width = 1,   reconfig_clk0.clk
		.reconfig_reset0       (reset_in_out_reset_reset),                      //   input,   width = 1, reconfig_reset0.reset
		.reconfig_write0       (serial_clock_reconfig_s0_write),                //   input,   width = 1,  reconfig_avmm0.write
		.reconfig_read0        (serial_clock_reconfig_s0_read),                 //   input,   width = 1,                .read
		.reconfig_address0     (serial_clock_reconfig_s0_address),              //   input,  width = 10,                .address
		.reconfig_writedata0   (serial_clock_reconfig_s0_writedata),            //   input,  width = 32,                .writedata
		.reconfig_readdata0    (serial_clock_reconfig_s0_readdata),             //  output,  width = 32,                .readdata
		.reconfig_waitrequest0 (serial_clock_reconfig_s0_waitrequest),          //  output,   width = 1,                .waitrequest
		.pll_cal_busy          (serial_clock_pll_cal_busy_pll_cal_busy)         //  output,   width = 1,    pll_cal_busy.pll_cal_busy
	);

endmodule
