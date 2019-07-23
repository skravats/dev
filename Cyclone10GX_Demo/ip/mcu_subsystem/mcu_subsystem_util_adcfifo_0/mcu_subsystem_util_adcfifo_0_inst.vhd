	component mcu_subsystem_util_adcfifo_0 is
		port (
			adc_clk         : in  std_logic                      := 'X';             -- clk
			adc_rst         : in  std_logic                      := 'X';             -- reset
			adc_wr          : in  std_logic                      := 'X';             -- valid
			adc_wdata       : in  std_logic_vector(127 downto 0) := (others => 'X'); -- data
			adc_wovf        : out std_logic;                                         -- ovf
			dma_clk         : in  std_logic                      := 'X';             -- clk
			dma_wr          : out std_logic;                                         -- valid
			dma_wdata       : out std_logic_vector(127 downto 0);                    -- data
			dma_wready      : in  std_logic                      := 'X';             -- ready
			dma_xfer_req    : in  std_logic                      := 'X';             -- xfer_req
			dma_xfer_status : out std_logic_vector(3 downto 0)                       -- xfer_status
		);
	end component mcu_subsystem_util_adcfifo_0;

	u0 : component mcu_subsystem_util_adcfifo_0
		port map (
			adc_clk         => CONNECTED_TO_adc_clk,         --         if_adc_clk.clk
			adc_rst         => CONNECTED_TO_adc_rst,         --         if_adc_rst.reset
			adc_wr          => CONNECTED_TO_adc_wr,          --          if_adc_wr.valid
			adc_wdata       => CONNECTED_TO_adc_wdata,       --       if_adc_wdata.data
			adc_wovf        => CONNECTED_TO_adc_wovf,        --        if_adc_wovf.ovf
			dma_clk         => CONNECTED_TO_dma_clk,         --         if_dma_clk.clk
			dma_wr          => CONNECTED_TO_dma_wr,          --          if_dma_wr.valid
			dma_wdata       => CONNECTED_TO_dma_wdata,       --       if_dma_wdata.data
			dma_wready      => CONNECTED_TO_dma_wready,      --      if_dma_wready.ready
			dma_xfer_req    => CONNECTED_TO_dma_xfer_req,    --    if_dma_xfer_req.xfer_req
			dma_xfer_status => CONNECTED_TO_dma_xfer_status  -- if_dma_xfer_status.xfer_status
		);

