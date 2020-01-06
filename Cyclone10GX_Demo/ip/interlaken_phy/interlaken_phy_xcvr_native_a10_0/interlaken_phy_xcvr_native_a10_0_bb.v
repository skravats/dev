module interlaken_phy_xcvr_native_a10_0 (
		input  wire [0:0]  tx_analogreset,           //           tx_analogreset.tx_analogreset
		input  wire [0:0]  tx_digitalreset,          //          tx_digitalreset.tx_digitalreset
		input  wire [0:0]  rx_analogreset,           //           rx_analogreset.rx_analogreset
		input  wire [0:0]  rx_digitalreset,          //          rx_digitalreset.rx_digitalreset
		output wire [0:0]  tx_cal_busy,              //              tx_cal_busy.tx_cal_busy
		output wire [0:0]  rx_cal_busy,              //              rx_cal_busy.rx_cal_busy
		input  wire [0:0]  tx_serial_clk0,           //           tx_serial_clk0.clk
		input  wire        rx_cdr_refclk0,           //           rx_cdr_refclk0.clk
		output wire [0:0]  tx_serial_data,           //           tx_serial_data.tx_serial_data
		input  wire [0:0]  rx_serial_data,           //           rx_serial_data.rx_serial_data
		input  wire [0:0]  rx_seriallpbken,          //          rx_seriallpbken.rx_seriallpbken
		input  wire [0:0]  rx_set_locktodata,        //        rx_set_locktodata.rx_set_locktodata
		input  wire [0:0]  rx_set_locktoref,         //         rx_set_locktoref.rx_set_locktoref
		output wire [0:0]  rx_is_lockedtoref,        //        rx_is_lockedtoref.rx_is_lockedtoref
		output wire [0:0]  rx_is_lockedtodata,       //       rx_is_lockedtodata.rx_is_lockedtodata
		input  wire [0:0]  tx_coreclkin,             //             tx_coreclkin.clk
		input  wire [0:0]  rx_coreclkin,             //             rx_coreclkin.clk
		output wire [0:0]  tx_clkout,                //                tx_clkout.clk
		output wire [0:0]  rx_clkout,                //                rx_clkout.clk
		input  wire [63:0] tx_parallel_data,         //         tx_parallel_data.tx_parallel_data
		input  wire [2:0]  tx_control,               //               tx_control.tx_control
		input  wire        tx_err_ins,               //               tx_err_ins.tx_err_ins
		input  wire [63:0] unused_tx_parallel_data,  //  unused_tx_parallel_data.unused_tx_parallel_data
		input  wire [13:0] unused_tx_control,        //        unused_tx_control.unused_tx_control
		output wire [63:0] rx_parallel_data,         //         rx_parallel_data.rx_parallel_data
		output wire [9:0]  rx_control,               //               rx_control.rx_control
		output wire [63:0] unused_rx_parallel_data,  //  unused_rx_parallel_data.unused_rx_parallel_data
		output wire [9:0]  unused_rx_control,        //        unused_rx_control.unused_rx_control
		input  wire [0:0]  tx_enh_data_valid,        //        tx_enh_data_valid.tx_enh_data_valid
		output wire [0:0]  tx_enh_fifo_full,         //         tx_enh_fifo_full.tx_enh_fifo_full
		output wire [0:0]  tx_enh_fifo_pfull,        //        tx_enh_fifo_pfull.tx_enh_fifo_pfull
		output wire [0:0]  tx_enh_fifo_empty,        //        tx_enh_fifo_empty.tx_enh_fifo_empty
		output wire [0:0]  tx_enh_fifo_pempty,       //       tx_enh_fifo_pempty.tx_enh_fifo_pempty
		input  wire [0:0]  rx_enh_fifo_rd_en,        //        rx_enh_fifo_rd_en.rx_enh_fifo_rd_en
		output wire [0:0]  rx_enh_fifo_full,         //         rx_enh_fifo_full.rx_enh_fifo_full
		output wire [0:0]  rx_enh_fifo_pfull,        //        rx_enh_fifo_pfull.rx_enh_fifo_pfull
		output wire [0:0]  rx_enh_fifo_empty,        //        rx_enh_fifo_empty.rx_enh_fifo_empty
		output wire [0:0]  rx_enh_fifo_pempty,       //       rx_enh_fifo_pempty.rx_enh_fifo_pempty
		input  wire [0:0]  tx_enh_frame_burst_en,    //          tx_enh_burst_en.tx_enh_frame_burst_en
		input  wire [1:0]  tx_enh_frame_diag_status, // tx_enh_frame_diag_status.tx_enh_frame_diag_status
		output wire [1:0]  rx_enh_frame_diag_status  // rx_enh_frame_diag_status.rx_enh_frame_diag_status
	);
endmodule

