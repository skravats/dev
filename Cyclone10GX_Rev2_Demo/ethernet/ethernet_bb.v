module ethernet (
		input  wire         clk_in_clk,         //     clk_in.clk
		input  wire         avm_waitrequest,    //        avm.waitrequest
		input  wire [255:0] avm_readdata,       //           .readdata
		input  wire         avm_readdatavalid,  //           .readdatavalid
		input  wire [1:0]   avm_response,       //           .response
		output wire [7:0]   avm_burstcount,     //           .burstcount
		output wire [255:0] avm_writedata,      //           .writedata
		output wire [30:0]  avm_address,        //           .address
		output wire         avm_write,          //           .write
		output wire         avm_read,           //           .read
		output wire [31:0]  avm_byteenable,     //           .byteenable
		output wire         avm_debugaccess,    //           .debugaccess
		output wire         dma_rx_irq_irq,     // dma_rx_irq.irq
		output wire         dma_tx_irq_irq,     // dma_tx_irq.irq
		input  wire         tx_clock_clk,       //   tx_clock.clk
		input  wire         misc_xon_gen,       //       misc.xon_gen
		input  wire         misc_xoff_gen,      //           .xoff_gen
		output wire         misc_magic_wakeup,  //           .magic_wakeup
		input  wire         misc_magic_sleep_n, //           .magic_sleep_n
		input  wire         misc_ff_tx_crc_fwd, //           .ff_tx_crc_fwd
		output wire         misc_ff_tx_septy,   //           .ff_tx_septy
		output wire         misc_tx_ff_uflow,   //           .tx_ff_uflow
		output wire         misc_ff_tx_a_full,  //           .ff_tx_a_full
		output wire         misc_ff_tx_a_empty, //           .ff_tx_a_empty
		output wire [17:0]  misc_rx_err_stat,   //           .rx_err_stat
		output wire [3:0]   misc_rx_frm_type,   //           .rx_frm_type
		output wire         misc_ff_rx_dsav,    //           .ff_rx_dsav
		output wire         misc_ff_rx_a_full,  //           .ff_rx_a_full
		output wire         misc_ff_rx_a_empty, //           .ff_rx_a_empty
		output wire         mdio_mdc,           //       mdio.mdc
		input  wire         mdio_mdio_in,       //           .mdio_in
		output wire         mdio_mdio_out,      //           .mdio_out
		output wire         mdio_mdio_oen,      //           .mdio_oen
		input  wire [7:0]   gmii_gmii_rx_d,     //       gmii.gmii_rx_d
		input  wire         gmii_gmii_rx_dv,    //           .gmii_rx_dv
		input  wire         gmii_gmii_rx_err,   //           .gmii_rx_err
		output wire [7:0]   gmii_gmii_tx_d,     //           .gmii_tx_d
		output wire         gmii_gmii_tx_en,    //           .gmii_tx_en
		output wire         gmii_gmii_tx_err,   //           .gmii_tx_err
		input  wire [3:0]   mii_mii_rx_d,       //        mii.mii_rx_d
		input  wire         mii_mii_rx_dv,      //           .mii_rx_dv
		input  wire         mii_mii_rx_err,     //           .mii_rx_err
		output wire [3:0]   mii_mii_tx_d,       //           .mii_tx_d
		output wire         mii_mii_tx_en,      //           .mii_tx_en
		output wire         mii_mii_tx_err,     //           .mii_tx_err
		input  wire         status_set_10,      //     status.set_10
		input  wire         status_set_1000,    //           .set_1000
		output wire         status_eth_mode,    //           .eth_mode
		output wire         status_ena_10,      //           .ena_10
		input  wire         rx_clock_clk,       //   rx_clock.clk
		output wire         avs_waitrequest,    //        avs.waitrequest
		output wire [31:0]  avs_readdata,       //           .readdata
		output wire         avs_readdatavalid,  //           .readdatavalid
		input  wire [4:0]   avs_burstcount,     //           .burstcount
		input  wire [31:0]  avs_writedata,      //           .writedata
		input  wire [10:0]  avs_address,        //           .address
		input  wire         avs_write,          //           .write
		input  wire         avs_read,           //           .read
		input  wire [3:0]   avs_byteenable,     //           .byteenable
		input  wire         avs_debugaccess,    //           .debugaccess
		input  wire         rst_in_reset_n      //     rst_in.reset_n
	);
endmodule

