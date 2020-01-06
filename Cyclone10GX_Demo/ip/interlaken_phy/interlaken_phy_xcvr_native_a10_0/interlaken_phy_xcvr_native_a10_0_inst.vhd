	component interlaken_phy_xcvr_native_a10_0 is
		port (
			tx_analogreset           : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- tx_analogreset
			tx_digitalreset          : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- tx_digitalreset
			rx_analogreset           : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- rx_analogreset
			rx_digitalreset          : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- rx_digitalreset
			tx_cal_busy              : out std_logic_vector(0 downto 0);                     -- tx_cal_busy
			rx_cal_busy              : out std_logic_vector(0 downto 0);                     -- rx_cal_busy
			tx_serial_clk0           : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- clk
			rx_cdr_refclk0           : in  std_logic                     := 'X';             -- clk
			tx_serial_data           : out std_logic_vector(0 downto 0);                     -- tx_serial_data
			rx_serial_data           : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- rx_serial_data
			rx_seriallpbken          : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- rx_seriallpbken
			rx_set_locktodata        : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- rx_set_locktodata
			rx_set_locktoref         : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- rx_set_locktoref
			rx_is_lockedtoref        : out std_logic_vector(0 downto 0);                     -- rx_is_lockedtoref
			rx_is_lockedtodata       : out std_logic_vector(0 downto 0);                     -- rx_is_lockedtodata
			tx_coreclkin             : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- clk
			rx_coreclkin             : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- clk
			tx_clkout                : out std_logic_vector(0 downto 0);                     -- clk
			rx_clkout                : out std_logic_vector(0 downto 0);                     -- clk
			tx_parallel_data         : in  std_logic_vector(63 downto 0) := (others => 'X'); -- tx_parallel_data
			tx_control               : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- tx_control
			tx_err_ins               : in  std_logic                     := 'X';             -- tx_err_ins
			unused_tx_parallel_data  : in  std_logic_vector(63 downto 0) := (others => 'X'); -- unused_tx_parallel_data
			unused_tx_control        : in  std_logic_vector(13 downto 0) := (others => 'X'); -- unused_tx_control
			rx_parallel_data         : out std_logic_vector(63 downto 0);                    -- rx_parallel_data
			rx_control               : out std_logic_vector(9 downto 0);                     -- rx_control
			unused_rx_parallel_data  : out std_logic_vector(63 downto 0);                    -- unused_rx_parallel_data
			unused_rx_control        : out std_logic_vector(9 downto 0);                     -- unused_rx_control
			tx_enh_data_valid        : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- tx_enh_data_valid
			tx_enh_fifo_full         : out std_logic_vector(0 downto 0);                     -- tx_enh_fifo_full
			tx_enh_fifo_pfull        : out std_logic_vector(0 downto 0);                     -- tx_enh_fifo_pfull
			tx_enh_fifo_empty        : out std_logic_vector(0 downto 0);                     -- tx_enh_fifo_empty
			tx_enh_fifo_pempty       : out std_logic_vector(0 downto 0);                     -- tx_enh_fifo_pempty
			rx_enh_fifo_rd_en        : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- rx_enh_fifo_rd_en
			rx_enh_fifo_full         : out std_logic_vector(0 downto 0);                     -- rx_enh_fifo_full
			rx_enh_fifo_pfull        : out std_logic_vector(0 downto 0);                     -- rx_enh_fifo_pfull
			rx_enh_fifo_empty        : out std_logic_vector(0 downto 0);                     -- rx_enh_fifo_empty
			rx_enh_fifo_pempty       : out std_logic_vector(0 downto 0);                     -- rx_enh_fifo_pempty
			tx_enh_frame_burst_en    : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- tx_enh_frame_burst_en
			tx_enh_frame_diag_status : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- tx_enh_frame_diag_status
			rx_enh_frame_diag_status : out std_logic_vector(1 downto 0)                      -- rx_enh_frame_diag_status
		);
	end component interlaken_phy_xcvr_native_a10_0;

	u0 : component interlaken_phy_xcvr_native_a10_0
		port map (
			tx_analogreset           => CONNECTED_TO_tx_analogreset,           --           tx_analogreset.tx_analogreset
			tx_digitalreset          => CONNECTED_TO_tx_digitalreset,          --          tx_digitalreset.tx_digitalreset
			rx_analogreset           => CONNECTED_TO_rx_analogreset,           --           rx_analogreset.rx_analogreset
			rx_digitalreset          => CONNECTED_TO_rx_digitalreset,          --          rx_digitalreset.rx_digitalreset
			tx_cal_busy              => CONNECTED_TO_tx_cal_busy,              --              tx_cal_busy.tx_cal_busy
			rx_cal_busy              => CONNECTED_TO_rx_cal_busy,              --              rx_cal_busy.rx_cal_busy
			tx_serial_clk0           => CONNECTED_TO_tx_serial_clk0,           --           tx_serial_clk0.clk
			rx_cdr_refclk0           => CONNECTED_TO_rx_cdr_refclk0,           --           rx_cdr_refclk0.clk
			tx_serial_data           => CONNECTED_TO_tx_serial_data,           --           tx_serial_data.tx_serial_data
			rx_serial_data           => CONNECTED_TO_rx_serial_data,           --           rx_serial_data.rx_serial_data
			rx_seriallpbken          => CONNECTED_TO_rx_seriallpbken,          --          rx_seriallpbken.rx_seriallpbken
			rx_set_locktodata        => CONNECTED_TO_rx_set_locktodata,        --        rx_set_locktodata.rx_set_locktodata
			rx_set_locktoref         => CONNECTED_TO_rx_set_locktoref,         --         rx_set_locktoref.rx_set_locktoref
			rx_is_lockedtoref        => CONNECTED_TO_rx_is_lockedtoref,        --        rx_is_lockedtoref.rx_is_lockedtoref
			rx_is_lockedtodata       => CONNECTED_TO_rx_is_lockedtodata,       --       rx_is_lockedtodata.rx_is_lockedtodata
			tx_coreclkin             => CONNECTED_TO_tx_coreclkin,             --             tx_coreclkin.clk
			rx_coreclkin             => CONNECTED_TO_rx_coreclkin,             --             rx_coreclkin.clk
			tx_clkout                => CONNECTED_TO_tx_clkout,                --                tx_clkout.clk
			rx_clkout                => CONNECTED_TO_rx_clkout,                --                rx_clkout.clk
			tx_parallel_data         => CONNECTED_TO_tx_parallel_data,         --         tx_parallel_data.tx_parallel_data
			tx_control               => CONNECTED_TO_tx_control,               --               tx_control.tx_control
			tx_err_ins               => CONNECTED_TO_tx_err_ins,               --               tx_err_ins.tx_err_ins
			unused_tx_parallel_data  => CONNECTED_TO_unused_tx_parallel_data,  --  unused_tx_parallel_data.unused_tx_parallel_data
			unused_tx_control        => CONNECTED_TO_unused_tx_control,        --        unused_tx_control.unused_tx_control
			rx_parallel_data         => CONNECTED_TO_rx_parallel_data,         --         rx_parallel_data.rx_parallel_data
			rx_control               => CONNECTED_TO_rx_control,               --               rx_control.rx_control
			unused_rx_parallel_data  => CONNECTED_TO_unused_rx_parallel_data,  --  unused_rx_parallel_data.unused_rx_parallel_data
			unused_rx_control        => CONNECTED_TO_unused_rx_control,        --        unused_rx_control.unused_rx_control
			tx_enh_data_valid        => CONNECTED_TO_tx_enh_data_valid,        --        tx_enh_data_valid.tx_enh_data_valid
			tx_enh_fifo_full         => CONNECTED_TO_tx_enh_fifo_full,         --         tx_enh_fifo_full.tx_enh_fifo_full
			tx_enh_fifo_pfull        => CONNECTED_TO_tx_enh_fifo_pfull,        --        tx_enh_fifo_pfull.tx_enh_fifo_pfull
			tx_enh_fifo_empty        => CONNECTED_TO_tx_enh_fifo_empty,        --        tx_enh_fifo_empty.tx_enh_fifo_empty
			tx_enh_fifo_pempty       => CONNECTED_TO_tx_enh_fifo_pempty,       --       tx_enh_fifo_pempty.tx_enh_fifo_pempty
			rx_enh_fifo_rd_en        => CONNECTED_TO_rx_enh_fifo_rd_en,        --        rx_enh_fifo_rd_en.rx_enh_fifo_rd_en
			rx_enh_fifo_full         => CONNECTED_TO_rx_enh_fifo_full,         --         rx_enh_fifo_full.rx_enh_fifo_full
			rx_enh_fifo_pfull        => CONNECTED_TO_rx_enh_fifo_pfull,        --        rx_enh_fifo_pfull.rx_enh_fifo_pfull
			rx_enh_fifo_empty        => CONNECTED_TO_rx_enh_fifo_empty,        --        rx_enh_fifo_empty.rx_enh_fifo_empty
			rx_enh_fifo_pempty       => CONNECTED_TO_rx_enh_fifo_pempty,       --       rx_enh_fifo_pempty.rx_enh_fifo_pempty
			tx_enh_frame_burst_en    => CONNECTED_TO_tx_enh_frame_burst_en,    --          tx_enh_burst_en.tx_enh_frame_burst_en
			tx_enh_frame_diag_status => CONNECTED_TO_tx_enh_frame_diag_status, -- tx_enh_frame_diag_status.tx_enh_frame_diag_status
			rx_enh_frame_diag_status => CONNECTED_TO_rx_enh_frame_diag_status  -- rx_enh_frame_diag_status.rx_enh_frame_diag_status
		);

