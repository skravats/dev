module top(
	input wire M10_CLK,
	input wire BASE_BTN1,
	input wire BASE_BTN2,
	output wire BASE_LED1,
	output wire BASE_LED2,
	input wire DATA0,
	output wire DEVCLRn,
	output wire DIS_1,
	output wire DIS_2,
	output wire DIS_3,
	output wire DIS_4,
	output wire EN_0V9,
	output wire EN_0V95,
	output wire EN_1V8,
	output wire EN_1V8MB,
	output wire EN_1V8VIO,
	output wire EN_1V35,
	output wire EN_3V3MB,
	output wire EN_VTT,
	output wire LED1,
	output wire LED2,
	output wire LED3,
	output wire LED4,
	output wire MSEL0,
	output wire MSEL1,
	output wire nCONFIG,
	output wire nSTATUS,
	input wire PG_0V9,
	input wire PG_0V95,
	input wire PG_1V8,
	output wire PLL_RST,

	input wire RXD_IN,
	output wire RXD_OUT,
	input wire TCK_IN,
	output wire TCK_OUT,
	input wire TDI_IN,
	output wire TDI_OUT,
	input wire TDO_IN,
	output wire TDO_OUT,
	input wire TMS_IN,
	output wire TMS_OUT,
	input wire TXD_IN,
	output wire TXD_OUT,
	
	inout wire I2C_SCL,
	inout wire I2C_SDA
);

wire sda_oe;
wire scl_oe;
wire sda_in;
wire scl_in;


assign BASE_LED1 = BASE_BTN1;
assign BASE_LED2 = BASE_BTN2;
assign nCONFIG = BASE_BTN1;

assign DEVCLRn = 1'b1;
assign LED1 = nSTATUS;
assign LED3 = DATA0;
assign LED4 = DATA0;

assign DIS_1 = 1'b0;
assign DIS_2 = 1'b0;
assign DIS_3 = 1'b0;
assign DIS_4 = 1'b0;

assign MSEL0 = 1'b1;
assign MSEL1 = 1'b1;
assign PLL_RST = 1'b1;



assign EN_0V9 = 1'b1;


assign EN_0V95 = PG_0V9;
assign EN_1V8 = PG_0V95;
assign EN_1V8VIO = PG_1V8;

assign EN_1V8MB = PG_1V8;
assign EN_3V3MB = PG_1V8;
assign EN_1V35 = PG_1V8;
assign EN_VTT = PG_1V8;

assign RXD_OUT = RXD_IN;
assign TXD_OUT = TXD_IN;

assign TCK_OUT = TCK_IN;
assign TMS_OUT = TMS_IN;
assign TDI_OUT = TDI_IN;
assign TDO_OUT = TDO_IN;

assign scl_in = I2C_SCL;
assign sda_in = I2C_SDA;

assign I2C_SDA = sda_oe ? 1'b0 : 1'bz;
assign I2C_SCL = scl_oe ? 1'b0 : 1'bz;

mcu_system cpu(
	.clk_clk				(M10_CLK),
	.reset_reset_n		(1'b1),
	.serial_sda_in		(sda_in),
	.serial_scl_in		(scl_in),
	.serial_sda_oe		(sda_oe),
	.serial_scl_oe		(scl_oe)
);

endmodule

