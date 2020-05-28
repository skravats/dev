	component ethernet_iopll is
		port (
			rst      : in  std_logic := 'X'; -- reset
			refclk   : in  std_logic := 'X'; -- clk
			outclk_0 : out std_logic         -- clk
		);
	end component ethernet_iopll;

	u0 : component ethernet_iopll
		port map (
			rst      => CONNECTED_TO_rst,      --   reset.reset
			refclk   => CONNECTED_TO_refclk,   --  refclk.clk
			outclk_0 => CONNECTED_TO_outclk_0  -- outclk0.clk
		);

