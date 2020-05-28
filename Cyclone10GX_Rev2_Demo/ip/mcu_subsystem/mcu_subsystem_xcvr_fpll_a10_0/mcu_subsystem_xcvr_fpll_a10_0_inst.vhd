	component mcu_subsystem_xcvr_fpll_a10_0 is
		port (
			pll_refclk0          : in  std_logic := 'X'; -- clk
			pll_powerdown        : in  std_logic := 'X'; -- pll_powerdown
			pll_locked           : out std_logic;        -- pll_locked
			hssi_pll_cascade_clk : out std_logic;        -- clk
			pll_cal_busy         : out std_logic         -- pll_cal_busy
		);
	end component mcu_subsystem_xcvr_fpll_a10_0;

	u0 : component mcu_subsystem_xcvr_fpll_a10_0
		port map (
			pll_refclk0          => CONNECTED_TO_pll_refclk0,          --          pll_refclk0.clk
			pll_powerdown        => CONNECTED_TO_pll_powerdown,        --        pll_powerdown.pll_powerdown
			pll_locked           => CONNECTED_TO_pll_locked,           --           pll_locked.pll_locked
			hssi_pll_cascade_clk => CONNECTED_TO_hssi_pll_cascade_clk, -- hssi_pll_cascade_clk.clk
			pll_cal_busy         => CONNECTED_TO_pll_cal_busy          --         pll_cal_busy.pll_cal_busy
		);

