	component ad9144_upack is
		port (
			dac_clk         : in  std_logic                      := 'X';             -- clk
			dac_valid       : out std_logic;                                         -- valid
			dac_sync        : out std_logic;                                         -- sync
			dac_data        : in  std_logic_vector(127 downto 0) := (others => 'X'); -- data
			dac_enable_0    : in  std_logic                      := 'X';             -- enable
			dac_valid_0     : in  std_logic                      := 'X';             -- valid
			dac_valid_out_0 : out std_logic;                                         -- data_valid
			dac_data_0      : out std_logic_vector(63 downto 0);                     -- data
			dac_enable_1    : in  std_logic                      := 'X';             -- enable
			dac_valid_1     : in  std_logic                      := 'X';             -- valid
			dac_valid_out_1 : out std_logic;                                         -- data_valid
			dac_data_1      : out std_logic_vector(63 downto 0)                      -- data
		);
	end component ad9144_upack;

	u0 : component ad9144_upack
		port map (
			dac_clk         => CONNECTED_TO_dac_clk,         --   if_dac_clk.clk
			dac_valid       => CONNECTED_TO_dac_valid,       -- if_dac_valid.valid
			dac_sync        => CONNECTED_TO_dac_sync,        --  if_dac_sync.sync
			dac_data        => CONNECTED_TO_dac_data,        --  if_dac_data.data
			dac_enable_0    => CONNECTED_TO_dac_enable_0,    --     dac_ch_0.enable
			dac_valid_0     => CONNECTED_TO_dac_valid_0,     --             .valid
			dac_valid_out_0 => CONNECTED_TO_dac_valid_out_0, --             .data_valid
			dac_data_0      => CONNECTED_TO_dac_data_0,      --             .data
			dac_enable_1    => CONNECTED_TO_dac_enable_1,    --     dac_ch_1.enable
			dac_valid_1     => CONNECTED_TO_dac_valid_1,     --             .valid
			dac_valid_out_1 => CONNECTED_TO_dac_valid_out_1, --             .data_valid
			dac_data_1      => CONNECTED_TO_dac_data_1       --             .data
		);

