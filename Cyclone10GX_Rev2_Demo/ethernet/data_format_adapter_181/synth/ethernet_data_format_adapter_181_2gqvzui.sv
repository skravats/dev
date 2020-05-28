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
//   output_name:        ethernet_data_format_adapter_181_2gqvzui
//   usePackets:         true
//   hasInEmpty:         true
//   inEmptyWidth:       2
//   hasOutEmpty:        true 
//   outEmptyWidth:      5
//   inDataWidth:        32
//   outDataWidth:       256
//   channelWidth:       0
//   inErrorWidth:       6
//   outErrorWidth:      6
//   inSymbolsPerBeat:   4
//   outSymbolsPerBeat:  32
//   maxState:           31
//   stateWidth:         5
//   maxChannel:         0
//   symbolWidth:        8
//   numMemSymbols:      31
//   symbolWidth:        8


// ------------------------------------------

 
module ethernet_data_format_adapter_181_2gqvzui (
 // Interface: in
 output reg         in_ready,
 input              in_valid,
 input [32-1 : 0]    in_data,
 input [6-1 : 0] in_error,
 input              in_startofpacket,
 input              in_endofpacket,
 input [2-1 : 0] in_empty,
 // Interface: out
 input                out_ready,
 output reg           out_valid,
 output reg [256-1: 0]  out_data,
 output reg [6-1 : 0] out_error,
 output reg           out_startofpacket,
 output reg           out_endofpacket,
 output reg [5-1 : 0] out_empty,

  // Interface: clk
 input              clk,
 // Interface: reset
 input              reset_n

);



   // ---------------------------------------------------------------------
   //| Signal Declarations
   // ---------------------------------------------------------------------
   reg         state_read_addr;
   wire [5-1:0]   state_from_memory;
   reg  [5-1:0]   state;
   reg  [5-1:0]   new_state;
   reg  [5-1:0]   state_d1;
    
   reg            in_ready_d1;
   reg            mem_readaddr; 
   reg            mem_readaddr_d1;
   reg            a_ready;
   reg            a_valid;
   reg            a_channel;
   reg [8-1:0]    a_data0; 
   reg [8-1:0]    a_data1; 
   reg [8-1:0]    a_data2; 
   reg [8-1:0]    a_data3; 
   reg            a_startofpacket;
   reg            a_endofpacket;
   reg  [2-1:0]   a_empty;
   reg  [6-1:0]   a_error;
   reg            b_ready;
   reg            b_valid;
   reg            b_channel;
   reg  [256-1:0]   b_data;
   reg            b_startofpacket; 
   wire           b_startofpacket_wire; 
   reg            b_endofpacket; 
   reg  [5-1:0]   b_empty;
   reg  [6-1:0]   b_error; 
   reg            mem_write0;
   reg  [8-1:0]   mem_writedata0;
   wire [8-1:0]   mem_readdata0;
   wire           mem_waitrequest0;
   reg  [8-1:0]   mem0[0:0];
   reg            mem_write1;
   reg  [8-1:0]   mem_writedata1;
   wire [8-1:0]   mem_readdata1;
   wire           mem_waitrequest1;
   reg  [8-1:0]   mem1[0:0];
   reg            mem_write2;
   reg  [8-1:0]   mem_writedata2;
   wire [8-1:0]   mem_readdata2;
   wire           mem_waitrequest2;
   reg  [8-1:0]   mem2[0:0];
   reg            mem_write3;
   reg  [8-1:0]   mem_writedata3;
   wire [8-1:0]   mem_readdata3;
   wire           mem_waitrequest3;
   reg  [8-1:0]   mem3[0:0];
   reg            mem_write4;
   reg  [8-1:0]   mem_writedata4;
   wire [8-1:0]   mem_readdata4;
   wire           mem_waitrequest4;
   reg  [8-1:0]   mem4[0:0];
   reg            mem_write5;
   reg  [8-1:0]   mem_writedata5;
   wire [8-1:0]   mem_readdata5;
   wire           mem_waitrequest5;
   reg  [8-1:0]   mem5[0:0];
   reg            mem_write6;
   reg  [8-1:0]   mem_writedata6;
   wire [8-1:0]   mem_readdata6;
   wire           mem_waitrequest6;
   reg  [8-1:0]   mem6[0:0];
   reg            mem_write7;
   reg  [8-1:0]   mem_writedata7;
   wire [8-1:0]   mem_readdata7;
   wire           mem_waitrequest7;
   reg  [8-1:0]   mem7[0:0];
   reg            mem_write8;
   reg  [8-1:0]   mem_writedata8;
   wire [8-1:0]   mem_readdata8;
   wire           mem_waitrequest8;
   reg  [8-1:0]   mem8[0:0];
   reg            mem_write9;
   reg  [8-1:0]   mem_writedata9;
   wire [8-1:0]   mem_readdata9;
   wire           mem_waitrequest9;
   reg  [8-1:0]   mem9[0:0];
   reg            mem_write10;
   reg  [8-1:0]   mem_writedata10;
   wire [8-1:0]   mem_readdata10;
   wire           mem_waitrequest10;
   reg  [8-1:0]   mem10[0:0];
   reg            mem_write11;
   reg  [8-1:0]   mem_writedata11;
   wire [8-1:0]   mem_readdata11;
   wire           mem_waitrequest11;
   reg  [8-1:0]   mem11[0:0];
   reg            mem_write12;
   reg  [8-1:0]   mem_writedata12;
   wire [8-1:0]   mem_readdata12;
   wire           mem_waitrequest12;
   reg  [8-1:0]   mem12[0:0];
   reg            mem_write13;
   reg  [8-1:0]   mem_writedata13;
   wire [8-1:0]   mem_readdata13;
   wire           mem_waitrequest13;
   reg  [8-1:0]   mem13[0:0];
   reg            mem_write14;
   reg  [8-1:0]   mem_writedata14;
   wire [8-1:0]   mem_readdata14;
   wire           mem_waitrequest14;
   reg  [8-1:0]   mem14[0:0];
   reg            mem_write15;
   reg  [8-1:0]   mem_writedata15;
   wire [8-1:0]   mem_readdata15;
   wire           mem_waitrequest15;
   reg  [8-1:0]   mem15[0:0];
   reg            mem_write16;
   reg  [8-1:0]   mem_writedata16;
   wire [8-1:0]   mem_readdata16;
   wire           mem_waitrequest16;
   reg  [8-1:0]   mem16[0:0];
   reg            mem_write17;
   reg  [8-1:0]   mem_writedata17;
   wire [8-1:0]   mem_readdata17;
   wire           mem_waitrequest17;
   reg  [8-1:0]   mem17[0:0];
   reg            mem_write18;
   reg  [8-1:0]   mem_writedata18;
   wire [8-1:0]   mem_readdata18;
   wire           mem_waitrequest18;
   reg  [8-1:0]   mem18[0:0];
   reg            mem_write19;
   reg  [8-1:0]   mem_writedata19;
   wire [8-1:0]   mem_readdata19;
   wire           mem_waitrequest19;
   reg  [8-1:0]   mem19[0:0];
   reg            mem_write20;
   reg  [8-1:0]   mem_writedata20;
   wire [8-1:0]   mem_readdata20;
   wire           mem_waitrequest20;
   reg  [8-1:0]   mem20[0:0];
   reg            mem_write21;
   reg  [8-1:0]   mem_writedata21;
   wire [8-1:0]   mem_readdata21;
   wire           mem_waitrequest21;
   reg  [8-1:0]   mem21[0:0];
   reg            mem_write22;
   reg  [8-1:0]   mem_writedata22;
   wire [8-1:0]   mem_readdata22;
   wire           mem_waitrequest22;
   reg  [8-1:0]   mem22[0:0];
   reg            mem_write23;
   reg  [8-1:0]   mem_writedata23;
   wire [8-1:0]   mem_readdata23;
   wire           mem_waitrequest23;
   reg  [8-1:0]   mem23[0:0];
   reg            mem_write24;
   reg  [8-1:0]   mem_writedata24;
   wire [8-1:0]   mem_readdata24;
   wire           mem_waitrequest24;
   reg  [8-1:0]   mem24[0:0];
   reg            mem_write25;
   reg  [8-1:0]   mem_writedata25;
   wire [8-1:0]   mem_readdata25;
   wire           mem_waitrequest25;
   reg  [8-1:0]   mem25[0:0];
   reg            mem_write26;
   reg  [8-1:0]   mem_writedata26;
   wire [8-1:0]   mem_readdata26;
   wire           mem_waitrequest26;
   reg  [8-1:0]   mem26[0:0];
   reg            mem_write27;
   reg  [8-1:0]   mem_writedata27;
   wire [8-1:0]   mem_readdata27;
   wire           mem_waitrequest27;
   reg  [8-1:0]   mem27[0:0];
   reg            mem_write28;
   reg  [8-1:0]   mem_writedata28;
   wire [8-1:0]   mem_readdata28;
   wire           mem_waitrequest28;
   reg  [8-1:0]   mem28[0:0];
   reg            mem_write29;
   reg  [8-1:0]   mem_writedata29;
   wire [8-1:0]   mem_readdata29;
   wire           mem_waitrequest29;
   reg  [8-1:0]   mem29[0:0];
   reg            mem_write30;
   reg  [8-1:0]   mem_writedata30;
   wire [8-1:0]   mem_readdata30;
   wire           mem_waitrequest30;
   reg  [8-1:0]   mem30[0:0];
   reg            sop_mem_writeenable;
   reg            sop_mem_writedata;
   wire           mem_waitrequest_sop; 

   wire           state_waitrequest;
   reg            state_waitrequest_d1; 

   reg            in_channel = 0;
   reg            out_channel;




   wire [6-1:0] error_from_mem;
   reg  [6-1:0] error_mem_writedata;
   reg          error_mem_writeenable;

   reg  [5-1:0]   state_register;
   reg            sop_register; 
   reg  [6-1:0]   error_register;
   reg  [8-1:0]   data0_register;
   reg  [8-1:0]   data1_register;
   reg  [8-1:0]   data2_register;
   reg  [8-1:0]   data3_register;
   reg  [8-1:0]   data4_register;
   reg  [8-1:0]   data5_register;
   reg  [8-1:0]   data6_register;
   reg  [8-1:0]   data7_register;
   reg  [8-1:0]   data8_register;
   reg  [8-1:0]   data9_register;
   reg  [8-1:0]   data10_register;
   reg  [8-1:0]   data11_register;
   reg  [8-1:0]   data12_register;
   reg  [8-1:0]   data13_register;
   reg  [8-1:0]   data14_register;
   reg  [8-1:0]   data15_register;
   reg  [8-1:0]   data16_register;
   reg  [8-1:0]   data17_register;
   reg  [8-1:0]   data18_register;
   reg  [8-1:0]   data19_register;
   reg  [8-1:0]   data20_register;
   reg  [8-1:0]   data21_register;
   reg  [8-1:0]   data22_register;
   reg  [8-1:0]   data23_register;
   reg  [8-1:0]   data24_register;
   reg  [8-1:0]   data25_register;
   reg  [8-1:0]   data26_register;
   reg  [8-1:0]   data27_register;
   reg  [8-1:0]   data28_register;
   reg  [8-1:0]   data29_register;
   reg  [8-1:0]   data30_register;

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
         a_startofpacket <= 0;
         a_endofpacket   <= 0;
         a_empty <= 0; 
         a_error <= 0;
      end else begin
         if (in_ready) begin
            a_valid   <= in_valid;
            a_channel <= in_channel;
            a_error   <= in_error;
            a_data0 <= in_data[31:24];
            a_data1 <= in_data[23:16];
            a_data2 <= in_data[15:8];
            a_data3 <= in_data[7:0];
            a_startofpacket <= in_startofpacket;
            a_endofpacket   <= in_endofpacket;
            a_empty         <= 0; 
            if (in_endofpacket)
               a_empty <= in_empty;
         end
      end 
   end

   always @* begin 
      state_read_addr = in_channel;
   end
   

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
   
   always @(posedge clk or negedge reset_n) begin
      if (!reset_n) begin
         state_register <= 0;
         sop_register   <= 0;
         data0_register <= 0;
         data1_register <= 0;
         data2_register <= 0;
         data3_register <= 0;
         data4_register <= 0;
         data5_register <= 0;
         data6_register <= 0;
         data7_register <= 0;
         data8_register <= 0;
         data9_register <= 0;
         data10_register <= 0;
         data11_register <= 0;
         data12_register <= 0;
         data13_register <= 0;
         data14_register <= 0;
         data15_register <= 0;
         data16_register <= 0;
         data17_register <= 0;
         data18_register <= 0;
         data19_register <= 0;
         data20_register <= 0;
         data21_register <= 0;
         data22_register <= 0;
         data23_register <= 0;
         data24_register <= 0;
         data25_register <= 0;
         data26_register <= 0;
         data27_register <= 0;
         data28_register <= 0;
         data29_register <= 0;
         data30_register <= 0;
         error_register <= 0;
      end else begin
         state_register <= new_state;
         if (sop_mem_writeenable)
            sop_register   <= sop_mem_writedata;
         if (a_valid)
            error_register <= error_mem_writedata;
         if (mem_write0)
            data0_register <= mem_writedata0;
         if (mem_write1)
            data1_register <= mem_writedata1;
         if (mem_write2)
            data2_register <= mem_writedata2;
         if (mem_write3)
            data3_register <= mem_writedata3;
         if (mem_write4)
            data4_register <= mem_writedata4;
         if (mem_write5)
            data5_register <= mem_writedata5;
         if (mem_write6)
            data6_register <= mem_writedata6;
         if (mem_write7)
            data7_register <= mem_writedata7;
         if (mem_write8)
            data8_register <= mem_writedata8;
         if (mem_write9)
            data9_register <= mem_writedata9;
         if (mem_write10)
            data10_register <= mem_writedata10;
         if (mem_write11)
            data11_register <= mem_writedata11;
         if (mem_write12)
            data12_register <= mem_writedata12;
         if (mem_write13)
            data13_register <= mem_writedata13;
         if (mem_write14)
            data14_register <= mem_writedata14;
         if (mem_write15)
            data15_register <= mem_writedata15;
         if (mem_write16)
            data16_register <= mem_writedata16;
         if (mem_write17)
            data17_register <= mem_writedata17;
         if (mem_write18)
            data18_register <= mem_writedata18;
         if (mem_write19)
            data19_register <= mem_writedata19;
         if (mem_write20)
            data20_register <= mem_writedata20;
         if (mem_write21)
            data21_register <= mem_writedata21;
         if (mem_write22)
            data22_register <= mem_writedata22;
         if (mem_write23)
            data23_register <= mem_writedata23;
         if (mem_write24)
            data24_register <= mem_writedata24;
         if (mem_write25)
            data25_register <= mem_writedata25;
         if (mem_write26)
            data26_register <= mem_writedata26;
         if (mem_write27)
            data27_register <= mem_writedata27;
         if (mem_write28)
            data28_register <= mem_writedata28;
         if (mem_write29)
            data29_register <= mem_writedata29;
         if (mem_write30)
            data30_register <= mem_writedata30;
         end
      end
   
      assign state_from_memory = state_register;
      assign b_startofpacket_wire = sop_register;
      assign mem_readdata0 = data0_register;
      assign mem_readdata1 = data1_register;
      assign mem_readdata2 = data2_register;
      assign mem_readdata3 = data3_register;
      assign mem_readdata4 = data4_register;
      assign mem_readdata5 = data5_register;
      assign mem_readdata6 = data6_register;
      assign mem_readdata7 = data7_register;
      assign mem_readdata8 = data8_register;
      assign mem_readdata9 = data9_register;
      assign mem_readdata10 = data10_register;
      assign mem_readdata11 = data11_register;
      assign mem_readdata12 = data12_register;
      assign mem_readdata13 = data13_register;
      assign mem_readdata14 = data14_register;
      assign mem_readdata15 = data15_register;
      assign mem_readdata16 = data16_register;
      assign mem_readdata17 = data17_register;
      assign mem_readdata18 = data18_register;
      assign mem_readdata19 = data19_register;
      assign mem_readdata20 = data20_register;
      assign mem_readdata21 = data21_register;
      assign mem_readdata22 = data22_register;
      assign mem_readdata23 = data23_register;
      assign mem_readdata24 = data24_register;
      assign mem_readdata25 = data25_register;
      assign mem_readdata26 = data26_register;
      assign mem_readdata27 = data27_register;
      assign mem_readdata28 = data28_register;
      assign mem_readdata29 = data29_register;
      assign mem_readdata30 = data30_register;
      assign error_from_mem = error_register;
   
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
   if (~in_ready_d1)
      state = state_d1;
         
   error_mem_writedata = error_from_mem | a_error;
   if (state == 0)
      error_mem_writedata = a_error;
   b_error = error_mem_writedata;
      
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
      
   b_startofpacket = b_startofpacket_wire;
   b_empty = 0;
       
   case (state) 
            0 : begin
               mem_writedata0 = a_data0;
               b_data[255:248] = a_data0;
               mem_writedata1 = a_data1;
               b_data[247:240] = a_data1;
               mem_writedata2 = a_data2;
               b_data[239:232] = a_data2;
               mem_writedata3 = a_data3;
               b_data[231:224] = a_data3;
               if (out_ready || ~out_valid) begin
                  a_ready = 1;
                  if (a_valid) 
                  begin
                     new_state = state+1'b1;
                     mem_write0 = 1;
                     mem_write1 = 1;
                     mem_write2 = 1;
                     mem_write3 = 1;
                     sop_mem_writeenable = 1;
                     if (a_endofpacket) begin
                        b_empty = a_empty+28;
                        b_valid = 1;
                        b_startofpacket = a_startofpacket;
                        new_state = 0;
                     end
                  end
               end
            end
         1 : begin
               mem_writedata0 = mem_readdata0;
               b_data[255:248] = mem_readdata0;
               mem_writedata1 = mem_readdata1;
               b_data[247:240] = mem_readdata1;
               mem_writedata2 = mem_readdata2;
               b_data[239:232] = mem_readdata2;
               mem_writedata3 = mem_readdata3;
               b_data[231:224] = mem_readdata3;
               mem_writedata4 = a_data0;
               b_data[223:216] = a_data0;
               mem_writedata5 = a_data1;
               b_data[215:208] = a_data1;
               mem_writedata6 = a_data2;
               b_data[207:200] = a_data2;
               mem_writedata7 = a_data3;
               b_data[199:192] = a_data3;
               if (out_ready || ~out_valid) begin
                  a_ready = 1;
                  if (a_valid) 
                  begin
                     new_state = state+1'b1;
                     mem_write0 = 1;
                     mem_write1 = 1;
                     mem_write2 = 1;
                     mem_write3 = 1;
                     mem_write4 = 1;
                     mem_write5 = 1;
                     mem_write6 = 1;
                     mem_write7 = 1;
                     if (a_endofpacket) begin
                        b_empty = a_empty+24;
                        b_valid = 1;
                        new_state = 0;
                     end
                  end
               end
            end
         2 : begin
               mem_writedata0 = mem_readdata0;
               b_data[255:248] = mem_readdata0;
               mem_writedata1 = mem_readdata1;
               b_data[247:240] = mem_readdata1;
               mem_writedata2 = mem_readdata2;
               b_data[239:232] = mem_readdata2;
               mem_writedata3 = mem_readdata3;
               b_data[231:224] = mem_readdata3;
               mem_writedata4 = mem_readdata4;
               b_data[223:216] = mem_readdata4;
               mem_writedata5 = mem_readdata5;
               b_data[215:208] = mem_readdata5;
               mem_writedata6 = mem_readdata6;
               b_data[207:200] = mem_readdata6;
               mem_writedata7 = mem_readdata7;
               b_data[199:192] = mem_readdata7;
               mem_writedata8 = a_data0;
               b_data[191:184] = a_data0;
               mem_writedata9 = a_data1;
               b_data[183:176] = a_data1;
               mem_writedata10 = a_data2;
               b_data[175:168] = a_data2;
               mem_writedata11 = a_data3;
               b_data[167:160] = a_data3;
               if (out_ready || ~out_valid) begin
                  a_ready = 1;
                  if (a_valid) 
                  begin
                     new_state = state+1'b1;
                     mem_write0 = 1;
                     mem_write1 = 1;
                     mem_write2 = 1;
                     mem_write3 = 1;
                     mem_write4 = 1;
                     mem_write5 = 1;
                     mem_write6 = 1;
                     mem_write7 = 1;
                     mem_write8 = 1;
                     mem_write9 = 1;
                     mem_write10 = 1;
                     mem_write11 = 1;
                     if (a_endofpacket) begin
                        b_empty = a_empty+20;
                        b_valid = 1;
                        new_state = 0;
                     end
                  end
               end
            end
         3 : begin
               mem_writedata0 = mem_readdata0;
               b_data[255:248] = mem_readdata0;
               mem_writedata1 = mem_readdata1;
               b_data[247:240] = mem_readdata1;
               mem_writedata2 = mem_readdata2;
               b_data[239:232] = mem_readdata2;
               mem_writedata3 = mem_readdata3;
               b_data[231:224] = mem_readdata3;
               mem_writedata4 = mem_readdata4;
               b_data[223:216] = mem_readdata4;
               mem_writedata5 = mem_readdata5;
               b_data[215:208] = mem_readdata5;
               mem_writedata6 = mem_readdata6;
               b_data[207:200] = mem_readdata6;
               mem_writedata7 = mem_readdata7;
               b_data[199:192] = mem_readdata7;
               mem_writedata8 = mem_readdata8;
               b_data[191:184] = mem_readdata8;
               mem_writedata9 = mem_readdata9;
               b_data[183:176] = mem_readdata9;
               mem_writedata10 = mem_readdata10;
               b_data[175:168] = mem_readdata10;
               mem_writedata11 = mem_readdata11;
               b_data[167:160] = mem_readdata11;
               mem_writedata12 = a_data0;
               b_data[159:152] = a_data0;
               mem_writedata13 = a_data1;
               b_data[151:144] = a_data1;
               mem_writedata14 = a_data2;
               b_data[143:136] = a_data2;
               mem_writedata15 = a_data3;
               b_data[135:128] = a_data3;
               if (out_ready || ~out_valid) begin
                  a_ready = 1;
                  if (a_valid) 
                  begin
                     new_state = state+1'b1;
                     mem_write0 = 1;
                     mem_write1 = 1;
                     mem_write2 = 1;
                     mem_write3 = 1;
                     mem_write4 = 1;
                     mem_write5 = 1;
                     mem_write6 = 1;
                     mem_write7 = 1;
                     mem_write8 = 1;
                     mem_write9 = 1;
                     mem_write10 = 1;
                     mem_write11 = 1;
                     mem_write12 = 1;
                     mem_write13 = 1;
                     mem_write14 = 1;
                     mem_write15 = 1;
                     if (a_endofpacket) begin
                        b_empty = a_empty+16;
                        b_valid = 1;
                        new_state = 0;
                     end
                  end
               end
            end
         4 : begin
               mem_writedata0 = mem_readdata0;
               b_data[255:248] = mem_readdata0;
               mem_writedata1 = mem_readdata1;
               b_data[247:240] = mem_readdata1;
               mem_writedata2 = mem_readdata2;
               b_data[239:232] = mem_readdata2;
               mem_writedata3 = mem_readdata3;
               b_data[231:224] = mem_readdata3;
               mem_writedata4 = mem_readdata4;
               b_data[223:216] = mem_readdata4;
               mem_writedata5 = mem_readdata5;
               b_data[215:208] = mem_readdata5;
               mem_writedata6 = mem_readdata6;
               b_data[207:200] = mem_readdata6;
               mem_writedata7 = mem_readdata7;
               b_data[199:192] = mem_readdata7;
               mem_writedata8 = mem_readdata8;
               b_data[191:184] = mem_readdata8;
               mem_writedata9 = mem_readdata9;
               b_data[183:176] = mem_readdata9;
               mem_writedata10 = mem_readdata10;
               b_data[175:168] = mem_readdata10;
               mem_writedata11 = mem_readdata11;
               b_data[167:160] = mem_readdata11;
               mem_writedata12 = mem_readdata12;
               b_data[159:152] = mem_readdata12;
               mem_writedata13 = mem_readdata13;
               b_data[151:144] = mem_readdata13;
               mem_writedata14 = mem_readdata14;
               b_data[143:136] = mem_readdata14;
               mem_writedata15 = mem_readdata15;
               b_data[135:128] = mem_readdata15;
               mem_writedata16 = a_data0;
               b_data[127:120] = a_data0;
               mem_writedata17 = a_data1;
               b_data[119:112] = a_data1;
               mem_writedata18 = a_data2;
               b_data[111:104] = a_data2;
               mem_writedata19 = a_data3;
               b_data[103:96] = a_data3;
               if (out_ready || ~out_valid) begin
                  a_ready = 1;
                  if (a_valid) 
                  begin
                     new_state = state+1'b1;
                     mem_write0 = 1;
                     mem_write1 = 1;
                     mem_write2 = 1;
                     mem_write3 = 1;
                     mem_write4 = 1;
                     mem_write5 = 1;
                     mem_write6 = 1;
                     mem_write7 = 1;
                     mem_write8 = 1;
                     mem_write9 = 1;
                     mem_write10 = 1;
                     mem_write11 = 1;
                     mem_write12 = 1;
                     mem_write13 = 1;
                     mem_write14 = 1;
                     mem_write15 = 1;
                     mem_write16 = 1;
                     mem_write17 = 1;
                     mem_write18 = 1;
                     mem_write19 = 1;
                     if (a_endofpacket) begin
                        b_empty = a_empty+12;
                        b_valid = 1;
                        new_state = 0;
                     end
                  end
               end
            end
         5 : begin
               mem_writedata0 = mem_readdata0;
               b_data[255:248] = mem_readdata0;
               mem_writedata1 = mem_readdata1;
               b_data[247:240] = mem_readdata1;
               mem_writedata2 = mem_readdata2;
               b_data[239:232] = mem_readdata2;
               mem_writedata3 = mem_readdata3;
               b_data[231:224] = mem_readdata3;
               mem_writedata4 = mem_readdata4;
               b_data[223:216] = mem_readdata4;
               mem_writedata5 = mem_readdata5;
               b_data[215:208] = mem_readdata5;
               mem_writedata6 = mem_readdata6;
               b_data[207:200] = mem_readdata6;
               mem_writedata7 = mem_readdata7;
               b_data[199:192] = mem_readdata7;
               mem_writedata8 = mem_readdata8;
               b_data[191:184] = mem_readdata8;
               mem_writedata9 = mem_readdata9;
               b_data[183:176] = mem_readdata9;
               mem_writedata10 = mem_readdata10;
               b_data[175:168] = mem_readdata10;
               mem_writedata11 = mem_readdata11;
               b_data[167:160] = mem_readdata11;
               mem_writedata12 = mem_readdata12;
               b_data[159:152] = mem_readdata12;
               mem_writedata13 = mem_readdata13;
               b_data[151:144] = mem_readdata13;
               mem_writedata14 = mem_readdata14;
               b_data[143:136] = mem_readdata14;
               mem_writedata15 = mem_readdata15;
               b_data[135:128] = mem_readdata15;
               mem_writedata16 = mem_readdata16;
               b_data[127:120] = mem_readdata16;
               mem_writedata17 = mem_readdata17;
               b_data[119:112] = mem_readdata17;
               mem_writedata18 = mem_readdata18;
               b_data[111:104] = mem_readdata18;
               mem_writedata19 = mem_readdata19;
               b_data[103:96] = mem_readdata19;
               mem_writedata20 = a_data0;
               b_data[95:88] = a_data0;
               mem_writedata21 = a_data1;
               b_data[87:80] = a_data1;
               mem_writedata22 = a_data2;
               b_data[79:72] = a_data2;
               mem_writedata23 = a_data3;
               b_data[71:64] = a_data3;
               if (out_ready || ~out_valid) begin
                  a_ready = 1;
                  if (a_valid) 
                  begin
                     new_state = state+1'b1;
                     mem_write0 = 1;
                     mem_write1 = 1;
                     mem_write2 = 1;
                     mem_write3 = 1;
                     mem_write4 = 1;
                     mem_write5 = 1;
                     mem_write6 = 1;
                     mem_write7 = 1;
                     mem_write8 = 1;
                     mem_write9 = 1;
                     mem_write10 = 1;
                     mem_write11 = 1;
                     mem_write12 = 1;
                     mem_write13 = 1;
                     mem_write14 = 1;
                     mem_write15 = 1;
                     mem_write16 = 1;
                     mem_write17 = 1;
                     mem_write18 = 1;
                     mem_write19 = 1;
                     mem_write20 = 1;
                     mem_write21 = 1;
                     mem_write22 = 1;
                     mem_write23 = 1;
                     if (a_endofpacket) begin
                        b_empty = a_empty+8;
                        b_valid = 1;
                        new_state = 0;
                     end
                  end
               end
            end
         6 : begin
               mem_writedata0 = mem_readdata0;
               b_data[255:248] = mem_readdata0;
               mem_writedata1 = mem_readdata1;
               b_data[247:240] = mem_readdata1;
               mem_writedata2 = mem_readdata2;
               b_data[239:232] = mem_readdata2;
               mem_writedata3 = mem_readdata3;
               b_data[231:224] = mem_readdata3;
               mem_writedata4 = mem_readdata4;
               b_data[223:216] = mem_readdata4;
               mem_writedata5 = mem_readdata5;
               b_data[215:208] = mem_readdata5;
               mem_writedata6 = mem_readdata6;
               b_data[207:200] = mem_readdata6;
               mem_writedata7 = mem_readdata7;
               b_data[199:192] = mem_readdata7;
               mem_writedata8 = mem_readdata8;
               b_data[191:184] = mem_readdata8;
               mem_writedata9 = mem_readdata9;
               b_data[183:176] = mem_readdata9;
               mem_writedata10 = mem_readdata10;
               b_data[175:168] = mem_readdata10;
               mem_writedata11 = mem_readdata11;
               b_data[167:160] = mem_readdata11;
               mem_writedata12 = mem_readdata12;
               b_data[159:152] = mem_readdata12;
               mem_writedata13 = mem_readdata13;
               b_data[151:144] = mem_readdata13;
               mem_writedata14 = mem_readdata14;
               b_data[143:136] = mem_readdata14;
               mem_writedata15 = mem_readdata15;
               b_data[135:128] = mem_readdata15;
               mem_writedata16 = mem_readdata16;
               b_data[127:120] = mem_readdata16;
               mem_writedata17 = mem_readdata17;
               b_data[119:112] = mem_readdata17;
               mem_writedata18 = mem_readdata18;
               b_data[111:104] = mem_readdata18;
               mem_writedata19 = mem_readdata19;
               b_data[103:96] = mem_readdata19;
               mem_writedata20 = mem_readdata20;
               b_data[95:88] = mem_readdata20;
               mem_writedata21 = mem_readdata21;
               b_data[87:80] = mem_readdata21;
               mem_writedata22 = mem_readdata22;
               b_data[79:72] = mem_readdata22;
               mem_writedata23 = mem_readdata23;
               b_data[71:64] = mem_readdata23;
               mem_writedata24 = a_data0;
               b_data[63:56] = a_data0;
               mem_writedata25 = a_data1;
               b_data[55:48] = a_data1;
               mem_writedata26 = a_data2;
               b_data[47:40] = a_data2;
               mem_writedata27 = a_data3;
               b_data[39:32] = a_data3;
               if (out_ready || ~out_valid) begin
                  a_ready = 1;
                  if (a_valid) 
                  begin
                     new_state = state+1'b1;
                     mem_write0 = 1;
                     mem_write1 = 1;
                     mem_write2 = 1;
                     mem_write3 = 1;
                     mem_write4 = 1;
                     mem_write5 = 1;
                     mem_write6 = 1;
                     mem_write7 = 1;
                     mem_write8 = 1;
                     mem_write9 = 1;
                     mem_write10 = 1;
                     mem_write11 = 1;
                     mem_write12 = 1;
                     mem_write13 = 1;
                     mem_write14 = 1;
                     mem_write15 = 1;
                     mem_write16 = 1;
                     mem_write17 = 1;
                     mem_write18 = 1;
                     mem_write19 = 1;
                     mem_write20 = 1;
                     mem_write21 = 1;
                     mem_write22 = 1;
                     mem_write23 = 1;
                     mem_write24 = 1;
                     mem_write25 = 1;
                     mem_write26 = 1;
                     mem_write27 = 1;
                     if (a_endofpacket) begin
                        b_empty = a_empty+4;
                        b_valid = 1;
                        new_state = 0;
                     end
                  end
               end
            end
         7 : begin
               b_data[255:248] = mem_readdata0;
               b_data[247:240] = mem_readdata1;
               b_data[239:232] = mem_readdata2;
               b_data[231:224] = mem_readdata3;
               b_data[223:216] = mem_readdata4;
               b_data[215:208] = mem_readdata5;
               b_data[207:200] = mem_readdata6;
               b_data[199:192] = mem_readdata7;
               b_data[191:184] = mem_readdata8;
               b_data[183:176] = mem_readdata9;
               b_data[175:168] = mem_readdata10;
               b_data[167:160] = mem_readdata11;
               b_data[159:152] = mem_readdata12;
               b_data[151:144] = mem_readdata13;
               b_data[143:136] = mem_readdata14;
               b_data[135:128] = mem_readdata15;
               b_data[127:120] = mem_readdata16;
               b_data[119:112] = mem_readdata17;
               b_data[111:104] = mem_readdata18;
               b_data[103:96] = mem_readdata19;
               b_data[95:88] = mem_readdata20;
               b_data[87:80] = mem_readdata21;
               b_data[79:72] = mem_readdata22;
               b_data[71:64] = mem_readdata23;
               b_data[63:56] = mem_readdata24;
               b_data[55:48] = mem_readdata25;
               b_data[47:40] = mem_readdata26;
               b_data[39:32] = mem_readdata27;
               b_data[31:24] = a_data0;
               b_data[23:16] = a_data1;
               b_data[15:8] = a_data2;
               b_data[7:0] = a_data3;
               if (out_ready || ~out_valid) begin
                  a_ready = 1;
                  if (a_valid) 
                  begin
                     new_state = state+1'b1;
                     b_valid = 1;
                     if (a_endofpacket) begin
                        b_empty = a_empty+0;
                        b_valid = 1;
                        new_state = 0;
                     end
                  end
               end
            end
         8 : begin
               mem_writedata0 = a_data0;
               b_data[255:248] = a_data0;
               mem_writedata1 = a_data1;
               b_data[247:240] = a_data1;
               mem_writedata2 = a_data2;
               b_data[239:232] = a_data2;
               mem_writedata3 = a_data3;
               b_data[231:224] = a_data3;
               if (out_ready || ~out_valid) begin
                  a_ready = 1;
                  if (a_valid) 
                  begin
                     new_state = state+1'b1;
                     mem_write0 = 1;
                     mem_write1 = 1;
                     mem_write2 = 1;
                     mem_write3 = 1;
                     sop_mem_writeenable = 1;
                     if (a_endofpacket) begin
                        b_empty = a_empty+28;
                        b_valid = 1;
                        new_state = 0;
                     end
                  end
               end
            end
         9 : begin
               mem_writedata0 = mem_readdata0;
               b_data[255:248] = mem_readdata0;
               mem_writedata1 = mem_readdata1;
               b_data[247:240] = mem_readdata1;
               mem_writedata2 = mem_readdata2;
               b_data[239:232] = mem_readdata2;
               mem_writedata3 = mem_readdata3;
               b_data[231:224] = mem_readdata3;
               mem_writedata4 = a_data0;
               b_data[223:216] = a_data0;
               mem_writedata5 = a_data1;
               b_data[215:208] = a_data1;
               mem_writedata6 = a_data2;
               b_data[207:200] = a_data2;
               mem_writedata7 = a_data3;
               b_data[199:192] = a_data3;
               if (out_ready || ~out_valid) begin
                  a_ready = 1;
                  if (a_valid) 
                  begin
                     new_state = state+1'b1;
                     mem_write0 = 1;
                     mem_write1 = 1;
                     mem_write2 = 1;
                     mem_write3 = 1;
                     mem_write4 = 1;
                     mem_write5 = 1;
                     mem_write6 = 1;
                     mem_write7 = 1;
                     if (a_endofpacket) begin
                        b_empty = a_empty+24;
                        b_valid = 1;
                        new_state = 0;
                     end
                  end
               end
            end
         10 : begin
               mem_writedata0 = mem_readdata0;
               b_data[255:248] = mem_readdata0;
               mem_writedata1 = mem_readdata1;
               b_data[247:240] = mem_readdata1;
               mem_writedata2 = mem_readdata2;
               b_data[239:232] = mem_readdata2;
               mem_writedata3 = mem_readdata3;
               b_data[231:224] = mem_readdata3;
               mem_writedata4 = mem_readdata4;
               b_data[223:216] = mem_readdata4;
               mem_writedata5 = mem_readdata5;
               b_data[215:208] = mem_readdata5;
               mem_writedata6 = mem_readdata6;
               b_data[207:200] = mem_readdata6;
               mem_writedata7 = mem_readdata7;
               b_data[199:192] = mem_readdata7;
               mem_writedata8 = a_data0;
               b_data[191:184] = a_data0;
               mem_writedata9 = a_data1;
               b_data[183:176] = a_data1;
               mem_writedata10 = a_data2;
               b_data[175:168] = a_data2;
               mem_writedata11 = a_data3;
               b_data[167:160] = a_data3;
               if (out_ready || ~out_valid) begin
                  a_ready = 1;
                  if (a_valid) 
                  begin
                     new_state = state+1'b1;
                     mem_write0 = 1;
                     mem_write1 = 1;
                     mem_write2 = 1;
                     mem_write3 = 1;
                     mem_write4 = 1;
                     mem_write5 = 1;
                     mem_write6 = 1;
                     mem_write7 = 1;
                     mem_write8 = 1;
                     mem_write9 = 1;
                     mem_write10 = 1;
                     mem_write11 = 1;
                     if (a_endofpacket) begin
                        b_empty = a_empty+20;
                        b_valid = 1;
                        new_state = 0;
                     end
                  end
               end
            end
         11 : begin
               mem_writedata0 = mem_readdata0;
               b_data[255:248] = mem_readdata0;
               mem_writedata1 = mem_readdata1;
               b_data[247:240] = mem_readdata1;
               mem_writedata2 = mem_readdata2;
               b_data[239:232] = mem_readdata2;
               mem_writedata3 = mem_readdata3;
               b_data[231:224] = mem_readdata3;
               mem_writedata4 = mem_readdata4;
               b_data[223:216] = mem_readdata4;
               mem_writedata5 = mem_readdata5;
               b_data[215:208] = mem_readdata5;
               mem_writedata6 = mem_readdata6;
               b_data[207:200] = mem_readdata6;
               mem_writedata7 = mem_readdata7;
               b_data[199:192] = mem_readdata7;
               mem_writedata8 = mem_readdata8;
               b_data[191:184] = mem_readdata8;
               mem_writedata9 = mem_readdata9;
               b_data[183:176] = mem_readdata9;
               mem_writedata10 = mem_readdata10;
               b_data[175:168] = mem_readdata10;
               mem_writedata11 = mem_readdata11;
               b_data[167:160] = mem_readdata11;
               mem_writedata12 = a_data0;
               b_data[159:152] = a_data0;
               mem_writedata13 = a_data1;
               b_data[151:144] = a_data1;
               mem_writedata14 = a_data2;
               b_data[143:136] = a_data2;
               mem_writedata15 = a_data3;
               b_data[135:128] = a_data3;
               if (out_ready || ~out_valid) begin
                  a_ready = 1;
                  if (a_valid) 
                  begin
                     new_state = state+1'b1;
                     mem_write0 = 1;
                     mem_write1 = 1;
                     mem_write2 = 1;
                     mem_write3 = 1;
                     mem_write4 = 1;
                     mem_write5 = 1;
                     mem_write6 = 1;
                     mem_write7 = 1;
                     mem_write8 = 1;
                     mem_write9 = 1;
                     mem_write10 = 1;
                     mem_write11 = 1;
                     mem_write12 = 1;
                     mem_write13 = 1;
                     mem_write14 = 1;
                     mem_write15 = 1;
                     if (a_endofpacket) begin
                        b_empty = a_empty+16;
                        b_valid = 1;
                        new_state = 0;
                     end
                  end
               end
            end
         12 : begin
               mem_writedata0 = mem_readdata0;
               b_data[255:248] = mem_readdata0;
               mem_writedata1 = mem_readdata1;
               b_data[247:240] = mem_readdata1;
               mem_writedata2 = mem_readdata2;
               b_data[239:232] = mem_readdata2;
               mem_writedata3 = mem_readdata3;
               b_data[231:224] = mem_readdata3;
               mem_writedata4 = mem_readdata4;
               b_data[223:216] = mem_readdata4;
               mem_writedata5 = mem_readdata5;
               b_data[215:208] = mem_readdata5;
               mem_writedata6 = mem_readdata6;
               b_data[207:200] = mem_readdata6;
               mem_writedata7 = mem_readdata7;
               b_data[199:192] = mem_readdata7;
               mem_writedata8 = mem_readdata8;
               b_data[191:184] = mem_readdata8;
               mem_writedata9 = mem_readdata9;
               b_data[183:176] = mem_readdata9;
               mem_writedata10 = mem_readdata10;
               b_data[175:168] = mem_readdata10;
               mem_writedata11 = mem_readdata11;
               b_data[167:160] = mem_readdata11;
               mem_writedata12 = mem_readdata12;
               b_data[159:152] = mem_readdata12;
               mem_writedata13 = mem_readdata13;
               b_data[151:144] = mem_readdata13;
               mem_writedata14 = mem_readdata14;
               b_data[143:136] = mem_readdata14;
               mem_writedata15 = mem_readdata15;
               b_data[135:128] = mem_readdata15;
               mem_writedata16 = a_data0;
               b_data[127:120] = a_data0;
               mem_writedata17 = a_data1;
               b_data[119:112] = a_data1;
               mem_writedata18 = a_data2;
               b_data[111:104] = a_data2;
               mem_writedata19 = a_data3;
               b_data[103:96] = a_data3;
               if (out_ready || ~out_valid) begin
                  a_ready = 1;
                  if (a_valid) 
                  begin
                     new_state = state+1'b1;
                     mem_write0 = 1;
                     mem_write1 = 1;
                     mem_write2 = 1;
                     mem_write3 = 1;
                     mem_write4 = 1;
                     mem_write5 = 1;
                     mem_write6 = 1;
                     mem_write7 = 1;
                     mem_write8 = 1;
                     mem_write9 = 1;
                     mem_write10 = 1;
                     mem_write11 = 1;
                     mem_write12 = 1;
                     mem_write13 = 1;
                     mem_write14 = 1;
                     mem_write15 = 1;
                     mem_write16 = 1;
                     mem_write17 = 1;
                     mem_write18 = 1;
                     mem_write19 = 1;
                     if (a_endofpacket) begin
                        b_empty = a_empty+12;
                        b_valid = 1;
                        new_state = 0;
                     end
                  end
               end
            end
         13 : begin
               mem_writedata0 = mem_readdata0;
               b_data[255:248] = mem_readdata0;
               mem_writedata1 = mem_readdata1;
               b_data[247:240] = mem_readdata1;
               mem_writedata2 = mem_readdata2;
               b_data[239:232] = mem_readdata2;
               mem_writedata3 = mem_readdata3;
               b_data[231:224] = mem_readdata3;
               mem_writedata4 = mem_readdata4;
               b_data[223:216] = mem_readdata4;
               mem_writedata5 = mem_readdata5;
               b_data[215:208] = mem_readdata5;
               mem_writedata6 = mem_readdata6;
               b_data[207:200] = mem_readdata6;
               mem_writedata7 = mem_readdata7;
               b_data[199:192] = mem_readdata7;
               mem_writedata8 = mem_readdata8;
               b_data[191:184] = mem_readdata8;
               mem_writedata9 = mem_readdata9;
               b_data[183:176] = mem_readdata9;
               mem_writedata10 = mem_readdata10;
               b_data[175:168] = mem_readdata10;
               mem_writedata11 = mem_readdata11;
               b_data[167:160] = mem_readdata11;
               mem_writedata12 = mem_readdata12;
               b_data[159:152] = mem_readdata12;
               mem_writedata13 = mem_readdata13;
               b_data[151:144] = mem_readdata13;
               mem_writedata14 = mem_readdata14;
               b_data[143:136] = mem_readdata14;
               mem_writedata15 = mem_readdata15;
               b_data[135:128] = mem_readdata15;
               mem_writedata16 = mem_readdata16;
               b_data[127:120] = mem_readdata16;
               mem_writedata17 = mem_readdata17;
               b_data[119:112] = mem_readdata17;
               mem_writedata18 = mem_readdata18;
               b_data[111:104] = mem_readdata18;
               mem_writedata19 = mem_readdata19;
               b_data[103:96] = mem_readdata19;
               mem_writedata20 = a_data0;
               b_data[95:88] = a_data0;
               mem_writedata21 = a_data1;
               b_data[87:80] = a_data1;
               mem_writedata22 = a_data2;
               b_data[79:72] = a_data2;
               mem_writedata23 = a_data3;
               b_data[71:64] = a_data3;
               if (out_ready || ~out_valid) begin
                  a_ready = 1;
                  if (a_valid) 
                  begin
                     new_state = state+1'b1;
                     mem_write0 = 1;
                     mem_write1 = 1;
                     mem_write2 = 1;
                     mem_write3 = 1;
                     mem_write4 = 1;
                     mem_write5 = 1;
                     mem_write6 = 1;
                     mem_write7 = 1;
                     mem_write8 = 1;
                     mem_write9 = 1;
                     mem_write10 = 1;
                     mem_write11 = 1;
                     mem_write12 = 1;
                     mem_write13 = 1;
                     mem_write14 = 1;
                     mem_write15 = 1;
                     mem_write16 = 1;
                     mem_write17 = 1;
                     mem_write18 = 1;
                     mem_write19 = 1;
                     mem_write20 = 1;
                     mem_write21 = 1;
                     mem_write22 = 1;
                     mem_write23 = 1;
                     if (a_endofpacket) begin
                        b_empty = a_empty+8;
                        b_valid = 1;
                        new_state = 0;
                     end
                  end
               end
            end
         14 : begin
               mem_writedata0 = mem_readdata0;
               b_data[255:248] = mem_readdata0;
               mem_writedata1 = mem_readdata1;
               b_data[247:240] = mem_readdata1;
               mem_writedata2 = mem_readdata2;
               b_data[239:232] = mem_readdata2;
               mem_writedata3 = mem_readdata3;
               b_data[231:224] = mem_readdata3;
               mem_writedata4 = mem_readdata4;
               b_data[223:216] = mem_readdata4;
               mem_writedata5 = mem_readdata5;
               b_data[215:208] = mem_readdata5;
               mem_writedata6 = mem_readdata6;
               b_data[207:200] = mem_readdata6;
               mem_writedata7 = mem_readdata7;
               b_data[199:192] = mem_readdata7;
               mem_writedata8 = mem_readdata8;
               b_data[191:184] = mem_readdata8;
               mem_writedata9 = mem_readdata9;
               b_data[183:176] = mem_readdata9;
               mem_writedata10 = mem_readdata10;
               b_data[175:168] = mem_readdata10;
               mem_writedata11 = mem_readdata11;
               b_data[167:160] = mem_readdata11;
               mem_writedata12 = mem_readdata12;
               b_data[159:152] = mem_readdata12;
               mem_writedata13 = mem_readdata13;
               b_data[151:144] = mem_readdata13;
               mem_writedata14 = mem_readdata14;
               b_data[143:136] = mem_readdata14;
               mem_writedata15 = mem_readdata15;
               b_data[135:128] = mem_readdata15;
               mem_writedata16 = mem_readdata16;
               b_data[127:120] = mem_readdata16;
               mem_writedata17 = mem_readdata17;
               b_data[119:112] = mem_readdata17;
               mem_writedata18 = mem_readdata18;
               b_data[111:104] = mem_readdata18;
               mem_writedata19 = mem_readdata19;
               b_data[103:96] = mem_readdata19;
               mem_writedata20 = mem_readdata20;
               b_data[95:88] = mem_readdata20;
               mem_writedata21 = mem_readdata21;
               b_data[87:80] = mem_readdata21;
               mem_writedata22 = mem_readdata22;
               b_data[79:72] = mem_readdata22;
               mem_writedata23 = mem_readdata23;
               b_data[71:64] = mem_readdata23;
               mem_writedata24 = a_data0;
               b_data[63:56] = a_data0;
               mem_writedata25 = a_data1;
               b_data[55:48] = a_data1;
               mem_writedata26 = a_data2;
               b_data[47:40] = a_data2;
               mem_writedata27 = a_data3;
               b_data[39:32] = a_data3;
               if (out_ready || ~out_valid) begin
                  a_ready = 1;
                  if (a_valid) 
                  begin
                     new_state = state+1'b1;
                     mem_write0 = 1;
                     mem_write1 = 1;
                     mem_write2 = 1;
                     mem_write3 = 1;
                     mem_write4 = 1;
                     mem_write5 = 1;
                     mem_write6 = 1;
                     mem_write7 = 1;
                     mem_write8 = 1;
                     mem_write9 = 1;
                     mem_write10 = 1;
                     mem_write11 = 1;
                     mem_write12 = 1;
                     mem_write13 = 1;
                     mem_write14 = 1;
                     mem_write15 = 1;
                     mem_write16 = 1;
                     mem_write17 = 1;
                     mem_write18 = 1;
                     mem_write19 = 1;
                     mem_write20 = 1;
                     mem_write21 = 1;
                     mem_write22 = 1;
                     mem_write23 = 1;
                     mem_write24 = 1;
                     mem_write25 = 1;
                     mem_write26 = 1;
                     mem_write27 = 1;
                     if (a_endofpacket) begin
                        b_empty = a_empty+4;
                        b_valid = 1;
                        new_state = 0;
                     end
                  end
               end
            end
         15 : begin
               b_data[255:248] = mem_readdata0;
               b_data[247:240] = mem_readdata1;
               b_data[239:232] = mem_readdata2;
               b_data[231:224] = mem_readdata3;
               b_data[223:216] = mem_readdata4;
               b_data[215:208] = mem_readdata5;
               b_data[207:200] = mem_readdata6;
               b_data[199:192] = mem_readdata7;
               b_data[191:184] = mem_readdata8;
               b_data[183:176] = mem_readdata9;
               b_data[175:168] = mem_readdata10;
               b_data[167:160] = mem_readdata11;
               b_data[159:152] = mem_readdata12;
               b_data[151:144] = mem_readdata13;
               b_data[143:136] = mem_readdata14;
               b_data[135:128] = mem_readdata15;
               b_data[127:120] = mem_readdata16;
               b_data[119:112] = mem_readdata17;
               b_data[111:104] = mem_readdata18;
               b_data[103:96] = mem_readdata19;
               b_data[95:88] = mem_readdata20;
               b_data[87:80] = mem_readdata21;
               b_data[79:72] = mem_readdata22;
               b_data[71:64] = mem_readdata23;
               b_data[63:56] = mem_readdata24;
               b_data[55:48] = mem_readdata25;
               b_data[47:40] = mem_readdata26;
               b_data[39:32] = mem_readdata27;
               b_data[31:24] = a_data0;
               b_data[23:16] = a_data1;
               b_data[15:8] = a_data2;
               b_data[7:0] = a_data3;
               if (out_ready || ~out_valid) begin
                  a_ready = 1;
                  if (a_valid) 
                  begin
                     new_state = state+1'b1;
                     b_valid = 1;
                     if (a_endofpacket) begin
                        b_empty = a_empty+0;
                        b_valid = 1;
                        new_state = 0;
                     end
                  end
               end
            end
         16 : begin
               mem_writedata0 = a_data0;
               b_data[255:248] = a_data0;
               mem_writedata1 = a_data1;
               b_data[247:240] = a_data1;
               mem_writedata2 = a_data2;
               b_data[239:232] = a_data2;
               mem_writedata3 = a_data3;
               b_data[231:224] = a_data3;
               if (out_ready || ~out_valid) begin
                  a_ready = 1;
                  if (a_valid) 
                  begin
                     new_state = state+1'b1;
                     mem_write0 = 1;
                     mem_write1 = 1;
                     mem_write2 = 1;
                     mem_write3 = 1;
                     sop_mem_writeenable = 1;
                     if (a_endofpacket) begin
                        b_empty = a_empty+28;
                        b_valid = 1;
                        new_state = 0;
                     end
                  end
               end
            end
         17 : begin
               mem_writedata0 = mem_readdata0;
               b_data[255:248] = mem_readdata0;
               mem_writedata1 = mem_readdata1;
               b_data[247:240] = mem_readdata1;
               mem_writedata2 = mem_readdata2;
               b_data[239:232] = mem_readdata2;
               mem_writedata3 = mem_readdata3;
               b_data[231:224] = mem_readdata3;
               mem_writedata4 = a_data0;
               b_data[223:216] = a_data0;
               mem_writedata5 = a_data1;
               b_data[215:208] = a_data1;
               mem_writedata6 = a_data2;
               b_data[207:200] = a_data2;
               mem_writedata7 = a_data3;
               b_data[199:192] = a_data3;
               if (out_ready || ~out_valid) begin
                  a_ready = 1;
                  if (a_valid) 
                  begin
                     new_state = state+1'b1;
                     mem_write0 = 1;
                     mem_write1 = 1;
                     mem_write2 = 1;
                     mem_write3 = 1;
                     mem_write4 = 1;
                     mem_write5 = 1;
                     mem_write6 = 1;
                     mem_write7 = 1;
                     if (a_endofpacket) begin
                        b_empty = a_empty+24;
                        b_valid = 1;
                        new_state = 0;
                     end
                  end
               end
            end
         18 : begin
               mem_writedata0 = mem_readdata0;
               b_data[255:248] = mem_readdata0;
               mem_writedata1 = mem_readdata1;
               b_data[247:240] = mem_readdata1;
               mem_writedata2 = mem_readdata2;
               b_data[239:232] = mem_readdata2;
               mem_writedata3 = mem_readdata3;
               b_data[231:224] = mem_readdata3;
               mem_writedata4 = mem_readdata4;
               b_data[223:216] = mem_readdata4;
               mem_writedata5 = mem_readdata5;
               b_data[215:208] = mem_readdata5;
               mem_writedata6 = mem_readdata6;
               b_data[207:200] = mem_readdata6;
               mem_writedata7 = mem_readdata7;
               b_data[199:192] = mem_readdata7;
               mem_writedata8 = a_data0;
               b_data[191:184] = a_data0;
               mem_writedata9 = a_data1;
               b_data[183:176] = a_data1;
               mem_writedata10 = a_data2;
               b_data[175:168] = a_data2;
               mem_writedata11 = a_data3;
               b_data[167:160] = a_data3;
               if (out_ready || ~out_valid) begin
                  a_ready = 1;
                  if (a_valid) 
                  begin
                     new_state = state+1'b1;
                     mem_write0 = 1;
                     mem_write1 = 1;
                     mem_write2 = 1;
                     mem_write3 = 1;
                     mem_write4 = 1;
                     mem_write5 = 1;
                     mem_write6 = 1;
                     mem_write7 = 1;
                     mem_write8 = 1;
                     mem_write9 = 1;
                     mem_write10 = 1;
                     mem_write11 = 1;
                     if (a_endofpacket) begin
                        b_empty = a_empty+20;
                        b_valid = 1;
                        new_state = 0;
                     end
                  end
               end
            end
         19 : begin
               mem_writedata0 = mem_readdata0;
               b_data[255:248] = mem_readdata0;
               mem_writedata1 = mem_readdata1;
               b_data[247:240] = mem_readdata1;
               mem_writedata2 = mem_readdata2;
               b_data[239:232] = mem_readdata2;
               mem_writedata3 = mem_readdata3;
               b_data[231:224] = mem_readdata3;
               mem_writedata4 = mem_readdata4;
               b_data[223:216] = mem_readdata4;
               mem_writedata5 = mem_readdata5;
               b_data[215:208] = mem_readdata5;
               mem_writedata6 = mem_readdata6;
               b_data[207:200] = mem_readdata6;
               mem_writedata7 = mem_readdata7;
               b_data[199:192] = mem_readdata7;
               mem_writedata8 = mem_readdata8;
               b_data[191:184] = mem_readdata8;
               mem_writedata9 = mem_readdata9;
               b_data[183:176] = mem_readdata9;
               mem_writedata10 = mem_readdata10;
               b_data[175:168] = mem_readdata10;
               mem_writedata11 = mem_readdata11;
               b_data[167:160] = mem_readdata11;
               mem_writedata12 = a_data0;
               b_data[159:152] = a_data0;
               mem_writedata13 = a_data1;
               b_data[151:144] = a_data1;
               mem_writedata14 = a_data2;
               b_data[143:136] = a_data2;
               mem_writedata15 = a_data3;
               b_data[135:128] = a_data3;
               if (out_ready || ~out_valid) begin
                  a_ready = 1;
                  if (a_valid) 
                  begin
                     new_state = state+1'b1;
                     mem_write0 = 1;
                     mem_write1 = 1;
                     mem_write2 = 1;
                     mem_write3 = 1;
                     mem_write4 = 1;
                     mem_write5 = 1;
                     mem_write6 = 1;
                     mem_write7 = 1;
                     mem_write8 = 1;
                     mem_write9 = 1;
                     mem_write10 = 1;
                     mem_write11 = 1;
                     mem_write12 = 1;
                     mem_write13 = 1;
                     mem_write14 = 1;
                     mem_write15 = 1;
                     if (a_endofpacket) begin
                        b_empty = a_empty+16;
                        b_valid = 1;
                        new_state = 0;
                     end
                  end
               end
            end
         20 : begin
               mem_writedata0 = mem_readdata0;
               b_data[255:248] = mem_readdata0;
               mem_writedata1 = mem_readdata1;
               b_data[247:240] = mem_readdata1;
               mem_writedata2 = mem_readdata2;
               b_data[239:232] = mem_readdata2;
               mem_writedata3 = mem_readdata3;
               b_data[231:224] = mem_readdata3;
               mem_writedata4 = mem_readdata4;
               b_data[223:216] = mem_readdata4;
               mem_writedata5 = mem_readdata5;
               b_data[215:208] = mem_readdata5;
               mem_writedata6 = mem_readdata6;
               b_data[207:200] = mem_readdata6;
               mem_writedata7 = mem_readdata7;
               b_data[199:192] = mem_readdata7;
               mem_writedata8 = mem_readdata8;
               b_data[191:184] = mem_readdata8;
               mem_writedata9 = mem_readdata9;
               b_data[183:176] = mem_readdata9;
               mem_writedata10 = mem_readdata10;
               b_data[175:168] = mem_readdata10;
               mem_writedata11 = mem_readdata11;
               b_data[167:160] = mem_readdata11;
               mem_writedata12 = mem_readdata12;
               b_data[159:152] = mem_readdata12;
               mem_writedata13 = mem_readdata13;
               b_data[151:144] = mem_readdata13;
               mem_writedata14 = mem_readdata14;
               b_data[143:136] = mem_readdata14;
               mem_writedata15 = mem_readdata15;
               b_data[135:128] = mem_readdata15;
               mem_writedata16 = a_data0;
               b_data[127:120] = a_data0;
               mem_writedata17 = a_data1;
               b_data[119:112] = a_data1;
               mem_writedata18 = a_data2;
               b_data[111:104] = a_data2;
               mem_writedata19 = a_data3;
               b_data[103:96] = a_data3;
               if (out_ready || ~out_valid) begin
                  a_ready = 1;
                  if (a_valid) 
                  begin
                     new_state = state+1'b1;
                     mem_write0 = 1;
                     mem_write1 = 1;
                     mem_write2 = 1;
                     mem_write3 = 1;
                     mem_write4 = 1;
                     mem_write5 = 1;
                     mem_write6 = 1;
                     mem_write7 = 1;
                     mem_write8 = 1;
                     mem_write9 = 1;
                     mem_write10 = 1;
                     mem_write11 = 1;
                     mem_write12 = 1;
                     mem_write13 = 1;
                     mem_write14 = 1;
                     mem_write15 = 1;
                     mem_write16 = 1;
                     mem_write17 = 1;
                     mem_write18 = 1;
                     mem_write19 = 1;
                     if (a_endofpacket) begin
                        b_empty = a_empty+12;
                        b_valid = 1;
                        new_state = 0;
                     end
                  end
               end
            end
         21 : begin
               mem_writedata0 = mem_readdata0;
               b_data[255:248] = mem_readdata0;
               mem_writedata1 = mem_readdata1;
               b_data[247:240] = mem_readdata1;
               mem_writedata2 = mem_readdata2;
               b_data[239:232] = mem_readdata2;
               mem_writedata3 = mem_readdata3;
               b_data[231:224] = mem_readdata3;
               mem_writedata4 = mem_readdata4;
               b_data[223:216] = mem_readdata4;
               mem_writedata5 = mem_readdata5;
               b_data[215:208] = mem_readdata5;
               mem_writedata6 = mem_readdata6;
               b_data[207:200] = mem_readdata6;
               mem_writedata7 = mem_readdata7;
               b_data[199:192] = mem_readdata7;
               mem_writedata8 = mem_readdata8;
               b_data[191:184] = mem_readdata8;
               mem_writedata9 = mem_readdata9;
               b_data[183:176] = mem_readdata9;
               mem_writedata10 = mem_readdata10;
               b_data[175:168] = mem_readdata10;
               mem_writedata11 = mem_readdata11;
               b_data[167:160] = mem_readdata11;
               mem_writedata12 = mem_readdata12;
               b_data[159:152] = mem_readdata12;
               mem_writedata13 = mem_readdata13;
               b_data[151:144] = mem_readdata13;
               mem_writedata14 = mem_readdata14;
               b_data[143:136] = mem_readdata14;
               mem_writedata15 = mem_readdata15;
               b_data[135:128] = mem_readdata15;
               mem_writedata16 = mem_readdata16;
               b_data[127:120] = mem_readdata16;
               mem_writedata17 = mem_readdata17;
               b_data[119:112] = mem_readdata17;
               mem_writedata18 = mem_readdata18;
               b_data[111:104] = mem_readdata18;
               mem_writedata19 = mem_readdata19;
               b_data[103:96] = mem_readdata19;
               mem_writedata20 = a_data0;
               b_data[95:88] = a_data0;
               mem_writedata21 = a_data1;
               b_data[87:80] = a_data1;
               mem_writedata22 = a_data2;
               b_data[79:72] = a_data2;
               mem_writedata23 = a_data3;
               b_data[71:64] = a_data3;
               if (out_ready || ~out_valid) begin
                  a_ready = 1;
                  if (a_valid) 
                  begin
                     new_state = state+1'b1;
                     mem_write0 = 1;
                     mem_write1 = 1;
                     mem_write2 = 1;
                     mem_write3 = 1;
                     mem_write4 = 1;
                     mem_write5 = 1;
                     mem_write6 = 1;
                     mem_write7 = 1;
                     mem_write8 = 1;
                     mem_write9 = 1;
                     mem_write10 = 1;
                     mem_write11 = 1;
                     mem_write12 = 1;
                     mem_write13 = 1;
                     mem_write14 = 1;
                     mem_write15 = 1;
                     mem_write16 = 1;
                     mem_write17 = 1;
                     mem_write18 = 1;
                     mem_write19 = 1;
                     mem_write20 = 1;
                     mem_write21 = 1;
                     mem_write22 = 1;
                     mem_write23 = 1;
                     if (a_endofpacket) begin
                        b_empty = a_empty+8;
                        b_valid = 1;
                        new_state = 0;
                     end
                  end
               end
            end
         22 : begin
               mem_writedata0 = mem_readdata0;
               b_data[255:248] = mem_readdata0;
               mem_writedata1 = mem_readdata1;
               b_data[247:240] = mem_readdata1;
               mem_writedata2 = mem_readdata2;
               b_data[239:232] = mem_readdata2;
               mem_writedata3 = mem_readdata3;
               b_data[231:224] = mem_readdata3;
               mem_writedata4 = mem_readdata4;
               b_data[223:216] = mem_readdata4;
               mem_writedata5 = mem_readdata5;
               b_data[215:208] = mem_readdata5;
               mem_writedata6 = mem_readdata6;
               b_data[207:200] = mem_readdata6;
               mem_writedata7 = mem_readdata7;
               b_data[199:192] = mem_readdata7;
               mem_writedata8 = mem_readdata8;
               b_data[191:184] = mem_readdata8;
               mem_writedata9 = mem_readdata9;
               b_data[183:176] = mem_readdata9;
               mem_writedata10 = mem_readdata10;
               b_data[175:168] = mem_readdata10;
               mem_writedata11 = mem_readdata11;
               b_data[167:160] = mem_readdata11;
               mem_writedata12 = mem_readdata12;
               b_data[159:152] = mem_readdata12;
               mem_writedata13 = mem_readdata13;
               b_data[151:144] = mem_readdata13;
               mem_writedata14 = mem_readdata14;
               b_data[143:136] = mem_readdata14;
               mem_writedata15 = mem_readdata15;
               b_data[135:128] = mem_readdata15;
               mem_writedata16 = mem_readdata16;
               b_data[127:120] = mem_readdata16;
               mem_writedata17 = mem_readdata17;
               b_data[119:112] = mem_readdata17;
               mem_writedata18 = mem_readdata18;
               b_data[111:104] = mem_readdata18;
               mem_writedata19 = mem_readdata19;
               b_data[103:96] = mem_readdata19;
               mem_writedata20 = mem_readdata20;
               b_data[95:88] = mem_readdata20;
               mem_writedata21 = mem_readdata21;
               b_data[87:80] = mem_readdata21;
               mem_writedata22 = mem_readdata22;
               b_data[79:72] = mem_readdata22;
               mem_writedata23 = mem_readdata23;
               b_data[71:64] = mem_readdata23;
               mem_writedata24 = a_data0;
               b_data[63:56] = a_data0;
               mem_writedata25 = a_data1;
               b_data[55:48] = a_data1;
               mem_writedata26 = a_data2;
               b_data[47:40] = a_data2;
               mem_writedata27 = a_data3;
               b_data[39:32] = a_data3;
               if (out_ready || ~out_valid) begin
                  a_ready = 1;
                  if (a_valid) 
                  begin
                     new_state = state+1'b1;
                     mem_write0 = 1;
                     mem_write1 = 1;
                     mem_write2 = 1;
                     mem_write3 = 1;
                     mem_write4 = 1;
                     mem_write5 = 1;
                     mem_write6 = 1;
                     mem_write7 = 1;
                     mem_write8 = 1;
                     mem_write9 = 1;
                     mem_write10 = 1;
                     mem_write11 = 1;
                     mem_write12 = 1;
                     mem_write13 = 1;
                     mem_write14 = 1;
                     mem_write15 = 1;
                     mem_write16 = 1;
                     mem_write17 = 1;
                     mem_write18 = 1;
                     mem_write19 = 1;
                     mem_write20 = 1;
                     mem_write21 = 1;
                     mem_write22 = 1;
                     mem_write23 = 1;
                     mem_write24 = 1;
                     mem_write25 = 1;
                     mem_write26 = 1;
                     mem_write27 = 1;
                     if (a_endofpacket) begin
                        b_empty = a_empty+4;
                        b_valid = 1;
                        new_state = 0;
                     end
                  end
               end
            end
         23 : begin
               b_data[255:248] = mem_readdata0;
               b_data[247:240] = mem_readdata1;
               b_data[239:232] = mem_readdata2;
               b_data[231:224] = mem_readdata3;
               b_data[223:216] = mem_readdata4;
               b_data[215:208] = mem_readdata5;
               b_data[207:200] = mem_readdata6;
               b_data[199:192] = mem_readdata7;
               b_data[191:184] = mem_readdata8;
               b_data[183:176] = mem_readdata9;
               b_data[175:168] = mem_readdata10;
               b_data[167:160] = mem_readdata11;
               b_data[159:152] = mem_readdata12;
               b_data[151:144] = mem_readdata13;
               b_data[143:136] = mem_readdata14;
               b_data[135:128] = mem_readdata15;
               b_data[127:120] = mem_readdata16;
               b_data[119:112] = mem_readdata17;
               b_data[111:104] = mem_readdata18;
               b_data[103:96] = mem_readdata19;
               b_data[95:88] = mem_readdata20;
               b_data[87:80] = mem_readdata21;
               b_data[79:72] = mem_readdata22;
               b_data[71:64] = mem_readdata23;
               b_data[63:56] = mem_readdata24;
               b_data[55:48] = mem_readdata25;
               b_data[47:40] = mem_readdata26;
               b_data[39:32] = mem_readdata27;
               b_data[31:24] = a_data0;
               b_data[23:16] = a_data1;
               b_data[15:8] = a_data2;
               b_data[7:0] = a_data3;
               if (out_ready || ~out_valid) begin
                  a_ready = 1;
                  if (a_valid) 
                  begin
                     new_state = state+1'b1;
                     b_valid = 1;
                     if (a_endofpacket) begin
                        b_empty = a_empty+0;
                        b_valid = 1;
                        new_state = 0;
                     end
                  end
               end
            end
         24 : begin
               mem_writedata0 = a_data0;
               b_data[255:248] = a_data0;
               mem_writedata1 = a_data1;
               b_data[247:240] = a_data1;
               mem_writedata2 = a_data2;
               b_data[239:232] = a_data2;
               mem_writedata3 = a_data3;
               b_data[231:224] = a_data3;
               if (out_ready || ~out_valid) begin
                  a_ready = 1;
                  if (a_valid) 
                  begin
                     new_state = state+1'b1;
                     mem_write0 = 1;
                     mem_write1 = 1;
                     mem_write2 = 1;
                     mem_write3 = 1;
                     sop_mem_writeenable = 1;
                     if (a_endofpacket) begin
                        b_empty = a_empty+28;
                        b_valid = 1;
                        new_state = 0;
                     end
                  end
               end
            end
         25 : begin
               mem_writedata0 = mem_readdata0;
               b_data[255:248] = mem_readdata0;
               mem_writedata1 = mem_readdata1;
               b_data[247:240] = mem_readdata1;
               mem_writedata2 = mem_readdata2;
               b_data[239:232] = mem_readdata2;
               mem_writedata3 = mem_readdata3;
               b_data[231:224] = mem_readdata3;
               mem_writedata4 = a_data0;
               b_data[223:216] = a_data0;
               mem_writedata5 = a_data1;
               b_data[215:208] = a_data1;
               mem_writedata6 = a_data2;
               b_data[207:200] = a_data2;
               mem_writedata7 = a_data3;
               b_data[199:192] = a_data3;
               if (out_ready || ~out_valid) begin
                  a_ready = 1;
                  if (a_valid) 
                  begin
                     new_state = state+1'b1;
                     mem_write0 = 1;
                     mem_write1 = 1;
                     mem_write2 = 1;
                     mem_write3 = 1;
                     mem_write4 = 1;
                     mem_write5 = 1;
                     mem_write6 = 1;
                     mem_write7 = 1;
                     if (a_endofpacket) begin
                        b_empty = a_empty+24;
                        b_valid = 1;
                        new_state = 0;
                     end
                  end
               end
            end
         26 : begin
               mem_writedata0 = mem_readdata0;
               b_data[255:248] = mem_readdata0;
               mem_writedata1 = mem_readdata1;
               b_data[247:240] = mem_readdata1;
               mem_writedata2 = mem_readdata2;
               b_data[239:232] = mem_readdata2;
               mem_writedata3 = mem_readdata3;
               b_data[231:224] = mem_readdata3;
               mem_writedata4 = mem_readdata4;
               b_data[223:216] = mem_readdata4;
               mem_writedata5 = mem_readdata5;
               b_data[215:208] = mem_readdata5;
               mem_writedata6 = mem_readdata6;
               b_data[207:200] = mem_readdata6;
               mem_writedata7 = mem_readdata7;
               b_data[199:192] = mem_readdata7;
               mem_writedata8 = a_data0;
               b_data[191:184] = a_data0;
               mem_writedata9 = a_data1;
               b_data[183:176] = a_data1;
               mem_writedata10 = a_data2;
               b_data[175:168] = a_data2;
               mem_writedata11 = a_data3;
               b_data[167:160] = a_data3;
               if (out_ready || ~out_valid) begin
                  a_ready = 1;
                  if (a_valid) 
                  begin
                     new_state = state+1'b1;
                     mem_write0 = 1;
                     mem_write1 = 1;
                     mem_write2 = 1;
                     mem_write3 = 1;
                     mem_write4 = 1;
                     mem_write5 = 1;
                     mem_write6 = 1;
                     mem_write7 = 1;
                     mem_write8 = 1;
                     mem_write9 = 1;
                     mem_write10 = 1;
                     mem_write11 = 1;
                     if (a_endofpacket) begin
                        b_empty = a_empty+20;
                        b_valid = 1;
                        new_state = 0;
                     end
                  end
               end
            end
         27 : begin
               mem_writedata0 = mem_readdata0;
               b_data[255:248] = mem_readdata0;
               mem_writedata1 = mem_readdata1;
               b_data[247:240] = mem_readdata1;
               mem_writedata2 = mem_readdata2;
               b_data[239:232] = mem_readdata2;
               mem_writedata3 = mem_readdata3;
               b_data[231:224] = mem_readdata3;
               mem_writedata4 = mem_readdata4;
               b_data[223:216] = mem_readdata4;
               mem_writedata5 = mem_readdata5;
               b_data[215:208] = mem_readdata5;
               mem_writedata6 = mem_readdata6;
               b_data[207:200] = mem_readdata6;
               mem_writedata7 = mem_readdata7;
               b_data[199:192] = mem_readdata7;
               mem_writedata8 = mem_readdata8;
               b_data[191:184] = mem_readdata8;
               mem_writedata9 = mem_readdata9;
               b_data[183:176] = mem_readdata9;
               mem_writedata10 = mem_readdata10;
               b_data[175:168] = mem_readdata10;
               mem_writedata11 = mem_readdata11;
               b_data[167:160] = mem_readdata11;
               mem_writedata12 = a_data0;
               b_data[159:152] = a_data0;
               mem_writedata13 = a_data1;
               b_data[151:144] = a_data1;
               mem_writedata14 = a_data2;
               b_data[143:136] = a_data2;
               mem_writedata15 = a_data3;
               b_data[135:128] = a_data3;
               if (out_ready || ~out_valid) begin
                  a_ready = 1;
                  if (a_valid) 
                  begin
                     new_state = state+1'b1;
                     mem_write0 = 1;
                     mem_write1 = 1;
                     mem_write2 = 1;
                     mem_write3 = 1;
                     mem_write4 = 1;
                     mem_write5 = 1;
                     mem_write6 = 1;
                     mem_write7 = 1;
                     mem_write8 = 1;
                     mem_write9 = 1;
                     mem_write10 = 1;
                     mem_write11 = 1;
                     mem_write12 = 1;
                     mem_write13 = 1;
                     mem_write14 = 1;
                     mem_write15 = 1;
                     if (a_endofpacket) begin
                        b_empty = a_empty+16;
                        b_valid = 1;
                        new_state = 0;
                     end
                  end
               end
            end
         28 : begin
               mem_writedata0 = mem_readdata0;
               b_data[255:248] = mem_readdata0;
               mem_writedata1 = mem_readdata1;
               b_data[247:240] = mem_readdata1;
               mem_writedata2 = mem_readdata2;
               b_data[239:232] = mem_readdata2;
               mem_writedata3 = mem_readdata3;
               b_data[231:224] = mem_readdata3;
               mem_writedata4 = mem_readdata4;
               b_data[223:216] = mem_readdata4;
               mem_writedata5 = mem_readdata5;
               b_data[215:208] = mem_readdata5;
               mem_writedata6 = mem_readdata6;
               b_data[207:200] = mem_readdata6;
               mem_writedata7 = mem_readdata7;
               b_data[199:192] = mem_readdata7;
               mem_writedata8 = mem_readdata8;
               b_data[191:184] = mem_readdata8;
               mem_writedata9 = mem_readdata9;
               b_data[183:176] = mem_readdata9;
               mem_writedata10 = mem_readdata10;
               b_data[175:168] = mem_readdata10;
               mem_writedata11 = mem_readdata11;
               b_data[167:160] = mem_readdata11;
               mem_writedata12 = mem_readdata12;
               b_data[159:152] = mem_readdata12;
               mem_writedata13 = mem_readdata13;
               b_data[151:144] = mem_readdata13;
               mem_writedata14 = mem_readdata14;
               b_data[143:136] = mem_readdata14;
               mem_writedata15 = mem_readdata15;
               b_data[135:128] = mem_readdata15;
               mem_writedata16 = a_data0;
               b_data[127:120] = a_data0;
               mem_writedata17 = a_data1;
               b_data[119:112] = a_data1;
               mem_writedata18 = a_data2;
               b_data[111:104] = a_data2;
               mem_writedata19 = a_data3;
               b_data[103:96] = a_data3;
               if (out_ready || ~out_valid) begin
                  a_ready = 1;
                  if (a_valid) 
                  begin
                     new_state = state+1'b1;
                     mem_write0 = 1;
                     mem_write1 = 1;
                     mem_write2 = 1;
                     mem_write3 = 1;
                     mem_write4 = 1;
                     mem_write5 = 1;
                     mem_write6 = 1;
                     mem_write7 = 1;
                     mem_write8 = 1;
                     mem_write9 = 1;
                     mem_write10 = 1;
                     mem_write11 = 1;
                     mem_write12 = 1;
                     mem_write13 = 1;
                     mem_write14 = 1;
                     mem_write15 = 1;
                     mem_write16 = 1;
                     mem_write17 = 1;
                     mem_write18 = 1;
                     mem_write19 = 1;
                     if (a_endofpacket) begin
                        b_empty = a_empty+12;
                        b_valid = 1;
                        new_state = 0;
                     end
                  end
               end
            end
         29 : begin
               mem_writedata0 = mem_readdata0;
               b_data[255:248] = mem_readdata0;
               mem_writedata1 = mem_readdata1;
               b_data[247:240] = mem_readdata1;
               mem_writedata2 = mem_readdata2;
               b_data[239:232] = mem_readdata2;
               mem_writedata3 = mem_readdata3;
               b_data[231:224] = mem_readdata3;
               mem_writedata4 = mem_readdata4;
               b_data[223:216] = mem_readdata4;
               mem_writedata5 = mem_readdata5;
               b_data[215:208] = mem_readdata5;
               mem_writedata6 = mem_readdata6;
               b_data[207:200] = mem_readdata6;
               mem_writedata7 = mem_readdata7;
               b_data[199:192] = mem_readdata7;
               mem_writedata8 = mem_readdata8;
               b_data[191:184] = mem_readdata8;
               mem_writedata9 = mem_readdata9;
               b_data[183:176] = mem_readdata9;
               mem_writedata10 = mem_readdata10;
               b_data[175:168] = mem_readdata10;
               mem_writedata11 = mem_readdata11;
               b_data[167:160] = mem_readdata11;
               mem_writedata12 = mem_readdata12;
               b_data[159:152] = mem_readdata12;
               mem_writedata13 = mem_readdata13;
               b_data[151:144] = mem_readdata13;
               mem_writedata14 = mem_readdata14;
               b_data[143:136] = mem_readdata14;
               mem_writedata15 = mem_readdata15;
               b_data[135:128] = mem_readdata15;
               mem_writedata16 = mem_readdata16;
               b_data[127:120] = mem_readdata16;
               mem_writedata17 = mem_readdata17;
               b_data[119:112] = mem_readdata17;
               mem_writedata18 = mem_readdata18;
               b_data[111:104] = mem_readdata18;
               mem_writedata19 = mem_readdata19;
               b_data[103:96] = mem_readdata19;
               mem_writedata20 = a_data0;
               b_data[95:88] = a_data0;
               mem_writedata21 = a_data1;
               b_data[87:80] = a_data1;
               mem_writedata22 = a_data2;
               b_data[79:72] = a_data2;
               mem_writedata23 = a_data3;
               b_data[71:64] = a_data3;
               if (out_ready || ~out_valid) begin
                  a_ready = 1;
                  if (a_valid) 
                  begin
                     new_state = state+1'b1;
                     mem_write0 = 1;
                     mem_write1 = 1;
                     mem_write2 = 1;
                     mem_write3 = 1;
                     mem_write4 = 1;
                     mem_write5 = 1;
                     mem_write6 = 1;
                     mem_write7 = 1;
                     mem_write8 = 1;
                     mem_write9 = 1;
                     mem_write10 = 1;
                     mem_write11 = 1;
                     mem_write12 = 1;
                     mem_write13 = 1;
                     mem_write14 = 1;
                     mem_write15 = 1;
                     mem_write16 = 1;
                     mem_write17 = 1;
                     mem_write18 = 1;
                     mem_write19 = 1;
                     mem_write20 = 1;
                     mem_write21 = 1;
                     mem_write22 = 1;
                     mem_write23 = 1;
                     if (a_endofpacket) begin
                        b_empty = a_empty+8;
                        b_valid = 1;
                        new_state = 0;
                     end
                  end
               end
            end
         30 : begin
               mem_writedata0 = mem_readdata0;
               b_data[255:248] = mem_readdata0;
               mem_writedata1 = mem_readdata1;
               b_data[247:240] = mem_readdata1;
               mem_writedata2 = mem_readdata2;
               b_data[239:232] = mem_readdata2;
               mem_writedata3 = mem_readdata3;
               b_data[231:224] = mem_readdata3;
               mem_writedata4 = mem_readdata4;
               b_data[223:216] = mem_readdata4;
               mem_writedata5 = mem_readdata5;
               b_data[215:208] = mem_readdata5;
               mem_writedata6 = mem_readdata6;
               b_data[207:200] = mem_readdata6;
               mem_writedata7 = mem_readdata7;
               b_data[199:192] = mem_readdata7;
               mem_writedata8 = mem_readdata8;
               b_data[191:184] = mem_readdata8;
               mem_writedata9 = mem_readdata9;
               b_data[183:176] = mem_readdata9;
               mem_writedata10 = mem_readdata10;
               b_data[175:168] = mem_readdata10;
               mem_writedata11 = mem_readdata11;
               b_data[167:160] = mem_readdata11;
               mem_writedata12 = mem_readdata12;
               b_data[159:152] = mem_readdata12;
               mem_writedata13 = mem_readdata13;
               b_data[151:144] = mem_readdata13;
               mem_writedata14 = mem_readdata14;
               b_data[143:136] = mem_readdata14;
               mem_writedata15 = mem_readdata15;
               b_data[135:128] = mem_readdata15;
               mem_writedata16 = mem_readdata16;
               b_data[127:120] = mem_readdata16;
               mem_writedata17 = mem_readdata17;
               b_data[119:112] = mem_readdata17;
               mem_writedata18 = mem_readdata18;
               b_data[111:104] = mem_readdata18;
               mem_writedata19 = mem_readdata19;
               b_data[103:96] = mem_readdata19;
               mem_writedata20 = mem_readdata20;
               b_data[95:88] = mem_readdata20;
               mem_writedata21 = mem_readdata21;
               b_data[87:80] = mem_readdata21;
               mem_writedata22 = mem_readdata22;
               b_data[79:72] = mem_readdata22;
               mem_writedata23 = mem_readdata23;
               b_data[71:64] = mem_readdata23;
               mem_writedata24 = a_data0;
               b_data[63:56] = a_data0;
               mem_writedata25 = a_data1;
               b_data[55:48] = a_data1;
               mem_writedata26 = a_data2;
               b_data[47:40] = a_data2;
               mem_writedata27 = a_data3;
               b_data[39:32] = a_data3;
               if (out_ready || ~out_valid) begin
                  a_ready = 1;
                  if (a_valid) 
                  begin
                     new_state = state+1'b1;
                     mem_write0 = 1;
                     mem_write1 = 1;
                     mem_write2 = 1;
                     mem_write3 = 1;
                     mem_write4 = 1;
                     mem_write5 = 1;
                     mem_write6 = 1;
                     mem_write7 = 1;
                     mem_write8 = 1;
                     mem_write9 = 1;
                     mem_write10 = 1;
                     mem_write11 = 1;
                     mem_write12 = 1;
                     mem_write13 = 1;
                     mem_write14 = 1;
                     mem_write15 = 1;
                     mem_write16 = 1;
                     mem_write17 = 1;
                     mem_write18 = 1;
                     mem_write19 = 1;
                     mem_write20 = 1;
                     mem_write21 = 1;
                     mem_write22 = 1;
                     mem_write23 = 1;
                     mem_write24 = 1;
                     mem_write25 = 1;
                     mem_write26 = 1;
                     mem_write27 = 1;
                     if (a_endofpacket) begin
                        b_empty = a_empty+4;
                        b_valid = 1;
                        new_state = 0;
                     end
                  end
               end
            end
         31 : begin
               b_data[255:248] = mem_readdata0;
               b_data[247:240] = mem_readdata1;
               b_data[239:232] = mem_readdata2;
               b_data[231:224] = mem_readdata3;
               b_data[223:216] = mem_readdata4;
               b_data[215:208] = mem_readdata5;
               b_data[207:200] = mem_readdata6;
               b_data[199:192] = mem_readdata7;
               b_data[191:184] = mem_readdata8;
               b_data[183:176] = mem_readdata9;
               b_data[175:168] = mem_readdata10;
               b_data[167:160] = mem_readdata11;
               b_data[159:152] = mem_readdata12;
               b_data[151:144] = mem_readdata13;
               b_data[143:136] = mem_readdata14;
               b_data[135:128] = mem_readdata15;
               b_data[127:120] = mem_readdata16;
               b_data[119:112] = mem_readdata17;
               b_data[111:104] = mem_readdata18;
               b_data[103:96] = mem_readdata19;
               b_data[95:88] = mem_readdata20;
               b_data[87:80] = mem_readdata21;
               b_data[79:72] = mem_readdata22;
               b_data[71:64] = mem_readdata23;
               b_data[63:56] = mem_readdata24;
               b_data[55:48] = mem_readdata25;
               b_data[47:40] = mem_readdata26;
               b_data[39:32] = mem_readdata27;
               b_data[31:24] = a_data0;
               b_data[23:16] = a_data1;
               b_data[15:8] = a_data2;
               b_data[7:0] = a_data3;
               if (out_ready || ~out_valid) begin
                  a_ready = 1;
                  if (a_valid) 
                  begin
                     new_state = 0;
                     b_valid = 1;
                     if (a_endofpacket) begin
                        b_empty = a_empty+0;
                        b_valid = 1;
                        new_state = 0;
                     end
                  end
               end
            end

   endcase

      in_ready = (a_ready || ~a_valid);

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

   

