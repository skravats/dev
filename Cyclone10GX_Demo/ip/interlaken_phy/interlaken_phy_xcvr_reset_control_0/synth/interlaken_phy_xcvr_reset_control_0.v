// interlaken_phy_xcvr_reset_control_0.v

// Generated using ACDS version 18.1.2 277

`timescale 1 ps / 1 ps
module interlaken_phy_xcvr_reset_control_0 (
		input  wire       clock,              //              clock.clk
		input  wire       reset,              //              reset.reset
		output wire [0:0] pll_powerdown,      //      pll_powerdown.pll_powerdown
		output wire [0:0] tx_analogreset,     //     tx_analogreset.tx_analogreset
		output wire [0:0] tx_digitalreset,    //    tx_digitalreset.tx_digitalreset
		output wire [0:0] tx_ready,           //           tx_ready.tx_ready
		input  wire [0:0] pll_locked,         //         pll_locked.pll_locked
		input  wire [0:0] pll_select,         //         pll_select.pll_select
		input  wire [0:0] tx_cal_busy,        //        tx_cal_busy.tx_cal_busy
		input  wire [0:0] pll_cal_busy,       //       pll_cal_busy.pll_cal_busy
		output wire [0:0] rx_analogreset,     //     rx_analogreset.rx_analogreset
		output wire [0:0] rx_digitalreset,    //    rx_digitalreset.rx_digitalreset
		output wire [0:0] rx_ready,           //           rx_ready.rx_ready
		input  wire [0:0] rx_is_lockedtodata, // rx_is_lockedtodata.rx_is_lockedtodata
		input  wire [0:0] rx_cal_busy         //        rx_cal_busy.rx_cal_busy
	);

	altera_xcvr_reset_control #(
		.CHANNELS              (1),
		.PLLS                  (1),
		.SYS_CLK_IN_MHZ        (250),
		.SYNCHRONIZE_RESET     (1),
		.REDUCED_SIM_TIME      (1),
		.TX_PLL_ENABLE         (1),
		.T_PLL_POWERDOWN       (1000),
		.SYNCHRONIZE_PLL_RESET (0),
		.TX_ENABLE             (1),
		.TX_PER_CHANNEL        (0),
		.T_TX_ANALOGRESET      (0),
		.T_TX_DIGITALRESET     (20),
		.T_PLL_LOCK_HYST       (0),
		.EN_PLL_CAL_BUSY       (1),
		.RX_ENABLE             (1),
		.RX_PER_CHANNEL        (0),
		.T_RX_ANALOGRESET      (40),
		.T_RX_DIGITALRESET     (4000)
	) xcvr_reset_control_0 (
		.clock              (clock),              //   input,  width = 1,              clock.clk
		.reset              (reset),              //   input,  width = 1,              reset.reset
		.pll_powerdown      (pll_powerdown),      //  output,  width = 1,      pll_powerdown.pll_powerdown
		.tx_analogreset     (tx_analogreset),     //  output,  width = 1,     tx_analogreset.tx_analogreset
		.tx_digitalreset    (tx_digitalreset),    //  output,  width = 1,    tx_digitalreset.tx_digitalreset
		.tx_ready           (tx_ready),           //  output,  width = 1,           tx_ready.tx_ready
		.pll_locked         (pll_locked),         //   input,  width = 1,         pll_locked.pll_locked
		.pll_select         (pll_select),         //   input,  width = 1,         pll_select.pll_select
		.tx_cal_busy        (tx_cal_busy),        //   input,  width = 1,        tx_cal_busy.tx_cal_busy
		.pll_cal_busy       (pll_cal_busy),       //   input,  width = 1,       pll_cal_busy.pll_cal_busy
		.rx_analogreset     (rx_analogreset),     //  output,  width = 1,     rx_analogreset.rx_analogreset
		.rx_digitalreset    (rx_digitalreset),    //  output,  width = 1,    rx_digitalreset.rx_digitalreset
		.rx_ready           (rx_ready),           //  output,  width = 1,           rx_ready.rx_ready
		.rx_is_lockedtodata (rx_is_lockedtodata), //   input,  width = 1, rx_is_lockedtodata.rx_is_lockedtodata
		.rx_cal_busy        (rx_cal_busy),        //   input,  width = 1,        rx_cal_busy.rx_cal_busy
		.tx_manual          (1'b0),               // (terminated),                                
		.rx_manual          (1'b0),               // (terminated),                                
		.tx_digitalreset_or (1'b0),               // (terminated),                                
		.rx_digitalreset_or (1'b0)                // (terminated),                                
	);

endmodule
