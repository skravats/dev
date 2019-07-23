// (C) 2001-2018 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


module system_bd_altera_arria10_interface_generator_140_as2bmya(
// hps_io
  output wire [1 - 1 : 0 ] hps_io_phery_emac1_TX_CLK
 ,output wire [1 - 1 : 0 ] hps_io_phery_emac1_TXD0
 ,output wire [1 - 1 : 0 ] hps_io_phery_emac1_TXD1
 ,output wire [1 - 1 : 0 ] hps_io_phery_emac1_TXD2
 ,output wire [1 - 1 : 0 ] hps_io_phery_emac1_TXD3
 ,input wire [1 - 1 : 0 ] hps_io_phery_emac1_RX_CTL
 ,output wire [1 - 1 : 0 ] hps_io_phery_emac1_TX_CTL
 ,input wire [1 - 1 : 0 ] hps_io_phery_emac1_RX_CLK
 ,input wire [1 - 1 : 0 ] hps_io_phery_emac1_RXD0
 ,input wire [1 - 1 : 0 ] hps_io_phery_emac1_RXD1
 ,input wire [1 - 1 : 0 ] hps_io_phery_emac1_RXD2
 ,input wire [1 - 1 : 0 ] hps_io_phery_emac1_RXD3
 ,inout wire [1 - 1 : 0 ] hps_io_phery_emac1_MDIO
 ,output wire [1 - 1 : 0 ] hps_io_phery_emac1_MDC
 ,inout wire [1 - 1 : 0 ] hps_io_phery_sdmmc_CMD
 ,inout wire [1 - 1 : 0 ] hps_io_phery_sdmmc_D0
 ,inout wire [1 - 1 : 0 ] hps_io_phery_sdmmc_D1
 ,inout wire [1 - 1 : 0 ] hps_io_phery_sdmmc_D2
 ,inout wire [1 - 1 : 0 ] hps_io_phery_sdmmc_D3
 ,output wire [1 - 1 : 0 ] hps_io_phery_sdmmc_CCLK
 ,inout wire [1 - 1 : 0 ] hps_io_phery_usb1_DATA0
 ,inout wire [1 - 1 : 0 ] hps_io_phery_usb1_DATA1
 ,inout wire [1 - 1 : 0 ] hps_io_phery_usb1_DATA2
 ,inout wire [1 - 1 : 0 ] hps_io_phery_usb1_DATA3
 ,inout wire [1 - 1 : 0 ] hps_io_phery_usb1_DATA4
 ,inout wire [1 - 1 : 0 ] hps_io_phery_usb1_DATA5
 ,inout wire [1 - 1 : 0 ] hps_io_phery_usb1_DATA6
 ,inout wire [1 - 1 : 0 ] hps_io_phery_usb1_DATA7
 ,input wire [1 - 1 : 0 ] hps_io_phery_usb1_CLK
 ,output wire [1 - 1 : 0 ] hps_io_phery_usb1_STP
 ,input wire [1 - 1 : 0 ] hps_io_phery_usb1_DIR
 ,input wire [1 - 1 : 0 ] hps_io_phery_usb1_NXT
 ,input wire [1 - 1 : 0 ] hps_io_phery_uart0_RX
 ,output wire [1 - 1 : 0 ] hps_io_phery_uart0_TX
 ,input wire [1 - 1 : 0 ] hps_io_phery_uart1_RX
 ,output wire [1 - 1 : 0 ] hps_io_phery_uart1_TX
 ,input wire [1 - 1 : 0 ] hps_io_phery_uart1_CTS_N
 ,output wire [1 - 1 : 0 ] hps_io_phery_uart1_RTS_N
);

assign hps_io_phery_emac1_MDIO = intermediate[1] ? intermediate[0] : 'z;
assign hps_io_phery_sdmmc_CMD = intermediate[3] ? intermediate[2] : 'z;
assign hps_io_phery_sdmmc_D0 = intermediate[5] ? intermediate[4] : 'z;
assign hps_io_phery_sdmmc_D1 = intermediate[7] ? intermediate[6] : 'z;
assign hps_io_phery_sdmmc_D2 = intermediate[9] ? intermediate[8] : 'z;
assign hps_io_phery_sdmmc_D3 = intermediate[11] ? intermediate[10] : 'z;
assign hps_io_phery_usb1_DATA0 = intermediate[13] ? intermediate[12] : 'z;
assign hps_io_phery_usb1_DATA1 = intermediate[15] ? intermediate[14] : 'z;
assign hps_io_phery_usb1_DATA2 = intermediate[17] ? intermediate[16] : 'z;
assign hps_io_phery_usb1_DATA3 = intermediate[19] ? intermediate[18] : 'z;
assign hps_io_phery_usb1_DATA4 = intermediate[21] ? intermediate[20] : 'z;
assign hps_io_phery_usb1_DATA5 = intermediate[23] ? intermediate[22] : 'z;
assign hps_io_phery_usb1_DATA6 = intermediate[25] ? intermediate[24] : 'z;
assign hps_io_phery_usb1_DATA7 = intermediate[27] ? intermediate[26] : 'z;

wire [28 - 1 : 0] intermediate;

twentynm_hps_peripheral_emac phery_emac1(
 .EMAC_CLK_RX({
    hps_io_phery_emac1_RX_CLK[0:0] // 0:0
  })
,.EMAC_PHY_TX_OE({
    hps_io_phery_emac1_TX_CTL[0:0] // 0:0
  })
,.EMAC_GMII_MDO_O({
    intermediate[0:0] // 0:0
  })
,.EMAC_GMII_MDO_OE({
    intermediate[1:1] // 0:0
  })
,.EMAC_PHY_RXDV({
    hps_io_phery_emac1_RX_CTL[0:0] // 0:0
  })
,.EMAC_PHY_TXD({
    hps_io_phery_emac1_TXD3[0:0] // 3:3
   ,hps_io_phery_emac1_TXD2[0:0] // 2:2
   ,hps_io_phery_emac1_TXD1[0:0] // 1:1
   ,hps_io_phery_emac1_TXD0[0:0] // 0:0
  })
,.EMAC_GMII_MDC({
    hps_io_phery_emac1_MDC[0:0] // 0:0
  })
,.EMAC_CLK_TX({
    hps_io_phery_emac1_TX_CLK[0:0] // 0:0
  })
,.EMAC_GMII_MDO_I({
    hps_io_phery_emac1_MDIO[0:0] // 0:0
  })
,.EMAC_PHY_RXD({
    hps_io_phery_emac1_RXD3[0:0] // 3:3
   ,hps_io_phery_emac1_RXD2[0:0] // 2:2
   ,hps_io_phery_emac1_RXD1[0:0] // 1:1
   ,hps_io_phery_emac1_RXD0[0:0] // 0:0
  })
);


twentynm_hps_peripheral_sdmmc phery_sdmmc(
 .SDMMC_CCLK({
    hps_io_phery_sdmmc_CCLK[0:0] // 0:0
  })
,.SDMMC_DATA_OE({
    intermediate[11:11] // 3:3
   ,intermediate[9:9] // 2:2
   ,intermediate[7:7] // 1:1
   ,intermediate[5:5] // 0:0
  })
,.SDMMC_CMD_O({
    intermediate[2:2] // 0:0
  })
,.SDMMC_DATA_I({
    hps_io_phery_sdmmc_D3[0:0] // 3:3
   ,hps_io_phery_sdmmc_D2[0:0] // 2:2
   ,hps_io_phery_sdmmc_D1[0:0] // 1:1
   ,hps_io_phery_sdmmc_D0[0:0] // 0:0
  })
,.SDMMC_CMD_OE({
    intermediate[3:3] // 0:0
  })
,.SDMMC_CMD_I({
    hps_io_phery_sdmmc_CMD[0:0] // 0:0
  })
,.SDMMC_DATA_O({
    intermediate[10:10] // 3:3
   ,intermediate[8:8] // 2:2
   ,intermediate[6:6] // 1:1
   ,intermediate[4:4] // 0:0
  })
);


twentynm_hps_peripheral_usb phery_usb1(
 .USB_ULPI_NXT({
    hps_io_phery_usb1_NXT[0:0] // 0:0
  })
,.USB_ULPI_DATA_I({
    hps_io_phery_usb1_DATA7[0:0] // 7:7
   ,hps_io_phery_usb1_DATA6[0:0] // 6:6
   ,hps_io_phery_usb1_DATA5[0:0] // 5:5
   ,hps_io_phery_usb1_DATA4[0:0] // 4:4
   ,hps_io_phery_usb1_DATA3[0:0] // 3:3
   ,hps_io_phery_usb1_DATA2[0:0] // 2:2
   ,hps_io_phery_usb1_DATA1[0:0] // 1:1
   ,hps_io_phery_usb1_DATA0[0:0] // 0:0
  })
,.USB_ULPI_CLK({
    hps_io_phery_usb1_CLK[0:0] // 0:0
  })
,.USB_ULPI_STP({
    hps_io_phery_usb1_STP[0:0] // 0:0
  })
,.USB_ULPI_DIR({
    hps_io_phery_usb1_DIR[0:0] // 0:0
  })
,.USB_ULPI_DATA_O({
    intermediate[26:26] // 7:7
   ,intermediate[24:24] // 6:6
   ,intermediate[22:22] // 5:5
   ,intermediate[20:20] // 4:4
   ,intermediate[18:18] // 3:3
   ,intermediate[16:16] // 2:2
   ,intermediate[14:14] // 1:1
   ,intermediate[12:12] // 0:0
  })
,.USB_ULPI_DATA_OE({
    intermediate[27:27] // 7:7
   ,intermediate[25:25] // 6:6
   ,intermediate[23:23] // 5:5
   ,intermediate[21:21] // 4:4
   ,intermediate[19:19] // 3:3
   ,intermediate[17:17] // 2:2
   ,intermediate[15:15] // 1:1
   ,intermediate[13:13] // 0:0
  })
);


twentynm_hps_peripheral_uart phery_uart0(
 .UART_RXD({
    hps_io_phery_uart0_RX[0:0] // 0:0
  })
,.UART_TXD({
    hps_io_phery_uart0_TX[0:0] // 0:0
  })
);


twentynm_hps_peripheral_uart phery_uart1(
 .UART_RTS_N({
    hps_io_phery_uart1_RTS_N[0:0] // 0:0
  })
,.UART_RXD({
    hps_io_phery_uart1_RX[0:0] // 0:0
  })
,.UART_CTS_N({
    hps_io_phery_uart1_CTS_N[0:0] // 0:0
  })
,.UART_TXD({
    hps_io_phery_uart1_TX[0:0] // 0:0
  })
);

endmodule

