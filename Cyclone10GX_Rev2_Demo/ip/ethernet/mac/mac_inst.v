	mac u0 (
		.clk           (_connected_to_clk_),           //   input,   width = 1, control_port_clock_connection.clk
		.reset         (_connected_to_reset_),         //   input,   width = 1,              reset_connection.reset
		.reg_addr      (_connected_to_reg_addr_),      //   input,   width = 8,                  control_port.address
		.reg_data_out  (_connected_to_reg_data_out_),  //  output,  width = 32,                              .readdata
		.reg_rd        (_connected_to_reg_rd_),        //   input,   width = 1,                              .read
		.reg_data_in   (_connected_to_reg_data_in_),   //   input,  width = 32,                              .writedata
		.reg_wr        (_connected_to_reg_wr_),        //   input,   width = 1,                              .write
		.reg_busy      (_connected_to_reg_busy_),      //  output,   width = 1,                              .waitrequest
		.ff_tx_clk     (_connected_to_ff_tx_clk_),     //   input,   width = 1,     transmit_clock_connection.clk
		.ff_rx_clk     (_connected_to_ff_rx_clk_),     //   input,   width = 1,      receive_clock_connection.clk
		.ff_rx_data    (_connected_to_ff_rx_data_),    //  output,  width = 32,                       receive.data
		.ff_rx_eop     (_connected_to_ff_rx_eop_),     //  output,   width = 1,                              .endofpacket
		.rx_err        (_connected_to_rx_err_),        //  output,   width = 6,                              .error
		.ff_rx_mod     (_connected_to_ff_rx_mod_),     //  output,   width = 2,                              .empty
		.ff_rx_rdy     (_connected_to_ff_rx_rdy_),     //   input,   width = 1,                              .ready
		.ff_rx_sop     (_connected_to_ff_rx_sop_),     //  output,   width = 1,                              .startofpacket
		.ff_rx_dval    (_connected_to_ff_rx_dval_),    //  output,   width = 1,                              .valid
		.ff_tx_data    (_connected_to_ff_tx_data_),    //   input,  width = 32,                      transmit.data
		.ff_tx_eop     (_connected_to_ff_tx_eop_),     //   input,   width = 1,                              .endofpacket
		.ff_tx_err     (_connected_to_ff_tx_err_),     //   input,   width = 1,                              .error
		.ff_tx_mod     (_connected_to_ff_tx_mod_),     //   input,   width = 2,                              .empty
		.ff_tx_rdy     (_connected_to_ff_tx_rdy_),     //  output,   width = 1,                              .ready
		.ff_tx_sop     (_connected_to_ff_tx_sop_),     //   input,   width = 1,                              .startofpacket
		.ff_tx_wren    (_connected_to_ff_tx_wren_),    //   input,   width = 1,                              .valid
		.xon_gen       (_connected_to_xon_gen_),       //   input,   width = 1,           mac_misc_connection.xon_gen
		.xoff_gen      (_connected_to_xoff_gen_),      //   input,   width = 1,                              .xoff_gen
		.magic_wakeup  (_connected_to_magic_wakeup_),  //  output,   width = 1,                              .magic_wakeup
		.magic_sleep_n (_connected_to_magic_sleep_n_), //   input,   width = 1,                              .magic_sleep_n
		.ff_tx_crc_fwd (_connected_to_ff_tx_crc_fwd_), //   input,   width = 1,                              .ff_tx_crc_fwd
		.ff_tx_septy   (_connected_to_ff_tx_septy_),   //  output,   width = 1,                              .ff_tx_septy
		.tx_ff_uflow   (_connected_to_tx_ff_uflow_),   //  output,   width = 1,                              .tx_ff_uflow
		.ff_tx_a_full  (_connected_to_ff_tx_a_full_),  //  output,   width = 1,                              .ff_tx_a_full
		.ff_tx_a_empty (_connected_to_ff_tx_a_empty_), //  output,   width = 1,                              .ff_tx_a_empty
		.rx_err_stat   (_connected_to_rx_err_stat_),   //  output,  width = 18,                              .rx_err_stat
		.rx_frm_type   (_connected_to_rx_frm_type_),   //  output,   width = 4,                              .rx_frm_type
		.ff_rx_dsav    (_connected_to_ff_rx_dsav_),    //  output,   width = 1,                              .ff_rx_dsav
		.ff_rx_a_full  (_connected_to_ff_rx_a_full_),  //  output,   width = 1,                              .ff_rx_a_full
		.ff_rx_a_empty (_connected_to_ff_rx_a_empty_), //  output,   width = 1,                              .ff_rx_a_empty
		.mdc           (_connected_to_mdc_),           //  output,   width = 1,           mac_mdio_connection.mdc
		.mdio_in       (_connected_to_mdio_in_),       //   input,   width = 1,                              .mdio_in
		.mdio_out      (_connected_to_mdio_out_),      //  output,   width = 1,                              .mdio_out
		.mdio_oen      (_connected_to_mdio_oen_),      //  output,   width = 1,                              .mdio_oen
		.gm_rx_d       (_connected_to_gm_rx_d_),       //   input,   width = 8,           mac_gmii_connection.gmii_rx_d
		.gm_rx_dv      (_connected_to_gm_rx_dv_),      //   input,   width = 1,                              .gmii_rx_dv
		.gm_rx_err     (_connected_to_gm_rx_err_),     //   input,   width = 1,                              .gmii_rx_err
		.gm_tx_d       (_connected_to_gm_tx_d_),       //  output,   width = 8,                              .gmii_tx_d
		.gm_tx_en      (_connected_to_gm_tx_en_),      //  output,   width = 1,                              .gmii_tx_en
		.gm_tx_err     (_connected_to_gm_tx_err_),     //  output,   width = 1,                              .gmii_tx_err
		.m_rx_d        (_connected_to_m_rx_d_),        //   input,   width = 4,            mac_mii_connection.mii_rx_d
		.m_rx_en       (_connected_to_m_rx_en_),       //   input,   width = 1,                              .mii_rx_dv
		.m_rx_err      (_connected_to_m_rx_err_),      //   input,   width = 1,                              .mii_rx_err
		.m_tx_d        (_connected_to_m_tx_d_),        //  output,   width = 4,                              .mii_tx_d
		.m_tx_en       (_connected_to_m_tx_en_),       //  output,   width = 1,                              .mii_tx_en
		.m_tx_err      (_connected_to_m_tx_err_),      //  output,   width = 1,                              .mii_tx_err
		.set_10        (_connected_to_set_10_),        //   input,   width = 1,         mac_status_connection.set_10
		.set_1000      (_connected_to_set_1000_),      //   input,   width = 1,                              .set_1000
		.eth_mode      (_connected_to_eth_mode_),      //  output,   width = 1,                              .eth_mode
		.ena_10        (_connected_to_ena_10_),        //  output,   width = 1,                              .ena_10
		.tx_clk        (_connected_to_tx_clk_),        //   input,   width = 1,   pcs_mac_tx_clock_connection.clk
		.rx_clk        (_connected_to_rx_clk_)         //   input,   width = 1,   pcs_mac_rx_clock_connection.clk
	);

