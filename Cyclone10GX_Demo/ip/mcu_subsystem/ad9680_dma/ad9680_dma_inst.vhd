	component ad9680_dma is
		port (
			s_axi_aclk         : in  std_logic                      := 'X';             -- clk
			s_axi_aresetn      : in  std_logic                      := 'X';             -- reset_n
			s_axi_awvalid      : in  std_logic                      := 'X';             -- awvalid
			s_axi_awaddr       : in  std_logic_vector(11 downto 0)  := (others => 'X'); -- awaddr
			s_axi_awprot       : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- awprot
			s_axi_awready      : out std_logic;                                         -- awready
			s_axi_wvalid       : in  std_logic                      := 'X';             -- wvalid
			s_axi_wdata        : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- wdata
			s_axi_wstrb        : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- wstrb
			s_axi_wready       : out std_logic;                                         -- wready
			s_axi_bvalid       : out std_logic;                                         -- bvalid
			s_axi_bresp        : out std_logic_vector(1 downto 0);                      -- bresp
			s_axi_bready       : in  std_logic                      := 'X';             -- bready
			s_axi_arvalid      : in  std_logic                      := 'X';             -- arvalid
			s_axi_araddr       : in  std_logic_vector(11 downto 0)  := (others => 'X'); -- araddr
			s_axi_arprot       : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- arprot
			s_axi_arready      : out std_logic;                                         -- arready
			s_axi_rvalid       : out std_logic;                                         -- rvalid
			s_axi_rresp        : out std_logic_vector(1 downto 0);                      -- rresp
			s_axi_rdata        : out std_logic_vector(31 downto 0);                     -- rdata
			s_axi_rready       : in  std_logic                      := 'X';             -- rready
			irq                : out std_logic;                                         -- irq
			m_dest_axi_aclk    : in  std_logic                      := 'X';             -- clk
			m_dest_axi_aresetn : in  std_logic                      := 'X';             -- reset_n
			s_axis_aclk        : in  std_logic                      := 'X';             -- clk
			s_axis_valid       : in  std_logic                      := 'X';             -- valid
			s_axis_data        : in  std_logic_vector(127 downto 0) := (others => 'X'); -- data
			s_axis_ready       : out std_logic;                                         -- ready
			s_axis_xfer_req    : out std_logic;                                         -- xfer_req
			m_dest_axi_awvalid : out std_logic;                                         -- awvalid
			m_dest_axi_awaddr  : out std_logic_vector(31 downto 0);                     -- awaddr
			m_dest_axi_awready : in  std_logic                      := 'X';             -- awready
			m_dest_axi_wvalid  : out std_logic;                                         -- wvalid
			m_dest_axi_wdata   : out std_logic_vector(127 downto 0);                    -- wdata
			m_dest_axi_wstrb   : out std_logic_vector(15 downto 0);                     -- wstrb
			m_dest_axi_wready  : in  std_logic                      := 'X';             -- wready
			m_dest_axi_bvalid  : in  std_logic                      := 'X';             -- bvalid
			m_dest_axi_bresp   : in  std_logic_vector(1 downto 0)   := (others => 'X'); -- bresp
			m_dest_axi_bready  : out std_logic;                                         -- bready
			m_dest_axi_arvalid : out std_logic;                                         -- arvalid
			m_dest_axi_araddr  : out std_logic_vector(31 downto 0);                     -- araddr
			m_dest_axi_arready : in  std_logic                      := 'X';             -- arready
			m_dest_axi_rvalid  : in  std_logic                      := 'X';             -- rvalid
			m_dest_axi_rresp   : in  std_logic_vector(1 downto 0)   := (others => 'X'); -- rresp
			m_dest_axi_rdata   : in  std_logic_vector(127 downto 0) := (others => 'X'); -- rdata
			m_dest_axi_rready  : out std_logic;                                         -- rready
			m_dest_axi_awlen   : out std_logic_vector(7 downto 0);                      -- awlen
			m_dest_axi_awsize  : out std_logic_vector(2 downto 0);                      -- awsize
			m_dest_axi_awburst : out std_logic_vector(1 downto 0);                      -- awburst
			m_dest_axi_awcache : out std_logic_vector(3 downto 0);                      -- awcache
			m_dest_axi_awprot  : out std_logic_vector(2 downto 0);                      -- awprot
			m_dest_axi_wlast   : out std_logic;                                         -- wlast
			m_dest_axi_arlen   : out std_logic_vector(7 downto 0);                      -- arlen
			m_dest_axi_arsize  : out std_logic_vector(2 downto 0);                      -- arsize
			m_dest_axi_arburst : out std_logic_vector(1 downto 0);                      -- arburst
			m_dest_axi_arcache : out std_logic_vector(3 downto 0);                      -- arcache
			m_dest_axi_arprot  : out std_logic_vector(2 downto 0)                       -- arprot
		);
	end component ad9680_dma;

	u0 : component ad9680_dma
		port map (
			s_axi_aclk         => CONNECTED_TO_s_axi_aclk,         --        s_axi_clock.clk
			s_axi_aresetn      => CONNECTED_TO_s_axi_aresetn,      --        s_axi_reset.reset_n
			s_axi_awvalid      => CONNECTED_TO_s_axi_awvalid,      --              s_axi.awvalid
			s_axi_awaddr       => CONNECTED_TO_s_axi_awaddr,       --                   .awaddr
			s_axi_awprot       => CONNECTED_TO_s_axi_awprot,       --                   .awprot
			s_axi_awready      => CONNECTED_TO_s_axi_awready,      --                   .awready
			s_axi_wvalid       => CONNECTED_TO_s_axi_wvalid,       --                   .wvalid
			s_axi_wdata        => CONNECTED_TO_s_axi_wdata,        --                   .wdata
			s_axi_wstrb        => CONNECTED_TO_s_axi_wstrb,        --                   .wstrb
			s_axi_wready       => CONNECTED_TO_s_axi_wready,       --                   .wready
			s_axi_bvalid       => CONNECTED_TO_s_axi_bvalid,       --                   .bvalid
			s_axi_bresp        => CONNECTED_TO_s_axi_bresp,        --                   .bresp
			s_axi_bready       => CONNECTED_TO_s_axi_bready,       --                   .bready
			s_axi_arvalid      => CONNECTED_TO_s_axi_arvalid,      --                   .arvalid
			s_axi_araddr       => CONNECTED_TO_s_axi_araddr,       --                   .araddr
			s_axi_arprot       => CONNECTED_TO_s_axi_arprot,       --                   .arprot
			s_axi_arready      => CONNECTED_TO_s_axi_arready,      --                   .arready
			s_axi_rvalid       => CONNECTED_TO_s_axi_rvalid,       --                   .rvalid
			s_axi_rresp        => CONNECTED_TO_s_axi_rresp,        --                   .rresp
			s_axi_rdata        => CONNECTED_TO_s_axi_rdata,        --                   .rdata
			s_axi_rready       => CONNECTED_TO_s_axi_rready,       --                   .rready
			irq                => CONNECTED_TO_irq,                --   interrupt_sender.irq
			m_dest_axi_aclk    => CONNECTED_TO_m_dest_axi_aclk,    --   m_dest_axi_clock.clk
			m_dest_axi_aresetn => CONNECTED_TO_m_dest_axi_aresetn, --   m_dest_axi_reset.reset_n
			s_axis_aclk        => CONNECTED_TO_s_axis_aclk,        --     if_s_axis_aclk.clk
			s_axis_valid       => CONNECTED_TO_s_axis_valid,       --    if_s_axis_valid.valid
			s_axis_data        => CONNECTED_TO_s_axis_data,        --     if_s_axis_data.data
			s_axis_ready       => CONNECTED_TO_s_axis_ready,       --    if_s_axis_ready.ready
			s_axis_xfer_req    => CONNECTED_TO_s_axis_xfer_req,    -- if_s_axis_xfer_req.xfer_req
			m_dest_axi_awvalid => CONNECTED_TO_m_dest_axi_awvalid, --         m_dest_axi.awvalid
			m_dest_axi_awaddr  => CONNECTED_TO_m_dest_axi_awaddr,  --                   .awaddr
			m_dest_axi_awready => CONNECTED_TO_m_dest_axi_awready, --                   .awready
			m_dest_axi_wvalid  => CONNECTED_TO_m_dest_axi_wvalid,  --                   .wvalid
			m_dest_axi_wdata   => CONNECTED_TO_m_dest_axi_wdata,   --                   .wdata
			m_dest_axi_wstrb   => CONNECTED_TO_m_dest_axi_wstrb,   --                   .wstrb
			m_dest_axi_wready  => CONNECTED_TO_m_dest_axi_wready,  --                   .wready
			m_dest_axi_bvalid  => CONNECTED_TO_m_dest_axi_bvalid,  --                   .bvalid
			m_dest_axi_bresp   => CONNECTED_TO_m_dest_axi_bresp,   --                   .bresp
			m_dest_axi_bready  => CONNECTED_TO_m_dest_axi_bready,  --                   .bready
			m_dest_axi_arvalid => CONNECTED_TO_m_dest_axi_arvalid, --                   .arvalid
			m_dest_axi_araddr  => CONNECTED_TO_m_dest_axi_araddr,  --                   .araddr
			m_dest_axi_arready => CONNECTED_TO_m_dest_axi_arready, --                   .arready
			m_dest_axi_rvalid  => CONNECTED_TO_m_dest_axi_rvalid,  --                   .rvalid
			m_dest_axi_rresp   => CONNECTED_TO_m_dest_axi_rresp,   --                   .rresp
			m_dest_axi_rdata   => CONNECTED_TO_m_dest_axi_rdata,   --                   .rdata
			m_dest_axi_rready  => CONNECTED_TO_m_dest_axi_rready,  --                   .rready
			m_dest_axi_awlen   => CONNECTED_TO_m_dest_axi_awlen,   --                   .awlen
			m_dest_axi_awsize  => CONNECTED_TO_m_dest_axi_awsize,  --                   .awsize
			m_dest_axi_awburst => CONNECTED_TO_m_dest_axi_awburst, --                   .awburst
			m_dest_axi_awcache => CONNECTED_TO_m_dest_axi_awcache, --                   .awcache
			m_dest_axi_awprot  => CONNECTED_TO_m_dest_axi_awprot,  --                   .awprot
			m_dest_axi_wlast   => CONNECTED_TO_m_dest_axi_wlast,   --                   .wlast
			m_dest_axi_arlen   => CONNECTED_TO_m_dest_axi_arlen,   --                   .arlen
			m_dest_axi_arsize  => CONNECTED_TO_m_dest_axi_arsize,  --                   .arsize
			m_dest_axi_arburst => CONNECTED_TO_m_dest_axi_arburst, --                   .arburst
			m_dest_axi_arcache => CONNECTED_TO_m_dest_axi_arcache, --                   .arcache
			m_dest_axi_arprot  => CONNECTED_TO_m_dest_axi_arprot   --                   .arprot
		);

