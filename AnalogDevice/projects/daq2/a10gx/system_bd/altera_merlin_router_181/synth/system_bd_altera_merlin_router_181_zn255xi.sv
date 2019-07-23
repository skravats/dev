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


// $Id: //acds/rel/18.1std/ip/merlin/altera_merlin_router/altera_merlin_router.sv.terp#1 $
// $Revision: #1 $
// $Date: 2018/07/18 $
// $Author: psgswbuild $

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

module system_bd_altera_merlin_router_181_zn255xi_default_decode
  #(
     parameter DEFAULT_CHANNEL = 21,
               DEFAULT_WR_CHANNEL = -1,
               DEFAULT_RD_CHANNEL = -1,
               DEFAULT_DESTID = 20 
   )
  (output [116 - 111 : 0] default_destination_id,
   output [45-1 : 0] default_wr_channel,
   output [45-1 : 0] default_rd_channel,
   output [45-1 : 0] default_src_channel
  );

  assign default_destination_id = 
    DEFAULT_DESTID[116 - 111 : 0];

  generate
    if (DEFAULT_CHANNEL == -1) begin : no_default_channel_assignment
      assign default_src_channel = '0;
    end
    else begin : default_channel_assignment
      assign default_src_channel = 45'b1 << DEFAULT_CHANNEL;
    end
  endgenerate

  generate
    if (DEFAULT_RD_CHANNEL == -1) begin : no_default_rw_channel_assignment
      assign default_wr_channel = '0;
      assign default_rd_channel = '0;
    end
    else begin : default_rw_channel_assignment
      assign default_wr_channel = 45'b1 << DEFAULT_WR_CHANNEL;
      assign default_rd_channel = 45'b1 << DEFAULT_RD_CHANNEL;
    end
  endgenerate

endmodule


module system_bd_altera_merlin_router_181_zn255xi
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
    input  [130-1 : 0]    sink_data,
    input                       sink_startofpacket,
    input                       sink_endofpacket,
    output                      sink_ready,

    // -------------------
    // Command Source (Output)
    // -------------------
    output                          src_valid,
    output reg [130-1    : 0] src_data,
    output reg [45-1 : 0] src_channel,
    output                          src_startofpacket,
    output                          src_endofpacket,
    input                           src_ready
);

    // -------------------------------------------------------
    // Local parameters and variables
    // -------------------------------------------------------
    localparam PKT_ADDR_H = 67;
    localparam PKT_ADDR_L = 36;
    localparam PKT_DEST_ID_H = 116;
    localparam PKT_DEST_ID_L = 111;
    localparam PKT_PROTECTION_H = 120;
    localparam PKT_PROTECTION_L = 118;
    localparam ST_DATA_W = 130;
    localparam ST_CHANNEL_W = 45;
    localparam DECODER_TYPE = 0;

    localparam PKT_TRANS_WRITE = 70;
    localparam PKT_TRANS_READ  = 71;

    localparam PKT_ADDR_W = PKT_ADDR_H-PKT_ADDR_L + 1;
    localparam PKT_DEST_ID_W = PKT_DEST_ID_H-PKT_DEST_ID_L + 1;



    // -------------------------------------------------------
    // Figure out the number of bits to mask off for each slave span
    // during address decoding
    // -------------------------------------------------------
    localparam PAD0 = log2ceil(64'h10000000 - 64'h0); 
    localparam PAD1 = log2ceil(64'h10024000 - 64'h10020000); 
    localparam PAD2 = log2ceil(64'h10024000 - 64'h10020000); 
    localparam PAD3 = log2ceil(64'h10025000 - 64'h10024000); 
    localparam PAD4 = log2ceil(64'h10025000 - 64'h10024000); 
    localparam PAD5 = log2ceil(64'h10026000 - 64'h10025000); 
    localparam PAD6 = log2ceil(64'h10027000 - 64'h10026000); 
    localparam PAD7 = log2ceil(64'h10029000 - 64'h10028000); 
    localparam PAD8 = log2ceil(64'h1002a000 - 64'h10029000); 
    localparam PAD9 = log2ceil(64'h1002b000 - 64'h1002a000); 
    localparam PAD10 = log2ceil(64'h1002c000 - 64'h1002b000); 
    localparam PAD11 = log2ceil(64'h1002d000 - 64'h1002c000); 
    localparam PAD12 = log2ceil(64'h1002d000 - 64'h1002c000); 
    localparam PAD13 = log2ceil(64'h10040000 - 64'h10030000); 
    localparam PAD14 = log2ceil(64'h10040000 - 64'h10030000); 
    localparam PAD15 = log2ceil(64'h10044000 - 64'h10040000); 
    localparam PAD16 = log2ceil(64'h10044000 - 64'h10040000); 
    localparam PAD17 = log2ceil(64'h10045000 - 64'h10044000); 
    localparam PAD18 = log2ceil(64'h10045000 - 64'h10044000); 
    localparam PAD19 = log2ceil(64'h10046000 - 64'h10045000); 
    localparam PAD20 = log2ceil(64'h10049000 - 64'h10048000); 
    localparam PAD21 = log2ceil(64'h1004a000 - 64'h10049000); 
    localparam PAD22 = log2ceil(64'h1004b000 - 64'h1004a000); 
    localparam PAD23 = log2ceil(64'h1004c000 - 64'h1004b000); 
    localparam PAD24 = log2ceil(64'h1004d000 - 64'h1004c000); 
    localparam PAD25 = log2ceil(64'h1004d000 - 64'h1004c000); 
    localparam PAD26 = log2ceil(64'h10060000 - 64'h10050000); 
    localparam PAD27 = log2ceil(64'h10060000 - 64'h10050000); 
    localparam PAD28 = log2ceil(64'h10180000 - 64'h10140000); 
    localparam PAD29 = log2ceil(64'h10181000 - 64'h10180800); 
    localparam PAD30 = log2ceil(64'h10181400 - 64'h10181000); 
    localparam PAD31 = log2ceil(64'h10181420 - 64'h10181400); 
    localparam PAD32 = log2ceil(64'h10181440 - 64'h10181420); 
    localparam PAD33 = log2ceil(64'h10181460 - 64'h10181440); 
    localparam PAD34 = log2ceil(64'h10181480 - 64'h10181460); 
    localparam PAD35 = log2ceil(64'h101814a0 - 64'h10181480); 
    localparam PAD36 = log2ceil(64'h101814c0 - 64'h101814a0); 
    localparam PAD37 = log2ceil(64'h101814d0 - 64'h101814c0); 
    localparam PAD38 = log2ceil(64'h101814e0 - 64'h101814d0); 
    localparam PAD39 = log2ceil(64'h101814e8 - 64'h101814e0); 
    localparam PAD40 = log2ceil(64'h101814f0 - 64'h101814e8); 
    localparam PAD41 = log2ceil(64'h101814f8 - 64'h101814f0); 
    localparam PAD42 = log2ceil(64'h10181510 - 64'h10181500); 
    localparam PAD43 = log2ceil(64'h10181540 - 64'h10181520); 
    localparam PAD44 = log2ceil(64'h12000000 - 64'h11000000); 
    // -------------------------------------------------------
    // Work out which address bits are significant based on the
    // address range of the slaves. If the required width is too
    // large or too small, we use the address field width instead.
    // -------------------------------------------------------
    localparam ADDR_RANGE = 64'h12000000;
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
    wire [45-1 : 0] default_src_channel;




    // -------------------------------------------------------
    // Write and read transaction signals
    // -------------------------------------------------------
    wire write_transaction;
    assign write_transaction = sink_data[PKT_TRANS_WRITE];
    wire read_transaction;
    assign read_transaction  = sink_data[PKT_TRANS_READ];


    system_bd_altera_merlin_router_181_zn255xi_default_decode the_default_decode(
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

    // ( 0x0 .. 0x10000000 )
    if ( {address[RG:PAD0],{PAD0{1'b0}}} == 29'h0   ) begin
            src_channel = 45'b000000000000000000000001000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 20;
    end

    // ( 0x10020000 .. 0x10024000 )
    if ( {address[RG:PAD1],{PAD1{1'b0}}} == 29'h10020000  && write_transaction  ) begin
            src_channel = 45'b000000000000000000000000000000000000000010000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 1;
    end

    // ( 0x10020000 .. 0x10024000 )
    if ( {address[RG:PAD2],{PAD2{1'b0}}} == 29'h10020000  && read_transaction  ) begin
            src_channel = 45'b000000000000000000000000000000000000000100000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 1;
    end

    // ( 0x10024000 .. 0x10025000 )
    if ( {address[RG:PAD3],{PAD3{1'b0}}} == 29'h10024000  && write_transaction  ) begin
            src_channel = 45'b000000000000000000000000000000000000000000001;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 0;
    end

    // ( 0x10024000 .. 0x10025000 )
    if ( {address[RG:PAD4],{PAD4{1'b0}}} == 29'h10024000  && read_transaction  ) begin
            src_channel = 45'b000000000000000000000000000000000000000000010;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 0;
    end

    // ( 0x10025000 .. 0x10026000 )
    if ( {address[RG:PAD5],{PAD5{1'b0}}} == 29'h10025000   ) begin
            src_channel = 45'b000000000000000000100000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 3;
    end

    // ( 0x10026000 .. 0x10027000 )
    if ( {address[RG:PAD6],{PAD6{1'b0}}} == 29'h10026000   ) begin
            src_channel = 45'b000000000000000000010000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 2;
    end

    // ( 0x10028000 .. 0x10029000 )
    if ( {address[RG:PAD7],{PAD7{1'b0}}} == 29'h10028000   ) begin
            src_channel = 45'b000000000000000010000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 7;
    end

    // ( 0x10029000 .. 0x1002a000 )
    if ( {address[RG:PAD8],{PAD8{1'b0}}} == 29'h10029000   ) begin
            src_channel = 45'b000000000000000100000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 9;
    end

    // ( 0x1002a000 .. 0x1002b000 )
    if ( {address[RG:PAD9],{PAD9{1'b0}}} == 29'h1002a000   ) begin
            src_channel = 45'b000000000000001000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 11;
    end

    // ( 0x1002b000 .. 0x1002c000 )
    if ( {address[RG:PAD10],{PAD10{1'b0}}} == 29'h1002b000   ) begin
            src_channel = 45'b000000000000010000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 13;
    end

    // ( 0x1002c000 .. 0x1002d000 )
    if ( {address[RG:PAD11],{PAD11{1'b0}}} == 29'h1002c000  && write_transaction  ) begin
            src_channel = 45'b000000000000000000000000000000000000100000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 16;
    end

    // ( 0x1002c000 .. 0x1002d000 )
    if ( {address[RG:PAD12],{PAD12{1'b0}}} == 29'h1002c000  && read_transaction  ) begin
            src_channel = 45'b000000000000000000000000000000000001000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 16;
    end

    // ( 0x10030000 .. 0x10040000 )
    if ( {address[RG:PAD13],{PAD13{1'b0}}} == 29'h10030000  && write_transaction  ) begin
            src_channel = 45'b000000000000000000000000000000000010000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 15;
    end

    // ( 0x10030000 .. 0x10040000 )
    if ( {address[RG:PAD14],{PAD14{1'b0}}} == 29'h10030000  && read_transaction  ) begin
            src_channel = 45'b000000000000000000000000000000000100000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 15;
    end

    // ( 0x10040000 .. 0x10044000 )
    if ( {address[RG:PAD15],{PAD15{1'b0}}} == 29'h10040000  && write_transaction  ) begin
            src_channel = 45'b000000000000000000000000000000000000001000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 5;
    end

    // ( 0x10040000 .. 0x10044000 )
    if ( {address[RG:PAD16],{PAD16{1'b0}}} == 29'h10040000  && read_transaction  ) begin
            src_channel = 45'b000000000000000000000000000000000000010000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 5;
    end

    // ( 0x10044000 .. 0x10045000 )
    if ( {address[RG:PAD17],{PAD17{1'b0}}} == 29'h10044000  && write_transaction  ) begin
            src_channel = 45'b000000000000000000000000000000000000000000100;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 4;
    end

    // ( 0x10044000 .. 0x10045000 )
    if ( {address[RG:PAD18],{PAD18{1'b0}}} == 29'h10044000  && read_transaction  ) begin
            src_channel = 45'b000000000000000000000000000000000000000001000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 4;
    end

    // ( 0x10045000 .. 0x10046000 )
    if ( {address[RG:PAD19],{PAD19{1'b0}}} == 29'h10045000   ) begin
            src_channel = 45'b000000000000000001000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 6;
    end

    // ( 0x10048000 .. 0x10049000 )
    if ( {address[RG:PAD20],{PAD20{1'b0}}} == 29'h10048000   ) begin
            src_channel = 45'b000000000000100000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 8;
    end

    // ( 0x10049000 .. 0x1004a000 )
    if ( {address[RG:PAD21],{PAD21{1'b0}}} == 29'h10049000   ) begin
            src_channel = 45'b000000000001000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 10;
    end

    // ( 0x1004a000 .. 0x1004b000 )
    if ( {address[RG:PAD22],{PAD22{1'b0}}} == 29'h1004a000   ) begin
            src_channel = 45'b000000000010000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 12;
    end

    // ( 0x1004b000 .. 0x1004c000 )
    if ( {address[RG:PAD23],{PAD23{1'b0}}} == 29'h1004b000   ) begin
            src_channel = 45'b000000000100000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 14;
    end

    // ( 0x1004c000 .. 0x1004d000 )
    if ( {address[RG:PAD24],{PAD24{1'b0}}} == 29'h1004c000  && write_transaction  ) begin
            src_channel = 45'b000000000000000000000000000000001000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 18;
    end

    // ( 0x1004c000 .. 0x1004d000 )
    if ( {address[RG:PAD25],{PAD25{1'b0}}} == 29'h1004c000  && read_transaction  ) begin
            src_channel = 45'b000000000000000000000000000000010000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 18;
    end

    // ( 0x10050000 .. 0x10060000 )
    if ( {address[RG:PAD26],{PAD26{1'b0}}} == 29'h10050000  && write_transaction  ) begin
            src_channel = 45'b000000000000000000000000000000100000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 17;
    end

    // ( 0x10050000 .. 0x10060000 )
    if ( {address[RG:PAD27],{PAD27{1'b0}}} == 29'h10050000  && read_transaction  ) begin
            src_channel = 45'b000000000000000000000000000001000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 17;
    end

    // ( 0x10140000 .. 0x10180000 )
    if ( {address[RG:PAD28],{PAD28{1'b0}}} == 29'h10140000   ) begin
            src_channel = 45'b000000010000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 32;
    end

    // ( 0x10180800 .. 0x10181000 )
    if ( {address[RG:PAD29],{PAD29{1'b0}}} == 29'h10180800   ) begin
            src_channel = 45'b000000000000000000000010000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 19;
    end

    // ( 0x10181000 .. 0x10181400 )
    if ( {address[RG:PAD30],{PAD30{1'b0}}} == 29'h10181000   ) begin
            src_channel = 45'b000000000000000000000000000100000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 21;
    end

    // ( 0x10181400 .. 0x10181420 )
    if ( {address[RG:PAD31],{PAD31{1'b0}}} == 29'h10181400   ) begin
            src_channel = 45'b010000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 33;
    end

    // ( 0x10181420 .. 0x10181440 )
    if ( {address[RG:PAD32],{PAD32{1'b0}}} == 29'h10181420   ) begin
            src_channel = 45'b000000100000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 34;
    end

    // ( 0x10181440 .. 0x10181460 )
    if ( {address[RG:PAD33],{PAD33{1'b0}}} == 29'h10181440  && write_transaction  ) begin
            src_channel = 45'b000000000000000000000100000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 23;
    end

    // ( 0x10181460 .. 0x10181480 )
    if ( {address[RG:PAD34],{PAD34{1'b0}}} == 29'h10181460  && write_transaction  ) begin
            src_channel = 45'b000000000000000000001000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 26;
    end

    // ( 0x10181480 .. 0x101814a0 )
    if ( {address[RG:PAD35],{PAD35{1'b0}}} == 29'h10181480   ) begin
            src_channel = 45'b000000000000000000000000100000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 25;
    end

    // ( 0x101814a0 .. 0x101814c0 )
    if ( {address[RG:PAD36],{PAD36{1'b0}}} == 29'h101814a0   ) begin
            src_channel = 45'b000000000000000000000000010000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 22;
    end

    // ( 0x101814c0 .. 0x101814d0 )
    if ( {address[RG:PAD37],{PAD37{1'b0}}} == 29'h101814c0   ) begin
            src_channel = 45'b000100000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 29;
    end

    // ( 0x101814d0 .. 0x101814e0 )
    if ( {address[RG:PAD38],{PAD38{1'b0}}} == 29'h101814d0   ) begin
            src_channel = 45'b000010000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 28;
    end

    // ( 0x101814e0 .. 0x101814e8 )
    if ( {address[RG:PAD39],{PAD39{1'b0}}} == 29'h101814e0  && read_transaction  ) begin
            src_channel = 45'b000000001000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 24;
    end

    // ( 0x101814e8 .. 0x101814f0 )
    if ( {address[RG:PAD40],{PAD40{1'b0}}} == 29'h101814e8  && read_transaction  ) begin
            src_channel = 45'b000000000000000000000000001000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 31;
    end

    // ( 0x101814f0 .. 0x101814f8 )
    if ( {address[RG:PAD41],{PAD41{1'b0}}} == 29'h101814f0   ) begin
            src_channel = 45'b000000000000000000000000000010000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 36;
    end

    // ( 0x10181500 .. 0x10181510 )
    if ( {address[RG:PAD42],{PAD42{1'b0}}} == 29'h10181500   ) begin
            src_channel = 45'b001000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 30;
    end

    // ( 0x10181520 .. 0x10181540 )
    if ( {address[RG:PAD43],{PAD43{1'b0}}} == 29'h10181520   ) begin
            src_channel = 45'b000001000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 35;
    end

    // ( 0x11000000 .. 0x12000000 )
    if ( {address[RG:PAD44],{PAD44{1'b0}}} == 29'h11000000   ) begin
            src_channel = 45'b100000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 27;
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


