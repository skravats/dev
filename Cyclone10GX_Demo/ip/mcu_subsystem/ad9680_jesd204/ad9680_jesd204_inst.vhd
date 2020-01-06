	component ad9680_jesd204 is
		port (
			sys_clk_clk                   : in  std_logic                      := 'X';             -- clk
			sys_resetn_reset_n            : in  std_logic                      := 'X';             -- reset_n
			ref_clk_clk                   : in  std_logic                      := 'X';             -- clk
			link_pll_reconfig_write       : in  std_logic                      := 'X';             -- write
			link_pll_reconfig_read        : in  std_logic                      := 'X';             -- read
			link_pll_reconfig_address     : in  std_logic_vector(9 downto 0)   := (others => 'X'); -- address
			link_pll_reconfig_writedata   : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- writedata
			link_pll_reconfig_readdata    : out std_logic_vector(31 downto 0);                     -- readdata
			link_pll_reconfig_waitrequest : out std_logic;                                         -- waitrequest
			link_clk_clk                  : out std_logic;                                         -- clk
			link_reset_reset              : out std_logic;                                         -- reset
			link_management_awvalid       : in  std_logic                      := 'X';             -- awvalid
			link_management_awaddr        : in  std_logic_vector(11 downto 0)  := (others => 'X'); -- awaddr
			link_management_awprot        : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- awprot
			link_management_awready       : out std_logic;                                         -- awready
			link_management_wvalid        : in  std_logic                      := 'X';             -- wvalid
			link_management_wdata         : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- wdata
			link_management_wstrb         : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- wstrb
			link_management_wready        : out std_logic;                                         -- wready
			link_management_bvalid        : out std_logic;                                         -- bvalid
			link_management_bresp         : out std_logic_vector(1 downto 0);                      -- bresp
			link_management_bready        : in  std_logic                      := 'X';             -- bready
			link_management_arvalid       : in  std_logic                      := 'X';             -- arvalid
			link_management_araddr        : in  std_logic_vector(11 downto 0)  := (others => 'X'); -- araddr
			link_management_arprot        : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- arprot
			link_management_arready       : out std_logic;                                         -- arready
			link_management_rvalid        : out std_logic;                                         -- rvalid
			link_management_rresp         : out std_logic_vector(1 downto 0);                      -- rresp
			link_management_rdata         : out std_logic_vector(31 downto 0);                     -- rdata
			link_management_rready        : in  std_logic                      := 'X';             -- rready
			serial_data_rx_serial_data    : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- rx_serial_data
			phy_reconfig_0_address        : in  std_logic_vector(9 downto 0)   := (others => 'X'); -- address
			phy_reconfig_0_read           : in  std_logic                      := 'X';             -- read
			phy_reconfig_0_readdata       : out std_logic_vector(31 downto 0);                     -- readdata
			phy_reconfig_0_waitrequest    : out std_logic;                                         -- waitrequest
			phy_reconfig_0_write          : in  std_logic                      := 'X';             -- write
			phy_reconfig_0_writedata      : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- writedata
			phy_reconfig_1_address        : in  std_logic_vector(9 downto 0)   := (others => 'X'); -- address
			phy_reconfig_1_read           : in  std_logic                      := 'X';             -- read
			phy_reconfig_1_readdata       : out std_logic_vector(31 downto 0);                     -- readdata
			phy_reconfig_1_waitrequest    : out std_logic;                                         -- waitrequest
			phy_reconfig_1_write          : in  std_logic                      := 'X';             -- write
			phy_reconfig_1_writedata      : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- writedata
			phy_reconfig_2_address        : in  std_logic_vector(9 downto 0)   := (others => 'X'); -- address
			phy_reconfig_2_read           : in  std_logic                      := 'X';             -- read
			phy_reconfig_2_readdata       : out std_logic_vector(31 downto 0);                     -- readdata
			phy_reconfig_2_waitrequest    : out std_logic;                                         -- waitrequest
			phy_reconfig_2_write          : in  std_logic                      := 'X';             -- write
			phy_reconfig_2_writedata      : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- writedata
			phy_reconfig_3_address        : in  std_logic_vector(9 downto 0)   := (others => 'X'); -- address
			phy_reconfig_3_read           : in  std_logic                      := 'X';             -- read
			phy_reconfig_3_readdata       : out std_logic_vector(31 downto 0);                     -- readdata
			phy_reconfig_3_waitrequest    : out std_logic;                                         -- waitrequest
			phy_reconfig_3_write          : in  std_logic                      := 'X';             -- write
			phy_reconfig_3_writedata      : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- writedata
			link_reconfig_awvalid         : in  std_logic                      := 'X';             -- awvalid
			link_reconfig_awaddr          : in  std_logic_vector(13 downto 0)  := (others => 'X'); -- awaddr
			link_reconfig_awprot          : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- awprot
			link_reconfig_awready         : out std_logic;                                         -- awready
			link_reconfig_wvalid          : in  std_logic                      := 'X';             -- wvalid
			link_reconfig_wdata           : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- wdata
			link_reconfig_wstrb           : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- wstrb
			link_reconfig_wready          : out std_logic;                                         -- wready
			link_reconfig_bvalid          : out std_logic;                                         -- bvalid
			link_reconfig_bresp           : out std_logic_vector(1 downto 0);                      -- bresp
			link_reconfig_bready          : in  std_logic                      := 'X';             -- bready
			link_reconfig_arvalid         : in  std_logic                      := 'X';             -- arvalid
			link_reconfig_araddr          : in  std_logic_vector(13 downto 0)  := (others => 'X'); -- araddr
			link_reconfig_arprot          : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- arprot
			link_reconfig_arready         : out std_logic;                                         -- arready
			link_reconfig_rvalid          : out std_logic;                                         -- rvalid
			link_reconfig_rresp           : out std_logic_vector(1 downto 0);                      -- rresp
			link_reconfig_rdata           : out std_logic_vector(31 downto 0);                     -- rdata
			link_reconfig_rready          : in  std_logic                      := 'X';             -- rready
			interrupt_irq                 : out std_logic;                                         -- irq
			sysref_export                 : in  std_logic                      := 'X';             -- export
			sync_export                   : out std_logic_vector(0 downto 0);                      -- export
			link_sof_export               : out std_logic_vector(3 downto 0);                      -- export
			link_data_data                : out std_logic_vector(127 downto 0);                    -- data
			link_data_valid               : out std_logic                                          -- valid
		);
	end component ad9680_jesd204;

	u0 : component ad9680_jesd204
		port map (
			sys_clk_clk                   => CONNECTED_TO_sys_clk_clk,                   --           sys_clk.clk
			sys_resetn_reset_n            => CONNECTED_TO_sys_resetn_reset_n,            --        sys_resetn.reset_n
			ref_clk_clk                   => CONNECTED_TO_ref_clk_clk,                   --           ref_clk.clk
			link_pll_reconfig_write       => CONNECTED_TO_link_pll_reconfig_write,       -- link_pll_reconfig.write
			link_pll_reconfig_read        => CONNECTED_TO_link_pll_reconfig_read,        --                  .read
			link_pll_reconfig_address     => CONNECTED_TO_link_pll_reconfig_address,     --                  .address
			link_pll_reconfig_writedata   => CONNECTED_TO_link_pll_reconfig_writedata,   --                  .writedata
			link_pll_reconfig_readdata    => CONNECTED_TO_link_pll_reconfig_readdata,    --                  .readdata
			link_pll_reconfig_waitrequest => CONNECTED_TO_link_pll_reconfig_waitrequest, --                  .waitrequest
			link_clk_clk                  => CONNECTED_TO_link_clk_clk,                  --          link_clk.clk
			link_reset_reset              => CONNECTED_TO_link_reset_reset,              --        link_reset.reset
			link_management_awvalid       => CONNECTED_TO_link_management_awvalid,       --   link_management.awvalid
			link_management_awaddr        => CONNECTED_TO_link_management_awaddr,        --                  .awaddr
			link_management_awprot        => CONNECTED_TO_link_management_awprot,        --                  .awprot
			link_management_awready       => CONNECTED_TO_link_management_awready,       --                  .awready
			link_management_wvalid        => CONNECTED_TO_link_management_wvalid,        --                  .wvalid
			link_management_wdata         => CONNECTED_TO_link_management_wdata,         --                  .wdata
			link_management_wstrb         => CONNECTED_TO_link_management_wstrb,         --                  .wstrb
			link_management_wready        => CONNECTED_TO_link_management_wready,        --                  .wready
			link_management_bvalid        => CONNECTED_TO_link_management_bvalid,        --                  .bvalid
			link_management_bresp         => CONNECTED_TO_link_management_bresp,         --                  .bresp
			link_management_bready        => CONNECTED_TO_link_management_bready,        --                  .bready
			link_management_arvalid       => CONNECTED_TO_link_management_arvalid,       --                  .arvalid
			link_management_araddr        => CONNECTED_TO_link_management_araddr,        --                  .araddr
			link_management_arprot        => CONNECTED_TO_link_management_arprot,        --                  .arprot
			link_management_arready       => CONNECTED_TO_link_management_arready,       --                  .arready
			link_management_rvalid        => CONNECTED_TO_link_management_rvalid,        --                  .rvalid
			link_management_rresp         => CONNECTED_TO_link_management_rresp,         --                  .rresp
			link_management_rdata         => CONNECTED_TO_link_management_rdata,         --                  .rdata
			link_management_rready        => CONNECTED_TO_link_management_rready,        --                  .rready
			serial_data_rx_serial_data    => CONNECTED_TO_serial_data_rx_serial_data,    --       serial_data.rx_serial_data
			phy_reconfig_0_address        => CONNECTED_TO_phy_reconfig_0_address,        --    phy_reconfig_0.address
			phy_reconfig_0_read           => CONNECTED_TO_phy_reconfig_0_read,           --                  .read
			phy_reconfig_0_readdata       => CONNECTED_TO_phy_reconfig_0_readdata,       --                  .readdata
			phy_reconfig_0_waitrequest    => CONNECTED_TO_phy_reconfig_0_waitrequest,    --                  .waitrequest
			phy_reconfig_0_write          => CONNECTED_TO_phy_reconfig_0_write,          --                  .write
			phy_reconfig_0_writedata      => CONNECTED_TO_phy_reconfig_0_writedata,      --                  .writedata
			phy_reconfig_1_address        => CONNECTED_TO_phy_reconfig_1_address,        --    phy_reconfig_1.address
			phy_reconfig_1_read           => CONNECTED_TO_phy_reconfig_1_read,           --                  .read
			phy_reconfig_1_readdata       => CONNECTED_TO_phy_reconfig_1_readdata,       --                  .readdata
			phy_reconfig_1_waitrequest    => CONNECTED_TO_phy_reconfig_1_waitrequest,    --                  .waitrequest
			phy_reconfig_1_write          => CONNECTED_TO_phy_reconfig_1_write,          --                  .write
			phy_reconfig_1_writedata      => CONNECTED_TO_phy_reconfig_1_writedata,      --                  .writedata
			phy_reconfig_2_address        => CONNECTED_TO_phy_reconfig_2_address,        --    phy_reconfig_2.address
			phy_reconfig_2_read           => CONNECTED_TO_phy_reconfig_2_read,           --                  .read
			phy_reconfig_2_readdata       => CONNECTED_TO_phy_reconfig_2_readdata,       --                  .readdata
			phy_reconfig_2_waitrequest    => CONNECTED_TO_phy_reconfig_2_waitrequest,    --                  .waitrequest
			phy_reconfig_2_write          => CONNECTED_TO_phy_reconfig_2_write,          --                  .write
			phy_reconfig_2_writedata      => CONNECTED_TO_phy_reconfig_2_writedata,      --                  .writedata
			phy_reconfig_3_address        => CONNECTED_TO_phy_reconfig_3_address,        --    phy_reconfig_3.address
			phy_reconfig_3_read           => CONNECTED_TO_phy_reconfig_3_read,           --                  .read
			phy_reconfig_3_readdata       => CONNECTED_TO_phy_reconfig_3_readdata,       --                  .readdata
			phy_reconfig_3_waitrequest    => CONNECTED_TO_phy_reconfig_3_waitrequest,    --                  .waitrequest
			phy_reconfig_3_write          => CONNECTED_TO_phy_reconfig_3_write,          --                  .write
			phy_reconfig_3_writedata      => CONNECTED_TO_phy_reconfig_3_writedata,      --                  .writedata
			link_reconfig_awvalid         => CONNECTED_TO_link_reconfig_awvalid,         --     link_reconfig.awvalid
			link_reconfig_awaddr          => CONNECTED_TO_link_reconfig_awaddr,          --                  .awaddr
			link_reconfig_awprot          => CONNECTED_TO_link_reconfig_awprot,          --                  .awprot
			link_reconfig_awready         => CONNECTED_TO_link_reconfig_awready,         --                  .awready
			link_reconfig_wvalid          => CONNECTED_TO_link_reconfig_wvalid,          --                  .wvalid
			link_reconfig_wdata           => CONNECTED_TO_link_reconfig_wdata,           --                  .wdata
			link_reconfig_wstrb           => CONNECTED_TO_link_reconfig_wstrb,           --                  .wstrb
			link_reconfig_wready          => CONNECTED_TO_link_reconfig_wready,          --                  .wready
			link_reconfig_bvalid          => CONNECTED_TO_link_reconfig_bvalid,          --                  .bvalid
			link_reconfig_bresp           => CONNECTED_TO_link_reconfig_bresp,           --                  .bresp
			link_reconfig_bready          => CONNECTED_TO_link_reconfig_bready,          --                  .bready
			link_reconfig_arvalid         => CONNECTED_TO_link_reconfig_arvalid,         --                  .arvalid
			link_reconfig_araddr          => CONNECTED_TO_link_reconfig_araddr,          --                  .araddr
			link_reconfig_arprot          => CONNECTED_TO_link_reconfig_arprot,          --                  .arprot
			link_reconfig_arready         => CONNECTED_TO_link_reconfig_arready,         --                  .arready
			link_reconfig_rvalid          => CONNECTED_TO_link_reconfig_rvalid,          --                  .rvalid
			link_reconfig_rresp           => CONNECTED_TO_link_reconfig_rresp,           --                  .rresp
			link_reconfig_rdata           => CONNECTED_TO_link_reconfig_rdata,           --                  .rdata
			link_reconfig_rready          => CONNECTED_TO_link_reconfig_rready,          --                  .rready
			interrupt_irq                 => CONNECTED_TO_interrupt_irq,                 --         interrupt.irq
			sysref_export                 => CONNECTED_TO_sysref_export,                 --            sysref.export
			sync_export                   => CONNECTED_TO_sync_export,                   --              sync.export
			link_sof_export               => CONNECTED_TO_link_sof_export,               --          link_sof.export
			link_data_data                => CONNECTED_TO_link_data_data,                --         link_data.data
			link_data_valid               => CONNECTED_TO_link_data_valid                --                  .valid
		);

