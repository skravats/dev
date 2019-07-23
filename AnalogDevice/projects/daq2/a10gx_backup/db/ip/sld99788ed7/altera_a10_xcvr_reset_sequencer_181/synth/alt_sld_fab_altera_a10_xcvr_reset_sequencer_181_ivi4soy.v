
    (*altera_attribute = "-name SDC_STATEMENT \"if { [get_collection_size [get_pins -compatibility_mode -nowarn ~ALTERA_CLKUSR~~ibuf|o]] > 0 } { create_clock -name ~ALTERA_CLKUSR~ -period 8 [get_pins -compatibility_mode -nowarn ~ALTERA_CLKUSR~~ibuf|o] }\"" *)

module alt_sld_fab_altera_a10_xcvr_reset_sequencer_181_ivi4soy (
    input wire clk_in_0,  // Unused (this is part of a reset ep configured which isn't configured as a clock input)
    input  wire reset_req_0,
    output wire reset_out_0,
    input wire clk_in_1,  // Unused (this is part of a reset ep configured which isn't configured as a clock input)
    input  wire reset_req_1,
    output wire reset_out_1,
    input wire clk_in_2,  // Unused (this is part of a reset ep configured which isn't configured as a clock input)
    input  wire reset_req_2,
    output wire reset_out_2,
    input wire clk_in_3,  // Unused (this is part of a reset ep configured which isn't configured as a clock input)
    input  wire reset_req_3,
    output wire reset_out_3,
    input wire clk_in_4,  // Unused (this is part of a reset ep configured which isn't configured as a clock input)
    input  wire reset_req_4,
    output wire reset_out_4,
    input wire clk_in_5,  // Unused (this is part of a reset ep configured which isn't configured as a clock input)
    input  wire reset_req_5,
    output wire reset_out_5,
    input wire clk_in_6,  // Unused (this is part of a reset ep configured which isn't configured as a clock input)
    input  wire reset_req_6,
    output wire reset_out_6,
    input wire clk_in_7,  // Unused (this is part of a reset ep configured which isn't configured as a clock input)
    input  wire reset_req_7,
    output wire reset_out_7
);
    
wire [8-1:0] reset_req;
wire [8-1:0] reset_out;

// Assgnments to break apart the bus
assign reset_req[0]  = reset_req_0;
assign reset_out_0  = reset_out[0];
assign reset_req[1]  = reset_req_1;
assign reset_out_1  = reset_out[1];
assign reset_req[2]  = reset_req_2;
assign reset_out_2  = reset_out[2];
assign reset_req[3]  = reset_req_3;
assign reset_out_3  = reset_out[3];
assign reset_req[4]  = reset_req_4;
assign reset_out_4  = reset_out[4];
assign reset_req[5]  = reset_req_5;
assign reset_out_5  = reset_out[5];
assign reset_req[6]  = reset_req_6;
assign reset_out_6  = reset_out[6];
assign reset_req[7]  = reset_req_7;
assign reset_out_7  = reset_out[7];

  wire altera_clk_user_int;
  twentynm_oscillator ALTERA_INSERTED_INTOSC_FOR_TRS
  (
    .clkout(altera_clk_user_int),
    .clkout1(),
    .oscena(1'b1)
  );

altera_xcvr_reset_sequencer
#(
  .CLK_FREQ_IN_HZ              ( 125000000 ),
  .RESET_SEPARATION_NS         ( 200       ),
  .NUM_RESETS                  ( 8    )              // total number of resets to sequence
                                                     // rx/tx_analog, pll_powerdown
) altera_reset_sequencer (
  // Input clock
  .altera_clk_user             ( altera_clk_user_int ),       // Connect to CLKUSR
  // Reset requests and acknowledgements
  .reset_req                   ( reset_req       ),
  .reset_out                   ( reset_out       ) 
);
endmodule
