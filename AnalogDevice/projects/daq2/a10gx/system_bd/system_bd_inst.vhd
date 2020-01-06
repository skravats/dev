	component system_bd is
		port (
			rx_ref_clk_clk                 : in    std_logic                     := 'X';             -- clk
			rx_serial_data_rx_serial_data  : in    std_logic_vector(3 downto 0)  := (others => 'X'); -- rx_serial_data
			rx_sync_export                 : out   std_logic_vector(0 downto 0);                     -- export
			rx_sysref_export               : in    std_logic                     := 'X';             -- export
			sys_clk_clk                    : in    std_logic                     := 'X';             -- clk
			sys_ddr3_cntrl_mem_mem_ck      : out   std_logic_vector(0 downto 0);                     -- mem_ck
			sys_ddr3_cntrl_mem_mem_ck_n    : out   std_logic_vector(0 downto 0);                     -- mem_ck_n
			sys_ddr3_cntrl_mem_mem_a       : out   std_logic_vector(11 downto 0);                    -- mem_a
			sys_ddr3_cntrl_mem_mem_ba      : out   std_logic_vector(2 downto 0);                     -- mem_ba
			sys_ddr3_cntrl_mem_mem_cke     : out   std_logic_vector(0 downto 0);                     -- mem_cke
			sys_ddr3_cntrl_mem_mem_cs_n    : out   std_logic_vector(0 downto 0);                     -- mem_cs_n
			sys_ddr3_cntrl_mem_mem_odt     : out   std_logic_vector(0 downto 0);                     -- mem_odt
			sys_ddr3_cntrl_mem_mem_reset_n : out   std_logic_vector(0 downto 0);                     -- mem_reset_n
			sys_ddr3_cntrl_mem_mem_we_n    : out   std_logic_vector(0 downto 0);                     -- mem_we_n
			sys_ddr3_cntrl_mem_mem_ras_n   : out   std_logic_vector(0 downto 0);                     -- mem_ras_n
			sys_ddr3_cntrl_mem_mem_cas_n   : out   std_logic_vector(0 downto 0);                     -- mem_cas_n
			sys_ddr3_cntrl_mem_mem_dqs     : inout std_logic_vector(7 downto 0)  := (others => 'X'); -- mem_dqs
			sys_ddr3_cntrl_mem_mem_dqs_n   : inout std_logic_vector(7 downto 0)  := (others => 'X'); -- mem_dqs_n
			sys_ddr3_cntrl_mem_mem_dq      : inout std_logic_vector(63 downto 0) := (others => 'X'); -- mem_dq
			sys_ddr3_cntrl_mem_mem_dm      : out   std_logic_vector(7 downto 0);                     -- mem_dm
			sys_ddr3_cntrl_oct_oct_rzqin   : in    std_logic                     := 'X';             -- oct_rzqin
			sys_ddr3_cntrl_pll_ref_clk_clk : in    std_logic                     := 'X';             -- clk
			sys_ethernet_mdio_mdc          : out   std_logic;                                        -- mdc
			sys_ethernet_mdio_mdio_in      : in    std_logic                     := 'X';             -- mdio_in
			sys_ethernet_mdio_mdio_out     : out   std_logic;                                        -- mdio_out
			sys_ethernet_mdio_mdio_oen     : out   std_logic;                                        -- mdio_oen
			sys_ethernet_ref_clk_clk       : in    std_logic                     := 'X';             -- clk
			sys_ethernet_reset_reset       : out   std_logic;                                        -- reset
			sys_ethernet_sgmii_rxp_0       : in    std_logic                     := 'X';             -- rxp_0
			sys_ethernet_sgmii_txp_0       : out   std_logic;                                        -- txp_0
			sys_flash_tcm_address_out      : out   std_logic_vector(23 downto 0);                    -- tcm_address_out
			sys_flash_tcm_read_n_out       : out   std_logic_vector(0 downto 0);                     -- tcm_read_n_out
			sys_flash_tcm_write_n_out      : out   std_logic_vector(0 downto 0);                     -- tcm_write_n_out
			sys_flash_tcm_data_out         : inout std_logic_vector(31 downto 0) := (others => 'X'); -- tcm_data_out
			sys_flash_tcm_chipselect_n_out : out   std_logic_vector(0 downto 0);                     -- tcm_chipselect_n_out
			sys_gpio_bd_in_port            : in    std_logic_vector(31 downto 0) := (others => 'X'); -- in_port
			sys_gpio_bd_out_port           : out   std_logic_vector(31 downto 0);                    -- out_port
			sys_gpio_in_export             : in    std_logic_vector(31 downto 0) := (others => 'X'); -- export
			sys_gpio_out_export            : out   std_logic_vector(31 downto 0);                    -- export
			sys_rst_reset_n                : in    std_logic                     := 'X';             -- reset_n
			sys_spi_MISO                   : in    std_logic                     := 'X';             -- MISO
			sys_spi_MOSI                   : out   std_logic;                                        -- MOSI
			sys_spi_SCLK                   : out   std_logic;                                        -- SCLK
			sys_spi_SS_n                   : out   std_logic_vector(7 downto 0);                     -- SS_n
			tx_fifo_bypass_bypass          : in    std_logic                     := 'X';             -- bypass
			tx_ref_clk_clk                 : in    std_logic                     := 'X';             -- clk
			tx_serial_data_tx_serial_data  : out   std_logic_vector(3 downto 0);                     -- tx_serial_data
			tx_sync_export                 : in    std_logic                     := 'X';             -- export
			tx_sysref_export               : in    std_logic                     := 'X'              -- export
		);
	end component system_bd;

	u0 : component system_bd
		port map (
			rx_ref_clk_clk                 => CONNECTED_TO_rx_ref_clk_clk,                 --                 rx_ref_clk.clk
			rx_serial_data_rx_serial_data  => CONNECTED_TO_rx_serial_data_rx_serial_data,  --             rx_serial_data.rx_serial_data
			rx_sync_export                 => CONNECTED_TO_rx_sync_export,                 --                    rx_sync.export
			rx_sysref_export               => CONNECTED_TO_rx_sysref_export,               --                  rx_sysref.export
			sys_clk_clk                    => CONNECTED_TO_sys_clk_clk,                    --                    sys_clk.clk
			sys_ddr3_cntrl_mem_mem_ck      => CONNECTED_TO_sys_ddr3_cntrl_mem_mem_ck,      --         sys_ddr3_cntrl_mem.mem_ck
			sys_ddr3_cntrl_mem_mem_ck_n    => CONNECTED_TO_sys_ddr3_cntrl_mem_mem_ck_n,    --                           .mem_ck_n
			sys_ddr3_cntrl_mem_mem_a       => CONNECTED_TO_sys_ddr3_cntrl_mem_mem_a,       --                           .mem_a
			sys_ddr3_cntrl_mem_mem_ba      => CONNECTED_TO_sys_ddr3_cntrl_mem_mem_ba,      --                           .mem_ba
			sys_ddr3_cntrl_mem_mem_cke     => CONNECTED_TO_sys_ddr3_cntrl_mem_mem_cke,     --                           .mem_cke
			sys_ddr3_cntrl_mem_mem_cs_n    => CONNECTED_TO_sys_ddr3_cntrl_mem_mem_cs_n,    --                           .mem_cs_n
			sys_ddr3_cntrl_mem_mem_odt     => CONNECTED_TO_sys_ddr3_cntrl_mem_mem_odt,     --                           .mem_odt
			sys_ddr3_cntrl_mem_mem_reset_n => CONNECTED_TO_sys_ddr3_cntrl_mem_mem_reset_n, --                           .mem_reset_n
			sys_ddr3_cntrl_mem_mem_we_n    => CONNECTED_TO_sys_ddr3_cntrl_mem_mem_we_n,    --                           .mem_we_n
			sys_ddr3_cntrl_mem_mem_ras_n   => CONNECTED_TO_sys_ddr3_cntrl_mem_mem_ras_n,   --                           .mem_ras_n
			sys_ddr3_cntrl_mem_mem_cas_n   => CONNECTED_TO_sys_ddr3_cntrl_mem_mem_cas_n,   --                           .mem_cas_n
			sys_ddr3_cntrl_mem_mem_dqs     => CONNECTED_TO_sys_ddr3_cntrl_mem_mem_dqs,     --                           .mem_dqs
			sys_ddr3_cntrl_mem_mem_dqs_n   => CONNECTED_TO_sys_ddr3_cntrl_mem_mem_dqs_n,   --                           .mem_dqs_n
			sys_ddr3_cntrl_mem_mem_dq      => CONNECTED_TO_sys_ddr3_cntrl_mem_mem_dq,      --                           .mem_dq
			sys_ddr3_cntrl_mem_mem_dm      => CONNECTED_TO_sys_ddr3_cntrl_mem_mem_dm,      --                           .mem_dm
			sys_ddr3_cntrl_oct_oct_rzqin   => CONNECTED_TO_sys_ddr3_cntrl_oct_oct_rzqin,   --         sys_ddr3_cntrl_oct.oct_rzqin
			sys_ddr3_cntrl_pll_ref_clk_clk => CONNECTED_TO_sys_ddr3_cntrl_pll_ref_clk_clk, -- sys_ddr3_cntrl_pll_ref_clk.clk
			sys_ethernet_mdio_mdc          => CONNECTED_TO_sys_ethernet_mdio_mdc,          --          sys_ethernet_mdio.mdc
			sys_ethernet_mdio_mdio_in      => CONNECTED_TO_sys_ethernet_mdio_mdio_in,      --                           .mdio_in
			sys_ethernet_mdio_mdio_out     => CONNECTED_TO_sys_ethernet_mdio_mdio_out,     --                           .mdio_out
			sys_ethernet_mdio_mdio_oen     => CONNECTED_TO_sys_ethernet_mdio_mdio_oen,     --                           .mdio_oen
			sys_ethernet_ref_clk_clk       => CONNECTED_TO_sys_ethernet_ref_clk_clk,       --       sys_ethernet_ref_clk.clk
			sys_ethernet_reset_reset       => CONNECTED_TO_sys_ethernet_reset_reset,       --         sys_ethernet_reset.reset
			sys_ethernet_sgmii_rxp_0       => CONNECTED_TO_sys_ethernet_sgmii_rxp_0,       --         sys_ethernet_sgmii.rxp_0
			sys_ethernet_sgmii_txp_0       => CONNECTED_TO_sys_ethernet_sgmii_txp_0,       --                           .txp_0
			sys_flash_tcm_address_out      => CONNECTED_TO_sys_flash_tcm_address_out,      --                  sys_flash.tcm_address_out
			sys_flash_tcm_read_n_out       => CONNECTED_TO_sys_flash_tcm_read_n_out,       --                           .tcm_read_n_out
			sys_flash_tcm_write_n_out      => CONNECTED_TO_sys_flash_tcm_write_n_out,      --                           .tcm_write_n_out
			sys_flash_tcm_data_out         => CONNECTED_TO_sys_flash_tcm_data_out,         --                           .tcm_data_out
			sys_flash_tcm_chipselect_n_out => CONNECTED_TO_sys_flash_tcm_chipselect_n_out, --                           .tcm_chipselect_n_out
			sys_gpio_bd_in_port            => CONNECTED_TO_sys_gpio_bd_in_port,            --                sys_gpio_bd.in_port
			sys_gpio_bd_out_port           => CONNECTED_TO_sys_gpio_bd_out_port,           --                           .out_port
			sys_gpio_in_export             => CONNECTED_TO_sys_gpio_in_export,             --                sys_gpio_in.export
			sys_gpio_out_export            => CONNECTED_TO_sys_gpio_out_export,            --               sys_gpio_out.export
			sys_rst_reset_n                => CONNECTED_TO_sys_rst_reset_n,                --                    sys_rst.reset_n
			sys_spi_MISO                   => CONNECTED_TO_sys_spi_MISO,                   --                    sys_spi.MISO
			sys_spi_MOSI                   => CONNECTED_TO_sys_spi_MOSI,                   --                           .MOSI
			sys_spi_SCLK                   => CONNECTED_TO_sys_spi_SCLK,                   --                           .SCLK
			sys_spi_SS_n                   => CONNECTED_TO_sys_spi_SS_n,                   --                           .SS_n
			tx_fifo_bypass_bypass          => CONNECTED_TO_tx_fifo_bypass_bypass,          --             tx_fifo_bypass.bypass
			tx_ref_clk_clk                 => CONNECTED_TO_tx_ref_clk_clk,                 --                 tx_ref_clk.clk
			tx_serial_data_tx_serial_data  => CONNECTED_TO_tx_serial_data_tx_serial_data,  --             tx_serial_data.tx_serial_data
			tx_sync_export                 => CONNECTED_TO_tx_sync_export,                 --                    tx_sync.export
			tx_sysref_export               => CONNECTED_TO_tx_sysref_export                --                  tx_sysref.export
		);

