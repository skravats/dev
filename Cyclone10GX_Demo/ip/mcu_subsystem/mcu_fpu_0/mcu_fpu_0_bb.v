module mcu_fpu_0 (
		input  wire [31:0] s1_dataa,     // s1.dataa
		input  wire [31:0] s1_datab,     //   .datab
		input  wire [3:0]  s1_n,         //   .n
		output wire [31:0] s1_result,    //   .result
		input  wire        s2_clk,       // s2.clk
		input  wire        s2_clk_en,    //   .clk_en
		input  wire [31:0] s2_dataa,     //   .dataa
		input  wire [31:0] s2_datab,     //   .datab
		input  wire [2:0]  s2_n,         //   .n
		input  wire        s2_reset,     //   .reset
		input  wire        s2_reset_req, //   .reset_req
		input  wire        s2_start,     //   .start
		output wire        s2_done,      //   .done
		output wire [31:0] s2_result     //   .result
	);
endmodule

