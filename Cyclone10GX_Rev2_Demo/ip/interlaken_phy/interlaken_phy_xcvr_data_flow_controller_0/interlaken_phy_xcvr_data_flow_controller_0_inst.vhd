	component interlaken_phy_xcvr_data_flow_controller_0 is
		port (
			csr_s0_address           : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- address
			csr_s0_read              : in  std_logic                     := 'X';             -- read
			csr_s0_readdata          : out std_logic_vector(31 downto 0);                    -- readdata
			csr_s0_readdatavalid     : out std_logic;                                        -- readdatavalid
			csr_s0_write             : in  std_logic                     := 'X';             -- write
			csr_s0_writedata         : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			csr_s0_waitrequest       : out std_logic;                                        -- waitrequest
			rx_parallel_data         : in  std_logic_vector(63 downto 0) := (others => 'X'); -- rx_parallel_data
			tx_parallel_data         : out std_logic_vector(63 downto 0);                    -- tx_parallel_data
			rx_enh_fifo_full         : in  std_logic                     := 'X';             -- rx_enh_fifo_full
			rx_enh_fifo_pfull        : in  std_logic                     := 'X';             -- rx_enh_fifo_pfull
			rx_enh_fifo_empty        : in  std_logic                     := 'X';             -- rx_enh_fifo_empty
			rx_enh_fifo_pempty       : in  std_logic                     := 'X';             -- rx_enh_fifo_pempty
			tx_enh_fifo_pempty       : in  std_logic                     := 'X';             -- tx_enh_fifo_pempty
			tx_enh_fifo_empty        : in  std_logic                     := 'X';             -- tx_enh_fifo_empty
			tx_enh_fifo_pfull        : in  std_logic                     := 'X';             -- tx_enh_fifo_pfull
			tx_enh_fifo_full         : in  std_logic                     := 'X';             -- tx_enh_fifo_full
			avm_m0_address           : out std_logic_vector(31 downto 0);                    -- address
			avm_m0_read              : out std_logic;                                        -- read
			avm_m0_waitrequest       : in  std_logic                     := 'X';             -- waitrequest
			avm_m0_readdata          : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			avm_m0_readdatavalid     : in  std_logic                     := 'X';             -- readdatavalid
			avm_m0_write             : out std_logic;                                        -- write
			avm_m0_writedata         : out std_logic_vector(31 downto 0);                    -- writedata
			tx_control               : out std_logic_vector(2 downto 0);                     -- tx_control
			rx_control               : in  std_logic_vector(9 downto 0)  := (others => 'X'); -- rx_control
			reset                    : in  std_logic                     := 'X';             -- reset
			clock                    : in  std_logic                     := 'X';             -- clk
			tx_ready                 : in  std_logic                     := 'X';             -- tx_ready
			rx_ready                 : in  std_logic                     := 'X';             -- rx_ready
			rx_irq                   : out std_logic;                                        -- irq
			tx_enh_data_valid        : out std_logic;                                        -- tx_enh_data_valid
			tx_irq                   : out std_logic;                                        -- irq
			tx_coreclkin             : in  std_logic                     := 'X';             -- clk
			rx_coreclkin             : in  std_logic                     := 'X';             -- clk
			rx_enh_fifo_rd_en        : out std_logic;                                        -- rx_enh_fifo_rd_en
			tx_err_ins               : out std_logic;                                        -- tx_err_ins
			reset_phy                : out std_logic;                                        -- reset
			pll_locked_out           : out std_logic;                                        -- pll_locked
			pll_powerdown_input      : in  std_logic                     := 'X';             -- pll_powerdown
			atx_pll_powerdown        : out std_logic;                                        -- pll_powerdown
			atx_pll_locked           : in  std_logic                     := 'X';             -- pll_locked
			rx_set_locktodata        : out std_logic;                                        -- rx_set_locktodata
			rx_set_locktoref         : out std_logic;                                        -- rx_set_locktoref
			tx_enh_frame_burst_en    : out std_logic;                                        -- tx_enh_frame_burst_en
			tx_enh_frame_diag_status : out std_logic_vector(1 downto 0);                     -- tx_enh_frame_diag_status
			unused_tx_control        : out std_logic_vector(13 downto 0);                    -- unused_tx_control
			unused_tx_parallel_data  : out std_logic_vector(63 downto 0);                    -- unused_tx_parallel_data
			rx_seriallpbken          : out std_logic;                                        -- rx_seriallpbken
			pll_select               : out std_logic;                                        -- pll_select
			rx_enh_frame_diag_status : in  std_logic_vector(1 downto 0)  := (others => 'X')  -- rx_enh_frame_diag_status
		);
	end component interlaken_phy_xcvr_data_flow_controller_0;

	u0 : component interlaken_phy_xcvr_data_flow_controller_0
		port map (
			csr_s0_address           => CONNECTED_TO_csr_s0_address,           --                   csr_s0.address
			csr_s0_read              => CONNECTED_TO_csr_s0_read,              --                         .read
			csr_s0_readdata          => CONNECTED_TO_csr_s0_readdata,          --                         .readdata
			csr_s0_readdatavalid     => CONNECTED_TO_csr_s0_readdatavalid,     --                         .readdatavalid
			csr_s0_write             => CONNECTED_TO_csr_s0_write,             --                         .write
			csr_s0_writedata         => CONNECTED_TO_csr_s0_writedata,         --                         .writedata
			csr_s0_waitrequest       => CONNECTED_TO_csr_s0_waitrequest,       --                         .waitrequest
			rx_parallel_data         => CONNECTED_TO_rx_parallel_data,         --         rx_parallel_data.rx_parallel_data
			tx_parallel_data         => CONNECTED_TO_tx_parallel_data,         --         tx_parallel_data.tx_parallel_data
			rx_enh_fifo_full         => CONNECTED_TO_rx_enh_fifo_full,         --         rx_enh_fifo_full.rx_enh_fifo_full
			rx_enh_fifo_pfull        => CONNECTED_TO_rx_enh_fifo_pfull,        --        rx_enh_fifo_pfull.rx_enh_fifo_pfull
			rx_enh_fifo_empty        => CONNECTED_TO_rx_enh_fifo_empty,        --        rx_enh_fifo_empty.rx_enh_fifo_empty
			rx_enh_fifo_pempty       => CONNECTED_TO_rx_enh_fifo_pempty,       --       rx_enh_fifo_pempty.rx_enh_fifo_pempty
			tx_enh_fifo_pempty       => CONNECTED_TO_tx_enh_fifo_pempty,       --       tx_enh_fifo_pempty.tx_enh_fifo_pempty
			tx_enh_fifo_empty        => CONNECTED_TO_tx_enh_fifo_empty,        --        tx_enh_fifo_empty.tx_enh_fifo_empty
			tx_enh_fifo_pfull        => CONNECTED_TO_tx_enh_fifo_pfull,        --        tx_enh_fifo_pfull.tx_enh_fifo_pfull
			tx_enh_fifo_full         => CONNECTED_TO_tx_enh_fifo_full,         --         tx_enh_fifo_full.tx_enh_fifo_full
			avm_m0_address           => CONNECTED_TO_avm_m0_address,           --                   avm_m0.address
			avm_m0_read              => CONNECTED_TO_avm_m0_read,              --                         .read
			avm_m0_waitrequest       => CONNECTED_TO_avm_m0_waitrequest,       --                         .waitrequest
			avm_m0_readdata          => CONNECTED_TO_avm_m0_readdata,          --                         .readdata
			avm_m0_readdatavalid     => CONNECTED_TO_avm_m0_readdatavalid,     --                         .readdatavalid
			avm_m0_write             => CONNECTED_TO_avm_m0_write,             --                         .write
			avm_m0_writedata         => CONNECTED_TO_avm_m0_writedata,         --                         .writedata
			tx_control               => CONNECTED_TO_tx_control,               --               tx_control.tx_control
			rx_control               => CONNECTED_TO_rx_control,               --               rx_control.rx_control
			reset                    => CONNECTED_TO_reset,                    --                      rst.reset
			clock                    => CONNECTED_TO_clock,                    --                      clk.clk
			tx_ready                 => CONNECTED_TO_tx_ready,                 --                 tx_ready.tx_ready
			rx_ready                 => CONNECTED_TO_rx_ready,                 --                 rx_ready.rx_ready
			rx_irq                   => CONNECTED_TO_rx_irq,                   --                   irq_rx.irq
			tx_enh_data_valid        => CONNECTED_TO_tx_enh_data_valid,        --        tx_enh_data_valid.tx_enh_data_valid
			tx_irq                   => CONNECTED_TO_tx_irq,                   --                   irq_tx.irq
			tx_coreclkin             => CONNECTED_TO_tx_coreclkin,             --             tx_coreclkin.clk
			rx_coreclkin             => CONNECTED_TO_rx_coreclkin,             --             rx_coreclkin.clk
			rx_enh_fifo_rd_en        => CONNECTED_TO_rx_enh_fifo_rd_en,        --        rx_enh_fifo_rd_en.rx_enh_fifo_rd_en
			tx_err_ins               => CONNECTED_TO_tx_err_ins,               --               tx_err_ins.tx_err_ins
			reset_phy                => CONNECTED_TO_reset_phy,                --                reset_phy.reset
			pll_locked_out           => CONNECTED_TO_pll_locked_out,           --           pll_locked_out.pll_locked
			pll_powerdown_input      => CONNECTED_TO_pll_powerdown_input,      --      pll_powerdown_input.pll_powerdown
			atx_pll_powerdown        => CONNECTED_TO_atx_pll_powerdown,        --        atx_pll_powerdown.pll_powerdown
			atx_pll_locked           => CONNECTED_TO_atx_pll_locked,           --           atx_pll_locked.pll_locked
			rx_set_locktodata        => CONNECTED_TO_rx_set_locktodata,        --        rx_set_locktodata.rx_set_locktodata
			rx_set_locktoref         => CONNECTED_TO_rx_set_locktoref,         --         rx_set_locktoref.rx_set_locktoref
			tx_enh_frame_burst_en    => CONNECTED_TO_tx_enh_frame_burst_en,    --    tx_enh_frame_burst_en.tx_enh_frame_burst_en
			tx_enh_frame_diag_status => CONNECTED_TO_tx_enh_frame_diag_status, -- tx_enh_frame_diag_status.tx_enh_frame_diag_status
			unused_tx_control        => CONNECTED_TO_unused_tx_control,        --        unused_tx_control.unused_tx_control
			unused_tx_parallel_data  => CONNECTED_TO_unused_tx_parallel_data,  --  unused_tx_parallel_data.unused_tx_parallel_data
			rx_seriallpbken          => CONNECTED_TO_rx_seriallpbken,          --          rx_seriallpbken.rx_seriallpbken
			pll_select               => CONNECTED_TO_pll_select,               --               pll_select.pll_select
			rx_enh_frame_diag_status => CONNECTED_TO_rx_enh_frame_diag_status  -- rx_enh_frame_diag_status.rx_enh_frame_diag_status
		);

