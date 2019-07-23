	component interlaken_phy is
		port (
			clk125_clk                           : in  std_logic                     := 'X';             -- clk
			phy_data_ctrl_csr_s0_address         : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- address
			phy_data_ctrl_csr_s0_read            : in  std_logic                     := 'X';             -- read
			phy_data_ctrl_csr_s0_readdata        : out std_logic_vector(31 downto 0);                    -- readdata
			phy_data_ctrl_csr_s0_readdatavalid   : out std_logic;                                        -- readdatavalid
			phy_data_ctrl_csr_s0_write           : in  std_logic                     := 'X';             -- write
			phy_data_ctrl_csr_s0_writedata       : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			phy_data_ctrl_csr_s0_waitrequest     : out std_logic;                                        -- waitrequest
			phy_data_ctrl_m0_address             : out std_logic_vector(31 downto 0);                    -- address
			phy_data_ctrl_m0_read                : out std_logic;                                        -- read
			phy_data_ctrl_m0_waitrequest         : in  std_logic                     := 'X';             -- waitrequest
			phy_data_ctrl_m0_readdata            : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			phy_data_ctrl_m0_readdatavalid       : in  std_logic                     := 'X';             -- readdatavalid
			phy_data_ctrl_m0_write               : out std_logic;                                        -- write
			phy_data_ctrl_m0_writedata           : out std_logic_vector(31 downto 0);                    -- writedata
			phy_data_irq_rx_irq                  : out std_logic;                                        -- irq
			phy_data_irq_tx_irq                  : out std_logic;                                        -- irq
			tx_serial_data_tx_serial_data        : out std_logic_vector(0 downto 0);                     -- tx_serial_data
			rx_serial_data_rx_serial_data        : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- rx_serial_data
			reset_reset                          : in  std_logic                     := 'X';             -- reset
			serial_clock_reconfig_s0_write       : in  std_logic                     := 'X';             -- write
			serial_clock_reconfig_s0_read        : in  std_logic                     := 'X';             -- read
			serial_clock_reconfig_s0_address     : in  std_logic_vector(9 downto 0)  := (others => 'X'); -- address
			serial_clock_reconfig_s0_writedata   : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			serial_clock_reconfig_s0_readdata    : out std_logic_vector(31 downto 0);                    -- readdata
			serial_clock_reconfig_s0_waitrequest : out std_logic                                         -- waitrequest
		);
	end component interlaken_phy;

	u0 : component interlaken_phy
		port map (
			clk125_clk                           => CONNECTED_TO_clk125_clk,                           --                   clk125.clk
			phy_data_ctrl_csr_s0_address         => CONNECTED_TO_phy_data_ctrl_csr_s0_address,         --     phy_data_ctrl_csr_s0.address
			phy_data_ctrl_csr_s0_read            => CONNECTED_TO_phy_data_ctrl_csr_s0_read,            --                         .read
			phy_data_ctrl_csr_s0_readdata        => CONNECTED_TO_phy_data_ctrl_csr_s0_readdata,        --                         .readdata
			phy_data_ctrl_csr_s0_readdatavalid   => CONNECTED_TO_phy_data_ctrl_csr_s0_readdatavalid,   --                         .readdatavalid
			phy_data_ctrl_csr_s0_write           => CONNECTED_TO_phy_data_ctrl_csr_s0_write,           --                         .write
			phy_data_ctrl_csr_s0_writedata       => CONNECTED_TO_phy_data_ctrl_csr_s0_writedata,       --                         .writedata
			phy_data_ctrl_csr_s0_waitrequest     => CONNECTED_TO_phy_data_ctrl_csr_s0_waitrequest,     --                         .waitrequest
			phy_data_ctrl_m0_address             => CONNECTED_TO_phy_data_ctrl_m0_address,             --         phy_data_ctrl_m0.address
			phy_data_ctrl_m0_read                => CONNECTED_TO_phy_data_ctrl_m0_read,                --                         .read
			phy_data_ctrl_m0_waitrequest         => CONNECTED_TO_phy_data_ctrl_m0_waitrequest,         --                         .waitrequest
			phy_data_ctrl_m0_readdata            => CONNECTED_TO_phy_data_ctrl_m0_readdata,            --                         .readdata
			phy_data_ctrl_m0_readdatavalid       => CONNECTED_TO_phy_data_ctrl_m0_readdatavalid,       --                         .readdatavalid
			phy_data_ctrl_m0_write               => CONNECTED_TO_phy_data_ctrl_m0_write,               --                         .write
			phy_data_ctrl_m0_writedata           => CONNECTED_TO_phy_data_ctrl_m0_writedata,           --                         .writedata
			phy_data_irq_rx_irq                  => CONNECTED_TO_phy_data_irq_rx_irq,                  --          phy_data_irq_rx.irq
			phy_data_irq_tx_irq                  => CONNECTED_TO_phy_data_irq_tx_irq,                  --          phy_data_irq_tx.irq
			tx_serial_data_tx_serial_data        => CONNECTED_TO_tx_serial_data_tx_serial_data,        --           tx_serial_data.tx_serial_data
			rx_serial_data_rx_serial_data        => CONNECTED_TO_rx_serial_data_rx_serial_data,        --           rx_serial_data.rx_serial_data
			reset_reset                          => CONNECTED_TO_reset_reset,                          --                    reset.reset
			serial_clock_reconfig_s0_write       => CONNECTED_TO_serial_clock_reconfig_s0_write,       -- serial_clock_reconfig_s0.write
			serial_clock_reconfig_s0_read        => CONNECTED_TO_serial_clock_reconfig_s0_read,        --                         .read
			serial_clock_reconfig_s0_address     => CONNECTED_TO_serial_clock_reconfig_s0_address,     --                         .address
			serial_clock_reconfig_s0_writedata   => CONNECTED_TO_serial_clock_reconfig_s0_writedata,   --                         .writedata
			serial_clock_reconfig_s0_readdata    => CONNECTED_TO_serial_clock_reconfig_s0_readdata,    --                         .readdata
			serial_clock_reconfig_s0_waitrequest => CONNECTED_TO_serial_clock_reconfig_s0_waitrequest  --                         .waitrequest
		);

