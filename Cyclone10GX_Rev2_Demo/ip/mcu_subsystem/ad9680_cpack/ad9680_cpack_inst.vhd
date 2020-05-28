	component ad9680_cpack is
		port (
			adc_clk      : in  std_logic                      := 'X';             -- clk
			adc_rst      : in  std_logic                      := 'X';             -- reset
			adc_valid    : out std_logic;                                         -- valid
			adc_sync     : out std_logic;                                         -- sync
			adc_data     : out std_logic_vector(127 downto 0);                    -- data
			adc_enable_0 : in  std_logic                      := 'X';             -- enable
			adc_valid_0  : in  std_logic                      := 'X';             -- valid
			adc_data_0   : in  std_logic_vector(63 downto 0)  := (others => 'X'); -- data
			adc_enable_1 : in  std_logic                      := 'X';             -- enable
			adc_valid_1  : in  std_logic                      := 'X';             -- valid
			adc_data_1   : in  std_logic_vector(63 downto 0)  := (others => 'X')  -- data
		);
	end component ad9680_cpack;

	u0 : component ad9680_cpack
		port map (
			adc_clk      => CONNECTED_TO_adc_clk,      --   if_adc_clk.clk
			adc_rst      => CONNECTED_TO_adc_rst,      --   if_adc_rst.reset
			adc_valid    => CONNECTED_TO_adc_valid,    -- if_adc_valid.valid
			adc_sync     => CONNECTED_TO_adc_sync,     --  if_adc_sync.sync
			adc_data     => CONNECTED_TO_adc_data,     --  if_adc_data.data
			adc_enable_0 => CONNECTED_TO_adc_enable_0, --     adc_ch_0.enable
			adc_valid_0  => CONNECTED_TO_adc_valid_0,  --             .valid
			adc_data_0   => CONNECTED_TO_adc_data_0,   --             .data
			adc_enable_1 => CONNECTED_TO_adc_enable_1, --     adc_ch_1.enable
			adc_valid_1  => CONNECTED_TO_adc_valid_1,  --             .valid
			adc_data_1   => CONNECTED_TO_adc_data_1    --             .data
		);

