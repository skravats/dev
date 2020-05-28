module interlaken_phy (
		input  wire        clk125_clk,                           //                   clk125.clk
		input  wire [7:0]  phy_data_ctrl_csr_s0_address,         //     phy_data_ctrl_csr_s0.address
		input  wire        phy_data_ctrl_csr_s0_read,            //                         .read
		output wire [31:0] phy_data_ctrl_csr_s0_readdata,        //                         .readdata
		output wire        phy_data_ctrl_csr_s0_readdatavalid,   //                         .readdatavalid
		input  wire        phy_data_ctrl_csr_s0_write,           //                         .write
		input  wire [31:0] phy_data_ctrl_csr_s0_writedata,       //                         .writedata
		output wire        phy_data_ctrl_csr_s0_waitrequest,     //                         .waitrequest
		output wire [31:0] phy_data_ctrl_m0_address,             //         phy_data_ctrl_m0.address
		output wire        phy_data_ctrl_m0_read,                //                         .read
		input  wire        phy_data_ctrl_m0_waitrequest,         //                         .waitrequest
		input  wire [31:0] phy_data_ctrl_m0_readdata,            //                         .readdata
		input  wire        phy_data_ctrl_m0_readdatavalid,       //                         .readdatavalid
		output wire        phy_data_ctrl_m0_write,               //                         .write
		output wire [31:0] phy_data_ctrl_m0_writedata,           //                         .writedata
		output wire        phy_data_irq_rx_irq,                  //          phy_data_irq_rx.irq
		output wire        phy_data_irq_tx_irq,                  //          phy_data_irq_tx.irq
		output wire [0:0]  tx_serial_data_tx_serial_data,        //           tx_serial_data.tx_serial_data
		input  wire [0:0]  rx_serial_data_rx_serial_data,        //           rx_serial_data.rx_serial_data
		input  wire        reset_reset,                          //                    reset.reset
		input  wire        serial_clock_reconfig_s0_write,       // serial_clock_reconfig_s0.write
		input  wire        serial_clock_reconfig_s0_read,        //                         .read
		input  wire [9:0]  serial_clock_reconfig_s0_address,     //                         .address
		input  wire [31:0] serial_clock_reconfig_s0_writedata,   //                         .writedata
		output wire [31:0] serial_clock_reconfig_s0_readdata,    //                         .readdata
		output wire        serial_clock_reconfig_s0_waitrequest  //                         .waitrequest
	);
endmodule

