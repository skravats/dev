config system_bd_adi_jesd204_10_ihqiogy_cfg;
		design system_bd_adi_jesd204_10_ihqiogy;
		instance system_bd_adi_jesd204_10_ihqiogy.link_pll use system_bd_altera_xcvr_fpll_a10_181.altera_xcvr_fpll_a10;
		instance system_bd_adi_jesd204_10_ihqiogy.axi_xcvr use system_bd_axi_adxcvr_10.axi_adxcvr;
		instance system_bd_adi_jesd204_10_ihqiogy.link_pll_reset_control use system_bd_altera_xcvr_reset_control_181.altera_xcvr_reset_control;
		instance system_bd_adi_jesd204_10_ihqiogy.phy_reset_control use system_bd_altera_xcvr_reset_control_181.altera_xcvr_reset_control;
		instance system_bd_adi_jesd204_10_ihqiogy.phy use system_bd_jesd204_phy_10.system_bd_jesd204_phy_10_2atbkja;
		instance system_bd_adi_jesd204_10_ihqiogy.axi_jesd204_rx use system_bd_axi_jesd204_rx_10.axi_jesd204_rx;
		instance system_bd_adi_jesd204_10_ihqiogy.jesd204_rx use system_bd_jesd204_rx_10.jesd204_rx;
		instance system_bd_adi_jesd204_10_ihqiogy.rst_controller use system_bd_altera_reset_controller_181.altera_reset_controller;
		instance system_bd_adi_jesd204_10_ihqiogy.rst_controller_001 use system_bd_altera_reset_controller_181.altera_reset_controller;
		instance system_bd_adi_jesd204_10_ihqiogy.rst_controller_002 use system_bd_altera_reset_controller_181.altera_reset_controller;
endconfig

