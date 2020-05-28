	component mcu_subsystem is
		port (
			tx_fifo_bypass_bypass         : in    std_logic                     := 'X';             -- bypass
			tx_pll_select_pll_select      : in    std_logic_vector(0 downto 0)  := (others => 'X'); -- pll_select
			tx_ref_clk_clk                : in    std_logic                     := 'X';             -- clk
			tx_serial_data_tx_serial_data : out   std_logic_vector(3 downto 0);                     -- tx_serial_data
			tx_sync_export                : in    std_logic                     := 'X';             -- export
			tx_sysref_export              : in    std_logic                     := 'X';             -- export
			rx_ref_clk_clk                : in    std_logic                     := 'X';             -- clk
			rx_serial_data_rx_serial_data : in    std_logic_vector(3 downto 0)  := (others => 'X'); -- rx_serial_data
			rx_sync_export                : out   std_logic_vector(0 downto 0);                     -- export
			rx_sysref_export              : in    std_logic                     := 'X';             -- export
			clk_clk                       : in    std_logic                     := 'X';             -- clk
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
			gpio_bus_in_port              : in    std_logic_vector(31 downto 0) := (others => 'X'); -- in_port
			gpio_bus_out_port             : out   std_logic_vector(31 downto 0);                    -- out_port
			i2c_serial_sda_in             : in    std_logic                     := 'X';             -- sda_in
			i2c_serial_scl_in             : in    std_logic                     := 'X';             -- scl_in
			i2c_serial_sda_oe             : out   std_logic;                                        -- sda_oe
			i2c_serial_scl_oe             : out   std_logic;                                        -- scl_oe
			iopll_0_locked_export         : out   std_logic;                                        -- export
			qspi_dclk                     : out   std_logic;                                        -- dclk
			qspi_ncs                      : out   std_logic;                                        -- ncs
			qspi_data                     : inout std_logic_vector(3 downto 0)  := (others => 'X'); -- data
			refclk_emif_clk               : in    std_logic                     := 'X';             -- clk
			reset_reset_n                 : in    std_logic                     := 'X';             -- reset_n
			spi_serial_MISO               : in    std_logic                     := 'X';             -- MISO
			spi_serial_MOSI               : out   std_logic;                                        -- MOSI
			spi_serial_SCLK               : out   std_logic;                                        -- SCLK
			spi_serial_SS_n               : out   std_logic_vector(7 downto 0);                     -- SS_n
			tx_clock_clk                  : in    std_logic                     := 'X';             -- clk
			misc_xon_gen                  : in    std_logic                     := 'X';             -- xon_gen
			misc_xoff_gen                 : in    std_logic                     := 'X';             -- xoff_gen
			misc_magic_wakeup             : out   std_logic;                                        -- magic_wakeup
			misc_magic_sleep_n            : in    std_logic                     := 'X';             -- magic_sleep_n
			misc_ff_tx_crc_fwd            : in    std_logic                     := 'X';             -- ff_tx_crc_fwd
			misc_ff_tx_septy              : out   std_logic;                                        -- ff_tx_septy
			misc_tx_ff_uflow              : out   std_logic;                                        -- tx_ff_uflow
			misc_ff_tx_a_full             : out   std_logic;                                        -- ff_tx_a_full
			misc_ff_tx_a_empty            : out   std_logic;                                        -- ff_tx_a_empty
			misc_rx_err_stat              : out   std_logic_vector(17 downto 0);                    -- rx_err_stat
			misc_rx_frm_type              : out   std_logic_vector(3 downto 0);                     -- rx_frm_type
			misc_ff_rx_dsav               : out   std_logic;                                        -- ff_rx_dsav
			misc_ff_rx_a_full             : out   std_logic;                                        -- ff_rx_a_full
			misc_ff_rx_a_empty            : out   std_logic;                                        -- ff_rx_a_empty
			mdio_mdc                      : out   std_logic;                                        -- mdc
			mdio_mdio_in                  : in    std_logic                     := 'X';             -- mdio_in
			mdio_mdio_out                 : out   std_logic;                                        -- mdio_out
			mdio_mdio_oen                 : out   std_logic;                                        -- mdio_oen
			gmii_gmii_rx_d                : in    std_logic_vector(7 downto 0)  := (others => 'X'); -- gmii_rx_d
			gmii_gmii_rx_dv               : in    std_logic                     := 'X';             -- gmii_rx_dv
			gmii_gmii_rx_err              : in    std_logic                     := 'X';             -- gmii_rx_err
			gmii_gmii_tx_d                : out   std_logic_vector(7 downto 0);                     -- gmii_tx_d
			gmii_gmii_tx_en               : out   std_logic;                                        -- gmii_tx_en
			gmii_gmii_tx_err              : out   std_logic;                                        -- gmii_tx_err
			mii_mii_rx_d                  : in    std_logic_vector(3 downto 0)  := (others => 'X'); -- mii_rx_d
			mii_mii_rx_dv                 : in    std_logic                     := 'X';             -- mii_rx_dv
			mii_mii_rx_err                : in    std_logic                     := 'X';             -- mii_rx_err
			mii_mii_tx_d                  : out   std_logic_vector(3 downto 0);                     -- mii_tx_d
			mii_mii_tx_en                 : out   std_logic;                                        -- mii_tx_en
			mii_mii_tx_err                : out   std_logic;                                        -- mii_tx_err
			status_1_set_10               : in    std_logic                     := 'X';             -- set_10
			status_1_set_1000             : in    std_logic                     := 'X';             -- set_1000
			status_1_eth_mode             : out   std_logic;                                        -- eth_mode
			status_1_ena_10               : out   std_logic;                                        -- ena_10
			rx_clock_clk                  : in    std_logic                     := 'X'              -- clk
		);
	end component mcu_subsystem;

	u0 : component mcu_subsystem
		port map (
			tx_fifo_bypass_bypass         => CONNECTED_TO_tx_fifo_bypass_bypass,         -- tx_fifo_bypass.bypass
			tx_pll_select_pll_select      => CONNECTED_TO_tx_pll_select_pll_select,      --  tx_pll_select.pll_select
			tx_ref_clk_clk                => CONNECTED_TO_tx_ref_clk_clk,                --     tx_ref_clk.clk
			tx_serial_data_tx_serial_data => CONNECTED_TO_tx_serial_data_tx_serial_data, -- tx_serial_data.tx_serial_data
			tx_sync_export                => CONNECTED_TO_tx_sync_export,                --        tx_sync.export
			tx_sysref_export              => CONNECTED_TO_tx_sysref_export,              --      tx_sysref.export
			rx_ref_clk_clk                => CONNECTED_TO_rx_ref_clk_clk,                --     rx_ref_clk.clk
			rx_serial_data_rx_serial_data => CONNECTED_TO_rx_serial_data_rx_serial_data, -- rx_serial_data.rx_serial_data
			rx_sync_export                => CONNECTED_TO_rx_sync_export,                --        rx_sync.export
			rx_sysref_export              => CONNECTED_TO_rx_sysref_export,              --      rx_sysref.export
			clk_clk                       => CONNECTED_TO_clk_clk,                       --            clk.clk
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
			gpio_bus_in_port              => CONNECTED_TO_gpio_bus_in_port,              --       gpio_bus.in_port
			gpio_bus_out_port             => CONNECTED_TO_gpio_bus_out_port,             --               .out_port
			i2c_serial_sda_in             => CONNECTED_TO_i2c_serial_sda_in,             --     i2c_serial.sda_in
			i2c_serial_scl_in             => CONNECTED_TO_i2c_serial_scl_in,             --               .scl_in
			i2c_serial_sda_oe             => CONNECTED_TO_i2c_serial_sda_oe,             --               .sda_oe
			i2c_serial_scl_oe             => CONNECTED_TO_i2c_serial_scl_oe,             --               .scl_oe
			iopll_0_locked_export         => CONNECTED_TO_iopll_0_locked_export,         -- iopll_0_locked.export
			qspi_dclk                     => CONNECTED_TO_qspi_dclk,                     --           qspi.dclk
			qspi_ncs                      => CONNECTED_TO_qspi_ncs,                      --               .ncs
			qspi_data                     => CONNECTED_TO_qspi_data,                     --               .data
			refclk_emif_clk               => CONNECTED_TO_refclk_emif_clk,               --    refclk_emif.clk
			reset_reset_n                 => CONNECTED_TO_reset_reset_n,                 --          reset.reset_n
			spi_serial_MISO               => CONNECTED_TO_spi_serial_MISO,               --     spi_serial.MISO
			spi_serial_MOSI               => CONNECTED_TO_spi_serial_MOSI,               --               .MOSI
			spi_serial_SCLK               => CONNECTED_TO_spi_serial_SCLK,               --               .SCLK
			spi_serial_SS_n               => CONNECTED_TO_spi_serial_SS_n,               --               .SS_n
			tx_clock_clk                  => CONNECTED_TO_tx_clock_clk,                  --       tx_clock.clk
			misc_xon_gen                  => CONNECTED_TO_misc_xon_gen,                  --           misc.xon_gen
			misc_xoff_gen                 => CONNECTED_TO_misc_xoff_gen,                 --               .xoff_gen
			misc_magic_wakeup             => CONNECTED_TO_misc_magic_wakeup,             --               .magic_wakeup
			misc_magic_sleep_n            => CONNECTED_TO_misc_magic_sleep_n,            --               .magic_sleep_n
			misc_ff_tx_crc_fwd            => CONNECTED_TO_misc_ff_tx_crc_fwd,            --               .ff_tx_crc_fwd
			misc_ff_tx_septy              => CONNECTED_TO_misc_ff_tx_septy,              --               .ff_tx_septy
			misc_tx_ff_uflow              => CONNECTED_TO_misc_tx_ff_uflow,              --               .tx_ff_uflow
			misc_ff_tx_a_full             => CONNECTED_TO_misc_ff_tx_a_full,             --               .ff_tx_a_full
			misc_ff_tx_a_empty            => CONNECTED_TO_misc_ff_tx_a_empty,            --               .ff_tx_a_empty
			misc_rx_err_stat              => CONNECTED_TO_misc_rx_err_stat,              --               .rx_err_stat
			misc_rx_frm_type              => CONNECTED_TO_misc_rx_frm_type,              --               .rx_frm_type
			misc_ff_rx_dsav               => CONNECTED_TO_misc_ff_rx_dsav,               --               .ff_rx_dsav
			misc_ff_rx_a_full             => CONNECTED_TO_misc_ff_rx_a_full,             --               .ff_rx_a_full
			misc_ff_rx_a_empty            => CONNECTED_TO_misc_ff_rx_a_empty,            --               .ff_rx_a_empty
			mdio_mdc                      => CONNECTED_TO_mdio_mdc,                      --           mdio.mdc
			mdio_mdio_in                  => CONNECTED_TO_mdio_mdio_in,                  --               .mdio_in
			mdio_mdio_out                 => CONNECTED_TO_mdio_mdio_out,                 --               .mdio_out
			mdio_mdio_oen                 => CONNECTED_TO_mdio_mdio_oen,                 --               .mdio_oen
			gmii_gmii_rx_d                => CONNECTED_TO_gmii_gmii_rx_d,                --           gmii.gmii_rx_d
			gmii_gmii_rx_dv               => CONNECTED_TO_gmii_gmii_rx_dv,               --               .gmii_rx_dv
			gmii_gmii_rx_err              => CONNECTED_TO_gmii_gmii_rx_err,              --               .gmii_rx_err
			gmii_gmii_tx_d                => CONNECTED_TO_gmii_gmii_tx_d,                --               .gmii_tx_d
			gmii_gmii_tx_en               => CONNECTED_TO_gmii_gmii_tx_en,               --               .gmii_tx_en
			gmii_gmii_tx_err              => CONNECTED_TO_gmii_gmii_tx_err,              --               .gmii_tx_err
			mii_mii_rx_d                  => CONNECTED_TO_mii_mii_rx_d,                  --            mii.mii_rx_d
			mii_mii_rx_dv                 => CONNECTED_TO_mii_mii_rx_dv,                 --               .mii_rx_dv
			mii_mii_rx_err                => CONNECTED_TO_mii_mii_rx_err,                --               .mii_rx_err
			mii_mii_tx_d                  => CONNECTED_TO_mii_mii_tx_d,                  --               .mii_tx_d
			mii_mii_tx_en                 => CONNECTED_TO_mii_mii_tx_en,                 --               .mii_tx_en
			mii_mii_tx_err                => CONNECTED_TO_mii_mii_tx_err,                --               .mii_tx_err
			status_1_set_10               => CONNECTED_TO_status_1_set_10,               --       status_1.set_10
			status_1_set_1000             => CONNECTED_TO_status_1_set_1000,             --               .set_1000
			status_1_eth_mode             => CONNECTED_TO_status_1_eth_mode,             --               .eth_mode
			status_1_ena_10               => CONNECTED_TO_status_1_ena_10,               --               .ena_10
			rx_clock_clk                  => CONNECTED_TO_rx_clock_clk                   --       rx_clock.clk
		);

