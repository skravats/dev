config system_bd_cfg;
		design system_bd;
		instance system_bd.ad9144_jesd204 use system_bd_adi_jesd204_10.system_bd_adi_jesd204_10_z5wjnwa;
		instance system_bd.ad9680_adcfifo use system_bd_util_adcfifo_10.util_adcfifo;
		instance system_bd.ad9680_jesd204 use system_bd_adi_jesd204_10.system_bd_adi_jesd204_10_ihqiogy;
		instance system_bd.avl_ad9144_fifo use system_bd_avl_dacfifo_10.avl_dacfifo;
		instance system_bd.avl_adxcfg_0 use system_bd_avl_adxcfg_10.avl_adxcfg;
		instance system_bd.avl_adxcfg_1 use system_bd_avl_adxcfg_10.avl_adxcfg;
		instance system_bd.avl_adxcfg_2 use system_bd_avl_adxcfg_10.avl_adxcfg;
		instance system_bd.avl_adxcfg_3 use system_bd_avl_adxcfg_10.avl_adxcfg;
		instance system_bd.axi_ad9144_core use system_bd_axi_ad9144_10.axi_ad9144;
		instance system_bd.axi_ad9144_dma use system_bd_axi_dmac_10.axi_dmac;
		instance system_bd.axi_ad9680_core use system_bd_axi_ad9680_10.axi_ad9680;
		instance system_bd.axi_ad9680_dma use system_bd_axi_dmac_10.axi_dmac;
		instance system_bd.sys_ddr4_cntrl use system_bd_altera_emif_181.system_bd_altera_emif_181_i6g4tza;
		instance system_bd.sys_gpio_bd use system_bd_altera_avalon_pio_181.system_bd_altera_avalon_pio_181_sesqgfy;
		instance system_bd.sys_gpio_in use system_bd_altera_avalon_pio_181.system_bd_altera_avalon_pio_181_wvvmw7a;
		instance system_bd.sys_gpio_out use system_bd_altera_avalon_pio_181.system_bd_altera_avalon_pio_181_o6mwuyy;
		instance system_bd.sys_hps use system_bd_altera_arria10_hps_181.system_bd_altera_arria10_hps_181_o76rqqy;
		instance system_bd.sys_hps_ddr4_cntrl use system_bd_altera_emif_a10_hps_181.system_bd_altera_emif_a10_hps_181_fyxkrly;
		instance system_bd.sys_spi use system_bd_altera_avalon_spi_181.system_bd_altera_avalon_spi_181_gh3z34i;
		instance system_bd.util_ad9144_upack use system_bd_util_upack_10.util_upack;
		instance system_bd.util_ad9680_cpack use system_bd_util_cpack_10.util_cpack;
		instance system_bd.mm_interconnect_1 use system_bd_altera_mm_interconnect_181.system_bd_altera_mm_interconnect_181_lokqtjy;
		instance system_bd.mm_interconnect_2 use system_bd_altera_mm_interconnect_181.system_bd_altera_mm_interconnect_181_zikmthi;
		instance system_bd.irq_mapper use system_bd_altera_irq_mapper_181.system_bd_altera_irq_mapper_181_2ftwj2y;
		instance system_bd.irq_mapper_001 use system_bd_altera_irq_mapper_181.system_bd_altera_irq_mapper_181_acw3b6a;
		instance system_bd.avalon_st_adapter use system_bd_altera_avalon_st_adapter_181.system_bd_altera_avalon_st_adapter_181_33ynmea;
		instance system_bd.rst_controller use system_bd_altera_reset_controller_181.altera_reset_controller;
		instance system_bd.rst_controller_001 use system_bd_altera_reset_controller_181.altera_reset_controller;
		instance system_bd.rst_controller_002 use system_bd_altera_reset_controller_181.altera_reset_controller;
		instance system_bd.rst_controller_003 use system_bd_altera_reset_controller_181.altera_reset_controller;
		instance system_bd.rst_controller_004 use system_bd_altera_reset_controller_181.altera_reset_controller;
		instance system_bd.rst_controller_005 use system_bd_altera_reset_controller_181.altera_reset_controller;
endconfig

