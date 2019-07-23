	component mcu_subsystem_generic_quad_spi_controller2_0 is
		port (
			clk                  : in    std_logic                     := 'X';             -- clk
			reset_n              : in    std_logic                     := 'X';             -- reset_n
			qspi_pins_dclk       : out   std_logic;                                        -- dclk
			qspi_pins_ncs        : out   std_logic;                                        -- ncs
			qspi_pins_data       : inout std_logic_vector(3 downto 0)  := (others => 'X'); -- data
			avl_csr_read         : in    std_logic                     := 'X';             -- read
			avl_csr_waitrequest  : out   std_logic;                                        -- waitrequest
			avl_csr_write        : in    std_logic                     := 'X';             -- write
			avl_csr_addr         : in    std_logic_vector(3 downto 0)  := (others => 'X'); -- address
			avl_csr_wrdata       : in    std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			avl_csr_rddata       : out   std_logic_vector(31 downto 0);                    -- readdata
			avl_csr_rddata_valid : out   std_logic;                                        -- readdatavalid
			avl_mem_write        : in    std_logic                     := 'X';             -- write
			avl_mem_burstcount   : in    std_logic_vector(6 downto 0)  := (others => 'X'); -- burstcount
			avl_mem_waitrequest  : out   std_logic;                                        -- waitrequest
			avl_mem_read         : in    std_logic                     := 'X';             -- read
			avl_mem_addr         : in    std_logic_vector(24 downto 0) := (others => 'X'); -- address
			avl_mem_wrdata       : in    std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			avl_mem_rddata       : out   std_logic_vector(31 downto 0);                    -- readdata
			avl_mem_rddata_valid : out   std_logic;                                        -- readdatavalid
			avl_mem_byteenable   : in    std_logic_vector(3 downto 0)  := (others => 'X'); -- byteenable
			irq                  : out   std_logic                                         -- irq
		);
	end component mcu_subsystem_generic_quad_spi_controller2_0;

	u0 : component mcu_subsystem_generic_quad_spi_controller2_0
		port map (
			clk                  => CONNECTED_TO_clk,                  --       clock_sink.clk
			reset_n              => CONNECTED_TO_reset_n,              --            reset.reset_n
			qspi_pins_dclk       => CONNECTED_TO_qspi_pins_dclk,       --        qspi_pins.dclk
			qspi_pins_ncs        => CONNECTED_TO_qspi_pins_ncs,        --                 .ncs
			qspi_pins_data       => CONNECTED_TO_qspi_pins_data,       --                 .data
			avl_csr_read         => CONNECTED_TO_avl_csr_read,         --          avl_csr.read
			avl_csr_waitrequest  => CONNECTED_TO_avl_csr_waitrequest,  --                 .waitrequest
			avl_csr_write        => CONNECTED_TO_avl_csr_write,        --                 .write
			avl_csr_addr         => CONNECTED_TO_avl_csr_addr,         --                 .address
			avl_csr_wrdata       => CONNECTED_TO_avl_csr_wrdata,       --                 .writedata
			avl_csr_rddata       => CONNECTED_TO_avl_csr_rddata,       --                 .readdata
			avl_csr_rddata_valid => CONNECTED_TO_avl_csr_rddata_valid, --                 .readdatavalid
			avl_mem_write        => CONNECTED_TO_avl_mem_write,        --          avl_mem.write
			avl_mem_burstcount   => CONNECTED_TO_avl_mem_burstcount,   --                 .burstcount
			avl_mem_waitrequest  => CONNECTED_TO_avl_mem_waitrequest,  --                 .waitrequest
			avl_mem_read         => CONNECTED_TO_avl_mem_read,         --                 .read
			avl_mem_addr         => CONNECTED_TO_avl_mem_addr,         --                 .address
			avl_mem_wrdata       => CONNECTED_TO_avl_mem_wrdata,       --                 .writedata
			avl_mem_rddata       => CONNECTED_TO_avl_mem_rddata,       --                 .readdata
			avl_mem_rddata_valid => CONNECTED_TO_avl_mem_rddata_valid, --                 .readdatavalid
			avl_mem_byteenable   => CONNECTED_TO_avl_mem_byteenable,   --                 .byteenable
			irq                  => CONNECTED_TO_irq                   -- interrupt_sender.irq
		);

