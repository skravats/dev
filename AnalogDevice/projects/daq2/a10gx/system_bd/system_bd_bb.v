
module system_bd (
	rx_ref_clk_clk,
	rx_serial_data_rx_serial_data,
	rx_sync_export,
	rx_sysref_export,
	sys_clk_clk,
	sys_ddr3_cntrl_mem_mem_ck,
	sys_ddr3_cntrl_mem_mem_ck_n,
	sys_ddr3_cntrl_mem_mem_a,
	sys_ddr3_cntrl_mem_mem_ba,
	sys_ddr3_cntrl_mem_mem_cke,
	sys_ddr3_cntrl_mem_mem_cs_n,
	sys_ddr3_cntrl_mem_mem_odt,
	sys_ddr3_cntrl_mem_mem_reset_n,
	sys_ddr3_cntrl_mem_mem_we_n,
	sys_ddr3_cntrl_mem_mem_ras_n,
	sys_ddr3_cntrl_mem_mem_cas_n,
	sys_ddr3_cntrl_mem_mem_dqs,
	sys_ddr3_cntrl_mem_mem_dqs_n,
	sys_ddr3_cntrl_mem_mem_dq,
	sys_ddr3_cntrl_mem_mem_dm,
	sys_ddr3_cntrl_oct_oct_rzqin,
	sys_ddr3_cntrl_pll_ref_clk_clk,
	sys_ethernet_mdio_mdc,
	sys_ethernet_mdio_mdio_in,
	sys_ethernet_mdio_mdio_out,
	sys_ethernet_mdio_mdio_oen,
	sys_ethernet_ref_clk_clk,
	sys_ethernet_reset_reset,
	sys_ethernet_sgmii_rxp_0,
	sys_ethernet_sgmii_txp_0,
	sys_flash_tcm_address_out,
	sys_flash_tcm_read_n_out,
	sys_flash_tcm_write_n_out,
	sys_flash_tcm_data_out,
	sys_flash_tcm_chipselect_n_out,
	sys_gpio_bd_in_port,
	sys_gpio_bd_out_port,
	sys_gpio_in_export,
	sys_gpio_out_export,
	sys_rst_reset_n,
	sys_spi_MISO,
	sys_spi_MOSI,
	sys_spi_SCLK,
	sys_spi_SS_n,
	tx_fifo_bypass_bypass,
	tx_ref_clk_clk,
	tx_serial_data_tx_serial_data,
	tx_sync_export,
	tx_sysref_export);	

	input		rx_ref_clk_clk;
	input	[3:0]	rx_serial_data_rx_serial_data;
	output	[0:0]	rx_sync_export;
	input		rx_sysref_export;
	input		sys_clk_clk;
	output	[0:0]	sys_ddr3_cntrl_mem_mem_ck;
	output	[0:0]	sys_ddr3_cntrl_mem_mem_ck_n;
	output	[11:0]	sys_ddr3_cntrl_mem_mem_a;
	output	[2:0]	sys_ddr3_cntrl_mem_mem_ba;
	output	[0:0]	sys_ddr3_cntrl_mem_mem_cke;
	output	[0:0]	sys_ddr3_cntrl_mem_mem_cs_n;
	output	[0:0]	sys_ddr3_cntrl_mem_mem_odt;
	output	[0:0]	sys_ddr3_cntrl_mem_mem_reset_n;
	output	[0:0]	sys_ddr3_cntrl_mem_mem_we_n;
	output	[0:0]	sys_ddr3_cntrl_mem_mem_ras_n;
	output	[0:0]	sys_ddr3_cntrl_mem_mem_cas_n;
	inout	[7:0]	sys_ddr3_cntrl_mem_mem_dqs;
	inout	[7:0]	sys_ddr3_cntrl_mem_mem_dqs_n;
	inout	[63:0]	sys_ddr3_cntrl_mem_mem_dq;
	output	[7:0]	sys_ddr3_cntrl_mem_mem_dm;
	input		sys_ddr3_cntrl_oct_oct_rzqin;
	input		sys_ddr3_cntrl_pll_ref_clk_clk;
	output		sys_ethernet_mdio_mdc;
	input		sys_ethernet_mdio_mdio_in;
	output		sys_ethernet_mdio_mdio_out;
	output		sys_ethernet_mdio_mdio_oen;
	input		sys_ethernet_ref_clk_clk;
	output		sys_ethernet_reset_reset;
	input		sys_ethernet_sgmii_rxp_0;
	output		sys_ethernet_sgmii_txp_0;
	output	[23:0]	sys_flash_tcm_address_out;
	output	[0:0]	sys_flash_tcm_read_n_out;
	output	[0:0]	sys_flash_tcm_write_n_out;
	inout	[31:0]	sys_flash_tcm_data_out;
	output	[0:0]	sys_flash_tcm_chipselect_n_out;
	input	[31:0]	sys_gpio_bd_in_port;
	output	[31:0]	sys_gpio_bd_out_port;
	input	[31:0]	sys_gpio_in_export;
	output	[31:0]	sys_gpio_out_export;
	input		sys_rst_reset_n;
	input		sys_spi_MISO;
	output		sys_spi_MOSI;
	output		sys_spi_SCLK;
	output	[7:0]	sys_spi_SS_n;
	input		tx_fifo_bypass_bypass;
	input		tx_ref_clk_clk;
	output	[3:0]	tx_serial_data_tx_serial_data;
	input		tx_sync_export;
	input		tx_sysref_export;
endmodule
