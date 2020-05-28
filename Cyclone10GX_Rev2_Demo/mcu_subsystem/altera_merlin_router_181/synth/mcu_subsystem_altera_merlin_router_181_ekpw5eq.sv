// (C) 2001-2019 Intel Corporation. All rights reserved.
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



// Your use of Altera Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License Subscription 
// Agreement, Altera MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// $Id: //acds/rel/18.1/ip/merlin/altera_merlin_router/altera_merlin_router.sv.terp#1 $
// $Revision: #1 $
// $Date: 2018/07/29 $

// -------------------------------------------------------
// Merlin Router
//
// Asserts the appropriate one-hot encoded channel based on 
// either (a) the address or (b) the dest id. The DECODER_TYPE
// parameter controls this behaviour. 0 means address decoder,
// 1 means dest id decoder.
//
// In the case of (a), it also sets the destination id.
// -------------------------------------------------------

`timescale 1 ns / 1 ns

module mcu_subsystem_altera_merlin_router_181_ekpw5eq_default_decode
  #(
     parameter DEFAULT_CHANNEL = 27,
               DEFAULT_WR_CHANNEL = -1,
               DEFAULT_RD_CHANNEL = -1,
               DEFAULT_DESTID = 13 
   )
  (output [117 - 113 : 0] default_destination_id,
   output [33-1 : 0] default_wr_channel,
   output [33-1 : 0] default_rd_channel,
   output [33-1 : 0] default_src_channel
  );

  assign default_destination_id = 
    DEFAULT_DESTID[117 - 113 : 0];

  generate
    if (DEFAULT_CHANNEL == -1) begin : no_default_channel_assignment
      assign default_src_channel = '0;
    end
    else begin : default_channel_assignment
      assign default_src_channel = 33'b1 << DEFAULT_CHANNEL;
    end
  endgenerate

  generate
    if (DEFAULT_RD_CHANNEL == -1) begin : no_default_rw_channel_assignment
      assign default_wr_channel = '0;
      assign default_rd_channel = '0;
    end
    else begin : default_rw_channel_assignment
      assign default_wr_channel = 33'b1 << DEFAULT_WR_CHANNEL;
      assign default_rd_channel = 33'b1 << DEFAULT_RD_CHANNEL;
    end
  endgenerate

endmodule


module mcu_subsystem_altera_merlin_router_181_ekpw5eq
(
    // -------------------
    // Clock & Reset
    // -------------------
    input clk,
    input reset,

    // -------------------
    // Command Sink (Input)
    // -------------------
    input                       sink_valid,
    input  [140-1 : 0]    sink_data,
    input                       sink_startofpacket,
    input                       sink_endofpacket,
    output                      sink_ready,

    // -------------------
    // Command Source (Output)
    // -------------------
    output                          src_valid,
    output reg [140-1    : 0] src_data,
    output reg [33-1 : 0] src_channel,
    output                          src_startofpacket,
    output                          src_endofpacket,
    input                           src_ready
);

    // -------------------------------------------------------
    // Local parameters and variables
    // -------------------------------------------------------
    localparam PKT_ADDR_H = 67;
    localparam PKT_ADDR_L = 36;
    localparam PKT_DEST_ID_H = 117;
    localparam PKT_DEST_ID_L = 113;
    localparam PKT_PROTECTION_H = 121;
    localparam PKT_PROTECTION_L = 119;
    localparam ST_DATA_W = 140;
    localparam ST_CHANNEL_W = 33;
    localparam DECODER_TYPE = 0;

    localparam PKT_TRANS_WRITE = 70;
    localparam PKT_TRANS_READ  = 71;

    localparam PKT_ADDR_W = PKT_ADDR_H-PKT_ADDR_L + 1;
    localparam PKT_DEST_ID_W = PKT_DEST_ID_H-PKT_DEST_ID_L + 1;



    // -------------------------------------------------------
    // Figure out the number of bits to mask off for each slave span
    // during address decoding
    // -------------------------------------------------------
    localparam PAD0 = log2ceil(64'h80000000 - 64'h0); 
    localparam PAD1 = log2ceil(64'h88000000 - 64'h80000000); 
    localparam PAD2 = log2ceil(64'h88040000 - 64'h88020000); 
    localparam PAD3 = log2ceil(64'h88050000 - 64'h88040000); 
    localparam PAD4 = log2ceil(64'h88050000 - 64'h88040000); 
    localparam PAD5 = log2ceil(64'h88060000 - 64'h88050000); 
    localparam PAD6 = log2ceil(64'h88060000 - 64'h88050000); 
    localparam PAD7 = log2ceil(64'h88064000 - 64'h88060000); 
    localparam PAD8 = log2ceil(64'h88064000 - 64'h88060000); 
    localparam PAD9 = log2ceil(64'h88068000 - 64'h88064000); 
    localparam PAD10 = log2ceil(64'h88068000 - 64'h88064000); 
    localparam PAD11 = log2ceil(64'h88069000 - 64'h88068000); 
    localparam PAD12 = log2ceil(64'h8806a000 - 64'h88069000); 
    localparam PAD13 = log2ceil(64'h8806b000 - 64'h8806a000); 
    localparam PAD14 = log2ceil(64'h8806b000 - 64'h8806a000); 
    localparam PAD15 = log2ceil(64'h8806c000 - 64'h8806b000); 
    localparam PAD16 = log2ceil(64'h8806c000 - 64'h8806b000); 
    localparam PAD17 = log2ceil(64'h8806d000 - 64'h8806c000); 
    localparam PAD18 = log2ceil(64'h8806e000 - 64'h8806d000); 
    localparam PAD19 = log2ceil(64'h8806f000 - 64'h8806e000); 
    localparam PAD20 = log2ceil(64'h88070000 - 64'h8806f000); 
    localparam PAD21 = log2ceil(64'h88070000 - 64'h8806f000); 
    localparam PAD22 = log2ceil(64'h88071000 - 64'h88070000); 
    localparam PAD23 = log2ceil(64'h88071000 - 64'h88070000); 
    localparam PAD24 = log2ceil(64'h88072000 - 64'h88071000); 
    localparam PAD25 = log2ceil(64'h88073000 - 64'h88072800); 
    localparam PAD26 = log2ceil(64'h88073040 - 64'h88073000); 
    localparam PAD27 = log2ceil(64'h88073080 - 64'h88073040); 
    localparam PAD28 = log2ceil(64'h880730a0 - 64'h88073080); 
    localparam PAD29 = log2ceil(64'h880730c0 - 64'h880730a0); 
    localparam PAD30 = log2ceil(64'h880730e0 - 64'h880730c0); 
    localparam PAD31 = log2ceil(64'h88073100 - 64'h880730e0); 
    localparam PAD32 = log2ceil(64'h88073108 - 64'h88073100); 
    // -------------------------------------------------------
    // Work out which address bits are significant based on the
    // address range of the slaves. If the required width is too
    // large or too small, we use the address field width instead.
    // -------------------------------------------------------
    localparam ADDR_RANGE = 64'h88073108;
    localparam RANGE_ADDR_WIDTH = log2ceil(ADDR_RANGE);
    localparam OPTIMIZED_ADDR_H = (RANGE_ADDR_WIDTH > PKT_ADDR_W) ||
                                  (RANGE_ADDR_WIDTH == 0) ?
                                        PKT_ADDR_H :
                                        PKT_ADDR_L + RANGE_ADDR_WIDTH - 1;

    localparam RG = RANGE_ADDR_WIDTH-1;
    localparam REAL_ADDRESS_RANGE = OPTIMIZED_ADDR_H - PKT_ADDR_L;

      reg [PKT_ADDR_W-1 : 0] address;
      always @* begin
        address = {PKT_ADDR_W{1'b0}};
        address [REAL_ADDRESS_RANGE:0] = sink_data[OPTIMIZED_ADDR_H : PKT_ADDR_L];
      end   

    // -------------------------------------------------------
    // Pass almost everything through, untouched
    // -------------------------------------------------------
    assign sink_ready        = src_ready;
    assign src_valid         = sink_valid;
    assign src_startofpacket = sink_startofpacket;
    assign src_endofpacket   = sink_endofpacket;
    wire [PKT_DEST_ID_W-1:0] default_destid;
    wire [33-1 : 0] default_src_channel;




    // -------------------------------------------------------
    // Write and read transaction signals
    // -------------------------------------------------------
    wire write_transaction;
    assign write_transaction = sink_data[PKT_TRANS_WRITE];
    wire read_transaction;
    assign read_transaction  = sink_data[PKT_TRANS_READ];


    mcu_subsystem_altera_merlin_router_181_ekpw5eq_default_decode the_default_decode(
      .default_destination_id (default_destid),
      .default_wr_channel   (),
      .default_rd_channel   (),
      .default_src_channel  (default_src_channel)
    );

    always @* begin
        src_data    = sink_data;
        src_channel = default_src_channel;
        src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = default_destid;

        // --------------------------------------------------
        // Address Decoder
        // Sets the channel and destination ID based on the address
        // --------------------------------------------------

    // ( 0x0 .. 0x80000000 )
    if ( {address[RG:PAD0],{PAD0{1'b0}}} == 32'h0   ) begin
            src_channel = 33'b000001000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 13;
    end

    // ( 0x80000000 .. 0x88000000 )
    if ( {address[RG:PAD1],{PAD1{1'b0}}} == 32'h80000000   ) begin
            src_channel = 33'b000000001000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 16;
    end

    // ( 0x88020000 .. 0x88040000 )
    if ( {address[RG:PAD2],{PAD2{1'b0}}} == 32'h88020000   ) begin
            src_channel = 33'b000010000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 21;
    end

    // ( 0x88040000 .. 0x88050000 )
    if ( {address[RG:PAD3],{PAD3{1'b0}}} == 32'h88040000  && write_transaction  ) begin
            src_channel = 33'b000000000000000000100000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 6;
    end

    // ( 0x88040000 .. 0x88050000 )
    if ( {address[RG:PAD4],{PAD4{1'b0}}} == 32'h88040000  && read_transaction  ) begin
            src_channel = 33'b000000000000000001000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 6;
    end

    // ( 0x88050000 .. 0x88060000 )
    if ( {address[RG:PAD5],{PAD5{1'b0}}} == 32'h88050000  && write_transaction  ) begin
            src_channel = 33'b000000000000000000000000100000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 0;
    end

    // ( 0x88050000 .. 0x88060000 )
    if ( {address[RG:PAD6],{PAD6{1'b0}}} == 32'h88050000  && read_transaction  ) begin
            src_channel = 33'b000000000000000000000001000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 0;
    end

    // ( 0x88060000 .. 0x88064000 )
    if ( {address[RG:PAD7],{PAD7{1'b0}}} == 32'h88060000  && write_transaction  ) begin
            src_channel = 33'b000000000000000000000000001000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 9;
    end

    // ( 0x88060000 .. 0x88064000 )
    if ( {address[RG:PAD8],{PAD8{1'b0}}} == 32'h88060000  && read_transaction  ) begin
            src_channel = 33'b000000000000000000000000010000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 9;
    end

    // ( 0x88064000 .. 0x88068000 )
    if ( {address[RG:PAD9],{PAD9{1'b0}}} == 32'h88064000  && write_transaction  ) begin
            src_channel = 33'b000000000000000000000000000010000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 3;
    end

    // ( 0x88064000 .. 0x88068000 )
    if ( {address[RG:PAD10],{PAD10{1'b0}}} == 32'h88064000  && read_transaction  ) begin
            src_channel = 33'b000000000000000000000000000100000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 3;
    end

    // ( 0x88068000 .. 0x88069000 )
    if ( {address[RG:PAD11],{PAD11{1'b0}}} == 32'h88068000   ) begin
            src_channel = 33'b000000000100000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 12;
    end

    // ( 0x88069000 .. 0x8806a000 )
    if ( {address[RG:PAD12],{PAD12{1'b0}}} == 32'h88069000   ) begin
            src_channel = 33'b000000000010000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 11;
    end

    // ( 0x8806a000 .. 0x8806b000 )
    if ( {address[RG:PAD13],{PAD13{1'b0}}} == 32'h8806a000  && write_transaction  ) begin
            src_channel = 33'b000000000000000000001000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 7;
    end

    // ( 0x8806a000 .. 0x8806b000 )
    if ( {address[RG:PAD14],{PAD14{1'b0}}} == 32'h8806a000  && read_transaction  ) begin
            src_channel = 33'b000000000000000000010000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 7;
    end

    // ( 0x8806b000 .. 0x8806c000 )
    if ( {address[RG:PAD15],{PAD15{1'b0}}} == 32'h8806b000  && write_transaction  ) begin
            src_channel = 33'b000000000000000000000010000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 1;
    end

    // ( 0x8806b000 .. 0x8806c000 )
    if ( {address[RG:PAD16],{PAD16{1'b0}}} == 32'h8806b000  && read_transaction  ) begin
            src_channel = 33'b000000000000000000000100000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 1;
    end

    // ( 0x8806c000 .. 0x8806d000 )
    if ( {address[RG:PAD17],{PAD17{1'b0}}} == 32'h8806c000   ) begin
            src_channel = 33'b000000100000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 14;
    end

    // ( 0x8806d000 .. 0x8806e000 )
    if ( {address[RG:PAD18],{PAD18{1'b0}}} == 32'h8806d000   ) begin
            src_channel = 33'b000000000001000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 10;
    end

    // ( 0x8806e000 .. 0x8806f000 )
    if ( {address[RG:PAD19],{PAD19{1'b0}}} == 32'h8806e000   ) begin
            src_channel = 33'b000000000000100000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 5;
    end

    // ( 0x8806f000 .. 0x88070000 )
    if ( {address[RG:PAD20],{PAD20{1'b0}}} == 32'h8806f000  && write_transaction  ) begin
            src_channel = 33'b000000000000000000000000000000100;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 8;
    end

    // ( 0x8806f000 .. 0x88070000 )
    if ( {address[RG:PAD21],{PAD21{1'b0}}} == 32'h8806f000  && read_transaction  ) begin
            src_channel = 33'b000000000000000000000000000001000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 8;
    end

    // ( 0x88070000 .. 0x88071000 )
    if ( {address[RG:PAD22],{PAD22{1'b0}}} == 32'h88070000  && write_transaction  ) begin
            src_channel = 33'b000000000000000000000000000000001;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 2;
    end

    // ( 0x88070000 .. 0x88071000 )
    if ( {address[RG:PAD23],{PAD23{1'b0}}} == 32'h88070000  && read_transaction  ) begin
            src_channel = 33'b000000000000000000000000000000010;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 2;
    end

    // ( 0x88071000 .. 0x88072000 )
    if ( {address[RG:PAD24],{PAD24{1'b0}}} == 32'h88071000   ) begin
            src_channel = 33'b000000000000010000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 4;
    end

    // ( 0x88072800 .. 0x88073000 )
    if ( {address[RG:PAD25],{PAD25{1'b0}}} == 32'h88072800   ) begin
            src_channel = 33'b000000000000001000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 20;
    end

    // ( 0x88073000 .. 0x88073040 )
    if ( {address[RG:PAD26],{PAD26{1'b0}}} == 32'h88073000   ) begin
            src_channel = 33'b000000010000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 15;
    end

    // ( 0x88073040 .. 0x88073080 )
    if ( {address[RG:PAD27],{PAD27{1'b0}}} == 32'h88073040   ) begin
            src_channel = 33'b000000000000000100000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 18;
    end

    // ( 0x88073080 .. 0x880730a0 )
    if ( {address[RG:PAD28],{PAD28{1'b0}}} == 32'h88073080   ) begin
            src_channel = 33'b100000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 22;
    end

    // ( 0x880730a0 .. 0x880730c0 )
    if ( {address[RG:PAD29],{PAD29{1'b0}}} == 32'h880730a0   ) begin
            src_channel = 33'b010000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 17;
    end

    // ( 0x880730c0 .. 0x880730e0 )
    if ( {address[RG:PAD30],{PAD30{1'b0}}} == 32'h880730c0   ) begin
            src_channel = 33'b001000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 23;
    end

    // ( 0x880730e0 .. 0x88073100 )
    if ( {address[RG:PAD31],{PAD31{1'b0}}} == 32'h880730e0   ) begin
            src_channel = 33'b000100000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 24;
    end

    // ( 0x88073100 .. 0x88073108 )
    if ( {address[RG:PAD32],{PAD32{1'b0}}} == 32'h88073100   ) begin
            src_channel = 33'b000000000000000010000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 19;
    end

end


    // --------------------------------------------------
    // Ceil(log2()) function
    // --------------------------------------------------
    function integer log2ceil;
        input reg[65:0] val;
        reg [65:0] i;

        begin
            i = 1;
            log2ceil = 0;

            while (i < val) begin
                log2ceil = log2ceil + 1;
                i = i << 1;
            end
        end
    endfunction

endmodule


