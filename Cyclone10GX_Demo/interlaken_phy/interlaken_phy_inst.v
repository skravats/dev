	interlaken_phy u0 (
		.clk125_clk                           (_connected_to_clk125_clk_),                           //   input,   width = 1,                   clk125.clk
		.phy_data_ctrl_csr_s0_address         (_connected_to_phy_data_ctrl_csr_s0_address_),         //   input,   width = 8,     phy_data_ctrl_csr_s0.address
		.phy_data_ctrl_csr_s0_read            (_connected_to_phy_data_ctrl_csr_s0_read_),            //   input,   width = 1,                         .read
		.phy_data_ctrl_csr_s0_readdata        (_connected_to_phy_data_ctrl_csr_s0_readdata_),        //  output,  width = 32,                         .readdata
		.phy_data_ctrl_csr_s0_readdatavalid   (_connected_to_phy_data_ctrl_csr_s0_readdatavalid_),   //  output,   width = 1,                         .readdatavalid
		.phy_data_ctrl_csr_s0_write           (_connected_to_phy_data_ctrl_csr_s0_write_),           //   input,   width = 1,                         .write
		.phy_data_ctrl_csr_s0_writedata       (_connected_to_phy_data_ctrl_csr_s0_writedata_),       //   input,  width = 32,                         .writedata
		.phy_data_ctrl_csr_s0_waitrequest     (_connected_to_phy_data_ctrl_csr_s0_waitrequest_),     //  output,   width = 1,                         .waitrequest
		.phy_data_ctrl_m0_address             (_connected_to_phy_data_ctrl_m0_address_),             //  output,  width = 32,         phy_data_ctrl_m0.address
		.phy_data_ctrl_m0_read                (_connected_to_phy_data_ctrl_m0_read_),                //  output,   width = 1,                         .read
		.phy_data_ctrl_m0_waitrequest         (_connected_to_phy_data_ctrl_m0_waitrequest_),         //   input,   width = 1,                         .waitrequest
		.phy_data_ctrl_m0_readdata            (_connected_to_phy_data_ctrl_m0_readdata_),            //   input,  width = 32,                         .readdata
		.phy_data_ctrl_m0_readdatavalid       (_connected_to_phy_data_ctrl_m0_readdatavalid_),       //   input,   width = 1,                         .readdatavalid
		.phy_data_ctrl_m0_write               (_connected_to_phy_data_ctrl_m0_write_),               //  output,   width = 1,                         .write
		.phy_data_ctrl_m0_writedata           (_connected_to_phy_data_ctrl_m0_writedata_),           //  output,  width = 32,                         .writedata
		.phy_data_irq_rx_irq                  (_connected_to_phy_data_irq_rx_irq_),                  //  output,   width = 1,          phy_data_irq_rx.irq
		.phy_data_irq_tx_irq                  (_connected_to_phy_data_irq_tx_irq_),                  //  output,   width = 1,          phy_data_irq_tx.irq
		.tx_serial_data_tx_serial_data        (_connected_to_tx_serial_data_tx_serial_data_),        //  output,   width = 1,           tx_serial_data.tx_serial_data
		.rx_serial_data_rx_serial_data        (_connected_to_rx_serial_data_rx_serial_data_),        //   input,   width = 1,           rx_serial_data.rx_serial_data
		.reset_reset                          (_connected_to_reset_reset_),                          //   input,   width = 1,                    reset.reset
		.serial_clock_reconfig_s0_write       (_connected_to_serial_clock_reconfig_s0_write_),       //   input,   width = 1, serial_clock_reconfig_s0.write
		.serial_clock_reconfig_s0_read        (_connected_to_serial_clock_reconfig_s0_read_),        //   input,   width = 1,                         .read
		.serial_clock_reconfig_s0_address     (_connected_to_serial_clock_reconfig_s0_address_),     //   input,  width = 10,                         .address
		.serial_clock_reconfig_s0_writedata   (_connected_to_serial_clock_reconfig_s0_writedata_),   //   input,  width = 32,                         .writedata
		.serial_clock_reconfig_s0_readdata    (_connected_to_serial_clock_reconfig_s0_readdata_),    //  output,  width = 32,                         .readdata
		.serial_clock_reconfig_s0_waitrequest (_connected_to_serial_clock_reconfig_s0_waitrequest_)  //  output,   width = 1,                         .waitrequest
	);

