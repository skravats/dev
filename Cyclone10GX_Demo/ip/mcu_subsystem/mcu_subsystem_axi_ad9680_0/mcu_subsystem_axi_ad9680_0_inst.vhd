	component mcu_subsystem_axi_ad9680_0 is
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
			rx_clk        : in  std_logic                      := 'X';             -- clk
			rx_sof        : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- export
			rx_data       : in  std_logic_vector(127 downto 0) := (others => 'X'); -- data
			rx_valid      : in  std_logic                      := 'X';             -- valid
			rx_ready      : out std_logic;                                         -- ready
			adc_clk       : out std_logic;                                         -- clk
			adc_enable_0  : out std_logic;                                         -- enable
			adc_valid_0   : out std_logic;                                         -- valid
			adc_data_0    : out std_logic_vector(63 downto 0);                     -- data
			adc_enable_1  : out std_logic;                                         -- enable
			adc_valid_1   : out std_logic;                                         -- valid
			adc_data_1    : out std_logic_vector(63 downto 0);                     -- data
			adc_dovf      : in  std_logic                      := 'X'              -- ovf
		);
	end component mcu_subsystem_axi_ad9680_0;

	u0 : component mcu_subsystem_axi_ad9680_0
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
			rx_clk        => CONNECTED_TO_rx_clk,        --   if_rx_clk.clk
			rx_sof        => CONNECTED_TO_rx_sof,        --   if_rx_sof.export
			rx_data       => CONNECTED_TO_rx_data,       --  if_rx_data.data
			rx_valid      => CONNECTED_TO_rx_valid,      --            .valid
			rx_ready      => CONNECTED_TO_rx_ready,      --            .ready
			adc_clk       => CONNECTED_TO_adc_clk,       --  if_adc_clk.clk
			adc_enable_0  => CONNECTED_TO_adc_enable_0,  --    adc_ch_0.enable
			adc_valid_0   => CONNECTED_TO_adc_valid_0,   --            .valid
			adc_data_0    => CONNECTED_TO_adc_data_0,    --            .data
			adc_enable_1  => CONNECTED_TO_adc_enable_1,  --    adc_ch_1.enable
			adc_valid_1   => CONNECTED_TO_adc_valid_1,   --            .valid
			adc_data_1    => CONNECTED_TO_adc_data_1,    --            .data
			adc_dovf      => CONNECTED_TO_adc_dovf       -- if_adc_dovf.ovf
		);

