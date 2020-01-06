	component mem_pll is
		port (
			rst      : in  std_logic := 'X'; -- reset
			refclk   : in  std_logic := 'X'; -- clk
			outclk_0 : out std_logic         -- clk
		);
	end component mem_pll;

	u0 : component mem_pll
		port map (
			rst      => CONNECTED_TO_rst,      --   reset.reset
			refclk   => CONNECTED_TO_refclk,   --  refclk.clk
			outclk_0 => CONNECTED_TO_outclk_0  -- outclk0.clk
		);

