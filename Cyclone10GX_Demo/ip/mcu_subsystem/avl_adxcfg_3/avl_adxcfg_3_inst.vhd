	component avl_adxcfg_3 is
		port (
			rcfg_clk               : in  std_logic                     := 'X';             -- clk
			rcfg_reset_n           : in  std_logic                     := 'X';             -- reset_n
			rcfg_in_read_0         : in  std_logic                     := 'X';             -- read
			rcfg_in_write_0        : in  std_logic                     := 'X';             -- write
			rcfg_in_address_0      : in  std_logic_vector(9 downto 0)  := (others => 'X'); -- address
			rcfg_in_writedata_0    : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			rcfg_in_readdata_0     : out std_logic_vector(31 downto 0);                    -- readdata
			rcfg_in_waitrequest_0  : out std_logic;                                        -- waitrequest
			rcfg_out_read_0        : out std_logic;                                        -- read
			rcfg_out_write_0       : out std_logic;                                        -- write
			rcfg_out_address_0     : out std_logic_vector(9 downto 0);                     -- address
			rcfg_out_writedata_0   : out std_logic_vector(31 downto 0);                    -- writedata
			rcfg_out_readdata_0    : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			rcfg_out_waitrequest_0 : in  std_logic                     := 'X';             -- waitrequest
			rcfg_in_read_1         : in  std_logic                     := 'X';             -- read
			rcfg_in_write_1        : in  std_logic                     := 'X';             -- write
			rcfg_in_address_1      : in  std_logic_vector(9 downto 0)  := (others => 'X'); -- address
			rcfg_in_writedata_1    : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			rcfg_in_readdata_1     : out std_logic_vector(31 downto 0);                    -- readdata
			rcfg_in_waitrequest_1  : out std_logic;                                        -- waitrequest
			rcfg_out_read_1        : out std_logic;                                        -- read
			rcfg_out_write_1       : out std_logic;                                        -- write
			rcfg_out_address_1     : out std_logic_vector(9 downto 0);                     -- address
			rcfg_out_writedata_1   : out std_logic_vector(31 downto 0);                    -- writedata
			rcfg_out_readdata_1    : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			rcfg_out_waitrequest_1 : in  std_logic                     := 'X'              -- waitrequest
		);
	end component avl_adxcfg_3;

	u0 : component avl_adxcfg_3
		port map (
			rcfg_clk               => CONNECTED_TO_rcfg_clk,               --     rcfg_clk.clk
			rcfg_reset_n           => CONNECTED_TO_rcfg_reset_n,           -- rcfg_reset_n.reset_n
			rcfg_in_read_0         => CONNECTED_TO_rcfg_in_read_0,         --      rcfg_s0.read
			rcfg_in_write_0        => CONNECTED_TO_rcfg_in_write_0,        --             .write
			rcfg_in_address_0      => CONNECTED_TO_rcfg_in_address_0,      --             .address
			rcfg_in_writedata_0    => CONNECTED_TO_rcfg_in_writedata_0,    --             .writedata
			rcfg_in_readdata_0     => CONNECTED_TO_rcfg_in_readdata_0,     --             .readdata
			rcfg_in_waitrequest_0  => CONNECTED_TO_rcfg_in_waitrequest_0,  --             .waitrequest
			rcfg_out_read_0        => CONNECTED_TO_rcfg_out_read_0,        --      rcfg_m0.read
			rcfg_out_write_0       => CONNECTED_TO_rcfg_out_write_0,       --             .write
			rcfg_out_address_0     => CONNECTED_TO_rcfg_out_address_0,     --             .address
			rcfg_out_writedata_0   => CONNECTED_TO_rcfg_out_writedata_0,   --             .writedata
			rcfg_out_readdata_0    => CONNECTED_TO_rcfg_out_readdata_0,    --             .readdata
			rcfg_out_waitrequest_0 => CONNECTED_TO_rcfg_out_waitrequest_0, --             .waitrequest
			rcfg_in_read_1         => CONNECTED_TO_rcfg_in_read_1,         --      rcfg_s1.read
			rcfg_in_write_1        => CONNECTED_TO_rcfg_in_write_1,        --             .write
			rcfg_in_address_1      => CONNECTED_TO_rcfg_in_address_1,      --             .address
			rcfg_in_writedata_1    => CONNECTED_TO_rcfg_in_writedata_1,    --             .writedata
			rcfg_in_readdata_1     => CONNECTED_TO_rcfg_in_readdata_1,     --             .readdata
			rcfg_in_waitrequest_1  => CONNECTED_TO_rcfg_in_waitrequest_1,  --             .waitrequest
			rcfg_out_read_1        => CONNECTED_TO_rcfg_out_read_1,        --      rcfg_m1.read
			rcfg_out_write_1       => CONNECTED_TO_rcfg_out_write_1,       --             .write
			rcfg_out_address_1     => CONNECTED_TO_rcfg_out_address_1,     --             .address
			rcfg_out_writedata_1   => CONNECTED_TO_rcfg_out_writedata_1,   --             .writedata
			rcfg_out_readdata_1    => CONNECTED_TO_rcfg_out_readdata_1,    --             .readdata
			rcfg_out_waitrequest_1 => CONNECTED_TO_rcfg_out_waitrequest_1  --             .waitrequest
		);

