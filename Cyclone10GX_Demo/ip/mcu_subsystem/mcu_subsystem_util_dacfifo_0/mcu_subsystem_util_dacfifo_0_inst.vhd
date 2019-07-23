	component mcu_subsystem_util_dacfifo_0 is
		port (
			dma_clk       : in  std_logic                      := 'X';             -- clk
			dma_rst       : in  std_logic                      := 'X';             -- reset
			dma_valid     : in  std_logic                      := 'X';             -- valid
			dma_data      : in  std_logic_vector(127 downto 0) := (others => 'X'); -- data
			dma_ready     : out std_logic;                                         -- ready
			dma_xfer_req  : in  std_logic                      := 'X';             -- xfer_req
			dma_xfer_last : in  std_logic                      := 'X';             -- last
			dac_clk       : in  std_logic                      := 'X';             -- clk
			dac_rst       : in  std_logic                      := 'X';             -- reset
			dac_valid     : in  std_logic                      := 'X';             -- valid
			dac_data      : out std_logic_vector(127 downto 0);                    -- data
			dac_xfer_out  : out std_logic;                                         -- xfer_req
			dac_dunf      : out std_logic;                                         -- unf
			bypass        : in  std_logic                      := 'X'              -- bypass
		);
	end component mcu_subsystem_util_dacfifo_0;

	u0 : component mcu_subsystem_util_dacfifo_0
		port map (
			dma_clk       => CONNECTED_TO_dma_clk,       --       if_dma_clk.clk
			dma_rst       => CONNECTED_TO_dma_rst,       --       if_dma_rst.reset
			dma_valid     => CONNECTED_TO_dma_valid,     --     if_dma_valid.valid
			dma_data      => CONNECTED_TO_dma_data,      --      if_dma_data.data
			dma_ready     => CONNECTED_TO_dma_ready,     --     if_dma_ready.ready
			dma_xfer_req  => CONNECTED_TO_dma_xfer_req,  --  if_dma_xfer_req.xfer_req
			dma_xfer_last => CONNECTED_TO_dma_xfer_last, -- if_dma_xfer_last.last
			dac_clk       => CONNECTED_TO_dac_clk,       --       if_dac_clk.clk
			dac_rst       => CONNECTED_TO_dac_rst,       --       if_dac_rst.reset
			dac_valid     => CONNECTED_TO_dac_valid,     --     if_dac_valid.valid
			dac_data      => CONNECTED_TO_dac_data,      --      if_dac_data.data
			dac_xfer_out  => CONNECTED_TO_dac_xfer_out,  --  if_dac_xfer_out.xfer_req
			dac_dunf      => CONNECTED_TO_dac_dunf,      --      if_dac_dunf.unf
			bypass        => CONNECTED_TO_bypass         --        if_bypass.bypass
		);

