	interlaken_phy_xcvr_native_a10_0 u0 (
		.tx_analogreset           (_connected_to_tx_analogreset_),           //   input,   width = 1,           tx_analogreset.tx_analogreset
		.tx_digitalreset          (_connected_to_tx_digitalreset_),          //   input,   width = 1,          tx_digitalreset.tx_digitalreset
		.rx_analogreset           (_connected_to_rx_analogreset_),           //   input,   width = 1,           rx_analogreset.rx_analogreset
		.rx_digitalreset          (_connected_to_rx_digitalreset_),          //   input,   width = 1,          rx_digitalreset.rx_digitalreset
		.tx_cal_busy              (_connected_to_tx_cal_busy_),              //  output,   width = 1,              tx_cal_busy.tx_cal_busy
		.rx_cal_busy              (_connected_to_rx_cal_busy_),              //  output,   width = 1,              rx_cal_busy.rx_cal_busy
		.tx_serial_clk0           (_connected_to_tx_serial_clk0_),           //   input,   width = 1,           tx_serial_clk0.clk
		.rx_cdr_refclk0           (_connected_to_rx_cdr_refclk0_),           //   input,   width = 1,           rx_cdr_refclk0.clk
		.tx_serial_data           (_connected_to_tx_serial_data_),           //  output,   width = 1,           tx_serial_data.tx_serial_data
		.rx_serial_data           (_connected_to_rx_serial_data_),           //   input,   width = 1,           rx_serial_data.rx_serial_data
		.rx_seriallpbken          (_connected_to_rx_seriallpbken_),          //   input,   width = 1,          rx_seriallpbken.rx_seriallpbken
		.rx_set_locktodata        (_connected_to_rx_set_locktodata_),        //   input,   width = 1,        rx_set_locktodata.rx_set_locktodata
		.rx_set_locktoref         (_connected_to_rx_set_locktoref_),         //   input,   width = 1,         rx_set_locktoref.rx_set_locktoref
		.rx_is_lockedtoref        (_connected_to_rx_is_lockedtoref_),        //  output,   width = 1,        rx_is_lockedtoref.rx_is_lockedtoref
		.rx_is_lockedtodata       (_connected_to_rx_is_lockedtodata_),       //  output,   width = 1,       rx_is_lockedtodata.rx_is_lockedtodata
		.tx_coreclkin             (_connected_to_tx_coreclkin_),             //   input,   width = 1,             tx_coreclkin.clk
		.rx_coreclkin             (_connected_to_rx_coreclkin_),             //   input,   width = 1,             rx_coreclkin.clk
		.tx_clkout                (_connected_to_tx_clkout_),                //  output,   width = 1,                tx_clkout.clk
		.rx_clkout                (_connected_to_rx_clkout_),                //  output,   width = 1,                rx_clkout.clk
		.tx_parallel_data         (_connected_to_tx_parallel_data_),         //   input,  width = 64,         tx_parallel_data.tx_parallel_data
		.tx_control               (_connected_to_tx_control_),               //   input,   width = 3,               tx_control.tx_control
		.tx_err_ins               (_connected_to_tx_err_ins_),               //   input,   width = 1,               tx_err_ins.tx_err_ins
		.unused_tx_parallel_data  (_connected_to_unused_tx_parallel_data_),  //   input,  width = 64,  unused_tx_parallel_data.unused_tx_parallel_data
		.unused_tx_control        (_connected_to_unused_tx_control_),        //   input,  width = 14,        unused_tx_control.unused_tx_control
		.rx_parallel_data         (_connected_to_rx_parallel_data_),         //  output,  width = 64,         rx_parallel_data.rx_parallel_data
		.rx_control               (_connected_to_rx_control_),               //  output,  width = 10,               rx_control.rx_control
		.unused_rx_parallel_data  (_connected_to_unused_rx_parallel_data_),  //  output,  width = 64,  unused_rx_parallel_data.unused_rx_parallel_data
		.unused_rx_control        (_connected_to_unused_rx_control_),        //  output,  width = 10,        unused_rx_control.unused_rx_control
		.tx_enh_data_valid        (_connected_to_tx_enh_data_valid_),        //   input,   width = 1,        tx_enh_data_valid.tx_enh_data_valid
		.tx_enh_fifo_full         (_connected_to_tx_enh_fifo_full_),         //  output,   width = 1,         tx_enh_fifo_full.tx_enh_fifo_full
		.tx_enh_fifo_pfull        (_connected_to_tx_enh_fifo_pfull_),        //  output,   width = 1,        tx_enh_fifo_pfull.tx_enh_fifo_pfull
		.tx_enh_fifo_empty        (_connected_to_tx_enh_fifo_empty_),        //  output,   width = 1,        tx_enh_fifo_empty.tx_enh_fifo_empty
		.tx_enh_fifo_pempty       (_connected_to_tx_enh_fifo_pempty_),       //  output,   width = 1,       tx_enh_fifo_pempty.tx_enh_fifo_pempty
		.rx_enh_fifo_rd_en        (_connected_to_rx_enh_fifo_rd_en_),        //   input,   width = 1,        rx_enh_fifo_rd_en.rx_enh_fifo_rd_en
		.rx_enh_fifo_full         (_connected_to_rx_enh_fifo_full_),         //  output,   width = 1,         rx_enh_fifo_full.rx_enh_fifo_full
		.rx_enh_fifo_pfull        (_connected_to_rx_enh_fifo_pfull_),        //  output,   width = 1,        rx_enh_fifo_pfull.rx_enh_fifo_pfull
		.rx_enh_fifo_empty        (_connected_to_rx_enh_fifo_empty_),        //  output,   width = 1,        rx_enh_fifo_empty.rx_enh_fifo_empty
		.rx_enh_fifo_pempty       (_connected_to_rx_enh_fifo_pempty_),       //  output,   width = 1,       rx_enh_fifo_pempty.rx_enh_fifo_pempty
		.tx_enh_frame_burst_en    (_connected_to_tx_enh_frame_burst_en_),    //   input,   width = 1,          tx_enh_burst_en.tx_enh_frame_burst_en
		.tx_enh_frame_diag_status (_connected_to_tx_enh_frame_diag_status_), //   input,   width = 2, tx_enh_frame_diag_status.tx_enh_frame_diag_status
		.rx_enh_frame_diag_status (_connected_to_rx_enh_frame_diag_status_)  //  output,   width = 2, rx_enh_frame_diag_status.rx_enh_frame_diag_status
	);

