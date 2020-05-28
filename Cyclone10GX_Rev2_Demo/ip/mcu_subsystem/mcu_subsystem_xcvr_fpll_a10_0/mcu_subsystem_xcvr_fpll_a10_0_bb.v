module mcu_subsystem_xcvr_fpll_a10_0 (
		input  wire  pll_refclk0,          //          pll_refclk0.clk
		input  wire  pll_powerdown,        //        pll_powerdown.pll_powerdown
		output wire  pll_locked,           //           pll_locked.pll_locked
		output wire  hssi_pll_cascade_clk, // hssi_pll_cascade_clk.clk
		output wire  pll_cal_busy          //         pll_cal_busy.pll_cal_busy
	);
endmodule

