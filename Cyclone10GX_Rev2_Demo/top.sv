module top #(
      parameter JESD_L = 4
	) (
	input wire clk0,
	input wire clk1,
	input wire clk_100,
	input wire refclk_emif_clk,
	
	output reg data_0,
	
	input wire         reset_in,

	input  wire        oct_oct_rzqin,            //    oct.oct_rzqin
	output wire [0:0]  mem_mem_ck,               //    mem.mem_ck
	output wire [0:0]  mem_mem_ck_n,             //       .mem_ck_n
	output wire [15:0] mem_mem_a,                //       .mem_a
	output wire [2:0]  mem_mem_ba,               //       .mem_ba
	output wire [0:0]  mem_mem_cke,              //       .mem_cke
	output wire [0:0]  mem_mem_cs_n,             //       .mem_cs_n
	output wire [0:0]  mem_mem_odt,              //       .mem_odt
	output wire [0:0]  mem_mem_reset_n,          //       .mem_reset_n
	output wire [0:0]  mem_mem_we_n,             //       .mem_we_n
	output wire [0:0]  mem_mem_ras_n,            //       .mem_ras_n
	output wire [0:0]  mem_mem_cas_n,            //       .mem_cas_n
	inout  wire [3:0]  mem_mem_dqs,              //       .mem_dqs
	inout  wire [3:0]  mem_mem_dqs_n,            //       .mem_dqs_n
	inout  wire [31:0] mem_mem_dq,               //       .mem_dq
	output wire [3:0]  mem_mem_dm,               //       .mem_dm
	output wire        status_local_cal_success, // status.local_cal_success
	output wire        status_local_cal_fail,    //       .local_cal_fail 
	
	output wire        qspi_dclk,
	output wire        qspi_ncs,
	inout  wire [3:0]  qspi_data,
		
	// FMC interface	
	input  wire [JESD_L-1:0]   rx_serial_data,
	input  wire                rx_ref_clk,
	output wire                rx_sync,
	input  wire                rx_sysref,
		
	// tx
	input  wire                tx_ref_clk,
	output wire [JESD_L-1:0]   tx_serial_data,
	input  wire                tx_sync,
	input  wire                tx_sysref,
	
	output wire                dac_reset,
	output wire                dac_txen,
	output wire                adc_pd,
	output wire                clkd_sync,

	input  wire                trig,
	input  wire                adc_fdb,
	input  wire                adc_fda,
	input  wire                dac_irq,
	input  wire [1:0]          clkd_status,

	output                     spi_csn_clk,
	output                     spi_csn_dac,
	output                     spi_csn_adc,
	output                     spi_clk,
	inout                      spi_sdio,
	output                     spi_dir,
	
	// Ethernet
	// RX
	inout wire [7:0]   			gmii_rx_d,
	input wire         			gmii_rx_err,
	inout wire         			gmii_rx_dv,
	input wire         			gmii_rx_clk,
	
	// TX
	output wire [7:0]  			gmii_tx_d,
	output wire        			gmii_tx_en,
	output wire        			gmii_tx_err,
	input wire         			gmii_tx_clk,
	
	input wire         			gmii_col,
	input wire         			gmii_crs,
	
	output wire        			gmii_mdc,
	inout wire         			gmii_mdio,
	
	output wire        			gmii_gtxck,
	output wire        			gmii_rst,
	
	inout wire         			gmii_clk125

);


reg [31:0] counter_reset;
reg [31:0] counter;
reg global_reset;

reg phy_strap_reg;

wire clk250;

wire [31:0] gpio_bus_i;
wire [31:0] gpio_bus_o;
wire [7:0]  spi_csn_s;
wire        spi_miso_s;
wire        spi_mosi_s;
//wire        spi_clk;
wire        dac_fifo_bypass;

wire        mdio_mdc;
wire        mdio_out;
wire        mdio_in;
wire        mdio_oen;
wire        tx_clock_clk;
wire        rx_clock_clk;

wire        gmii_rx_dv_i;
wire [7:0]  gmii_rx_d_i;

// clocks for rx/tx
assign tx_clock_clk = clk0;//gmii_clk125;//gmii_tx_clk;
assign rx_clock_clk = gmii_rx_clk;

assign gmii_mdc  = mdio_mdc;
assign gmii_mdio = mdio_oen ? 1'bz : mdio_out;
assign mdio_in = gmii_mdio;
assign gmii_gtxck = clk0;//gmii_clk125;// 125MHz ref clock
assign gmii_rst = gpio_bus_o[31];

  
assign gpio_bus_i[11]	= trig;
assign gpio_bus_i[4]		= adc_fdb;
assign gpio_bus_i[3]		= adc_fda;
assign gpio_bus_i[2]		= dac_irq;
assign gpio_bus_i[1:0]	= clkd_status[1:0];

assign dac_fifo_bypass	= gpio_bus_o[12];
assign adc_pd				= gpio_bus_o[10];
assign dac_txen 			= gpio_bus_o[9];
assign dac_reset			= gpio_bus_o[8];
assign clkd_sync			= gpio_bus_o[6];

assign spi_csn_clk		= spi_csn_s[0];
assign spi_csn_dac		= spi_csn_s[1];
assign spi_csn_adc		= spi_csn_s[2];


always @(posedge clk0)
begin

	if(reset_in == 1'b0) begin
		counter_reset	<= 0;
		global_reset	<= 1'b1;
	end 
	
	if((reset_in == 1'b1) && (global_reset)) begin
		if(counter_reset == 10000000) begin
			global_reset	<= 1'b0;
		end else begin
			counter_reset	<= counter_reset + 1;
		end
	end

	
	if(counter > 100000000) begin
		counter <= 0;
		data_0 <= ~data_0;
	end else begin
		counter <= counter + 1;
	end
end

always @(posedge tx_ref_clk)
begin


end

// 19 -> phy addr 0 -> 1
// 17 -> phy addr 1 -> 0
// 48 -> phy addr 2 -> 0  -> 001
//
// 44 -> mode 0 -> 001
// 43 -> mode 1
// 41 -> mode 2
// 39 -> mode 3
//
//

// PHY STRAPS
// phy_strap_reg -> 1 => asserted
// phy_strap_reg -> 0 => deasserted

// LED_MODE -> AD15
//is sampled and latched at power-up/reset and is
//defined as follows:
//Pull-up (1) = Single-LED mode
//Pull-down (0) = Tri-color dual-LED mode
assign gmii_clk125 = phy_strap_reg ? 1'b0 : 1'bz;

// CLK125_EN -> AE14
// CLK125_EN is sampled and latched at power-up/reset and is
// defined as follows:
// Pull-up (1) = Enable 125 MHz clock output
// Pull-down (0) = Disable 125 MHz clock output
// Pin 55 (CLK125_NDO) provides the 125 MHz reference clock output
// option for use by the MAC.
assign gmii_rx_dv_i = gmii_rx_dv;
assign gmii_rx_dv = phy_strap_reg ? 1'b1 : 1'bz;


// The MODE[3:0] strap-in pins are sampled and latched at power-up/
// reset and are defined as follows:
// MODE[3:0] Mode
// 0000 Reserved - not used
// 0001 GMII/MII mode
// 0010 Reserved - not used
// 0011 Reserved - not used
// 0100 NAND tree mode
// 0101 Reserved - not used
// 0110 Reserved - not used
// 0111 Chip power-down mode
// 1000 Reserved - not used
// 1001 Reserved - not used
// 1010 Reserved - not used
// 1011 Reserved - not used
// 1100 Reserved - not used
// 1101 Reserved - not used
// 1110 Reserved - not used
// 1111 Reserved - not used
assign gmii_rx_d_i[7:0] = gmii_rx_d[7:0];
assign gmii_rx_d[7:0]   = phy_strap_reg ? 8'b00000001 : 8'bzzzzzzzz;

// The PHY address, PHYAD[2:0], is sampled and latched at power-up/
// reset and is configurable to any value from 0 to 7. Each PHY address
// bit is configured as follows:
// Pull-up = 1
// Pull-down = 0
// PHY Address Bits [4:3] are always set to ‘00’.
// 001

iopll pll (
	.rst			(global_reset),
	.refclk		(clk0),
	.locked		(),
	.outclk_0	(clk250)

);


daq2_spi i_daq2_spi (
	.spi_csn			(spi_csn_s[2:0]),
	.spi_clk			(spi_clk),
	.spi_mosi		(spi_mosi_s),
	.spi_miso 		(spi_miso_s),
	.spi_sdio		(spi_sdio),
	.spi_dir			(spi_dir)
);

	 

mcu_subsystem mcu_0(

	.clk_clk				(clk0),
	//.clk100_clk			(clk_100),
	.reset_reset_n		(!global_reset),

	// ddr3
	.refclk_emif_clk				(refclk_emif_clk),          //    refclk_emif_clk
	.oct_oct_rzqin					(oct_oct_rzqin),
	.mem_mem_ck						(mem_mem_ck),               //    mem.mem_ck
	.mem_mem_ck_n					(mem_mem_ck_n),             //       .mem_ck_n
	.mem_mem_a						(mem_mem_a),                //       .mem_a
	.mem_mem_ba						(mem_mem_ba),               //       .mem_ba
	.mem_mem_cke					(mem_mem_cke),              //       .mem_cke
	.mem_mem_cs_n					(mem_mem_cs_n),             //       .mem_cs_n
	.mem_mem_odt					(mem_mem_odt),              //       .mem_odt
	.mem_mem_reset_n				(mem_mem_reset_n),          //       .mem_reset_n
	.mem_mem_we_n					(mem_mem_we_n),             //       .mem_we_n
	.mem_mem_ras_n					(mem_mem_ras_n),            //       .mem_ras_n
	.mem_mem_cas_n					(mem_mem_cas_n),            //       .mem_cas_n
	.mem_mem_dqs					(mem_mem_dqs),              //       .mem_dqs
	.mem_mem_dqs_n					(mem_mem_dqs_n),            //       .mem_dqs_n
	.mem_mem_dq						(mem_mem_dq),               //       .mem_dq
	.mem_mem_dm						(mem_mem_dm),               //       .mem_dm
	.status_local_cal_success	(status_local_cal_success), // status.local_cal_success
	.status_local_cal_fail		(status_local_cal_fail),    //       .local_cal_fail 

	.qspi_dclk						(qspi_dclk),
	.qspi_ncs						(qspi_ncs),
	.qspi_data						(qspi_data),


	//.dbg_reset_reset											(),
	
	// SPI
	.spi_serial_MISO												(spi_miso_s),
	.spi_serial_MOSI												(spi_mosi_s),
	.spi_serial_SCLK												(spi_clk),
	.spi_serial_SS_n												(spi_csn_s),

	// i2c
	.i2c_serial_sda_in											(),
	.i2c_serial_scl_in											(),
	.i2c_serial_sda_oe											(),
	.i2c_serial_scl_oe											(),

	// tx
	.tx_fifo_bypass_bypass										(dac_fifo_bypass),
	.tx_serial_data_tx_serial_data							(tx_serial_data),
	.tx_sysref_export												(tx_sysref),
	.tx_sync_export												(tx_sync),
	.tx_ref_clk_clk												(tx_ref_clk),
	// rx
	.rx_serial_data_rx_serial_data							(rx_serial_data),
	.rx_sysref_export												(rx_sysref),
	.rx_sync_export												(rx_sync),
	.rx_ref_clk_clk												(rx_ref_clk),

	.gpio_bus_in_port												(gpio_bus_i),
	.gpio_bus_out_port											(gpio_bus_o),
	
	.tx_pll_select_pll_select									(1'b0),
	
	.misc_ff_tx_crc_fwd        								(1'b0),
	.misc_ff_tx_septy          								(),
	.misc_tx_ff_uflow          								(),
	.misc_ff_tx_a_full         								(),
	.misc_ff_tx_a_empty        								(),
	.misc_rx_err_stat          								(),
	.misc_rx_frm_type          								(),
	.misc_ff_rx_dsav           								(),
	.misc_ff_rx_a_full         								(),
	.misc_ff_rx_a_empty        								(),
	.gmii_gmii_rx_d            								(gmii_rx_d_i),
	.gmii_gmii_rx_dv           								(gmii_rx_dv_i),
	.gmii_gmii_rx_err          								(gmii_rx_err),
	.gmii_gmii_tx_d            								(gmii_tx_d),
	.gmii_gmii_tx_en           								(gmii_tx_en),
	.gmii_gmii_tx_err          								(gmii_tx_err),
	.mii_mii_rx_d              								(),
	.mii_mii_rx_dv             								(),
	.mii_mii_rx_err            								(),
	.mii_mii_tx_d              								(),
	.mii_mii_tx_en             								(),
	.mii_mii_tx_err            								(),
	.status_1_set_10           								(1'b0),
	.status_1_set_1000         								(1'b1),
	.status_1_eth_mode         								(),
	.status_1_ena_10           								(),
	.mdio_mdc                  								(mdio_mdc),
	.mdio_mdio_in              								(mdio_in),
	.mdio_mdio_out             								(mdio_out),
	.mdio_mdio_oen             								(mdio_oen),
	.tx_clock_clk              								(tx_clock_clk),
	.rx_clock_clk              								(rx_clock_clk)


);


endmodule