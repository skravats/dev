	mcu_subsystem_xcvr_fpll_a10_0 u0 (
		.pll_refclk0          (_connected_to_pll_refclk0_),          //   input,  width = 1,          pll_refclk0.clk
		.pll_powerdown        (_connected_to_pll_powerdown_),        //   input,  width = 1,        pll_powerdown.pll_powerdown
		.pll_locked           (_connected_to_pll_locked_),           //  output,  width = 1,           pll_locked.pll_locked
		.hssi_pll_cascade_clk (_connected_to_hssi_pll_cascade_clk_), //  output,  width = 1, hssi_pll_cascade_clk.clk
		.pll_cal_busy         (_connected_to_pll_cal_busy_)          //  output,  width = 1,         pll_cal_busy.pll_cal_busy
	);

