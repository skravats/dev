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


// (C) 2001-2013 Altera Corporation. All rights reserved.
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

 
// $Id: //acds/rel/13.1/ip/.../avalon-st_data_format_adapter.sv.terp#1 $
// $Revision: #1 $
// $Date: 2013/09/21 $
// $Author: dmunday $


// --------------------------------------------------------------------------------
//| Avalon Streaming Data Adapter
// --------------------------------------------------------------------------------

`timescale 1ns / 100ps

// ------------------------------------------
// Generation parameters:
//   output_name:        ethernet_data_format_adapter_181_jumd7li
//   usePackets:         true
//   hasInEmpty:         true
//   inEmptyWidth:       5
//   hasOutEmpty:        true 
//   outEmptyWidth:      2
//   inDataWidth:        256
//   outDataWidth:       32
//   channelWidth:       8
//   inErrorWidth:       8
//   outErrorWidth:      8
//   inSymbolsPerBeat:   32
//   outSymbolsPerBeat:  4
//   maxState:           31
//   stateWidth:         5
//   maxChannel:         255
//   symbolWidth:        8
//   numMemSymbols:      31
//   symbolWidth:        8


// ------------------------------------------

 
module ethernet_data_format_adapter_181_jumd7li (
 // Interface: in
 output reg         in_ready,
 input              in_valid,
 input [256-1 : 0]    in_data,
 input [8-1 : 0] in_channel,
 input [8-1 : 0] in_error,
 input              in_startofpacket,
 input              in_endofpacket,
 input [5-1 : 0] in_empty,
 // Interface: out
 input                out_ready,
 output reg           out_valid,
 output reg [32-1: 0]  out_data,
 output reg [8-1: 0] out_channel,
 output reg [8-1 : 0] out_error,
 output reg           out_startofpacket,
 output reg           out_endofpacket,
 output reg [2-1 : 0] out_empty,

  // Interface: clk
 input              clk,
 // Interface: reset
 input              reset_n

);



   // ---------------------------------------------------------------------
   //| Signal Declarations
   // ---------------------------------------------------------------------
   reg  [8-1:0]   state_read_addr;
   wire [5-1:0]   state_from_memory;
   reg  [5-1:0]   state;
   reg  [5-1:0]   new_state;
   reg  [5-1:0]   state_d1;
    
   reg            in_ready_d1;
   reg [8-1:0] mem_readaddr; 
   reg [8-1:0] mem_readaddr_d1;
   reg            a_ready;
   reg            a_valid;
   reg [8-1:0]    a_channel;
   reg [8-1:0]    a_data0; 
   reg [8-1:0]    a_data1; 
   reg [8-1:0]    a_data2; 
   reg [8-1:0]    a_data3; 
   reg [8-1:0]    a_data4; 
   reg [8-1:0]    a_data5; 
   reg [8-1:0]    a_data6; 
   reg [8-1:0]    a_data7; 
   reg [8-1:0]    a_data8; 
   reg [8-1:0]    a_data9; 
   reg [8-1:0]    a_data10; 
   reg [8-1:0]    a_data11; 
   reg [8-1:0]    a_data12; 
   reg [8-1:0]    a_data13; 
   reg [8-1:0]    a_data14; 
   reg [8-1:0]    a_data15; 
   reg [8-1:0]    a_data16; 
   reg [8-1:0]    a_data17; 
   reg [8-1:0]    a_data18; 
   reg [8-1:0]    a_data19; 
   reg [8-1:0]    a_data20; 
   reg [8-1:0]    a_data21; 
   reg [8-1:0]    a_data22; 
   reg [8-1:0]    a_data23; 
   reg [8-1:0]    a_data24; 
   reg [8-1:0]    a_data25; 
   reg [8-1:0]    a_data26; 
   reg [8-1:0]    a_data27; 
   reg [8-1:0]    a_data28; 
   reg [8-1:0]    a_data29; 
   reg [8-1:0]    a_data30; 
   reg [8-1:0]    a_data31; 
   reg            a_startofpacket;
   reg            a_endofpacket;
   reg  [5-1:0]   a_empty;
   reg  [8-1:0]   a_error;
   reg            b_ready;
   reg            b_valid;
   reg  [8-1:0]   b_channel;
   reg  [32-1:0]   b_data;
   reg            b_startofpacket; 
   wire           b_startofpacket_wire; 
   reg            b_endofpacket; 
   reg  [2-1:0]   b_empty;
   reg  [8-1:0]   b_error; 
   reg            mem_write0;
   reg  [8-1:0]   mem_writedata0;
   wire [8-1:0]   mem_readdata0;
   wire           mem_waitrequest0;
   reg  [8-1:0]   mem0[0:255];
   reg            mem_write1;
   reg  [8-1:0]   mem_writedata1;
   wire [8-1:0]   mem_readdata1;
   wire           mem_waitrequest1;
   reg  [8-1:0]   mem1[0:255];
   reg            mem_write2;
   reg  [8-1:0]   mem_writedata2;
   wire [8-1:0]   mem_readdata2;
   wire           mem_waitrequest2;
   reg  [8-1:0]   mem2[0:255];
   reg            mem_write3;
   reg  [8-1:0]   mem_writedata3;
   wire [8-1:0]   mem_readdata3;
   wire           mem_waitrequest3;
   reg  [8-1:0]   mem3[0:255];
   reg            mem_write4;
   reg  [8-1:0]   mem_writedata4;
   wire [8-1:0]   mem_readdata4;
   wire           mem_waitrequest4;
   reg  [8-1:0]   mem4[0:255];
   reg            mem_write5;
   reg  [8-1:0]   mem_writedata5;
   wire [8-1:0]   mem_readdata5;
   wire           mem_waitrequest5;
   reg  [8-1:0]   mem5[0:255];
   reg            mem_write6;
   reg  [8-1:0]   mem_writedata6;
   wire [8-1:0]   mem_readdata6;
   wire           mem_waitrequest6;
   reg  [8-1:0]   mem6[0:255];
   reg            mem_write7;
   reg  [8-1:0]   mem_writedata7;
   wire [8-1:0]   mem_readdata7;
   wire           mem_waitrequest7;
   reg  [8-1:0]   mem7[0:255];
   reg            mem_write8;
   reg  [8-1:0]   mem_writedata8;
   wire [8-1:0]   mem_readdata8;
   wire           mem_waitrequest8;
   reg  [8-1:0]   mem8[0:255];
   reg            mem_write9;
   reg  [8-1:0]   mem_writedata9;
   wire [8-1:0]   mem_readdata9;
   wire           mem_waitrequest9;
   reg  [8-1:0]   mem9[0:255];
   reg            mem_write10;
   reg  [8-1:0]   mem_writedata10;
   wire [8-1:0]   mem_readdata10;
   wire           mem_waitrequest10;
   reg  [8-1:0]   mem10[0:255];
   reg            mem_write11;
   reg  [8-1:0]   mem_writedata11;
   wire [8-1:0]   mem_readdata11;
   wire           mem_waitrequest11;
   reg  [8-1:0]   mem11[0:255];
   reg            mem_write12;
   reg  [8-1:0]   mem_writedata12;
   wire [8-1:0]   mem_readdata12;
   wire           mem_waitrequest12;
   reg  [8-1:0]   mem12[0:255];
   reg            mem_write13;
   reg  [8-1:0]   mem_writedata13;
   wire [8-1:0]   mem_readdata13;
   wire           mem_waitrequest13;
   reg  [8-1:0]   mem13[0:255];
   reg            mem_write14;
   reg  [8-1:0]   mem_writedata14;
   wire [8-1:0]   mem_readdata14;
   wire           mem_waitrequest14;
   reg  [8-1:0]   mem14[0:255];
   reg            mem_write15;
   reg  [8-1:0]   mem_writedata15;
   wire [8-1:0]   mem_readdata15;
   wire           mem_waitrequest15;
   reg  [8-1:0]   mem15[0:255];
   reg            mem_write16;
   reg  [8-1:0]   mem_writedata16;
   wire [8-1:0]   mem_readdata16;
   wire           mem_waitrequest16;
   reg  [8-1:0]   mem16[0:255];
   reg            mem_write17;
   reg  [8-1:0]   mem_writedata17;
   wire [8-1:0]   mem_readdata17;
   wire           mem_waitrequest17;
   reg  [8-1:0]   mem17[0:255];
   reg            mem_write18;
   reg  [8-1:0]   mem_writedata18;
   wire [8-1:0]   mem_readdata18;
   wire           mem_waitrequest18;
   reg  [8-1:0]   mem18[0:255];
   reg            mem_write19;
   reg  [8-1:0]   mem_writedata19;
   wire [8-1:0]   mem_readdata19;
   wire           mem_waitrequest19;
   reg  [8-1:0]   mem19[0:255];
   reg            mem_write20;
   reg  [8-1:0]   mem_writedata20;
   wire [8-1:0]   mem_readdata20;
   wire           mem_waitrequest20;
   reg  [8-1:0]   mem20[0:255];
   reg            mem_write21;
   reg  [8-1:0]   mem_writedata21;
   wire [8-1:0]   mem_readdata21;
   wire           mem_waitrequest21;
   reg  [8-1:0]   mem21[0:255];
   reg            mem_write22;
   reg  [8-1:0]   mem_writedata22;
   wire [8-1:0]   mem_readdata22;
   wire           mem_waitrequest22;
   reg  [8-1:0]   mem22[0:255];
   reg            mem_write23;
   reg  [8-1:0]   mem_writedata23;
   wire [8-1:0]   mem_readdata23;
   wire           mem_waitrequest23;
   reg  [8-1:0]   mem23[0:255];
   reg            mem_write24;
   reg  [8-1:0]   mem_writedata24;
   wire [8-1:0]   mem_readdata24;
   wire           mem_waitrequest24;
   reg  [8-1:0]   mem24[0:255];
   reg            mem_write25;
   reg  [8-1:0]   mem_writedata25;
   wire [8-1:0]   mem_readdata25;
   wire           mem_waitrequest25;
   reg  [8-1:0]   mem25[0:255];
   reg            mem_write26;
   reg  [8-1:0]   mem_writedata26;
   wire [8-1:0]   mem_readdata26;
   wire           mem_waitrequest26;
   reg  [8-1:0]   mem26[0:255];
   reg            mem_write27;
   reg  [8-1:0]   mem_writedata27;
   wire [8-1:0]   mem_readdata27;
   wire           mem_waitrequest27;
   reg  [8-1:0]   mem27[0:255];
   reg            mem_write28;
   reg  [8-1:0]   mem_writedata28;
   wire [8-1:0]   mem_readdata28;
   wire           mem_waitrequest28;
   reg  [8-1:0]   mem28[0:255];
   reg            mem_write29;
   reg  [8-1:0]   mem_writedata29;
   wire [8-1:0]   mem_readdata29;
   wire           mem_waitrequest29;
   reg  [8-1:0]   mem29[0:255];
   reg            mem_write30;
   reg  [8-1:0]   mem_writedata30;
   wire [8-1:0]   mem_readdata30;
   wire           mem_waitrequest30;
   reg  [8-1:0]   mem30[0:255];
   reg            sop_mem_writeenable;
   reg            sop_mem_writedata;
   wire           mem_waitrequest_sop; 

   wire           state_waitrequest;
   reg            state_waitrequest_d1; 







   // ---------------------------------------------------------------------
   //| Input Register Stage
   // ---------------------------------------------------------------------
   always @(posedge clk or negedge reset_n) begin
      if (!reset_n) begin
         a_valid   <= 0;
         a_channel <= 0;
         a_data0   <= 0;
         a_data1   <= 0;
         a_data2   <= 0;
         a_data3   <= 0;
         a_data4   <= 0;
         a_data5   <= 0;
         a_data6   <= 0;
         a_data7   <= 0;
         a_data8   <= 0;
         a_data9   <= 0;
         a_data10   <= 0;
         a_data11   <= 0;
         a_data12   <= 0;
         a_data13   <= 0;
         a_data14   <= 0;
         a_data15   <= 0;
         a_data16   <= 0;
         a_data17   <= 0;
         a_data18   <= 0;
         a_data19   <= 0;
         a_data20   <= 0;
         a_data21   <= 0;
         a_data22   <= 0;
         a_data23   <= 0;
         a_data24   <= 0;
         a_data25   <= 0;
         a_data26   <= 0;
         a_data27   <= 0;
         a_data28   <= 0;
         a_data29   <= 0;
         a_data30   <= 0;
         a_data31   <= 0;
         a_startofpacket <= 0;
         a_endofpacket   <= 0;
         a_empty <= 0; 
         a_error <= 0;
      end else begin
         if (in_ready) begin
            a_valid   <= in_valid;
            a_channel <= in_channel;
            a_error   <= in_error;
            a_data0 <= in_data[255:248];
            a_data1 <= in_data[247:240];
            a_data2 <= in_data[239:232];
            a_data3 <= in_data[231:224];
            a_data4 <= in_data[223:216];
            a_data5 <= in_data[215:208];
            a_data6 <= in_data[207:200];
            a_data7 <= in_data[199:192];
            a_data8 <= in_data[191:184];
            a_data9 <= in_data[183:176];
            a_data10 <= in_data[175:168];
            a_data11 <= in_data[167:160];
            a_data12 <= in_data[159:152];
            a_data13 <= in_data[151:144];
            a_data14 <= in_data[143:136];
            a_data15 <= in_data[135:128];
            a_data16 <= in_data[127:120];
            a_data17 <= in_data[119:112];
            a_data18 <= in_data[111:104];
            a_data19 <= in_data[103:96];
            a_data20 <= in_data[95:88];
            a_data21 <= in_data[87:80];
            a_data22 <= in_data[79:72];
            a_data23 <= in_data[71:64];
            a_data24 <= in_data[63:56];
            a_data25 <= in_data[55:48];
            a_data26 <= in_data[47:40];
            a_data27 <= in_data[39:32];
            a_data28 <= in_data[31:24];
            a_data29 <= in_data[23:16];
            a_data30 <= in_data[15:8];
            a_data31 <= in_data[7:0];
            a_startofpacket <= in_startofpacket;
            a_endofpacket   <= in_endofpacket;
            a_empty         <= 0; 
            if (in_endofpacket)
               a_empty <= in_empty;
         end
      end 
   end

   always @* begin 
      state_read_addr = a_channel;
      if (in_ready)
         state_read_addr = in_channel;
   end
   
   // ---------------------------------------------------------------------
   //| State Memory
   // ---------------------------------------------------------------------
   ethernet_data_format_adapter_181_jumd7li_state_ram state_ram ( 
   .clk            (clk),
   .reset_n        (reset_n),
   .rd0_address    (state_read_addr),
   .rd0_readdata   (state_from_memory),
   .wr_address     (a_channel),
   .wr_writedata   (new_state),
   .wr_write       (~state_waitrequest_d1),
   .wr_waitrequest (state_waitrequest)
   );

   // ---------------------------------------------------------------------
   //| Data Memories
   // ---------------------------------------------------------------------
   ethernet_data_format_adapter_181_jumd7li_data_ram data_ram0 ( 
   .clk            (clk),
   .reset_n        (reset_n),
   .rd0_address    (mem_readaddr),
   .rd0_readdata   (mem_readdata0),
   .wr_address     (a_channel),
   .wr_writedata   (mem_writedata0),
   .wr_write       (mem_write0),
   .wr_waitrequest (mem_waitrequest0)
   );
   ethernet_data_format_adapter_181_jumd7li_data_ram data_ram1 ( 
   .clk            (clk),
   .reset_n        (reset_n),
   .rd0_address    (mem_readaddr),
   .rd0_readdata   (mem_readdata1),
   .wr_address     (a_channel),
   .wr_writedata   (mem_writedata1),
   .wr_write       (mem_write1),
   .wr_waitrequest (mem_waitrequest1)
   );
   ethernet_data_format_adapter_181_jumd7li_data_ram data_ram2 ( 
   .clk            (clk),
   .reset_n        (reset_n),
   .rd0_address    (mem_readaddr),
   .rd0_readdata   (mem_readdata2),
   .wr_address     (a_channel),
   .wr_writedata   (mem_writedata2),
   .wr_write       (mem_write2),
   .wr_waitrequest (mem_waitrequest2)
   );
   ethernet_data_format_adapter_181_jumd7li_data_ram data_ram3 ( 
   .clk            (clk),
   .reset_n        (reset_n),
   .rd0_address    (mem_readaddr),
   .rd0_readdata   (mem_readdata3),
   .wr_address     (a_channel),
   .wr_writedata   (mem_writedata3),
   .wr_write       (mem_write3),
   .wr_waitrequest (mem_waitrequest3)
   );
   ethernet_data_format_adapter_181_jumd7li_data_ram data_ram4 ( 
   .clk            (clk),
   .reset_n        (reset_n),
   .rd0_address    (mem_readaddr),
   .rd0_readdata   (mem_readdata4),
   .wr_address     (a_channel),
   .wr_writedata   (mem_writedata4),
   .wr_write       (mem_write4),
   .wr_waitrequest (mem_waitrequest4)
   );
   ethernet_data_format_adapter_181_jumd7li_data_ram data_ram5 ( 
   .clk            (clk),
   .reset_n        (reset_n),
   .rd0_address    (mem_readaddr),
   .rd0_readdata   (mem_readdata5),
   .wr_address     (a_channel),
   .wr_writedata   (mem_writedata5),
   .wr_write       (mem_write5),
   .wr_waitrequest (mem_waitrequest5)
   );
   ethernet_data_format_adapter_181_jumd7li_data_ram data_ram6 ( 
   .clk            (clk),
   .reset_n        (reset_n),
   .rd0_address    (mem_readaddr),
   .rd0_readdata   (mem_readdata6),
   .wr_address     (a_channel),
   .wr_writedata   (mem_writedata6),
   .wr_write       (mem_write6),
   .wr_waitrequest (mem_waitrequest6)
   );
   ethernet_data_format_adapter_181_jumd7li_data_ram data_ram7 ( 
   .clk            (clk),
   .reset_n        (reset_n),
   .rd0_address    (mem_readaddr),
   .rd0_readdata   (mem_readdata7),
   .wr_address     (a_channel),
   .wr_writedata   (mem_writedata7),
   .wr_write       (mem_write7),
   .wr_waitrequest (mem_waitrequest7)
   );
   ethernet_data_format_adapter_181_jumd7li_data_ram data_ram8 ( 
   .clk            (clk),
   .reset_n        (reset_n),
   .rd0_address    (mem_readaddr),
   .rd0_readdata   (mem_readdata8),
   .wr_address     (a_channel),
   .wr_writedata   (mem_writedata8),
   .wr_write       (mem_write8),
   .wr_waitrequest (mem_waitrequest8)
   );
   ethernet_data_format_adapter_181_jumd7li_data_ram data_ram9 ( 
   .clk            (clk),
   .reset_n        (reset_n),
   .rd0_address    (mem_readaddr),
   .rd0_readdata   (mem_readdata9),
   .wr_address     (a_channel),
   .wr_writedata   (mem_writedata9),
   .wr_write       (mem_write9),
   .wr_waitrequest (mem_waitrequest9)
   );
   ethernet_data_format_adapter_181_jumd7li_data_ram data_ram10 ( 
   .clk            (clk),
   .reset_n        (reset_n),
   .rd0_address    (mem_readaddr),
   .rd0_readdata   (mem_readdata10),
   .wr_address     (a_channel),
   .wr_writedata   (mem_writedata10),
   .wr_write       (mem_write10),
   .wr_waitrequest (mem_waitrequest10)
   );
   ethernet_data_format_adapter_181_jumd7li_data_ram data_ram11 ( 
   .clk            (clk),
   .reset_n        (reset_n),
   .rd0_address    (mem_readaddr),
   .rd0_readdata   (mem_readdata11),
   .wr_address     (a_channel),
   .wr_writedata   (mem_writedata11),
   .wr_write       (mem_write11),
   .wr_waitrequest (mem_waitrequest11)
   );
   ethernet_data_format_adapter_181_jumd7li_data_ram data_ram12 ( 
   .clk            (clk),
   .reset_n        (reset_n),
   .rd0_address    (mem_readaddr),
   .rd0_readdata   (mem_readdata12),
   .wr_address     (a_channel),
   .wr_writedata   (mem_writedata12),
   .wr_write       (mem_write12),
   .wr_waitrequest (mem_waitrequest12)
   );
   ethernet_data_format_adapter_181_jumd7li_data_ram data_ram13 ( 
   .clk            (clk),
   .reset_n        (reset_n),
   .rd0_address    (mem_readaddr),
   .rd0_readdata   (mem_readdata13),
   .wr_address     (a_channel),
   .wr_writedata   (mem_writedata13),
   .wr_write       (mem_write13),
   .wr_waitrequest (mem_waitrequest13)
   );
   ethernet_data_format_adapter_181_jumd7li_data_ram data_ram14 ( 
   .clk            (clk),
   .reset_n        (reset_n),
   .rd0_address    (mem_readaddr),
   .rd0_readdata   (mem_readdata14),
   .wr_address     (a_channel),
   .wr_writedata   (mem_writedata14),
   .wr_write       (mem_write14),
   .wr_waitrequest (mem_waitrequest14)
   );
   ethernet_data_format_adapter_181_jumd7li_data_ram data_ram15 ( 
   .clk            (clk),
   .reset_n        (reset_n),
   .rd0_address    (mem_readaddr),
   .rd0_readdata   (mem_readdata15),
   .wr_address     (a_channel),
   .wr_writedata   (mem_writedata15),
   .wr_write       (mem_write15),
   .wr_waitrequest (mem_waitrequest15)
   );
   ethernet_data_format_adapter_181_jumd7li_data_ram data_ram16 ( 
   .clk            (clk),
   .reset_n        (reset_n),
   .rd0_address    (mem_readaddr),
   .rd0_readdata   (mem_readdata16),
   .wr_address     (a_channel),
   .wr_writedata   (mem_writedata16),
   .wr_write       (mem_write16),
   .wr_waitrequest (mem_waitrequest16)
   );
   ethernet_data_format_adapter_181_jumd7li_data_ram data_ram17 ( 
   .clk            (clk),
   .reset_n        (reset_n),
   .rd0_address    (mem_readaddr),
   .rd0_readdata   (mem_readdata17),
   .wr_address     (a_channel),
   .wr_writedata   (mem_writedata17),
   .wr_write       (mem_write17),
   .wr_waitrequest (mem_waitrequest17)
   );
   ethernet_data_format_adapter_181_jumd7li_data_ram data_ram18 ( 
   .clk            (clk),
   .reset_n        (reset_n),
   .rd0_address    (mem_readaddr),
   .rd0_readdata   (mem_readdata18),
   .wr_address     (a_channel),
   .wr_writedata   (mem_writedata18),
   .wr_write       (mem_write18),
   .wr_waitrequest (mem_waitrequest18)
   );
   ethernet_data_format_adapter_181_jumd7li_data_ram data_ram19 ( 
   .clk            (clk),
   .reset_n        (reset_n),
   .rd0_address    (mem_readaddr),
   .rd0_readdata   (mem_readdata19),
   .wr_address     (a_channel),
   .wr_writedata   (mem_writedata19),
   .wr_write       (mem_write19),
   .wr_waitrequest (mem_waitrequest19)
   );
   ethernet_data_format_adapter_181_jumd7li_data_ram data_ram20 ( 
   .clk            (clk),
   .reset_n        (reset_n),
   .rd0_address    (mem_readaddr),
   .rd0_readdata   (mem_readdata20),
   .wr_address     (a_channel),
   .wr_writedata   (mem_writedata20),
   .wr_write       (mem_write20),
   .wr_waitrequest (mem_waitrequest20)
   );
   ethernet_data_format_adapter_181_jumd7li_data_ram data_ram21 ( 
   .clk            (clk),
   .reset_n        (reset_n),
   .rd0_address    (mem_readaddr),
   .rd0_readdata   (mem_readdata21),
   .wr_address     (a_channel),
   .wr_writedata   (mem_writedata21),
   .wr_write       (mem_write21),
   .wr_waitrequest (mem_waitrequest21)
   );
   ethernet_data_format_adapter_181_jumd7li_data_ram data_ram22 ( 
   .clk            (clk),
   .reset_n        (reset_n),
   .rd0_address    (mem_readaddr),
   .rd0_readdata   (mem_readdata22),
   .wr_address     (a_channel),
   .wr_writedata   (mem_writedata22),
   .wr_write       (mem_write22),
   .wr_waitrequest (mem_waitrequest22)
   );
   ethernet_data_format_adapter_181_jumd7li_data_ram data_ram23 ( 
   .clk            (clk),
   .reset_n        (reset_n),
   .rd0_address    (mem_readaddr),
   .rd0_readdata   (mem_readdata23),
   .wr_address     (a_channel),
   .wr_writedata   (mem_writedata23),
   .wr_write       (mem_write23),
   .wr_waitrequest (mem_waitrequest23)
   );
   ethernet_data_format_adapter_181_jumd7li_data_ram data_ram24 ( 
   .clk            (clk),
   .reset_n        (reset_n),
   .rd0_address    (mem_readaddr),
   .rd0_readdata   (mem_readdata24),
   .wr_address     (a_channel),
   .wr_writedata   (mem_writedata24),
   .wr_write       (mem_write24),
   .wr_waitrequest (mem_waitrequest24)
   );
   ethernet_data_format_adapter_181_jumd7li_data_ram data_ram25 ( 
   .clk            (clk),
   .reset_n        (reset_n),
   .rd0_address    (mem_readaddr),
   .rd0_readdata   (mem_readdata25),
   .wr_address     (a_channel),
   .wr_writedata   (mem_writedata25),
   .wr_write       (mem_write25),
   .wr_waitrequest (mem_waitrequest25)
   );
   ethernet_data_format_adapter_181_jumd7li_data_ram data_ram26 ( 
   .clk            (clk),
   .reset_n        (reset_n),
   .rd0_address    (mem_readaddr),
   .rd0_readdata   (mem_readdata26),
   .wr_address     (a_channel),
   .wr_writedata   (mem_writedata26),
   .wr_write       (mem_write26),
   .wr_waitrequest (mem_waitrequest26)
   );
   ethernet_data_format_adapter_181_jumd7li_data_ram data_ram27 ( 
   .clk            (clk),
   .reset_n        (reset_n),
   .rd0_address    (mem_readaddr),
   .rd0_readdata   (mem_readdata27),
   .wr_address     (a_channel),
   .wr_writedata   (mem_writedata27),
   .wr_write       (mem_write27),
   .wr_waitrequest (mem_waitrequest27)
   );
   ethernet_data_format_adapter_181_jumd7li_data_ram data_ram28 ( 
   .clk            (clk),
   .reset_n        (reset_n),
   .rd0_address    (mem_readaddr),
   .rd0_readdata   (mem_readdata28),
   .wr_address     (a_channel),
   .wr_writedata   (mem_writedata28),
   .wr_write       (mem_write28),
   .wr_waitrequest (mem_waitrequest28)
   );
   ethernet_data_format_adapter_181_jumd7li_data_ram data_ram29 ( 
   .clk            (clk),
   .reset_n        (reset_n),
   .rd0_address    (mem_readaddr),
   .rd0_readdata   (mem_readdata29),
   .wr_address     (a_channel),
   .wr_writedata   (mem_writedata29),
   .wr_write       (mem_write29),
   .wr_waitrequest (mem_waitrequest29)
   );
   ethernet_data_format_adapter_181_jumd7li_data_ram data_ram30 ( 
   .clk            (clk),
   .reset_n        (reset_n),
   .rd0_address    (mem_readaddr),
   .rd0_readdata   (mem_readdata30),
   .wr_address     (a_channel),
   .wr_writedata   (mem_writedata30),
   .wr_write       (mem_write30),
   .wr_waitrequest (mem_waitrequest30)
   );



   // ---------------------------------------------------------------------
   //| State & Memory Keepers
   // ---------------------------------------------------------------------
   always @(posedge clk or negedge reset_n) begin
      if (!reset_n) begin
         in_ready_d1          <= 0;
         state_d1             <= 0;
         mem_readaddr_d1      <= 0;
         state_waitrequest_d1 <= 0;
      end else begin
         in_ready_d1          <= in_ready;
         state_d1             <= state;
         mem_readaddr_d1      <= mem_readaddr;
         state_waitrequest_d1 <= state_waitrequest;
      end
   end
   
   
   // ---------------------------------------------------------------------
   //| State Machine
   // ---------------------------------------------------------------------
   always @* begin

      
   b_ready = (out_ready || ~out_valid);

   a_ready   = 0;
   b_data    = 0;
   b_valid   = 0;
   b_channel = a_channel;
   b_error   = a_error;
      
   state = state_from_memory;
      
   new_state           = state;
   mem_write0          = 0;
   mem_writedata0      = a_data0;
   mem_write1          = 0;
   mem_writedata1      = a_data0;
   mem_write2          = 0;
   mem_writedata2      = a_data0;
   mem_write3          = 0;
   mem_writedata3      = a_data0;
   mem_write4          = 0;
   mem_writedata4      = a_data0;
   mem_write5          = 0;
   mem_writedata5      = a_data0;
   mem_write6          = 0;
   mem_writedata6      = a_data0;
   mem_write7          = 0;
   mem_writedata7      = a_data0;
   mem_write8          = 0;
   mem_writedata8      = a_data0;
   mem_write9          = 0;
   mem_writedata9      = a_data0;
   mem_write10          = 0;
   mem_writedata10      = a_data0;
   mem_write11          = 0;
   mem_writedata11      = a_data0;
   mem_write12          = 0;
   mem_writedata12      = a_data0;
   mem_write13          = 0;
   mem_writedata13      = a_data0;
   mem_write14          = 0;
   mem_writedata14      = a_data0;
   mem_write15          = 0;
   mem_writedata15      = a_data0;
   mem_write16          = 0;
   mem_writedata16      = a_data0;
   mem_write17          = 0;
   mem_writedata17      = a_data0;
   mem_write18          = 0;
   mem_writedata18      = a_data0;
   mem_write19          = 0;
   mem_writedata19      = a_data0;
   mem_write20          = 0;
   mem_writedata20      = a_data0;
   mem_write21          = 0;
   mem_writedata21      = a_data0;
   mem_write22          = 0;
   mem_writedata22      = a_data0;
   mem_write23          = 0;
   mem_writedata23      = a_data0;
   mem_write24          = 0;
   mem_writedata24      = a_data0;
   mem_write25          = 0;
   mem_writedata25      = a_data0;
   mem_write26          = 0;
   mem_writedata26      = a_data0;
   mem_write27          = 0;
   mem_writedata27      = a_data0;
   mem_write28          = 0;
   mem_writedata28      = a_data0;
   mem_write29          = 0;
   mem_writedata29      = a_data0;
   mem_write30          = 0;
   mem_writedata30      = a_data0;
   sop_mem_writeenable = 0;

   b_endofpacket = a_endofpacket;
      
   b_startofpacket = 0;
      
   b_endofpacket = 0;
   b_empty = 0;
       
   case (state) 
            0 : begin
            b_data[31:24] = a_data0;
            b_data[23:16] = a_data1;
            b_data[15:8] = a_data2;
            b_data[7:0] = a_data3;
            b_startofpacket = a_startofpacket;
            if (out_ready || ~out_valid) begin
               if (a_valid) begin
                  b_valid = 1;
                  new_state = state+1'b1;
                     if (a_endofpacket && (a_empty >= 28) ) begin
                        new_state = 0;
                        b_empty = a_empty - 28;
                        b_endofpacket = 1;
                        a_ready = 1;
                     end
                  end
               end
            end
         1 : begin
            b_data[31:24] = a_data4;
            b_data[23:16] = a_data5;
            b_data[15:8] = a_data6;
            b_data[7:0] = a_data7;
            b_startofpacket = 0;
            if (out_ready || ~out_valid) begin
               if (a_valid) begin
                  b_valid = 1;
                  new_state = state+1'b1;
                     if (a_endofpacket && (a_empty >= 24) ) begin
                        new_state = 0;
                        b_empty = a_empty - 24;
                        b_endofpacket = 1;
                        a_ready = 1;
                     end
                  end
               end
            end
         2 : begin
            b_data[31:24] = a_data8;
            b_data[23:16] = a_data9;
            b_data[15:8] = a_data10;
            b_data[7:0] = a_data11;
            b_startofpacket = 0;
            if (out_ready || ~out_valid) begin
               if (a_valid) begin
                  b_valid = 1;
                  new_state = state+1'b1;
                     if (a_endofpacket && (a_empty >= 20) ) begin
                        new_state = 0;
                        b_empty = a_empty - 20;
                        b_endofpacket = 1;
                        a_ready = 1;
                     end
                  end
               end
            end
         3 : begin
            b_data[31:24] = a_data12;
            b_data[23:16] = a_data13;
            b_data[15:8] = a_data14;
            b_data[7:0] = a_data15;
            b_startofpacket = 0;
            if (out_ready || ~out_valid) begin
               if (a_valid) begin
                  b_valid = 1;
                  new_state = state+1'b1;
                     if (a_endofpacket && (a_empty >= 16) ) begin
                        new_state = 0;
                        b_empty = a_empty - 16;
                        b_endofpacket = 1;
                        a_ready = 1;
                     end
                  end
               end
            end
         4 : begin
            b_data[31:24] = a_data16;
            b_data[23:16] = a_data17;
            b_data[15:8] = a_data18;
            b_data[7:0] = a_data19;
            b_startofpacket = 0;
            if (out_ready || ~out_valid) begin
               if (a_valid) begin
                  b_valid = 1;
                  new_state = state+1'b1;
                     if (a_endofpacket && (a_empty >= 12) ) begin
                        new_state = 0;
                        b_empty = a_empty - 12;
                        b_endofpacket = 1;
                        a_ready = 1;
                     end
                  end
               end
            end
         5 : begin
            b_data[31:24] = a_data20;
            b_data[23:16] = a_data21;
            b_data[15:8] = a_data22;
            b_data[7:0] = a_data23;
            b_startofpacket = 0;
            if (out_ready || ~out_valid) begin
               if (a_valid) begin
                  b_valid = 1;
                  new_state = state+1'b1;
                     if (a_endofpacket && (a_empty >= 8) ) begin
                        new_state = 0;
                        b_empty = a_empty - 8;
                        b_endofpacket = 1;
                        a_ready = 1;
                     end
                  end
               end
            end
         6 : begin
            b_data[31:24] = a_data24;
            b_data[23:16] = a_data25;
            b_data[15:8] = a_data26;
            b_data[7:0] = a_data27;
            b_startofpacket = 0;
            if (out_ready || ~out_valid) begin
               if (a_valid) begin
                  b_valid = 1;
                  new_state = state+1'b1;
                     if (a_endofpacket && (a_empty >= 4) ) begin
                        new_state = 0;
                        b_empty = a_empty - 4;
                        b_endofpacket = 1;
                        a_ready = 1;
                     end
                  end
               end
            end
         7 : begin
            b_data[31:24] = a_data28;
            b_data[23:16] = a_data29;
            b_data[15:8] = a_data30;
            b_data[7:0] = a_data31;
            b_startofpacket = 0;
            if (out_ready || ~out_valid) begin
            a_ready = 1;
               if (a_valid) begin
                  b_valid = 1;
                  new_state = state+1'b1;
                     if (a_endofpacket && (a_empty >= 0) ) begin
                        new_state = 0;
                        b_empty = a_empty - 0;
                        b_endofpacket = 1;
                        a_ready = 1;
                     end
                  end
               end
            end
         8 : begin
            b_data[31:24] = a_data0;
            b_data[23:16] = a_data1;
            b_data[15:8] = a_data2;
            b_data[7:0] = a_data3;
            b_startofpacket = 0;
            if (out_ready || ~out_valid) begin
               if (a_valid) begin
                  b_valid = 1;
                  new_state = state+1'b1;
                     if (a_endofpacket && (a_empty >= 28) ) begin
                        new_state = 0;
                        b_empty = a_empty - 28;
                        b_endofpacket = 1;
                        a_ready = 1;
                     end
                  end
               end
            end
         9 : begin
            b_data[31:24] = a_data4;
            b_data[23:16] = a_data5;
            b_data[15:8] = a_data6;
            b_data[7:0] = a_data7;
            b_startofpacket = 0;
            if (out_ready || ~out_valid) begin
               if (a_valid) begin
                  b_valid = 1;
                  new_state = state+1'b1;
                     if (a_endofpacket && (a_empty >= 24) ) begin
                        new_state = 0;
                        b_empty = a_empty - 24;
                        b_endofpacket = 1;
                        a_ready = 1;
                     end
                  end
               end
            end
         10 : begin
            b_data[31:24] = a_data8;
            b_data[23:16] = a_data9;
            b_data[15:8] = a_data10;
            b_data[7:0] = a_data11;
            b_startofpacket = 0;
            if (out_ready || ~out_valid) begin
               if (a_valid) begin
                  b_valid = 1;
                  new_state = state+1'b1;
                     if (a_endofpacket && (a_empty >= 20) ) begin
                        new_state = 0;
                        b_empty = a_empty - 20;
                        b_endofpacket = 1;
                        a_ready = 1;
                     end
                  end
               end
            end
         11 : begin
            b_data[31:24] = a_data12;
            b_data[23:16] = a_data13;
            b_data[15:8] = a_data14;
            b_data[7:0] = a_data15;
            b_startofpacket = 0;
            if (out_ready || ~out_valid) begin
               if (a_valid) begin
                  b_valid = 1;
                  new_state = state+1'b1;
                     if (a_endofpacket && (a_empty >= 16) ) begin
                        new_state = 0;
                        b_empty = a_empty - 16;
                        b_endofpacket = 1;
                        a_ready = 1;
                     end
                  end
               end
            end
         12 : begin
            b_data[31:24] = a_data16;
            b_data[23:16] = a_data17;
            b_data[15:8] = a_data18;
            b_data[7:0] = a_data19;
            b_startofpacket = 0;
            if (out_ready || ~out_valid) begin
               if (a_valid) begin
                  b_valid = 1;
                  new_state = state+1'b1;
                     if (a_endofpacket && (a_empty >= 12) ) begin
                        new_state = 0;
                        b_empty = a_empty - 12;
                        b_endofpacket = 1;
                        a_ready = 1;
                     end
                  end
               end
            end
         13 : begin
            b_data[31:24] = a_data20;
            b_data[23:16] = a_data21;
            b_data[15:8] = a_data22;
            b_data[7:0] = a_data23;
            b_startofpacket = 0;
            if (out_ready || ~out_valid) begin
               if (a_valid) begin
                  b_valid = 1;
                  new_state = state+1'b1;
                     if (a_endofpacket && (a_empty >= 8) ) begin
                        new_state = 0;
                        b_empty = a_empty - 8;
                        b_endofpacket = 1;
                        a_ready = 1;
                     end
                  end
               end
            end
         14 : begin
            b_data[31:24] = a_data24;
            b_data[23:16] = a_data25;
            b_data[15:8] = a_data26;
            b_data[7:0] = a_data27;
            b_startofpacket = 0;
            if (out_ready || ~out_valid) begin
               if (a_valid) begin
                  b_valid = 1;
                  new_state = state+1'b1;
                     if (a_endofpacket && (a_empty >= 4) ) begin
                        new_state = 0;
                        b_empty = a_empty - 4;
                        b_endofpacket = 1;
                        a_ready = 1;
                     end
                  end
               end
            end
         15 : begin
            b_data[31:24] = a_data28;
            b_data[23:16] = a_data29;
            b_data[15:8] = a_data30;
            b_data[7:0] = a_data31;
            b_startofpacket = 0;
            if (out_ready || ~out_valid) begin
            a_ready = 1;
               if (a_valid) begin
                  b_valid = 1;
                  new_state = state+1'b1;
                     if (a_endofpacket && (a_empty >= 0) ) begin
                        new_state = 0;
                        b_empty = a_empty - 0;
                        b_endofpacket = 1;
                        a_ready = 1;
                     end
                  end
               end
            end
         16 : begin
            b_data[31:24] = a_data0;
            b_data[23:16] = a_data1;
            b_data[15:8] = a_data2;
            b_data[7:0] = a_data3;
            b_startofpacket = 0;
            if (out_ready || ~out_valid) begin
               if (a_valid) begin
                  b_valid = 1;
                  new_state = state+1'b1;
                     if (a_endofpacket && (a_empty >= 28) ) begin
                        new_state = 0;
                        b_empty = a_empty - 28;
                        b_endofpacket = 1;
                        a_ready = 1;
                     end
                  end
               end
            end
         17 : begin
            b_data[31:24] = a_data4;
            b_data[23:16] = a_data5;
            b_data[15:8] = a_data6;
            b_data[7:0] = a_data7;
            b_startofpacket = 0;
            if (out_ready || ~out_valid) begin
               if (a_valid) begin
                  b_valid = 1;
                  new_state = state+1'b1;
                     if (a_endofpacket && (a_empty >= 24) ) begin
                        new_state = 0;
                        b_empty = a_empty - 24;
                        b_endofpacket = 1;
                        a_ready = 1;
                     end
                  end
               end
            end
         18 : begin
            b_data[31:24] = a_data8;
            b_data[23:16] = a_data9;
            b_data[15:8] = a_data10;
            b_data[7:0] = a_data11;
            b_startofpacket = 0;
            if (out_ready || ~out_valid) begin
               if (a_valid) begin
                  b_valid = 1;
                  new_state = state+1'b1;
                     if (a_endofpacket && (a_empty >= 20) ) begin
                        new_state = 0;
                        b_empty = a_empty - 20;
                        b_endofpacket = 1;
                        a_ready = 1;
                     end
                  end
               end
            end
         19 : begin
            b_data[31:24] = a_data12;
            b_data[23:16] = a_data13;
            b_data[15:8] = a_data14;
            b_data[7:0] = a_data15;
            b_startofpacket = 0;
            if (out_ready || ~out_valid) begin
               if (a_valid) begin
                  b_valid = 1;
                  new_state = state+1'b1;
                     if (a_endofpacket && (a_empty >= 16) ) begin
                        new_state = 0;
                        b_empty = a_empty - 16;
                        b_endofpacket = 1;
                        a_ready = 1;
                     end
                  end
               end
            end
         20 : begin
            b_data[31:24] = a_data16;
            b_data[23:16] = a_data17;
            b_data[15:8] = a_data18;
            b_data[7:0] = a_data19;
            b_startofpacket = 0;
            if (out_ready || ~out_valid) begin
               if (a_valid) begin
                  b_valid = 1;
                  new_state = state+1'b1;
                     if (a_endofpacket && (a_empty >= 12) ) begin
                        new_state = 0;
                        b_empty = a_empty - 12;
                        b_endofpacket = 1;
                        a_ready = 1;
                     end
                  end
               end
            end
         21 : begin
            b_data[31:24] = a_data20;
            b_data[23:16] = a_data21;
            b_data[15:8] = a_data22;
            b_data[7:0] = a_data23;
            b_startofpacket = 0;
            if (out_ready || ~out_valid) begin
               if (a_valid) begin
                  b_valid = 1;
                  new_state = state+1'b1;
                     if (a_endofpacket && (a_empty >= 8) ) begin
                        new_state = 0;
                        b_empty = a_empty - 8;
                        b_endofpacket = 1;
                        a_ready = 1;
                     end
                  end
               end
            end
         22 : begin
            b_data[31:24] = a_data24;
            b_data[23:16] = a_data25;
            b_data[15:8] = a_data26;
            b_data[7:0] = a_data27;
            b_startofpacket = 0;
            if (out_ready || ~out_valid) begin
               if (a_valid) begin
                  b_valid = 1;
                  new_state = state+1'b1;
                     if (a_endofpacket && (a_empty >= 4) ) begin
                        new_state = 0;
                        b_empty = a_empty - 4;
                        b_endofpacket = 1;
                        a_ready = 1;
                     end
                  end
               end
            end
         23 : begin
            b_data[31:24] = a_data28;
            b_data[23:16] = a_data29;
            b_data[15:8] = a_data30;
            b_data[7:0] = a_data31;
            b_startofpacket = 0;
            if (out_ready || ~out_valid) begin
            a_ready = 1;
               if (a_valid) begin
                  b_valid = 1;
                  new_state = state+1'b1;
                     if (a_endofpacket && (a_empty >= 0) ) begin
                        new_state = 0;
                        b_empty = a_empty - 0;
                        b_endofpacket = 1;
                        a_ready = 1;
                     end
                  end
               end
            end
         24 : begin
            b_data[31:24] = a_data0;
            b_data[23:16] = a_data1;
            b_data[15:8] = a_data2;
            b_data[7:0] = a_data3;
            b_startofpacket = 0;
            if (out_ready || ~out_valid) begin
               if (a_valid) begin
                  b_valid = 1;
                  new_state = state+1'b1;
                     if (a_endofpacket && (a_empty >= 28) ) begin
                        new_state = 0;
                        b_empty = a_empty - 28;
                        b_endofpacket = 1;
                        a_ready = 1;
                     end
                  end
               end
            end
         25 : begin
            b_data[31:24] = a_data4;
            b_data[23:16] = a_data5;
            b_data[15:8] = a_data6;
            b_data[7:0] = a_data7;
            b_startofpacket = 0;
            if (out_ready || ~out_valid) begin
               if (a_valid) begin
                  b_valid = 1;
                  new_state = state+1'b1;
                     if (a_endofpacket && (a_empty >= 24) ) begin
                        new_state = 0;
                        b_empty = a_empty - 24;
                        b_endofpacket = 1;
                        a_ready = 1;
                     end
                  end
               end
            end
         26 : begin
            b_data[31:24] = a_data8;
            b_data[23:16] = a_data9;
            b_data[15:8] = a_data10;
            b_data[7:0] = a_data11;
            b_startofpacket = 0;
            if (out_ready || ~out_valid) begin
               if (a_valid) begin
                  b_valid = 1;
                  new_state = state+1'b1;
                     if (a_endofpacket && (a_empty >= 20) ) begin
                        new_state = 0;
                        b_empty = a_empty - 20;
                        b_endofpacket = 1;
                        a_ready = 1;
                     end
                  end
               end
            end
         27 : begin
            b_data[31:24] = a_data12;
            b_data[23:16] = a_data13;
            b_data[15:8] = a_data14;
            b_data[7:0] = a_data15;
            b_startofpacket = 0;
            if (out_ready || ~out_valid) begin
               if (a_valid) begin
                  b_valid = 1;
                  new_state = state+1'b1;
                     if (a_endofpacket && (a_empty >= 16) ) begin
                        new_state = 0;
                        b_empty = a_empty - 16;
                        b_endofpacket = 1;
                        a_ready = 1;
                     end
                  end
               end
            end
         28 : begin
            b_data[31:24] = a_data16;
            b_data[23:16] = a_data17;
            b_data[15:8] = a_data18;
            b_data[7:0] = a_data19;
            b_startofpacket = 0;
            if (out_ready || ~out_valid) begin
               if (a_valid) begin
                  b_valid = 1;
                  new_state = state+1'b1;
                     if (a_endofpacket && (a_empty >= 12) ) begin
                        new_state = 0;
                        b_empty = a_empty - 12;
                        b_endofpacket = 1;
                        a_ready = 1;
                     end
                  end
               end
            end
         29 : begin
            b_data[31:24] = a_data20;
            b_data[23:16] = a_data21;
            b_data[15:8] = a_data22;
            b_data[7:0] = a_data23;
            b_startofpacket = 0;
            if (out_ready || ~out_valid) begin
               if (a_valid) begin
                  b_valid = 1;
                  new_state = state+1'b1;
                     if (a_endofpacket && (a_empty >= 8) ) begin
                        new_state = 0;
                        b_empty = a_empty - 8;
                        b_endofpacket = 1;
                        a_ready = 1;
                     end
                  end
               end
            end
         30 : begin
            b_data[31:24] = a_data24;
            b_data[23:16] = a_data25;
            b_data[15:8] = a_data26;
            b_data[7:0] = a_data27;
            b_startofpacket = 0;
            if (out_ready || ~out_valid) begin
               if (a_valid) begin
                  b_valid = 1;
                  new_state = state+1'b1;
                     if (a_endofpacket && (a_empty >= 4) ) begin
                        new_state = 0;
                        b_empty = a_empty - 4;
                        b_endofpacket = 1;
                        a_ready = 1;
                     end
                  end
               end
            end
         31 : begin
            b_data[31:24] = a_data28;
            b_data[23:16] = a_data29;
            b_data[15:8] = a_data30;
            b_data[7:0] = a_data31;
            b_startofpacket = 0;
            if (out_ready || ~out_valid) begin
            a_ready = 1;
               if (a_valid) begin
                  b_valid = 1;
                  new_state = 0;
                     if (a_endofpacket && (a_empty >= 0) ) begin
                        new_state = 0;
                        b_empty = a_empty - 0;
                        b_endofpacket = 1;
                        a_ready = 1;
                     end
                  end
               end
            end

   endcase

      in_ready = (a_ready || ~a_valid) && ~state_waitrequest;

      mem_readaddr = in_channel; 
      if (~in_ready)
         mem_readaddr = mem_readaddr_d1;

      
      sop_mem_writedata = 0;
      if (a_valid)
         sop_mem_writedata = a_startofpacket;
      if (b_ready && b_valid && b_startofpacket)
         sop_mem_writeenable = 1;

   end


   // ---------------------------------------------------------------------
   //| Output Register Stage
   // ---------------------------------------------------------------------
   always @(posedge clk or negedge reset_n) begin
      if (!reset_n) begin
         out_valid         <= 0;
         out_data          <= 0;
         out_channel       <= 0;
         out_startofpacket <= 0;
         out_endofpacket   <= 0;
         out_empty         <= 0;
         out_error         <= 0;
      end else begin
         if (out_ready || ~out_valid) begin
            out_valid         <= b_valid;
            out_data          <= b_data;
            out_channel       <= b_channel; 
            out_startofpacket <= b_startofpacket;
            out_endofpacket   <= b_endofpacket;
            out_empty         <= b_empty;
            out_error         <= b_error;
         end
      end 
   end
   



endmodule

   

