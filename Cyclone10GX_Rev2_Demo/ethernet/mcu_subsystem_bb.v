module mcu_subsystem (
		input  wire        tx_fifo_bypass_bypass,         // tx_fifo_bypass.bypass
		input  wire [0:0]  tx_pll_select_pll_select,      //  tx_pll_select.pll_select
		input  wire        tx_ref_clk_clk,                //     tx_ref_clk.clk
		output wire [3:0]  tx_serial_data_tx_serial_data, // tx_serial_data.tx_serial_data
		input  wire        tx_sync_export,                //        tx_sync.export
		input  wire        tx_sysref_export,              //      tx_sysref.export
		input  wire        rx_ref_clk_clk,                //     rx_ref_clk.clk
		input  wire [3:0]  rx_serial_data_rx_serial_data, // rx_serial_data.rx_serial_data
		output wire [0:0]  rx_sync_export,                //        rx_sync.export
		input  wire        rx_sysref_export,              //      rx_sysref.export
		input  wire        clk_clk,                       //            clk.clk
		input  wire        oct_oct_rzqin,                 //            oct.oct_rzqin
		output wire [0:0]  mem_mem_ck,                    //            mem.mem_ck
		output wire [0:0]  mem_mem_ck_n,                  //               .mem_ck_n
		output wire [15:0] mem_mem_a,                     //               .mem_a
		output wire [2:0]  mem_mem_ba,                    //               .mem_ba
		output wire [0:0]  mem_mem_cke,                   //               .mem_cke
		output wire [0:0]  mem_mem_cs_n,                  //               .mem_cs_n
		output wire [0:0]  mem_mem_odt,                   //               .mem_odt
		output wire [0:0]  mem_mem_reset_n,               //               .mem_reset_n
		output wire [0:0]  mem_mem_we_n,                  //               .mem_we_n
		output wire [0:0]  mem_mem_ras_n,                 //               .mem_ras_n
		output wire [0:0]  mem_mem_cas_n,                 //               .mem_cas_n
		inout  wire [3:0]  mem_mem_dqs,                   //               .mem_dqs
		inout  wire [3:0]  mem_mem_dqs_n,                 //               .mem_dqs_n
		inout  wire [31:0] mem_mem_dq,                    //               .mem_dq
		output wire [3:0]  mem_mem_dm,                    //               .mem_dm
		output wire        status_local_cal_success,      //         status.local_cal_success
		output wire        status_local_cal_fail,         //               .local_cal_fail
		input  wire        tx_clock_clk,                  //       tx_clock.clk
		input  wire        misc_xon_gen,                  //           misc.xon_gen
		input  wire        misc_xoff_gen,                 //               .xoff_gen
		output wire        misc_magic_wakeup,             //               .magic_wakeup
		input  wire        misc_magic_sleep_n,            //               .magic_sleep_n
		input  wire        misc_ff_tx_crc_fwd,            //               .ff_tx_crc_fwd
		output wire        misc_ff_tx_septy,              //               .ff_tx_septy
		output wire        misc_tx_ff_uflow,              //               .tx_ff_uflow
		output wire        misc_ff_tx_a_full,             //               .ff_tx_a_full
		output wire        misc_ff_tx_a_empty,            //               .ff_tx_a_empty
		output wire [17:0] misc_rx_err_stat,              //               .rx_err_stat
		output wire [3:0]  misc_rx_frm_type,              //               .rx_frm_type
		output wire        misc_ff_rx_dsav,               //               .ff_rx_dsav
		output wire        misc_ff_rx_a_full,             //               .ff_rx_a_full
		output wire        misc_ff_rx_a_empty,            //               .ff_rx_a_empty
		output wire        mdio_mdc,                      //           mdio.mdc
		input  wire        mdio_mdio_in,                  //               .mdio_in
		output wire        mdio_mdio_out,                 //               .mdio_out
		output wire        mdio_mdio_oen,                 //               .mdio_oen
		input  wire [7:0]  gmii_gmii_rx_d,                //           gmii.gmii_rx_d
		input  wire        gmii_gmii_rx_dv,               //               .gmii_rx_dv
		input  wire        gmii_gmii_rx_err,              //               .gmii_rx_err
		output wire [7:0]  gmii_gmii_tx_d,                //               .gmii_tx_d
		output wire        gmii_gmii_tx_en,               //               .gmii_tx_en
		output wire        gmii_gmii_tx_err,              //               .gmii_tx_err
		input  wire [3:0]  mii_mii_rx_d,                  //            mii.mii_rx_d
		input  wire        mii_mii_rx_dv,                 //               .mii_rx_dv
		input  wire        mii_mii_rx_err,                //               .mii_rx_err
		output wire [3:0]  mii_mii_tx_d,                  //               .mii_tx_d
		output wire        mii_mii_tx_en,                 //               .mii_tx_en
		output wire        mii_mii_tx_err,                //               .mii_tx_err
		input  wire        status_1_set_10,               //       status_1.set_10
		input  wire        status_1_set_1000,             //               .set_1000
		output wire        status_1_eth_mode,             //               .eth_mode
		output wire        status_1_ena_10,               //               .ena_10
		input  wire        rx_clock_clk,                  //       rx_clock.clk
		input  wire [31:0] gpio_bus_in_port,              //       gpio_bus.in_port
		output wire [31:0] gpio_bus_out_port,             //               .out_port
		input  wire        i2c_serial_sda_in,             //     i2c_serial.sda_in
		input  wire        i2c_serial_scl_in,             //               .scl_in
		output wire        i2c_serial_sda_oe,             //               .sda_oe
		output wire        i2c_serial_scl_oe,             //               .scl_oe
		output wire        iopll_0_locked_export,         // iopll_0_locked.export
		output wire        qspi_dclk,                     //           qspi.dclk
		output wire        qspi_ncs,                      //               .ncs
		inout  wire [3:0]  qspi_data,                     //               .data
		input  wire        refclk_emif_clk,               //    refclk_emif.clk
		input  wire        reset_reset_n,                 //          reset.reset_n
		input  wire        spi_serial_MISO,               //     spi_serial.MISO
		output wire        spi_serial_MOSI,               //               .MOSI
		output wire        spi_serial_SCLK,               //               .SCLK
		output wire [7:0]  spi_serial_SS_n                //               .SS_n
	);
endmodule

