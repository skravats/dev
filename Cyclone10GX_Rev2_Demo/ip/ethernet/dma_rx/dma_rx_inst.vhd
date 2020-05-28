	component dma_rx is
		port (
			clock_clk                    : in  std_logic                      := 'X';             -- clk
			reset_n_reset_n              : in  std_logic                      := 'X';             -- reset_n
			csr_writedata                : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- writedata
			csr_write                    : in  std_logic                      := 'X';             -- write
			csr_byteenable               : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- byteenable
			csr_readdata                 : out std_logic_vector(31 downto 0);                     -- readdata
			csr_read                     : in  std_logic                      := 'X';             -- read
			csr_address                  : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- address
			descriptor_slave_write       : in  std_logic                      := 'X';             -- write
			descriptor_slave_waitrequest : out std_logic;                                         -- waitrequest
			descriptor_slave_writedata   : in  std_logic_vector(255 downto 0) := (others => 'X'); -- writedata
			descriptor_slave_byteenable  : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- byteenable
			response_waitrequest         : out std_logic;                                         -- waitrequest
			response_byteenable          : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- byteenable
			response_address             : in  std_logic                      := 'X';             -- address
			response_readdata            : out std_logic_vector(31 downto 0);                     -- readdata
			response_read                : in  std_logic                      := 'X';             -- read
			csr_irq_irq                  : out std_logic;                                         -- irq
			mm_write_address             : out std_logic_vector(31 downto 0);                     -- address
			mm_write_write               : out std_logic;                                         -- write
			mm_write_byteenable          : out std_logic_vector(31 downto 0);                     -- byteenable
			mm_write_writedata           : out std_logic_vector(255 downto 0);                    -- writedata
			mm_write_waitrequest         : in  std_logic                      := 'X';             -- waitrequest
			mm_write_burstcount          : out std_logic_vector(7 downto 0);                      -- burstcount
			st_sink_data                 : in  std_logic_vector(255 downto 0) := (others => 'X'); -- data
			st_sink_valid                : in  std_logic                      := 'X';             -- valid
			st_sink_ready                : out std_logic;                                         -- ready
			st_sink_startofpacket        : in  std_logic                      := 'X';             -- startofpacket
			st_sink_endofpacket          : in  std_logic                      := 'X';             -- endofpacket
			st_sink_empty                : in  std_logic_vector(4 downto 0)   := (others => 'X'); -- empty
			st_sink_error                : in  std_logic_vector(7 downto 0)   := (others => 'X')  -- error
		);
	end component dma_rx;

	u0 : component dma_rx
		port map (
			clock_clk                    => CONNECTED_TO_clock_clk,                    --            clock.clk
			reset_n_reset_n              => CONNECTED_TO_reset_n_reset_n,              --          reset_n.reset_n
			csr_writedata                => CONNECTED_TO_csr_writedata,                --              csr.writedata
			csr_write                    => CONNECTED_TO_csr_write,                    --                 .write
			csr_byteenable               => CONNECTED_TO_csr_byteenable,               --                 .byteenable
			csr_readdata                 => CONNECTED_TO_csr_readdata,                 --                 .readdata
			csr_read                     => CONNECTED_TO_csr_read,                     --                 .read
			csr_address                  => CONNECTED_TO_csr_address,                  --                 .address
			descriptor_slave_write       => CONNECTED_TO_descriptor_slave_write,       -- descriptor_slave.write
			descriptor_slave_waitrequest => CONNECTED_TO_descriptor_slave_waitrequest, --                 .waitrequest
			descriptor_slave_writedata   => CONNECTED_TO_descriptor_slave_writedata,   --                 .writedata
			descriptor_slave_byteenable  => CONNECTED_TO_descriptor_slave_byteenable,  --                 .byteenable
			response_waitrequest         => CONNECTED_TO_response_waitrequest,         --         response.waitrequest
			response_byteenable          => CONNECTED_TO_response_byteenable,          --                 .byteenable
			response_address             => CONNECTED_TO_response_address,             --                 .address
			response_readdata            => CONNECTED_TO_response_readdata,            --                 .readdata
			response_read                => CONNECTED_TO_response_read,                --                 .read
			csr_irq_irq                  => CONNECTED_TO_csr_irq_irq,                  --          csr_irq.irq
			mm_write_address             => CONNECTED_TO_mm_write_address,             --         mm_write.address
			mm_write_write               => CONNECTED_TO_mm_write_write,               --                 .write
			mm_write_byteenable          => CONNECTED_TO_mm_write_byteenable,          --                 .byteenable
			mm_write_writedata           => CONNECTED_TO_mm_write_writedata,           --                 .writedata
			mm_write_waitrequest         => CONNECTED_TO_mm_write_waitrequest,         --                 .waitrequest
			mm_write_burstcount          => CONNECTED_TO_mm_write_burstcount,          --                 .burstcount
			st_sink_data                 => CONNECTED_TO_st_sink_data,                 --          st_sink.data
			st_sink_valid                => CONNECTED_TO_st_sink_valid,                --                 .valid
			st_sink_ready                => CONNECTED_TO_st_sink_ready,                --                 .ready
			st_sink_startofpacket        => CONNECTED_TO_st_sink_startofpacket,        --                 .startofpacket
			st_sink_endofpacket          => CONNECTED_TO_st_sink_endofpacket,          --                 .endofpacket
			st_sink_empty                => CONNECTED_TO_st_sink_empty,                --                 .empty
			st_sink_error                => CONNECTED_TO_st_sink_error                 --                 .error
		);

