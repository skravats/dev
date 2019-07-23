	component mcu_subsystem_iopll_1 is
		port (
			rst         : in  std_logic := 'X'; -- reset
			refclk      : in  std_logic := 'X'; -- clk
			locked      : out std_logic;        -- export
			outclk_0    : out std_logic;        -- clk
			cascade_out : out std_logic         -- clk
		);
	end component mcu_subsystem_iopll_1;

	u0 : component mcu_subsystem_iopll_1
		port map (
			rst         => CONNECTED_TO_rst,         --       reset.reset
			refclk      => CONNECTED_TO_refclk,      --      refclk.clk
			locked      => CONNECTED_TO_locked,      --      locked.export
			outclk_0    => CONNECTED_TO_outclk_0,    --     outclk0.clk
			cascade_out => CONNECTED_TO_cascade_out  -- cascade_out.clk
		);

