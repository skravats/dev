	component mcu_subsystem_axi_ad9144_0 is
		port (
			s_axi_aclk    : in  std_logic                      := 'X';             -- clk
			s_axi_aresetn : in  std_logic                      := 'X';             -- reset_n
			s_axi_awvalid : in  std_logic                      := 'X';             -- awvalid
			s_axi_awaddr  : in  std_logic_vector(15 downto 0)  := (others => 'X'); -- awaddr
			s_axi_awprot  : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- awprot
			s_axi_awready : out std_logic;                                         -- awready
			s_axi_wvalid  : in  std_logic                      := 'X';             -- wvalid
			s_axi_wdata   : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- wdata
			s_axi_wstrb   : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- wstrb
			s_axi_wready  : out std_logic;                                         -- wready
			s_axi_bvalid  : out std_logic;                                         -- bvalid
			s_axi_bresp   : out std_logic_vector(1 downto 0);                      -- bresp
			s_axi_bready  : in  std_logic                      := 'X';             -- bready
			s_axi_arvalid : in  std_logic                      := 'X';             -- arvalid
			s_axi_araddr  : in  std_logic_vector(15 downto 0)  := (others => 'X'); -- araddr
			s_axi_arprot  : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- arprot
			s_axi_arready : out std_logic;                                         -- arready
			s_axi_rvalid  : out std_logic;                                         -- rvalid
			s_axi_rresp   : out std_logic_vector(1 downto 0);                      -- rresp
			s_axi_rdata   : out std_logic_vector(31 downto 0);                     -- rdata
			s_axi_rready  : in  std_logic                      := 'X';             -- rready
			tx_clk        : in  std_logic                      := 'X';             -- clk
			tx_data       : out std_logic_vector(127 downto 0);                    -- data
			tx_valid      : out std_logic;                                         -- valid
			tx_ready      : in  std_logic                      := 'X';             -- ready
			dac_clk       : out std_logic;                                         -- clk
			dac_enable_0  : out std_logic;                                         -- enable
			dac_valid_0   : out std_logic;                                         -- valid
			dac_ddata_0   : in  std_logic_vector(63 downto 0)  := (others => 'X'); -- data
			dac_enable_1  : out std_logic;                                         -- enable
			dac_valid_1   : out std_logic;                                         -- valid
			dac_ddata_1   : in  std_logic_vector(63 downto 0)  := (others => 'X'); -- data
			dac_dunf      : in  std_logic                      := 'X'              -- unf
		);
	end component mcu_subsystem_axi_ad9144_0;

	u0 : component mcu_subsystem_axi_ad9144_0
		port map (
			s_axi_aclk    => CONNECTED_TO_s_axi_aclk,    -- s_axi_clock.clk
			s_axi_aresetn => CONNECTED_TO_s_axi_aresetn, -- s_axi_reset.reset_n
			s_axi_awvalid => CONNECTED_TO_s_axi_awvalid, --       s_axi.awvalid
			s_axi_awaddr  => CONNECTED_TO_s_axi_awaddr,  --            .awaddr
			s_axi_awprot  => CONNECTED_TO_s_axi_awprot,  --            .awprot
			s_axi_awready => CONNECTED_TO_s_axi_awready, --            .awready
			s_axi_wvalid  => CONNECTED_TO_s_axi_wvalid,  --            .wvalid
			s_axi_wdata   => CONNECTED_TO_s_axi_wdata,   --            .wdata
			s_axi_wstrb   => CONNECTED_TO_s_axi_wstrb,   --            .wstrb
			s_axi_wready  => CONNECTED_TO_s_axi_wready,  --            .wready
			s_axi_bvalid  => CONNECTED_TO_s_axi_bvalid,  --            .bvalid
			s_axi_bresp   => CONNECTED_TO_s_axi_bresp,   --            .bresp
			s_axi_bready  => CONNECTED_TO_s_axi_bready,  --            .bready
			s_axi_arvalid => CONNECTED_TO_s_axi_arvalid, --            .arvalid
			s_axi_araddr  => CONNECTED_TO_s_axi_araddr,  --            .araddr
			s_axi_arprot  => CONNECTED_TO_s_axi_arprot,  --            .arprot
			s_axi_arready => CONNECTED_TO_s_axi_arready, --            .arready
			s_axi_rvalid  => CONNECTED_TO_s_axi_rvalid,  --            .rvalid
			s_axi_rresp   => CONNECTED_TO_s_axi_rresp,   --            .rresp
			s_axi_rdata   => CONNECTED_TO_s_axi_rdata,   --            .rdata
			s_axi_rready  => CONNECTED_TO_s_axi_rready,  --            .rready
			tx_clk        => CONNECTED_TO_tx_clk,        --   if_tx_clk.clk
			tx_data       => CONNECTED_TO_tx_data,       --  if_tx_data.data
			tx_valid      => CONNECTED_TO_tx_valid,      --            .valid
			tx_ready      => CONNECTED_TO_tx_ready,      --            .ready
			dac_clk       => CONNECTED_TO_dac_clk,       --  if_dac_clk.clk
			dac_enable_0  => CONNECTED_TO_dac_enable_0,  --    dac_ch_0.enable
			dac_valid_0   => CONNECTED_TO_dac_valid_0,   --            .valid
			dac_ddata_0   => CONNECTED_TO_dac_ddata_0,   --            .data
			dac_enable_1  => CONNECTED_TO_dac_enable_1,  --    dac_ch_1.enable
			dac_valid_1   => CONNECTED_TO_dac_valid_1,   --            .valid
			dac_ddata_1   => CONNECTED_TO_dac_ddata_1,   --            .data
			dac_dunf      => CONNECTED_TO_dac_dunf       -- if_dac_dunf.unf
		);
