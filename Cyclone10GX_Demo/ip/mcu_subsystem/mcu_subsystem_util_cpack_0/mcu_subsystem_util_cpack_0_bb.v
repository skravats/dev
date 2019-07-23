module mcu_subsystem_util_cpack_0 (
		input  wire         adc_clk,      //   if_adc_clk.clk
		input  wire         adc_rst,      //   if_adc_rst.reset
		output wire         adc_valid,    // if_adc_valid.valid
		output wire         adc_sync,     //  if_adc_sync.sync
		output wire [127:0] adc_data,     //  if_adc_data.data
		input  wire         adc_enable_0, //     adc_ch_0.enable
		input  wire         adc_valid_0,  //             .valid
		input  wire [63:0]  adc_data_0,   //             .data
		input  wire         adc_enable_1, //     adc_ch_1.enable
		input  wire         adc_valid_1,  //             .valid
		input  wire [63:0]  adc_data_1    //             .data
	);
endmodule

