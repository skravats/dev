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
	
	output wire        tx_0,
	input  wire        rx_0,
	
	output wire        tx_1,
	input  wire        rx_1,
	
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
	output                     spi_dir
);


reg [31:0] counter_reset;
reg [31:0] counter;
reg global_reset;

wire [31:0] gpio_bus_i;
wire [31:0] gpio_bus_o;
wire [7:0]  spi_csn_s;
wire        spi_miso_s;
wire        spi_mosi_s;
wire        spi_clk;
wire        dac_fifo_bypass;

  
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
	.clk100_clk			(clk_100),
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

	// transceiver
	.tx_0_tx_serial_data											(tx_0),
	.rx_0_rx_serial_data											(rx_0),
	
	.tx_1_tx_serial_data											(tx_1),
	.rx_1_rx_serial_data											(rx_1),

	.dbg_reset_reset												(),
	
	// FMC
	// SPI
	.spi_MISO														(spi_miso_s),
	.spi_MOSI														(spi_mosi_s),
	.spi_SCLK														(spi_clk),
	.spi_SS_n														(spi_csn_s),
	// i2c
	.i2c_sda_in														(),
	.i2c_scl_in														(),
	.i2c_sda_oe														(),
	.i2c_scl_oe														(),
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

	.fmc_gpio_in_port												(gpio_bus_i),
	.fmc_gpio_out_port											(gpio_bus_o)
	
);


endmodule