module mcu_subsystem (
		input  wire        tx_fifo_bypass_bypass,         // tx_fifo_bypass.bypass
		input  wire        tx_ref_clk_clk,                //     tx_ref_clk.clk
		output wire [3:0]  tx_serial_data_tx_serial_data, // tx_serial_data.tx_serial_data
		input  wire        tx_sysref_export,              //      tx_sysref.export
		input  wire        tx_sync_export,                //        tx_sync.export
		input  wire        rx_ref_clk_clk,                //     rx_ref_clk.clk
		input  wire [3:0]  rx_serial_data_rx_serial_data, // rx_serial_data.rx_serial_data
		input  wire        rx_sysref_export,              //      rx_sysref.export
		output wire [0:0]  rx_sync_export,                //        rx_sync.export
		input  wire        clk100_clk,                    //         clk100.clk
		input  wire        clk_clk,                       //            clk.clk
		output wire        dbg_reset_reset,               //      dbg_reset.reset
		input  wire [31:0] fmc_gpio_in_port,              //       fmc_gpio.in_port
		output wire [31:0] fmc_gpio_out_port,             //               .out_port
		input  wire        i2c_sda_in,                    //            i2c.sda_in
		input  wire        i2c_scl_in,                    //               .scl_in
		output wire        i2c_sda_oe,                    //               .sda_oe
		output wire        i2c_scl_oe,                    //               .scl_oe
		input  wire        spi_MISO,                      //            spi.MISO
		output wire        spi_MOSI,                      //               .MOSI
		output wire        spi_SCLK,                      //               .SCLK
		output wire [7:0]  spi_SS_n,                      //               .SS_n
		output wire        iopll_0_locked_export,         // iopll_0_locked.export
		output wire        qspi_dclk,                     //           qspi.dclk
		output wire        qspi_ncs,                      //               .ncs
		inout  wire [3:0]  qspi_data,                     //               .data
		input  wire        refclk_emif_clk,               //    refclk_emif.clk
		input  wire        reset_reset_n,                 //          reset.reset_n
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
		output wire [0:0]  tx_0_tx_serial_data,           //           tx_0.tx_serial_data
		input  wire [0:0]  rx_0_rx_serial_data,           //           rx_0.rx_serial_data
		output wire [0:0]  tx_1_tx_serial_data,           //           tx_1.tx_serial_data
		input  wire [0:0]  rx_1_rx_serial_data            //           rx_1.rx_serial_data
	);
endmodule

