	component mcu_subsystem is
		port (
			tx_fifo_bypass_bypass         : in    std_logic                     := 'X';             -- bypass
			tx_ref_clk_clk                : in    std_logic                     := 'X';             -- clk
			tx_serial_data_tx_serial_data : out   std_logic_vector(3 downto 0);                     -- tx_serial_data
			tx_sysref_export              : in    std_logic                     := 'X';             -- export
			tx_sync_export                : in    std_logic                     := 'X';             -- export
			rx_ref_clk_clk                : in    std_logic                     := 'X';             -- clk
			rx_serial_data_rx_serial_data : in    std_logic_vector(3 downto 0)  := (others => 'X'); -- rx_serial_data
			rx_sysref_export              : in    std_logic                     := 'X';             -- export
			rx_sync_export                : out   std_logic_vector(0 downto 0);                     -- export
			clk100_clk                    : in    std_logic                     := 'X';             -- clk
			clk_clk                       : in    std_logic                     := 'X';             -- clk
			dbg_reset_reset               : out   std_logic;                                        -- reset
			fmc_gpio_in_port              : in    std_logic_vector(31 downto 0) := (others => 'X'); -- in_port
			fmc_gpio_out_port             : out   std_logic_vector(31 downto 0);                    -- out_port
			i2c_sda_in                    : in    std_logic                     := 'X';             -- sda_in
			i2c_scl_in                    : in    std_logic                     := 'X';             -- scl_in
			i2c_sda_oe                    : out   std_logic;                                        -- sda_oe
			i2c_scl_oe                    : out   std_logic;                                        -- scl_oe
			spi_MISO                      : in    std_logic                     := 'X';             -- MISO
			spi_MOSI                      : out   std_logic;                                        -- MOSI
			spi_SCLK                      : out   std_logic;                                        -- SCLK
			spi_SS_n                      : out   std_logic_vector(7 downto 0);                     -- SS_n
			iopll_0_locked_export         : out   std_logic;                                        -- export
			qspi_dclk                     : out   std_logic;                                        -- dclk
			qspi_ncs                      : out   std_logic;                                        -- ncs
			qspi_data                     : inout std_logic_vector(3 downto 0)  := (others => 'X'); -- data
			refclk_emif_clk               : in    std_logic                     := 'X';             -- clk
			reset_reset_n                 : in    std_logic                     := 'X';             -- reset_n
			oct_oct_rzqin                 : in    std_logic                     := 'X';             -- oct_rzqin
			mem_mem_ck                    : out   std_logic_vector(0 downto 0);                     -- mem_ck
			mem_mem_ck_n                  : out   std_logic_vector(0 downto 0);                     -- mem_ck_n
			mem_mem_a                     : out   std_logic_vector(15 downto 0);                    -- mem_a
			mem_mem_ba                    : out   std_logic_vector(2 downto 0);                     -- mem_ba
			mem_mem_cke                   : out   std_logic_vector(0 downto 0);                     -- mem_cke
			mem_mem_cs_n                  : out   std_logic_vector(0 downto 0);                     -- mem_cs_n
			mem_mem_odt                   : out   std_logic_vector(0 downto 0);                     -- mem_odt
			mem_mem_reset_n               : out   std_logic_vector(0 downto 0);                     -- mem_reset_n
			mem_mem_we_n                  : out   std_logic_vector(0 downto 0);                     -- mem_we_n
			mem_mem_ras_n                 : out   std_logic_vector(0 downto 0);                     -- mem_ras_n
			mem_mem_cas_n                 : out   std_logic_vector(0 downto 0);                     -- mem_cas_n
			mem_mem_dqs                   : inout std_logic_vector(3 downto 0)  := (others => 'X'); -- mem_dqs
			mem_mem_dqs_n                 : inout std_logic_vector(3 downto 0)  := (others => 'X'); -- mem_dqs_n
			mem_mem_dq                    : inout std_logic_vector(31 downto 0) := (others => 'X'); -- mem_dq
			mem_mem_dm                    : out   std_logic_vector(3 downto 0);                     -- mem_dm
			status_local_cal_success      : out   std_logic;                                        -- local_cal_success
			status_local_cal_fail         : out   std_logic;                                        -- local_cal_fail
			tx_0_tx_serial_data           : out   std_logic_vector(0 downto 0);                     -- tx_serial_data
			rx_0_rx_serial_data           : in    std_logic_vector(0 downto 0)  := (others => 'X'); -- rx_serial_data
			tx_1_tx_serial_data           : out   std_logic_vector(0 downto 0);                     -- tx_serial_data
			rx_1_rx_serial_data           : in    std_logic_vector(0 downto 0)  := (others => 'X')  -- rx_serial_data
		);
	end component mcu_subsystem;

	u0 : component mcu_subsystem
		port map (
			tx_fifo_bypass_bypass         => CONNECTED_TO_tx_fifo_bypass_bypass,         -- tx_fifo_bypass.bypass
			tx_ref_clk_clk                => CONNECTED_TO_tx_ref_clk_clk,                --     tx_ref_clk.clk
			tx_serial_data_tx_serial_data => CONNECTED_TO_tx_serial_data_tx_serial_data, -- tx_serial_data.tx_serial_data
			tx_sysref_export              => CONNECTED_TO_tx_sysref_export,              --      tx_sysref.export
			tx_sync_export                => CONNECTED_TO_tx_sync_export,                --        tx_sync.export
			rx_ref_clk_clk                => CONNECTED_TO_rx_ref_clk_clk,                --     rx_ref_clk.clk
			rx_serial_data_rx_serial_data => CONNECTED_TO_rx_serial_data_rx_serial_data, -- rx_serial_data.rx_serial_data
			rx_sysref_export              => CONNECTED_TO_rx_sysref_export,              --      rx_sysref.export
			rx_sync_export                => CONNECTED_TO_rx_sync_export,                --        rx_sync.export
			clk100_clk                    => CONNECTED_TO_clk100_clk,                    --         clk100.clk
			clk_clk                       => CONNECTED_TO_clk_clk,                       --            clk.clk
			dbg_reset_reset               => CONNECTED_TO_dbg_reset_reset,               --      dbg_reset.reset
			fmc_gpio_in_port              => CONNECTED_TO_fmc_gpio_in_port,              --       fmc_gpio.in_port
			fmc_gpio_out_port             => CONNECTED_TO_fmc_gpio_out_port,             --               .out_port
			i2c_sda_in                    => CONNECTED_TO_i2c_sda_in,                    --            i2c.sda_in
			i2c_scl_in                    => CONNECTED_TO_i2c_scl_in,                    --               .scl_in
			i2c_sda_oe                    => CONNECTED_TO_i2c_sda_oe,                    --               .sda_oe
			i2c_scl_oe                    => CONNECTED_TO_i2c_scl_oe,                    --               .scl_oe
			spi_MISO                      => CONNECTED_TO_spi_MISO,                      --            spi.MISO
			spi_MOSI                      => CONNECTED_TO_spi_MOSI,                      --               .MOSI
			spi_SCLK                      => CONNECTED_TO_spi_SCLK,                      --               .SCLK
			spi_SS_n                      => CONNECTED_TO_spi_SS_n,                      --               .SS_n
			iopll_0_locked_export         => CONNECTED_TO_iopll_0_locked_export,         -- iopll_0_locked.export
			qspi_dclk                     => CONNECTED_TO_qspi_dclk,                     --           qspi.dclk
			qspi_ncs                      => CONNECTED_TO_qspi_ncs,                      --               .ncs
			qspi_data                     => CONNECTED_TO_qspi_data,                     --               .data
			refclk_emif_clk               => CONNECTED_TO_refclk_emif_clk,               --    refclk_emif.clk
			reset_reset_n                 => CONNECTED_TO_reset_reset_n,                 --          reset.reset_n
			oct_oct_rzqin                 => CONNECTED_TO_oct_oct_rzqin,                 --            oct.oct_rzqin
			mem_mem_ck                    => CONNECTED_TO_mem_mem_ck,                    --            mem.mem_ck
			mem_mem_ck_n                  => CONNECTED_TO_mem_mem_ck_n,                  --               .mem_ck_n
			mem_mem_a                     => CONNECTED_TO_mem_mem_a,                     --               .mem_a
			mem_mem_ba                    => CONNECTED_TO_mem_mem_ba,                    --               .mem_ba
			mem_mem_cke                   => CONNECTED_TO_mem_mem_cke,                   --               .mem_cke
			mem_mem_cs_n                  => CONNECTED_TO_mem_mem_cs_n,                  --               .mem_cs_n
			mem_mem_odt                   => CONNECTED_TO_mem_mem_odt,                   --               .mem_odt
			mem_mem_reset_n               => CONNECTED_TO_mem_mem_reset_n,               --               .mem_reset_n
			mem_mem_we_n                  => CONNECTED_TO_mem_mem_we_n,                  --               .mem_we_n
			mem_mem_ras_n                 => CONNECTED_TO_mem_mem_ras_n,                 --               .mem_ras_n
			mem_mem_cas_n                 => CONNECTED_TO_mem_mem_cas_n,                 --               .mem_cas_n
			mem_mem_dqs                   => CONNECTED_TO_mem_mem_dqs,                   --               .mem_dqs
			mem_mem_dqs_n                 => CONNECTED_TO_mem_mem_dqs_n,                 --               .mem_dqs_n
			mem_mem_dq                    => CONNECTED_TO_mem_mem_dq,                    --               .mem_dq
			mem_mem_dm                    => CONNECTED_TO_mem_mem_dm,                    --               .mem_dm
			status_local_cal_success      => CONNECTED_TO_status_local_cal_success,      --         status.local_cal_success
			status_local_cal_fail         => CONNECTED_TO_status_local_cal_fail,         --               .local_cal_fail
			tx_0_tx_serial_data           => CONNECTED_TO_tx_0_tx_serial_data,           --           tx_0.tx_serial_data
			rx_0_rx_serial_data           => CONNECTED_TO_rx_0_rx_serial_data,           --           rx_0.rx_serial_data
			tx_1_tx_serial_data           => CONNECTED_TO_tx_1_tx_serial_data,           --           tx_1.tx_serial_data
			rx_1_rx_serial_data           => CONNECTED_TO_rx_1_rx_serial_data            --           rx_1.rx_serial_data
		);

