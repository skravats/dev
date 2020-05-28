	interlaken_phy_xcvr_atx_pll_a10_0 u0 (
		.pll_powerdown         (_connected_to_pll_powerdown_),         //   input,   width = 1,   pll_powerdown.pll_powerdown
		.pll_refclk0           (_connected_to_pll_refclk0_),           //   input,   width = 1,     pll_refclk0.clk
		.tx_serial_clk         (_connected_to_tx_serial_clk_),         //  output,   width = 1,   tx_serial_clk.clk
		.pll_locked            (_connected_to_pll_locked_),            //  output,   width = 1,      pll_locked.pll_locked
		.reconfig_clk0         (_connected_to_reconfig_clk0_),         //   input,   width = 1,   reconfig_clk0.clk
		.reconfig_reset0       (_connected_to_reconfig_reset0_),       //   input,   width = 1, reconfig_reset0.reset
		.reconfig_write0       (_connected_to_reconfig_write0_),       //   input,   width = 1,  reconfig_avmm0.write
		.reconfig_read0        (_connected_to_reconfig_read0_),        //   input,   width = 1,                .read
		.reconfig_address0     (_connected_to_reconfig_address0_),     //   input,  width = 10,                .address
		.reconfig_writedata0   (_connected_to_reconfig_writedata0_),   //   input,  width = 32,                .writedata
		.reconfig_readdata0    (_connected_to_reconfig_readdata0_),    //  output,  width = 32,                .readdata
		.reconfig_waitrequest0 (_connected_to_reconfig_waitrequest0_), //  output,   width = 1,                .waitrequest
		.pll_cal_busy          (_connected_to_pll_cal_busy_)           //  output,   width = 1,    pll_cal_busy.pll_cal_busy
	);

