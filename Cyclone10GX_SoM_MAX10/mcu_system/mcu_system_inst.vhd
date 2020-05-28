	component mcu_system is
		port (
			clk_clk       : in  std_logic := 'X'; -- clk
			reset_reset_n : in  std_logic := 'X'; -- reset_n
			serial_sda_in : in  std_logic := 'X'; -- sda_in
			serial_scl_in : in  std_logic := 'X'; -- scl_in
			serial_sda_oe : out std_logic;        -- sda_oe
			serial_scl_oe : out std_logic         -- scl_oe
		);
	end component mcu_system;

	u0 : component mcu_system
		port map (
			clk_clk       => CONNECTED_TO_clk_clk,       --    clk.clk
			reset_reset_n => CONNECTED_TO_reset_reset_n, --  reset.reset_n
			serial_sda_in => CONNECTED_TO_serial_sda_in, -- serial.sda_in
			serial_scl_in => CONNECTED_TO_serial_scl_in, --       .scl_in
			serial_sda_oe => CONNECTED_TO_serial_sda_oe, --       .sda_oe
			serial_scl_oe => CONNECTED_TO_serial_scl_oe  --       .scl_oe
		);

