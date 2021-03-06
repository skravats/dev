	mcu_subsystem u0 (
		.tx_fifo_bypass_bypass         (_connected_to_tx_fifo_bypass_bypass_),         //   input,   width = 1, tx_fifo_bypass.bypass
		.tx_pll_select_pll_select      (_connected_to_tx_pll_select_pll_select_),      //   input,   width = 1,  tx_pll_select.pll_select
		.tx_ref_clk_clk                (_connected_to_tx_ref_clk_clk_),                //   input,   width = 1,     tx_ref_clk.clk
		.tx_serial_data_tx_serial_data (_connected_to_tx_serial_data_tx_serial_data_), //  output,   width = 4, tx_serial_data.tx_serial_data
		.tx_sync_export                (_connected_to_tx_sync_export_),                //   input,   width = 1,        tx_sync.export
		.tx_sysref_export              (_connected_to_tx_sysref_export_),              //   input,   width = 1,      tx_sysref.export
		.rx_ref_clk_clk                (_connected_to_rx_ref_clk_clk_),                //   input,   width = 1,     rx_ref_clk.clk
		.rx_serial_data_rx_serial_data (_connected_to_rx_serial_data_rx_serial_data_), //   input,   width = 4, rx_serial_data.rx_serial_data
		.rx_sync_export                (_connected_to_rx_sync_export_),                //  output,   width = 1,        rx_sync.export
		.rx_sysref_export              (_connected_to_rx_sysref_export_),              //   input,   width = 1,      rx_sysref.export
		.clk_clk                       (_connected_to_clk_clk_),                       //   input,   width = 1,            clk.clk
		.oct_oct_rzqin                 (_connected_to_oct_oct_rzqin_),                 //   input,   width = 1,            oct.oct_rzqin
		.mem_mem_ck                    (_connected_to_mem_mem_ck_),                    //  output,   width = 1,            mem.mem_ck
		.mem_mem_ck_n                  (_connected_to_mem_mem_ck_n_),                  //  output,   width = 1,               .mem_ck_n
		.mem_mem_a                     (_connected_to_mem_mem_a_),                     //  output,  width = 16,               .mem_a
		.mem_mem_ba                    (_connected_to_mem_mem_ba_),                    //  output,   width = 3,               .mem_ba
		.mem_mem_cke                   (_connected_to_mem_mem_cke_),                   //  output,   width = 1,               .mem_cke
		.mem_mem_cs_n                  (_connected_to_mem_mem_cs_n_),                  //  output,   width = 1,               .mem_cs_n
		.mem_mem_odt                   (_connected_to_mem_mem_odt_),                   //  output,   width = 1,               .mem_odt
		.mem_mem_reset_n               (_connected_to_mem_mem_reset_n_),               //  output,   width = 1,               .mem_reset_n
		.mem_mem_we_n                  (_connected_to_mem_mem_we_n_),                  //  output,   width = 1,               .mem_we_n
		.mem_mem_ras_n                 (_connected_to_mem_mem_ras_n_),                 //  output,   width = 1,               .mem_ras_n
		.mem_mem_cas_n                 (_connected_to_mem_mem_cas_n_),                 //  output,   width = 1,               .mem_cas_n
		.mem_mem_dqs                   (_connected_to_mem_mem_dqs_),                   //   inout,   width = 4,               .mem_dqs
		.mem_mem_dqs_n                 (_connected_to_mem_mem_dqs_n_),                 //   inout,   width = 4,               .mem_dqs_n
		.mem_mem_dq                    (_connected_to_mem_mem_dq_),                    //   inout,  width = 32,               .mem_dq
		.mem_mem_dm                    (_connected_to_mem_mem_dm_),                    //  output,   width = 4,               .mem_dm
		.status_local_cal_success      (_connected_to_status_local_cal_success_),      //  output,   width = 1,         status.local_cal_success
		.status_local_cal_fail         (_connected_to_status_local_cal_fail_),         //  output,   width = 1,               .local_cal_fail
		.tx_clock_clk                  (_connected_to_tx_clock_clk_),                  //   input,   width = 1,       tx_clock.clk
		.misc_xon_gen                  (_connected_to_misc_xon_gen_),                  //   input,   width = 1,           misc.xon_gen
		.misc_xoff_gen                 (_connected_to_misc_xoff_gen_),                 //   input,   width = 1,               .xoff_gen
		.misc_magic_wakeup             (_connected_to_misc_magic_wakeup_),             //  output,   width = 1,               .magic_wakeup
		.misc_magic_sleep_n            (_connected_to_misc_magic_sleep_n_),            //   input,   width = 1,               .magic_sleep_n
		.misc_ff_tx_crc_fwd            (_connected_to_misc_ff_tx_crc_fwd_),            //   input,   width = 1,               .ff_tx_crc_fwd
		.misc_ff_tx_septy              (_connected_to_misc_ff_tx_septy_),              //  output,   width = 1,               .ff_tx_septy
		.misc_tx_ff_uflow              (_connected_to_misc_tx_ff_uflow_),              //  output,   width = 1,               .tx_ff_uflow
		.misc_ff_tx_a_full             (_connected_to_misc_ff_tx_a_full_),             //  output,   width = 1,               .ff_tx_a_full
		.misc_ff_tx_a_empty            (_connected_to_misc_ff_tx_a_empty_),            //  output,   width = 1,               .ff_tx_a_empty
		.misc_rx_err_stat              (_connected_to_misc_rx_err_stat_),              //  output,  width = 18,               .rx_err_stat
		.misc_rx_frm_type              (_connected_to_misc_rx_frm_type_),              //  output,   width = 4,               .rx_frm_type
		.misc_ff_rx_dsav               (_connected_to_misc_ff_rx_dsav_),               //  output,   width = 1,               .ff_rx_dsav
		.misc_ff_rx_a_full             (_connected_to_misc_ff_rx_a_full_),             //  output,   width = 1,               .ff_rx_a_full
		.misc_ff_rx_a_empty            (_connected_to_misc_ff_rx_a_empty_),            //  output,   width = 1,               .ff_rx_a_empty
		.mdio_mdc                      (_connected_to_mdio_mdc_),                      //  output,   width = 1,           mdio.mdc
		.mdio_mdio_in                  (_connected_to_mdio_mdio_in_),                  //   input,   width = 1,               .mdio_in
		.mdio_mdio_out                 (_connected_to_mdio_mdio_out_),                 //  output,   width = 1,               .mdio_out
		.mdio_mdio_oen                 (_connected_to_mdio_mdio_oen_),                 //  output,   width = 1,               .mdio_oen
		.gmii_gmii_rx_d                (_connected_to_gmii_gmii_rx_d_),                //   input,   width = 8,           gmii.gmii_rx_d
		.gmii_gmii_rx_dv               (_connected_to_gmii_gmii_rx_dv_),               //   input,   width = 1,               .gmii_rx_dv
		.gmii_gmii_rx_err              (_connected_to_gmii_gmii_rx_err_),              //   input,   width = 1,               .gmii_rx_err
		.gmii_gmii_tx_d                (_connected_to_gmii_gmii_tx_d_),                //  output,   width = 8,               .gmii_tx_d
		.gmii_gmii_tx_en               (_connected_to_gmii_gmii_tx_en_),               //  output,   width = 1,               .gmii_tx_en
		.gmii_gmii_tx_err              (_connected_to_gmii_gmii_tx_err_),              //  output,   width = 1,               .gmii_tx_err
		.mii_mii_rx_d                  (_connected_to_mii_mii_rx_d_),                  //   input,   width = 4,            mii.mii_rx_d
		.mii_mii_rx_dv                 (_connected_to_mii_mii_rx_dv_),                 //   input,   width = 1,               .mii_rx_dv
		.mii_mii_rx_err                (_connected_to_mii_mii_rx_err_),                //   input,   width = 1,               .mii_rx_err
		.mii_mii_tx_d                  (_connected_to_mii_mii_tx_d_),                  //  output,   width = 4,               .mii_tx_d
		.mii_mii_tx_en                 (_connected_to_mii_mii_tx_en_),                 //  output,   width = 1,               .mii_tx_en
		.mii_mii_tx_err                (_connected_to_mii_mii_tx_err_),                //  output,   width = 1,               .mii_tx_err
		.status_1_set_10               (_connected_to_status_1_set_10_),               //   input,   width = 1,       status_1.set_10
		.status_1_set_1000             (_connected_to_status_1_set_1000_),             //   input,   width = 1,               .set_1000
		.status_1_eth_mode             (_connected_to_status_1_eth_mode_),             //  output,   width = 1,               .eth_mode
		.status_1_ena_10               (_connected_to_status_1_ena_10_),               //  output,   width = 1,               .ena_10
		.rx_clock_clk                  (_connected_to_rx_clock_clk_),                  //   input,   width = 1,       rx_clock.clk
		.gpio_bus_in_port              (_connected_to_gpio_bus_in_port_),              //   input,  width = 32,       gpio_bus.in_port
		.gpio_bus_out_port             (_connected_to_gpio_bus_out_port_),             //  output,  width = 32,               .out_port
		.i2c_serial_sda_in             (_connected_to_i2c_serial_sda_in_),             //   input,   width = 1,     i2c_serial.sda_in
		.i2c_serial_scl_in             (_connected_to_i2c_serial_scl_in_),             //   input,   width = 1,               .scl_in
		.i2c_serial_sda_oe             (_connected_to_i2c_serial_sda_oe_),             //  output,   width = 1,               .sda_oe
		.i2c_serial_scl_oe             (_connected_to_i2c_serial_scl_oe_),             //  output,   width = 1,               .scl_oe
		.iopll_0_locked_export         (_connected_to_iopll_0_locked_export_),         //  output,   width = 1, iopll_0_locked.export
		.qspi_dclk                     (_connected_to_qspi_dclk_),                     //  output,   width = 1,           qspi.dclk
		.qspi_ncs                      (_connected_to_qspi_ncs_),                      //  output,   width = 1,               .ncs
		.qspi_data                     (_connected_to_qspi_data_),                     //   inout,   width = 4,               .data
		.refclk_emif_clk               (_connected_to_refclk_emif_clk_),               //   input,   width = 1,    refclk_emif.clk
		.reset_reset_n                 (_connected_to_reset_reset_n_),                 //   input,   width = 1,          reset.reset_n
		.spi_serial_MISO               (_connected_to_spi_serial_MISO_),               //   input,   width = 1,     spi_serial.MISO
		.spi_serial_MOSI               (_connected_to_spi_serial_MOSI_),               //  output,   width = 1,               .MOSI
		.spi_serial_SCLK               (_connected_to_spi_serial_SCLK_),               //  output,   width = 1,               .SCLK
		.spi_serial_SS_n               (_connected_to_spi_serial_SS_n_)                //  output,   width = 8,               .SS_n
	);

