module interlaken_phy_xcvr_data_flow_controller_0 (
		input  wire [7:0]  csr_s0_address,           //                   csr_s0.address
		input  wire        csr_s0_read,              //                         .read
		output wire [31:0] csr_s0_readdata,          //                         .readdata
		output wire        csr_s0_readdatavalid,     //                         .readdatavalid
		input  wire        csr_s0_write,             //                         .write
		input  wire [31:0] csr_s0_writedata,         //                         .writedata
		output wire        csr_s0_waitrequest,       //                         .waitrequest
		input  wire [63:0] rx_parallel_data,         //         rx_parallel_data.rx_parallel_data
		output wire [63:0] tx_parallel_data,         //         tx_parallel_data.tx_parallel_data
		input  wire        rx_enh_fifo_full,         //         rx_enh_fifo_full.rx_enh_fifo_full
		input  wire        rx_enh_fifo_pfull,        //        rx_enh_fifo_pfull.rx_enh_fifo_pfull
		input  wire        rx_enh_fifo_empty,        //        rx_enh_fifo_empty.rx_enh_fifo_empty
		input  wire        rx_enh_fifo_pempty,       //       rx_enh_fifo_pempty.rx_enh_fifo_pempty
		input  wire        tx_enh_fifo_pempty,       //       tx_enh_fifo_pempty.tx_enh_fifo_pempty
		input  wire        tx_enh_fifo_empty,        //        tx_enh_fifo_empty.tx_enh_fifo_empty
		input  wire        tx_enh_fifo_pfull,        //        tx_enh_fifo_pfull.tx_enh_fifo_pfull
		input  wire        tx_enh_fifo_full,         //         tx_enh_fifo_full.tx_enh_fifo_full
		output wire [31:0] avm_m0_address,           //                   avm_m0.address
		output wire        avm_m0_read,              //                         .read
		input  wire        avm_m0_waitrequest,       //                         .waitrequest
		input  wire [31:0] avm_m0_readdata,          //                         .readdata
		input  wire        avm_m0_readdatavalid,     //                         .readdatavalid
		output wire        avm_m0_write,             //                         .write
		output wire [31:0] avm_m0_writedata,         //                         .writedata
		output wire [2:0]  tx_control,               //               tx_control.tx_control
		input  wire [9:0]  rx_control,               //               rx_control.rx_control
		input  wire        reset,                    //                      rst.reset
		input  wire        clock,                    //                      clk.clk
		input  wire        tx_ready,                 //                 tx_ready.tx_ready
		input  wire        rx_ready,                 //                 rx_ready.rx_ready
		output wire        rx_irq,                   //                   irq_rx.irq
		output wire        tx_enh_data_valid,        //        tx_enh_data_valid.tx_enh_data_valid
		output wire        tx_irq,                   //                   irq_tx.irq
		input  wire        tx_coreclkin,             //             tx_coreclkin.clk
		input  wire        rx_coreclkin,             //             rx_coreclkin.clk
		output wire        rx_enh_fifo_rd_en,        //        rx_enh_fifo_rd_en.rx_enh_fifo_rd_en
		output wire        tx_err_ins,               //               tx_err_ins.tx_err_ins
		output wire        reset_phy,                //                reset_phy.reset
		output wire        pll_locked_out,           //           pll_locked_out.pll_locked
		input  wire        pll_powerdown_input,      //      pll_powerdown_input.pll_powerdown
		output wire        atx_pll_powerdown,        //        atx_pll_powerdown.pll_powerdown
		input  wire        atx_pll_locked,           //           atx_pll_locked.pll_locked
		output wire        rx_set_locktodata,        //        rx_set_locktodata.rx_set_locktodata
		output wire        rx_set_locktoref,         //         rx_set_locktoref.rx_set_locktoref
		output wire        tx_enh_frame_burst_en,    //    tx_enh_frame_burst_en.tx_enh_frame_burst_en
		output wire [1:0]  tx_enh_frame_diag_status, // tx_enh_frame_diag_status.tx_enh_frame_diag_status
		output wire [13:0] unused_tx_control,        //        unused_tx_control.unused_tx_control
		output wire [63:0] unused_tx_parallel_data,  //  unused_tx_parallel_data.unused_tx_parallel_data
		output wire        rx_seriallpbken,          //          rx_seriallpbken.rx_seriallpbken
		output wire        pll_select,               //               pll_select.pll_select
		input  wire [1:0]  rx_enh_frame_diag_status  // rx_enh_frame_diag_status.rx_enh_frame_diag_status
	);
endmodule

