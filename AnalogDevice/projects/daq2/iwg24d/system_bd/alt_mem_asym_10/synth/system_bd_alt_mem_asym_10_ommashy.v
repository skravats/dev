// system_bd_alt_mem_asym_10_ommashy.v

// This file was auto-generated from alt_mem_asym_hw.tcl.  If you edit it your changes
// will probably be lost.
// 
// Generated using ACDS version 18.1 625

`timescale 1 ps / 1 ps
module system_bd_alt_mem_asym_10_ommashy #(
		parameter A_ADDRESS_WIDTH = 0,
		parameter A_DATA_WIDTH    = 512,
		parameter B_ADDRESS_WIDTH = 12,
		parameter B_DATA_WIDTH    = 128
	) (
		input  wire [511:0] mem_i_datain,    // mem_i.datain
		input  wire [9:0]   mem_i_wraddress, //      .wraddress
		input  wire [11:0]  mem_i_rdaddress, //      .rdaddress
		input  wire         mem_i_wren,      //      .wren
		input  wire         mem_i_wrclock,   //      .wrclock
		input  wire         mem_i_rdclock,   //      .rdclock
		output wire [127:0] mem_o_dataout    // mem_o.dataout
	);

	generate
		// If any of the display statements (or deliberately broken
		// instantiations) within this generate block triggers then this module
		// has been instantiated this module with a set of parameters different
		// from those it was generated for.  This will usually result in a
		// non-functioning system.
		if (A_ADDRESS_WIDTH != 0)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					a_address_width_check ( .error(1'b1) );
		end
		if (A_DATA_WIDTH != 512)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					a_data_width_check ( .error(1'b1) );
		end
		if (B_ADDRESS_WIDTH != 12)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					b_address_width_check ( .error(1'b1) );
		end
		if (B_DATA_WIDTH != 128)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					b_data_width_check ( .error(1'b1) );
		end
	endgenerate

	system_bd_ram_2port_181_3tckbay alt_mem (
		.data      (mem_i_datain),    //  ram_input.datain
		.wraddress (mem_i_wraddress), //           .wraddress
		.rdaddress (mem_i_rdaddress), //           .rdaddress
		.wren      (mem_i_wren),      //           .wren
		.wrclock   (mem_i_wrclock),   //           .wrclock
		.rdclock   (mem_i_rdclock),   //           .rdclock
		.q         (mem_o_dataout)    // ram_output.dataout
	);

endmodule
