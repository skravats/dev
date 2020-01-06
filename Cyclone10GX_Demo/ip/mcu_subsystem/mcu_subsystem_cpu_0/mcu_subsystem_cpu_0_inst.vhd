	component mcu_subsystem_cpu_0 is
		port (
			clk                                 : in  std_logic                     := 'X';             -- clk
			reset_n                             : in  std_logic                     := 'X';             -- reset_n
			reset_req                           : in  std_logic                     := 'X';             -- reset_req
			d_address                           : out std_logic_vector(31 downto 0);                    -- address
			d_byteenable                        : out std_logic_vector(3 downto 0);                     -- byteenable
			d_read                              : out std_logic;                                        -- read
			d_readdata                          : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			d_waitrequest                       : in  std_logic                     := 'X';             -- waitrequest
			d_write                             : out std_logic;                                        -- write
			d_writedata                         : out std_logic_vector(31 downto 0);                    -- writedata
			d_readdatavalid                     : in  std_logic                     := 'X';             -- readdatavalid
			debug_mem_slave_debugaccess_to_roms : out std_logic;                                        -- debugaccess
			i_address                           : out std_logic_vector(31 downto 0);                    -- address
			i_read                              : out std_logic;                                        -- read
			i_readdata                          : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			i_waitrequest                       : in  std_logic                     := 'X';             -- waitrequest
			i_readdatavalid                     : in  std_logic                     := 'X';             -- readdatavalid
			irq                                 : in  std_logic_vector(31 downto 0) := (others => 'X'); -- irq
			debug_reset_request                 : out std_logic;                                        -- reset
			debug_mem_slave_address             : in  std_logic_vector(8 downto 0)  := (others => 'X'); -- address
			debug_mem_slave_byteenable          : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- byteenable
			debug_mem_slave_debugaccess         : in  std_logic                     := 'X';             -- debugaccess
			debug_mem_slave_read                : in  std_logic                     := 'X';             -- read
			debug_mem_slave_readdata            : out std_logic_vector(31 downto 0);                    -- readdata
			debug_mem_slave_waitrequest         : out std_logic;                                        -- waitrequest
			debug_mem_slave_write               : in  std_logic                     := 'X';             -- write
			debug_mem_slave_writedata           : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			A_ci_multi_done                     : in  std_logic                     := 'X';             -- done
			A_ci_multi_result                   : in  std_logic_vector(31 downto 0) := (others => 'X'); -- multi_result
			A_ci_multi_a                        : out std_logic_vector(4 downto 0);                     -- multi_a
			A_ci_multi_b                        : out std_logic_vector(4 downto 0);                     -- multi_b
			A_ci_multi_c                        : out std_logic_vector(4 downto 0);                     -- multi_c
			A_ci_multi_clk_en                   : out std_logic;                                        -- clk_en
			A_ci_multi_clock                    : out std_logic;                                        -- clk
			A_ci_multi_reset                    : out std_logic;                                        -- reset
			A_ci_multi_reset_req                : out std_logic;                                        -- reset_req
			A_ci_multi_dataa                    : out std_logic_vector(31 downto 0);                    -- multi_dataa
			A_ci_multi_datab                    : out std_logic_vector(31 downto 0);                    -- multi_datab
			A_ci_multi_n                        : out std_logic_vector(7 downto 0);                     -- multi_n
			A_ci_multi_readra                   : out std_logic;                                        -- multi_readra
			A_ci_multi_readrb                   : out std_logic;                                        -- multi_readrb
			A_ci_multi_start                    : out std_logic;                                        -- start
			A_ci_multi_writerc                  : out std_logic;                                        -- multi_writerc
			E_ci_combo_result                   : in  std_logic_vector(31 downto 0) := (others => 'X'); -- result
			E_ci_combo_a                        : out std_logic_vector(4 downto 0);                     -- a
			E_ci_combo_b                        : out std_logic_vector(4 downto 0);                     -- b
			E_ci_combo_c                        : out std_logic_vector(4 downto 0);                     -- c
			E_ci_combo_dataa                    : out std_logic_vector(31 downto 0);                    -- dataa
			E_ci_combo_datab                    : out std_logic_vector(31 downto 0);                    -- datab
			E_ci_combo_estatus                  : out std_logic;                                        -- estatus
			E_ci_combo_ipending                 : out std_logic_vector(31 downto 0);                    -- ipending
			E_ci_combo_n                        : out std_logic_vector(7 downto 0);                     -- n
			E_ci_combo_readra                   : out std_logic;                                        -- readra
			E_ci_combo_readrb                   : out std_logic;                                        -- readrb
			E_ci_combo_writerc                  : out std_logic                                         -- writerc
		);
	end component mcu_subsystem_cpu_0;

	u0 : component mcu_subsystem_cpu_0
		port map (
			clk                                 => CONNECTED_TO_clk,                                 --                       clk.clk
			reset_n                             => CONNECTED_TO_reset_n,                             --                     reset.reset_n
			reset_req                           => CONNECTED_TO_reset_req,                           --                          .reset_req
			d_address                           => CONNECTED_TO_d_address,                           --               data_master.address
			d_byteenable                        => CONNECTED_TO_d_byteenable,                        --                          .byteenable
			d_read                              => CONNECTED_TO_d_read,                              --                          .read
			d_readdata                          => CONNECTED_TO_d_readdata,                          --                          .readdata
			d_waitrequest                       => CONNECTED_TO_d_waitrequest,                       --                          .waitrequest
			d_write                             => CONNECTED_TO_d_write,                             --                          .write
			d_writedata                         => CONNECTED_TO_d_writedata,                         --                          .writedata
			d_readdatavalid                     => CONNECTED_TO_d_readdatavalid,                     --                          .readdatavalid
			debug_mem_slave_debugaccess_to_roms => CONNECTED_TO_debug_mem_slave_debugaccess_to_roms, --                          .debugaccess
			i_address                           => CONNECTED_TO_i_address,                           --        instruction_master.address
			i_read                              => CONNECTED_TO_i_read,                              --                          .read
			i_readdata                          => CONNECTED_TO_i_readdata,                          --                          .readdata
			i_waitrequest                       => CONNECTED_TO_i_waitrequest,                       --                          .waitrequest
			i_readdatavalid                     => CONNECTED_TO_i_readdatavalid,                     --                          .readdatavalid
			irq                                 => CONNECTED_TO_irq,                                 --                       irq.irq
			debug_reset_request                 => CONNECTED_TO_debug_reset_request,                 --       debug_reset_request.reset
			debug_mem_slave_address             => CONNECTED_TO_debug_mem_slave_address,             --           debug_mem_slave.address
			debug_mem_slave_byteenable          => CONNECTED_TO_debug_mem_slave_byteenable,          --                          .byteenable
			debug_mem_slave_debugaccess         => CONNECTED_TO_debug_mem_slave_debugaccess,         --                          .debugaccess
			debug_mem_slave_read                => CONNECTED_TO_debug_mem_slave_read,                --                          .read
			debug_mem_slave_readdata            => CONNECTED_TO_debug_mem_slave_readdata,            --                          .readdata
			debug_mem_slave_waitrequest         => CONNECTED_TO_debug_mem_slave_waitrequest,         --                          .waitrequest
			debug_mem_slave_write               => CONNECTED_TO_debug_mem_slave_write,               --                          .write
			debug_mem_slave_writedata           => CONNECTED_TO_debug_mem_slave_writedata,           --                          .writedata
			A_ci_multi_done                     => CONNECTED_TO_A_ci_multi_done,                     -- custom_instruction_master.done
			A_ci_multi_result                   => CONNECTED_TO_A_ci_multi_result,                   --                          .multi_result
			A_ci_multi_a                        => CONNECTED_TO_A_ci_multi_a,                        --                          .multi_a
			A_ci_multi_b                        => CONNECTED_TO_A_ci_multi_b,                        --                          .multi_b
			A_ci_multi_c                        => CONNECTED_TO_A_ci_multi_c,                        --                          .multi_c
			A_ci_multi_clk_en                   => CONNECTED_TO_A_ci_multi_clk_en,                   --                          .clk_en
			A_ci_multi_clock                    => CONNECTED_TO_A_ci_multi_clock,                    --                          .clk
			A_ci_multi_reset                    => CONNECTED_TO_A_ci_multi_reset,                    --                          .reset
			A_ci_multi_reset_req                => CONNECTED_TO_A_ci_multi_reset_req,                --                          .reset_req
			A_ci_multi_dataa                    => CONNECTED_TO_A_ci_multi_dataa,                    --                          .multi_dataa
			A_ci_multi_datab                    => CONNECTED_TO_A_ci_multi_datab,                    --                          .multi_datab
			A_ci_multi_n                        => CONNECTED_TO_A_ci_multi_n,                        --                          .multi_n
			A_ci_multi_readra                   => CONNECTED_TO_A_ci_multi_readra,                   --                          .multi_readra
			A_ci_multi_readrb                   => CONNECTED_TO_A_ci_multi_readrb,                   --                          .multi_readrb
			A_ci_multi_start                    => CONNECTED_TO_A_ci_multi_start,                    --                          .start
			A_ci_multi_writerc                  => CONNECTED_TO_A_ci_multi_writerc,                  --                          .multi_writerc
			E_ci_combo_result                   => CONNECTED_TO_E_ci_combo_result,                   --                          .result
			E_ci_combo_a                        => CONNECTED_TO_E_ci_combo_a,                        --                          .a
			E_ci_combo_b                        => CONNECTED_TO_E_ci_combo_b,                        --                          .b
			E_ci_combo_c                        => CONNECTED_TO_E_ci_combo_c,                        --                          .c
			E_ci_combo_dataa                    => CONNECTED_TO_E_ci_combo_dataa,                    --                          .dataa
			E_ci_combo_datab                    => CONNECTED_TO_E_ci_combo_datab,                    --                          .datab
			E_ci_combo_estatus                  => CONNECTED_TO_E_ci_combo_estatus,                  --                          .estatus
			E_ci_combo_ipending                 => CONNECTED_TO_E_ci_combo_ipending,                 --                          .ipending
			E_ci_combo_n                        => CONNECTED_TO_E_ci_combo_n,                        --                          .n
			E_ci_combo_readra                   => CONNECTED_TO_E_ci_combo_readra,                   --                          .readra
			E_ci_combo_readrb                   => CONNECTED_TO_E_ci_combo_readrb,                   --                          .readrb
			E_ci_combo_writerc                  => CONNECTED_TO_E_ci_combo_writerc                   --                          .writerc
		);

