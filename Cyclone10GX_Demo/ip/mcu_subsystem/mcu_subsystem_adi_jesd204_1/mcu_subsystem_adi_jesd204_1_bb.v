module mcu_subsystem_adi_jesd204_1 (
		input  wire         sys_clk_clk,                   //           sys_clk.clk
		input  wire         sys_resetn_reset_n,            //        sys_resetn.reset_n
		input  wire         ref_clk_clk,                   //           ref_clk.clk
		input  wire         link_pll_reconfig_write,       // link_pll_reconfig.write
		input  wire         link_pll_reconfig_read,        //                  .read
		input  wire [9:0]   link_pll_reconfig_address,     //                  .address
		input  wire [31:0]  link_pll_reconfig_writedata,   //                  .writedata
		output wire [31:0]  link_pll_reconfig_readdata,    //                  .readdata
		output wire         link_pll_reconfig_waitrequest, //                  .waitrequest
		output wire         link_clk_clk,                  //          link_clk.clk
		output wire         link_reset_reset,              //        link_reset.reset
		input  wire         link_management_awvalid,       //   link_management.awvalid
		input  wire [11:0]  link_management_awaddr,        //                  .awaddr
		input  wire [2:0]   link_management_awprot,        //                  .awprot
		output wire         link_management_awready,       //                  .awready
		input  wire         link_management_wvalid,        //                  .wvalid
		input  wire [31:0]  link_management_wdata,         //                  .wdata
		input  wire [3:0]   link_management_wstrb,         //                  .wstrb
		output wire         link_management_wready,        //                  .wready
		output wire         link_management_bvalid,        //                  .bvalid
		output wire [1:0]   link_management_bresp,         //                  .bresp
		input  wire         link_management_bready,        //                  .bready
		input  wire         link_management_arvalid,       //                  .arvalid
		input  wire [11:0]  link_management_araddr,        //                  .araddr
		input  wire [2:0]   link_management_arprot,        //                  .arprot
		output wire         link_management_arready,       //                  .arready
		output wire         link_management_rvalid,        //                  .rvalid
		output wire [1:0]   link_management_rresp,         //                  .rresp
		output wire [31:0]  link_management_rdata,         //                  .rdata
		input  wire         link_management_rready,        //                  .rready
		input  wire [3:0]   serial_data_rx_serial_data,    //       serial_data.rx_serial_data
		input  wire [9:0]   phy_reconfig_0_address,        //    phy_reconfig_0.address
		input  wire         phy_reconfig_0_read,           //                  .read
		output wire [31:0]  phy_reconfig_0_readdata,       //                  .readdata
		output wire         phy_reconfig_0_waitrequest,    //                  .waitrequest
		input  wire         phy_reconfig_0_write,          //                  .write
		input  wire [31:0]  phy_reconfig_0_writedata,      //                  .writedata
		input  wire [9:0]   phy_reconfig_1_address,        //    phy_reconfig_1.address
		input  wire         phy_reconfig_1_read,           //                  .read
		output wire [31:0]  phy_reconfig_1_readdata,       //                  .readdata
		output wire         phy_reconfig_1_waitrequest,    //                  .waitrequest
		input  wire         phy_reconfig_1_write,          //                  .write
		input  wire [31:0]  phy_reconfig_1_writedata,      //                  .writedata
		input  wire [9:0]   phy_reconfig_2_address,        //    phy_reconfig_2.address
		input  wire         phy_reconfig_2_read,           //                  .read
		output wire [31:0]  phy_reconfig_2_readdata,       //                  .readdata
		output wire         phy_reconfig_2_waitrequest,    //                  .waitrequest
		input  wire         phy_reconfig_2_write,          //                  .write
		input  wire [31:0]  phy_reconfig_2_writedata,      //                  .writedata
		input  wire [9:0]   phy_reconfig_3_address,        //    phy_reconfig_3.address
		input  wire         phy_reconfig_3_read,           //                  .read
		output wire [31:0]  phy_reconfig_3_readdata,       //                  .readdata
		output wire         phy_reconfig_3_waitrequest,    //                  .waitrequest
		input  wire         phy_reconfig_3_write,          //                  .write
		input  wire [31:0]  phy_reconfig_3_writedata,      //                  .writedata
		input  wire         link_reconfig_awvalid,         //     link_reconfig.awvalid
		input  wire [13:0]  link_reconfig_awaddr,          //                  .awaddr
		input  wire [2:0]   link_reconfig_awprot,          //                  .awprot
		output wire         link_reconfig_awready,         //                  .awready
		input  wire         link_reconfig_wvalid,          //                  .wvalid
		input  wire [31:0]  link_reconfig_wdata,           //                  .wdata
		input  wire [3:0]   link_reconfig_wstrb,           //                  .wstrb
		output wire         link_reconfig_wready,          //                  .wready
		output wire         link_reconfig_bvalid,          //                  .bvalid
		output wire [1:0]   link_reconfig_bresp,           //                  .bresp
		input  wire         link_reconfig_bready,          //                  .bready
		input  wire         link_reconfig_arvalid,         //                  .arvalid
		input  wire [13:0]  link_reconfig_araddr,          //                  .araddr
		input  wire [2:0]   link_reconfig_arprot,          //                  .arprot
		output wire         link_reconfig_arready,         //                  .arready
		output wire         link_reconfig_rvalid,          //                  .rvalid
		output wire [1:0]   link_reconfig_rresp,           //                  .rresp
		output wire [31:0]  link_reconfig_rdata,           //                  .rdata
		input  wire         link_reconfig_rready,          //                  .rready
		output wire         interrupt_irq,                 //         interrupt.irq
		input  wire         sysref_export,                 //            sysref.export
		output wire [0:0]   sync_export,                   //              sync.export
		output wire [3:0]   link_sof_export,               //          link_sof.export
		output wire [127:0] link_data_data,                //         link_data.data
		output wire         link_data_valid                //                  .valid
	);
endmodule

