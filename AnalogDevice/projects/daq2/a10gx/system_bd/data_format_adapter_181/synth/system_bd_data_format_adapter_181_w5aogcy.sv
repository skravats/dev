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
//   output_name:        system_bd_data_format_adapter_181_w5aogcy
//   usePackets:         true
//   hasInEmpty:         true
//   inEmptyWidth:       3
//   hasOutEmpty:        true 
//   outEmptyWidth:      2
//   inDataWidth:        64
//   outDataWidth:       32
//   channelWidth:       0
//   inErrorWidth:       1
//   outErrorWidth:      1
//   inSymbolsPerBeat:   8
//   outSymbolsPerBeat:  4
//   maxState:           7
//   stateWidth:         3
//   maxChannel:         0
//   symbolWidth:        8
//   numMemSymbols:      7
//   symbolWidth:        8


// ------------------------------------------

 
module system_bd_data_format_adapter_181_w5aogcy (
 // Interface: in
 output reg         in_ready,
 input              in_valid,
 input [64-1 : 0]    in_data,
 input              in_error,
 input              in_startofpacket,
 input              in_endofpacket,
 input [3-1 : 0] in_empty,
 // Interface: out
 input                out_ready,
 output reg           out_valid,
 output reg [32-1: 0]  out_data,
 output reg            out_error,
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
   reg         state_read_addr;
   wire [3-1:0]   state_from_memory;
   reg  [3-1:0]   state;
   reg  [3-1:0]   new_state;
   reg  [3-1:0]   state_d1;
    
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
   reg [8-1:0]    a_data4; 
   reg [8-1:0]    a_data5; 
   reg [8-1:0]    a_data6; 
   reg [8-1:0]    a_data7; 
   reg            a_startofpacket;
   reg            a_endofpacket;
   reg  [3-1:0]   a_empty;
   reg  [1-1:0]   a_error;
   reg            b_ready;
   reg            b_valid;
   reg            b_channel;
   reg  [32-1:0]   b_data;
   reg            b_startofpacket; 
   wire           b_startofpacket_wire; 
   reg            b_endofpacket; 
   reg  [2-1:0]   b_empty;
   reg  [1-1:0]   b_error; 
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
   reg            sop_mem_writeenable;
   reg            sop_mem_writedata;
   wire           mem_waitrequest_sop; 

   wire           state_waitrequest;
   reg            state_waitrequest_d1; 

   reg            in_channel = 0;
   reg            out_channel;





   reg  [3-1:0]   state_register;
   reg            sop_register; 
   reg  [1-1:0]   error_register;
   reg  [8-1:0]   data0_register;
   reg  [8-1:0]   data1_register;
   reg  [8-1:0]   data2_register;
   reg  [8-1:0]   data3_register;
   reg  [8-1:0]   data4_register;
   reg  [8-1:0]   data5_register;
   reg  [8-1:0]   data6_register;

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
         a_startofpacket <= 0;
         a_endofpacket   <= 0;
         a_empty <= 0; 
         a_error <= 0;
      end else begin
         if (in_ready) begin
            a_valid   <= in_valid;
            a_channel <= in_channel;
            a_error   <= in_error;
            a_data0 <= in_data[63:56];
            a_data1 <= in_data[55:48];
            a_data2 <= in_data[47:40];
            a_data3 <= in_data[39:32];
            a_data4 <= in_data[31:24];
            a_data5 <= in_data[23:16];
            a_data6 <= in_data[15:8];
            a_data7 <= in_data[7:0];
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
      end else begin
         state_register <= new_state;
         if (sop_mem_writeenable)
            sop_register   <= sop_mem_writedata;
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
                     if (a_endofpacket && (a_empty >= 4) ) begin
                        new_state = 0;
                        b_empty = a_empty - 4;
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
         2 : begin
            b_data[31:24] = a_data0;
            b_data[23:16] = a_data1;
            b_data[15:8] = a_data2;
            b_data[7:0] = a_data3;
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
         3 : begin
            b_data[31:24] = a_data4;
            b_data[23:16] = a_data5;
            b_data[15:8] = a_data6;
            b_data[7:0] = a_data7;
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
         4 : begin
            b_data[31:24] = a_data0;
            b_data[23:16] = a_data1;
            b_data[15:8] = a_data2;
            b_data[7:0] = a_data3;
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
         5 : begin
            b_data[31:24] = a_data4;
            b_data[23:16] = a_data5;
            b_data[15:8] = a_data6;
            b_data[7:0] = a_data7;
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
         6 : begin
            b_data[31:24] = a_data0;
            b_data[23:16] = a_data1;
            b_data[15:8] = a_data2;
            b_data[7:0] = a_data3;
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
            b_data[31:24] = a_data4;
            b_data[23:16] = a_data5;
            b_data[15:8] = a_data6;
            b_data[7:0] = a_data7;
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

   

