// ***************************************************************************
// ***************************************************************************
// Copyright 2014 - 2017 (c) Analog Devices, Inc. All rights reserved.
//
// In this HDL repository, there are many different and unique modules, consisting
// of various HDL (Verilog or VHDL) components. The individual modules are
// developed independently, and may be accompanied by separate and unique license
// terms.
//
// The user should read each of these license terms, and understand the
// freedoms and responsibilities that he or she has by using this source/core.
//
// This core is distributed in the hope that it will be useful, but WITHOUT ANY
// WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
// A PARTICULAR PURPOSE.
//
// Redistribution and use of source or resulting binaries, with or without modification
// of this file, are permitted under one of the following two license terms:
//
//   1. The GNU General Public License version 2 as published by the
//      Free Software Foundation, which can be found in the top level directory
//      of this repository (LICENSE_GPL2), and also online at:
//      <https://www.gnu.org/licenses/old-licenses/gpl-2.0.html>
//
// OR
//
//   2. An ADI specific BSD license, which can be found in the top level directory
//      of this repository (LICENSE_ADIBSD), and also on-line at:
//      https://github.com/analogdevicesinc/hdl/blob/master/LICENSE_ADIBSD
//      This will allow to generate bit files and not release the source code,
//      as long as it attaches to an ADI device.
//
// ***************************************************************************
// ***************************************************************************

`timescale 1ns/100ps

module util_cpack_mux (

  // adc interface

  input                   adc_clk,
  input                   adc_valid,
  input       [ 7:0]      adc_enable,
  input       [127:0]     adc_data,

  // fifo interface

  output  reg             adc_mux_valid,
  output  reg             adc_mux_enable_0,
  output  reg [ 15:0]     adc_mux_data_0,
  output  reg             adc_mux_enable_1,
  output  reg [ 31:0]     adc_mux_data_1,
  output  reg             adc_mux_enable_2,
  output  reg [ 47:0]     adc_mux_data_2,
  output  reg             adc_mux_enable_3,
  output  reg [ 63:0]     adc_mux_data_3,
  output  reg             adc_mux_enable_4,
  output  reg [ 79:0]     adc_mux_data_4,
  output  reg             adc_mux_enable_5,
  output  reg [ 95:0]     adc_mux_data_5,
  output  reg             adc_mux_enable_6,
  output  reg [111:0]     adc_mux_data_6,
  output  reg             adc_mux_enable_7,
  output  reg [127:0]     adc_mux_data_7);

  // internal registers

  reg               adc_valid_d = 'd0;
  reg               adc_mux_enable_0_0 = 'd0;
  reg     [ 15:0]   adc_mux_data_0_0 = 'd0;
  reg               adc_mux_enable_1_0 = 'd0;
  reg     [ 31:0]   adc_mux_data_1_0 = 'd0;
  reg               adc_mux_enable_1_1 = 'd0;
  reg     [ 31:0]   adc_mux_data_1_1 = 'd0;
  reg               adc_mux_enable_2_0 = 'd0;
  reg     [ 47:0]   adc_mux_data_2_0 = 'd0;
  reg               adc_mux_enable_2_1 = 'd0;
  reg     [ 47:0]   adc_mux_data_2_1 = 'd0;
  reg               adc_mux_enable_2_2 = 'd0;
  reg     [ 47:0]   adc_mux_data_2_2 = 'd0;
  reg               adc_mux_enable_2_3 = 'd0;
  reg     [ 47:0]   adc_mux_data_2_3 = 'd0;
  reg               adc_mux_enable_3_0 = 'd0;
  reg     [ 63:0]   adc_mux_data_3_0 = 'd0;
  reg               adc_mux_enable_3_1 = 'd0;
  reg     [ 63:0]   adc_mux_data_3_1 = 'd0;
  reg               adc_mux_enable_3_2 = 'd0;
  reg     [ 63:0]   adc_mux_data_3_2 = 'd0;
  reg               adc_mux_enable_3_3 = 'd0;
  reg     [ 63:0]   adc_mux_data_3_3 = 'd0;
  reg               adc_mux_enable_3_4 = 'd0;
  reg     [ 63:0]   adc_mux_data_3_4 = 'd0;
  reg               adc_mux_enable_4_0 = 'd0;
  reg     [ 79:0]   adc_mux_data_4_0 = 'd0;
  reg               adc_mux_enable_4_1 = 'd0;
  reg     [ 79:0]   adc_mux_data_4_1 = 'd0;
  reg               adc_mux_enable_4_2 = 'd0;
  reg     [ 79:0]   adc_mux_data_4_2 = 'd0;
  reg               adc_mux_enable_4_3 = 'd0;
  reg     [ 79:0]   adc_mux_data_4_3 = 'd0;
  reg               adc_mux_enable_5_0 = 'd0;
  reg     [ 95:0]   adc_mux_data_5_0 = 'd0;
  reg               adc_mux_enable_5_1 = 'd0;
  reg     [ 95:0]   adc_mux_data_5_1 = 'd0;
  reg               adc_mux_enable_6_0 = 'd0;
  reg     [111:0]   adc_mux_data_6_0 = 'd0;
  reg               adc_mux_enable_7_0 = 'd0;
  reg     [127:0]   adc_mux_data_7_0 = 'd0;

  // simple data or for pipe line registers

  always @(posedge adc_clk) begin
    adc_valid_d <= adc_valid;
    adc_mux_valid <= adc_valid_d;
  end

  always @(posedge adc_clk) begin
    adc_mux_enable_0 <= adc_mux_enable_0_0;
    adc_mux_enable_1 <= adc_mux_enable_1_0 | adc_mux_enable_1_1;
    adc_mux_enable_2 <= adc_mux_enable_2_0 | adc_mux_enable_2_1 |
                        adc_mux_enable_2_2 | adc_mux_enable_2_3;
    adc_mux_enable_3 <= adc_mux_enable_3_0 | adc_mux_enable_3_1 |
                        adc_mux_enable_3_2 | adc_mux_enable_3_3 |
                        adc_mux_enable_3_4;
    adc_mux_enable_4 <= adc_mux_enable_4_0 | adc_mux_enable_4_1 |
                        adc_mux_enable_4_2 | adc_mux_enable_4_3;
    adc_mux_enable_5 <= adc_mux_enable_5_0 | adc_mux_enable_5_1;
    adc_mux_enable_6 <= adc_mux_enable_6_0;
    adc_mux_enable_7 <= adc_mux_enable_7_0;
  end

  always @(posedge adc_clk) begin
    adc_mux_data_0 <= adc_mux_data_0_0;
    adc_mux_data_1 <= adc_mux_data_1_0 | adc_mux_data_1_1;
    adc_mux_data_2 <= adc_mux_data_2_0 | adc_mux_data_2_1 |
                      adc_mux_data_2_2 | adc_mux_data_2_3;
    adc_mux_data_3 <= adc_mux_data_3_0 | adc_mux_data_3_1 |
                      adc_mux_data_3_2 | adc_mux_data_3_3 |
                      adc_mux_data_3_4;
    adc_mux_data_4 <= adc_mux_data_4_0 | adc_mux_data_4_1 |
                      adc_mux_data_4_2 | adc_mux_data_4_3;
    adc_mux_data_5 <= adc_mux_data_5_0 | adc_mux_data_5_1;
    adc_mux_data_6 <= adc_mux_data_6_0;
    adc_mux_data_7 <= adc_mux_data_7_0;
  end

  // mux below is generated using a script-- do not modify-- ask me first!

  // 1 channel(s)

  always @(posedge adc_clk) begin
     case (adc_enable)
      8'b00000001: begin
        adc_mux_enable_0_0 <= 1'b1;
        adc_mux_data_0_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
      end
      8'b00000010: begin
        adc_mux_enable_0_0 <= 1'b1;
        adc_mux_data_0_0[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
      end
      8'b00000100: begin
        adc_mux_enable_0_0 <= 1'b1;
        adc_mux_data_0_0[((16*0)+15):(16*0)] <= adc_data[((16*2)+15):(16*2)];
      end
      8'b00001000: begin
        adc_mux_enable_0_0 <= 1'b1;
        adc_mux_data_0_0[((16*0)+15):(16*0)] <= adc_data[((16*3)+15):(16*3)];
      end
      8'b00010000: begin
        adc_mux_enable_0_0 <= 1'b1;
        adc_mux_data_0_0[((16*0)+15):(16*0)] <= adc_data[((16*4)+15):(16*4)];
      end
      8'b00100000: begin
        adc_mux_enable_0_0 <= 1'b1;
        adc_mux_data_0_0[((16*0)+15):(16*0)] <= adc_data[((16*5)+15):(16*5)];
      end
      8'b01000000: begin
        adc_mux_enable_0_0 <= 1'b1;
        adc_mux_data_0_0[((16*0)+15):(16*0)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b10000000: begin
        adc_mux_enable_0_0 <= 1'b1;
        adc_mux_data_0_0[((16*0)+15):(16*0)] <= adc_data[((16*7)+15):(16*7)];
      end
      default: begin
        adc_mux_enable_0_0 <= 'd0;
        adc_mux_data_0_0 <= 'd0;
      end
    endcase
  end

  // 2 channel(s)

  always @(posedge adc_clk) begin
     case (adc_enable)
      8'b00000011: begin
        adc_mux_enable_1_0 <= 1'b1;
        adc_mux_data_1_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_1_0[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
      end
      8'b00000101: begin
        adc_mux_enable_1_0 <= 1'b1;
        adc_mux_data_1_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_1_0[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
      end
      8'b00000110: begin
        adc_mux_enable_1_0 <= 1'b1;
        adc_mux_data_1_0[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_1_0[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
      end
      8'b00001001: begin
        adc_mux_enable_1_0 <= 1'b1;
        adc_mux_data_1_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_1_0[((16*1)+15):(16*1)] <= adc_data[((16*3)+15):(16*3)];
      end
      8'b00001010: begin
        adc_mux_enable_1_0 <= 1'b1;
        adc_mux_data_1_0[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_1_0[((16*1)+15):(16*1)] <= adc_data[((16*3)+15):(16*3)];
      end
      8'b00001100: begin
        adc_mux_enable_1_0 <= 1'b1;
        adc_mux_data_1_0[((16*0)+15):(16*0)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_1_0[((16*1)+15):(16*1)] <= adc_data[((16*3)+15):(16*3)];
      end
      8'b00010001: begin
        adc_mux_enable_1_0 <= 1'b1;
        adc_mux_data_1_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_1_0[((16*1)+15):(16*1)] <= adc_data[((16*4)+15):(16*4)];
      end
      8'b00010010: begin
        adc_mux_enable_1_0 <= 1'b1;
        adc_mux_data_1_0[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_1_0[((16*1)+15):(16*1)] <= adc_data[((16*4)+15):(16*4)];
      end
      8'b00010100: begin
        adc_mux_enable_1_0 <= 1'b1;
        adc_mux_data_1_0[((16*0)+15):(16*0)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_1_0[((16*1)+15):(16*1)] <= adc_data[((16*4)+15):(16*4)];
      end
      8'b00011000: begin
        adc_mux_enable_1_0 <= 1'b1;
        adc_mux_data_1_0[((16*0)+15):(16*0)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_1_0[((16*1)+15):(16*1)] <= adc_data[((16*4)+15):(16*4)];
      end
      8'b00100001: begin
        adc_mux_enable_1_0 <= 1'b1;
        adc_mux_data_1_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_1_0[((16*1)+15):(16*1)] <= adc_data[((16*5)+15):(16*5)];
      end
      8'b00100010: begin
        adc_mux_enable_1_0 <= 1'b1;
        adc_mux_data_1_0[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_1_0[((16*1)+15):(16*1)] <= adc_data[((16*5)+15):(16*5)];
      end
      8'b00100100: begin
        adc_mux_enable_1_0 <= 1'b1;
        adc_mux_data_1_0[((16*0)+15):(16*0)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_1_0[((16*1)+15):(16*1)] <= adc_data[((16*5)+15):(16*5)];
      end
      8'b00101000: begin
        adc_mux_enable_1_0 <= 1'b1;
        adc_mux_data_1_0[((16*0)+15):(16*0)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_1_0[((16*1)+15):(16*1)] <= adc_data[((16*5)+15):(16*5)];
      end
      8'b00110000: begin
        adc_mux_enable_1_0 <= 1'b1;
        adc_mux_data_1_0[((16*0)+15):(16*0)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_1_0[((16*1)+15):(16*1)] <= adc_data[((16*5)+15):(16*5)];
      end
      8'b01000001: begin
        adc_mux_enable_1_0 <= 1'b1;
        adc_mux_data_1_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_1_0[((16*1)+15):(16*1)] <= adc_data[((16*6)+15):(16*6)];
      end
      default: begin
        adc_mux_enable_1_0 <= 'd0;
        adc_mux_data_1_0 <= 'd0;
      end
    endcase
  end

  always @(posedge adc_clk) begin
     case (adc_enable)
      8'b01000010: begin
        adc_mux_enable_1_1 <= 1'b1;
        adc_mux_data_1_1[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_1_1[((16*1)+15):(16*1)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01000100: begin
        adc_mux_enable_1_1 <= 1'b1;
        adc_mux_data_1_1[((16*0)+15):(16*0)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_1_1[((16*1)+15):(16*1)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01001000: begin
        adc_mux_enable_1_1 <= 1'b1;
        adc_mux_data_1_1[((16*0)+15):(16*0)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_1_1[((16*1)+15):(16*1)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01010000: begin
        adc_mux_enable_1_1 <= 1'b1;
        adc_mux_data_1_1[((16*0)+15):(16*0)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_1_1[((16*1)+15):(16*1)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01100000: begin
        adc_mux_enable_1_1 <= 1'b1;
        adc_mux_data_1_1[((16*0)+15):(16*0)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_1_1[((16*1)+15):(16*1)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b10000001: begin
        adc_mux_enable_1_1 <= 1'b1;
        adc_mux_data_1_1[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_1_1[((16*1)+15):(16*1)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10000010: begin
        adc_mux_enable_1_1 <= 1'b1;
        adc_mux_data_1_1[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_1_1[((16*1)+15):(16*1)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10000100: begin
        adc_mux_enable_1_1 <= 1'b1;
        adc_mux_data_1_1[((16*0)+15):(16*0)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_1_1[((16*1)+15):(16*1)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10001000: begin
        adc_mux_enable_1_1 <= 1'b1;
        adc_mux_data_1_1[((16*0)+15):(16*0)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_1_1[((16*1)+15):(16*1)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10010000: begin
        adc_mux_enable_1_1 <= 1'b1;
        adc_mux_data_1_1[((16*0)+15):(16*0)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_1_1[((16*1)+15):(16*1)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10100000: begin
        adc_mux_enable_1_1 <= 1'b1;
        adc_mux_data_1_1[((16*0)+15):(16*0)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_1_1[((16*1)+15):(16*1)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11000000: begin
        adc_mux_enable_1_1 <= 1'b1;
        adc_mux_data_1_1[((16*0)+15):(16*0)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_1_1[((16*1)+15):(16*1)] <= adc_data[((16*7)+15):(16*7)];
      end
      default: begin
        adc_mux_enable_1_1 <= 'd0;
        adc_mux_data_1_1 <= 'd0;
      end
    endcase
  end

  // 3 channel(s)

  always @(posedge adc_clk) begin
     case (adc_enable)
      8'b00000111: begin
        adc_mux_enable_2_0 <= 1'b1;
        adc_mux_data_2_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_2_0[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_2_0[((16*2)+15):(16*2)] <= adc_data[((16*2)+15):(16*2)];
      end
      8'b00001011: begin
        adc_mux_enable_2_0 <= 1'b1;
        adc_mux_data_2_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_2_0[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_2_0[((16*2)+15):(16*2)] <= adc_data[((16*3)+15):(16*3)];
      end
      8'b00001101: begin
        adc_mux_enable_2_0 <= 1'b1;
        adc_mux_data_2_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_2_0[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_2_0[((16*2)+15):(16*2)] <= adc_data[((16*3)+15):(16*3)];
      end
      8'b00001110: begin
        adc_mux_enable_2_0 <= 1'b1;
        adc_mux_data_2_0[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_2_0[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_2_0[((16*2)+15):(16*2)] <= adc_data[((16*3)+15):(16*3)];
      end
      8'b00010011: begin
        adc_mux_enable_2_0 <= 1'b1;
        adc_mux_data_2_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_2_0[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_2_0[((16*2)+15):(16*2)] <= adc_data[((16*4)+15):(16*4)];
      end
      8'b00010101: begin
        adc_mux_enable_2_0 <= 1'b1;
        adc_mux_data_2_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_2_0[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_2_0[((16*2)+15):(16*2)] <= adc_data[((16*4)+15):(16*4)];
      end
      8'b00010110: begin
        adc_mux_enable_2_0 <= 1'b1;
        adc_mux_data_2_0[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_2_0[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_2_0[((16*2)+15):(16*2)] <= adc_data[((16*4)+15):(16*4)];
      end
      8'b00011001: begin
        adc_mux_enable_2_0 <= 1'b1;
        adc_mux_data_2_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_2_0[((16*1)+15):(16*1)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_2_0[((16*2)+15):(16*2)] <= adc_data[((16*4)+15):(16*4)];
      end
      8'b00011010: begin
        adc_mux_enable_2_0 <= 1'b1;
        adc_mux_data_2_0[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_2_0[((16*1)+15):(16*1)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_2_0[((16*2)+15):(16*2)] <= adc_data[((16*4)+15):(16*4)];
      end
      8'b00011100: begin
        adc_mux_enable_2_0 <= 1'b1;
        adc_mux_data_2_0[((16*0)+15):(16*0)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_2_0[((16*1)+15):(16*1)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_2_0[((16*2)+15):(16*2)] <= adc_data[((16*4)+15):(16*4)];
      end
      8'b00100011: begin
        adc_mux_enable_2_0 <= 1'b1;
        adc_mux_data_2_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_2_0[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_2_0[((16*2)+15):(16*2)] <= adc_data[((16*5)+15):(16*5)];
      end
      8'b00100101: begin
        adc_mux_enable_2_0 <= 1'b1;
        adc_mux_data_2_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_2_0[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_2_0[((16*2)+15):(16*2)] <= adc_data[((16*5)+15):(16*5)];
      end
      8'b00100110: begin
        adc_mux_enable_2_0 <= 1'b1;
        adc_mux_data_2_0[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_2_0[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_2_0[((16*2)+15):(16*2)] <= adc_data[((16*5)+15):(16*5)];
      end
      8'b00101001: begin
        adc_mux_enable_2_0 <= 1'b1;
        adc_mux_data_2_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_2_0[((16*1)+15):(16*1)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_2_0[((16*2)+15):(16*2)] <= adc_data[((16*5)+15):(16*5)];
      end
      8'b00101010: begin
        adc_mux_enable_2_0 <= 1'b1;
        adc_mux_data_2_0[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_2_0[((16*1)+15):(16*1)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_2_0[((16*2)+15):(16*2)] <= adc_data[((16*5)+15):(16*5)];
      end
      8'b00101100: begin
        adc_mux_enable_2_0 <= 1'b1;
        adc_mux_data_2_0[((16*0)+15):(16*0)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_2_0[((16*1)+15):(16*1)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_2_0[((16*2)+15):(16*2)] <= adc_data[((16*5)+15):(16*5)];
      end
      default: begin
        adc_mux_enable_2_0 <= 'd0;
        adc_mux_data_2_0 <= 'd0;
      end
    endcase
  end

  always @(posedge adc_clk) begin
     case (adc_enable)
      8'b00110001: begin
        adc_mux_enable_2_1 <= 1'b1;
        adc_mux_data_2_1[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_2_1[((16*1)+15):(16*1)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_2_1[((16*2)+15):(16*2)] <= adc_data[((16*5)+15):(16*5)];
      end
      8'b00110010: begin
        adc_mux_enable_2_1 <= 1'b1;
        adc_mux_data_2_1[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_2_1[((16*1)+15):(16*1)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_2_1[((16*2)+15):(16*2)] <= adc_data[((16*5)+15):(16*5)];
      end
      8'b00110100: begin
        adc_mux_enable_2_1 <= 1'b1;
        adc_mux_data_2_1[((16*0)+15):(16*0)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_2_1[((16*1)+15):(16*1)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_2_1[((16*2)+15):(16*2)] <= adc_data[((16*5)+15):(16*5)];
      end
      8'b00111000: begin
        adc_mux_enable_2_1 <= 1'b1;
        adc_mux_data_2_1[((16*0)+15):(16*0)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_2_1[((16*1)+15):(16*1)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_2_1[((16*2)+15):(16*2)] <= adc_data[((16*5)+15):(16*5)];
      end
      8'b01000011: begin
        adc_mux_enable_2_1 <= 1'b1;
        adc_mux_data_2_1[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_2_1[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_2_1[((16*2)+15):(16*2)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01000101: begin
        adc_mux_enable_2_1 <= 1'b1;
        adc_mux_data_2_1[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_2_1[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_2_1[((16*2)+15):(16*2)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01000110: begin
        adc_mux_enable_2_1 <= 1'b1;
        adc_mux_data_2_1[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_2_1[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_2_1[((16*2)+15):(16*2)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01001001: begin
        adc_mux_enable_2_1 <= 1'b1;
        adc_mux_data_2_1[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_2_1[((16*1)+15):(16*1)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_2_1[((16*2)+15):(16*2)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01001010: begin
        adc_mux_enable_2_1 <= 1'b1;
        adc_mux_data_2_1[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_2_1[((16*1)+15):(16*1)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_2_1[((16*2)+15):(16*2)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01001100: begin
        adc_mux_enable_2_1 <= 1'b1;
        adc_mux_data_2_1[((16*0)+15):(16*0)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_2_1[((16*1)+15):(16*1)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_2_1[((16*2)+15):(16*2)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01010001: begin
        adc_mux_enable_2_1 <= 1'b1;
        adc_mux_data_2_1[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_2_1[((16*1)+15):(16*1)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_2_1[((16*2)+15):(16*2)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01010010: begin
        adc_mux_enable_2_1 <= 1'b1;
        adc_mux_data_2_1[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_2_1[((16*1)+15):(16*1)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_2_1[((16*2)+15):(16*2)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01010100: begin
        adc_mux_enable_2_1 <= 1'b1;
        adc_mux_data_2_1[((16*0)+15):(16*0)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_2_1[((16*1)+15):(16*1)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_2_1[((16*2)+15):(16*2)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01011000: begin
        adc_mux_enable_2_1 <= 1'b1;
        adc_mux_data_2_1[((16*0)+15):(16*0)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_2_1[((16*1)+15):(16*1)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_2_1[((16*2)+15):(16*2)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01100001: begin
        adc_mux_enable_2_1 <= 1'b1;
        adc_mux_data_2_1[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_2_1[((16*1)+15):(16*1)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_2_1[((16*2)+15):(16*2)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01100010: begin
        adc_mux_enable_2_1 <= 1'b1;
        adc_mux_data_2_1[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_2_1[((16*1)+15):(16*1)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_2_1[((16*2)+15):(16*2)] <= adc_data[((16*6)+15):(16*6)];
      end
      default: begin
        adc_mux_enable_2_1 <= 'd0;
        adc_mux_data_2_1 <= 'd0;
      end
    endcase
  end

  always @(posedge adc_clk) begin
     case (adc_enable)
      8'b01100100: begin
        adc_mux_enable_2_2 <= 1'b1;
        adc_mux_data_2_2[((16*0)+15):(16*0)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_2_2[((16*1)+15):(16*1)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_2_2[((16*2)+15):(16*2)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01101000: begin
        adc_mux_enable_2_2 <= 1'b1;
        adc_mux_data_2_2[((16*0)+15):(16*0)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_2_2[((16*1)+15):(16*1)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_2_2[((16*2)+15):(16*2)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01110000: begin
        adc_mux_enable_2_2 <= 1'b1;
        adc_mux_data_2_2[((16*0)+15):(16*0)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_2_2[((16*1)+15):(16*1)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_2_2[((16*2)+15):(16*2)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b10000011: begin
        adc_mux_enable_2_2 <= 1'b1;
        adc_mux_data_2_2[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_2_2[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_2_2[((16*2)+15):(16*2)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10000101: begin
        adc_mux_enable_2_2 <= 1'b1;
        adc_mux_data_2_2[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_2_2[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_2_2[((16*2)+15):(16*2)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10000110: begin
        adc_mux_enable_2_2 <= 1'b1;
        adc_mux_data_2_2[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_2_2[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_2_2[((16*2)+15):(16*2)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10001001: begin
        adc_mux_enable_2_2 <= 1'b1;
        adc_mux_data_2_2[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_2_2[((16*1)+15):(16*1)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_2_2[((16*2)+15):(16*2)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10001010: begin
        adc_mux_enable_2_2 <= 1'b1;
        adc_mux_data_2_2[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_2_2[((16*1)+15):(16*1)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_2_2[((16*2)+15):(16*2)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10001100: begin
        adc_mux_enable_2_2 <= 1'b1;
        adc_mux_data_2_2[((16*0)+15):(16*0)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_2_2[((16*1)+15):(16*1)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_2_2[((16*2)+15):(16*2)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10010001: begin
        adc_mux_enable_2_2 <= 1'b1;
        adc_mux_data_2_2[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_2_2[((16*1)+15):(16*1)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_2_2[((16*2)+15):(16*2)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10010010: begin
        adc_mux_enable_2_2 <= 1'b1;
        adc_mux_data_2_2[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_2_2[((16*1)+15):(16*1)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_2_2[((16*2)+15):(16*2)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10010100: begin
        adc_mux_enable_2_2 <= 1'b1;
        adc_mux_data_2_2[((16*0)+15):(16*0)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_2_2[((16*1)+15):(16*1)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_2_2[((16*2)+15):(16*2)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10011000: begin
        adc_mux_enable_2_2 <= 1'b1;
        adc_mux_data_2_2[((16*0)+15):(16*0)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_2_2[((16*1)+15):(16*1)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_2_2[((16*2)+15):(16*2)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10100001: begin
        adc_mux_enable_2_2 <= 1'b1;
        adc_mux_data_2_2[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_2_2[((16*1)+15):(16*1)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_2_2[((16*2)+15):(16*2)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10100010: begin
        adc_mux_enable_2_2 <= 1'b1;
        adc_mux_data_2_2[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_2_2[((16*1)+15):(16*1)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_2_2[((16*2)+15):(16*2)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10100100: begin
        adc_mux_enable_2_2 <= 1'b1;
        adc_mux_data_2_2[((16*0)+15):(16*0)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_2_2[((16*1)+15):(16*1)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_2_2[((16*2)+15):(16*2)] <= adc_data[((16*7)+15):(16*7)];
      end
      default: begin
        adc_mux_enable_2_2 <= 'd0;
        adc_mux_data_2_2 <= 'd0;
      end
    endcase
  end

  always @(posedge adc_clk) begin
     case (adc_enable)
      8'b10101000: begin
        adc_mux_enable_2_3 <= 1'b1;
        adc_mux_data_2_3[((16*0)+15):(16*0)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_2_3[((16*1)+15):(16*1)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_2_3[((16*2)+15):(16*2)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10110000: begin
        adc_mux_enable_2_3 <= 1'b1;
        adc_mux_data_2_3[((16*0)+15):(16*0)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_2_3[((16*1)+15):(16*1)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_2_3[((16*2)+15):(16*2)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11000001: begin
        adc_mux_enable_2_3 <= 1'b1;
        adc_mux_data_2_3[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_2_3[((16*1)+15):(16*1)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_2_3[((16*2)+15):(16*2)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11000010: begin
        adc_mux_enable_2_3 <= 1'b1;
        adc_mux_data_2_3[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_2_3[((16*1)+15):(16*1)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_2_3[((16*2)+15):(16*2)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11000100: begin
        adc_mux_enable_2_3 <= 1'b1;
        adc_mux_data_2_3[((16*0)+15):(16*0)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_2_3[((16*1)+15):(16*1)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_2_3[((16*2)+15):(16*2)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11001000: begin
        adc_mux_enable_2_3 <= 1'b1;
        adc_mux_data_2_3[((16*0)+15):(16*0)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_2_3[((16*1)+15):(16*1)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_2_3[((16*2)+15):(16*2)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11010000: begin
        adc_mux_enable_2_3 <= 1'b1;
        adc_mux_data_2_3[((16*0)+15):(16*0)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_2_3[((16*1)+15):(16*1)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_2_3[((16*2)+15):(16*2)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11100000: begin
        adc_mux_enable_2_3 <= 1'b1;
        adc_mux_data_2_3[((16*0)+15):(16*0)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_2_3[((16*1)+15):(16*1)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_2_3[((16*2)+15):(16*2)] <= adc_data[((16*7)+15):(16*7)];
      end
      default: begin
        adc_mux_enable_2_3 <= 'd0;
        adc_mux_data_2_3 <= 'd0;
      end
    endcase
  end

  // 4 channel(s)

  always @(posedge adc_clk) begin
     case (adc_enable)
      8'b00001111: begin
        adc_mux_enable_3_0 <= 1'b1;
        adc_mux_data_3_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_3_0[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_3_0[((16*2)+15):(16*2)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_3_0[((16*3)+15):(16*3)] <= adc_data[((16*3)+15):(16*3)];
      end
      8'b00010111: begin
        adc_mux_enable_3_0 <= 1'b1;
        adc_mux_data_3_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_3_0[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_3_0[((16*2)+15):(16*2)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_3_0[((16*3)+15):(16*3)] <= adc_data[((16*4)+15):(16*4)];
      end
      8'b00011011: begin
        adc_mux_enable_3_0 <= 1'b1;
        adc_mux_data_3_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_3_0[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_3_0[((16*2)+15):(16*2)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_3_0[((16*3)+15):(16*3)] <= adc_data[((16*4)+15):(16*4)];
      end
      8'b00011101: begin
        adc_mux_enable_3_0 <= 1'b1;
        adc_mux_data_3_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_3_0[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_3_0[((16*2)+15):(16*2)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_3_0[((16*3)+15):(16*3)] <= adc_data[((16*4)+15):(16*4)];
      end
      8'b00011110: begin
        adc_mux_enable_3_0 <= 1'b1;
        adc_mux_data_3_0[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_3_0[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_3_0[((16*2)+15):(16*2)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_3_0[((16*3)+15):(16*3)] <= adc_data[((16*4)+15):(16*4)];
      end
      8'b00100111: begin
        adc_mux_enable_3_0 <= 1'b1;
        adc_mux_data_3_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_3_0[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_3_0[((16*2)+15):(16*2)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_3_0[((16*3)+15):(16*3)] <= adc_data[((16*5)+15):(16*5)];
      end
      8'b00101011: begin
        adc_mux_enable_3_0 <= 1'b1;
        adc_mux_data_3_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_3_0[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_3_0[((16*2)+15):(16*2)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_3_0[((16*3)+15):(16*3)] <= adc_data[((16*5)+15):(16*5)];
      end
      8'b00101101: begin
        adc_mux_enable_3_0 <= 1'b1;
        adc_mux_data_3_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_3_0[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_3_0[((16*2)+15):(16*2)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_3_0[((16*3)+15):(16*3)] <= adc_data[((16*5)+15):(16*5)];
      end
      8'b00101110: begin
        adc_mux_enable_3_0 <= 1'b1;
        adc_mux_data_3_0[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_3_0[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_3_0[((16*2)+15):(16*2)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_3_0[((16*3)+15):(16*3)] <= adc_data[((16*5)+15):(16*5)];
      end
      8'b00110011: begin
        adc_mux_enable_3_0 <= 1'b1;
        adc_mux_data_3_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_3_0[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_3_0[((16*2)+15):(16*2)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_3_0[((16*3)+15):(16*3)] <= adc_data[((16*5)+15):(16*5)];
      end
      8'b00110101: begin
        adc_mux_enable_3_0 <= 1'b1;
        adc_mux_data_3_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_3_0[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_3_0[((16*2)+15):(16*2)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_3_0[((16*3)+15):(16*3)] <= adc_data[((16*5)+15):(16*5)];
      end
      8'b00110110: begin
        adc_mux_enable_3_0 <= 1'b1;
        adc_mux_data_3_0[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_3_0[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_3_0[((16*2)+15):(16*2)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_3_0[((16*3)+15):(16*3)] <= adc_data[((16*5)+15):(16*5)];
      end
      8'b00111001: begin
        adc_mux_enable_3_0 <= 1'b1;
        adc_mux_data_3_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_3_0[((16*1)+15):(16*1)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_3_0[((16*2)+15):(16*2)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_3_0[((16*3)+15):(16*3)] <= adc_data[((16*5)+15):(16*5)];
      end
      8'b00111010: begin
        adc_mux_enable_3_0 <= 1'b1;
        adc_mux_data_3_0[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_3_0[((16*1)+15):(16*1)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_3_0[((16*2)+15):(16*2)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_3_0[((16*3)+15):(16*3)] <= adc_data[((16*5)+15):(16*5)];
      end
      8'b00111100: begin
        adc_mux_enable_3_0 <= 1'b1;
        adc_mux_data_3_0[((16*0)+15):(16*0)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_3_0[((16*1)+15):(16*1)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_3_0[((16*2)+15):(16*2)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_3_0[((16*3)+15):(16*3)] <= adc_data[((16*5)+15):(16*5)];
      end
      8'b01000111: begin
        adc_mux_enable_3_0 <= 1'b1;
        adc_mux_data_3_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_3_0[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_3_0[((16*2)+15):(16*2)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_3_0[((16*3)+15):(16*3)] <= adc_data[((16*6)+15):(16*6)];
      end
      default: begin
        adc_mux_enable_3_0 <= 'd0;
        adc_mux_data_3_0 <= 'd0;
      end
    endcase
  end

  always @(posedge adc_clk) begin
     case (adc_enable)
      8'b01001011: begin
        adc_mux_enable_3_1 <= 1'b1;
        adc_mux_data_3_1[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_3_1[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_3_1[((16*2)+15):(16*2)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_3_1[((16*3)+15):(16*3)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01001101: begin
        adc_mux_enable_3_1 <= 1'b1;
        adc_mux_data_3_1[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_3_1[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_3_1[((16*2)+15):(16*2)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_3_1[((16*3)+15):(16*3)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01001110: begin
        adc_mux_enable_3_1 <= 1'b1;
        adc_mux_data_3_1[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_3_1[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_3_1[((16*2)+15):(16*2)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_3_1[((16*3)+15):(16*3)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01010011: begin
        adc_mux_enable_3_1 <= 1'b1;
        adc_mux_data_3_1[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_3_1[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_3_1[((16*2)+15):(16*2)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_3_1[((16*3)+15):(16*3)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01010101: begin
        adc_mux_enable_3_1 <= 1'b1;
        adc_mux_data_3_1[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_3_1[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_3_1[((16*2)+15):(16*2)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_3_1[((16*3)+15):(16*3)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01010110: begin
        adc_mux_enable_3_1 <= 1'b1;
        adc_mux_data_3_1[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_3_1[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_3_1[((16*2)+15):(16*2)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_3_1[((16*3)+15):(16*3)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01011001: begin
        adc_mux_enable_3_1 <= 1'b1;
        adc_mux_data_3_1[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_3_1[((16*1)+15):(16*1)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_3_1[((16*2)+15):(16*2)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_3_1[((16*3)+15):(16*3)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01011010: begin
        adc_mux_enable_3_1 <= 1'b1;
        adc_mux_data_3_1[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_3_1[((16*1)+15):(16*1)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_3_1[((16*2)+15):(16*2)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_3_1[((16*3)+15):(16*3)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01011100: begin
        adc_mux_enable_3_1 <= 1'b1;
        adc_mux_data_3_1[((16*0)+15):(16*0)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_3_1[((16*1)+15):(16*1)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_3_1[((16*2)+15):(16*2)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_3_1[((16*3)+15):(16*3)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01100011: begin
        adc_mux_enable_3_1 <= 1'b1;
        adc_mux_data_3_1[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_3_1[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_3_1[((16*2)+15):(16*2)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_3_1[((16*3)+15):(16*3)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01100101: begin
        adc_mux_enable_3_1 <= 1'b1;
        adc_mux_data_3_1[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_3_1[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_3_1[((16*2)+15):(16*2)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_3_1[((16*3)+15):(16*3)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01100110: begin
        adc_mux_enable_3_1 <= 1'b1;
        adc_mux_data_3_1[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_3_1[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_3_1[((16*2)+15):(16*2)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_3_1[((16*3)+15):(16*3)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01101001: begin
        adc_mux_enable_3_1 <= 1'b1;
        adc_mux_data_3_1[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_3_1[((16*1)+15):(16*1)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_3_1[((16*2)+15):(16*2)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_3_1[((16*3)+15):(16*3)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01101010: begin
        adc_mux_enable_3_1 <= 1'b1;
        adc_mux_data_3_1[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_3_1[((16*1)+15):(16*1)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_3_1[((16*2)+15):(16*2)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_3_1[((16*3)+15):(16*3)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01101100: begin
        adc_mux_enable_3_1 <= 1'b1;
        adc_mux_data_3_1[((16*0)+15):(16*0)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_3_1[((16*1)+15):(16*1)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_3_1[((16*2)+15):(16*2)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_3_1[((16*3)+15):(16*3)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01110001: begin
        adc_mux_enable_3_1 <= 1'b1;
        adc_mux_data_3_1[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_3_1[((16*1)+15):(16*1)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_3_1[((16*2)+15):(16*2)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_3_1[((16*3)+15):(16*3)] <= adc_data[((16*6)+15):(16*6)];
      end
      default: begin
        adc_mux_enable_3_1 <= 'd0;
        adc_mux_data_3_1 <= 'd0;
      end
    endcase
  end

  always @(posedge adc_clk) begin
     case (adc_enable)
      8'b01110010: begin
        adc_mux_enable_3_2 <= 1'b1;
        adc_mux_data_3_2[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_3_2[((16*1)+15):(16*1)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_3_2[((16*2)+15):(16*2)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_3_2[((16*3)+15):(16*3)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01110100: begin
        adc_mux_enable_3_2 <= 1'b1;
        adc_mux_data_3_2[((16*0)+15):(16*0)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_3_2[((16*1)+15):(16*1)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_3_2[((16*2)+15):(16*2)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_3_2[((16*3)+15):(16*3)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01111000: begin
        adc_mux_enable_3_2 <= 1'b1;
        adc_mux_data_3_2[((16*0)+15):(16*0)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_3_2[((16*1)+15):(16*1)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_3_2[((16*2)+15):(16*2)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_3_2[((16*3)+15):(16*3)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b10000111: begin
        adc_mux_enable_3_2 <= 1'b1;
        adc_mux_data_3_2[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_3_2[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_3_2[((16*2)+15):(16*2)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_3_2[((16*3)+15):(16*3)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10001011: begin
        adc_mux_enable_3_2 <= 1'b1;
        adc_mux_data_3_2[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_3_2[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_3_2[((16*2)+15):(16*2)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_3_2[((16*3)+15):(16*3)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10001101: begin
        adc_mux_enable_3_2 <= 1'b1;
        adc_mux_data_3_2[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_3_2[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_3_2[((16*2)+15):(16*2)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_3_2[((16*3)+15):(16*3)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10001110: begin
        adc_mux_enable_3_2 <= 1'b1;
        adc_mux_data_3_2[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_3_2[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_3_2[((16*2)+15):(16*2)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_3_2[((16*3)+15):(16*3)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10010011: begin
        adc_mux_enable_3_2 <= 1'b1;
        adc_mux_data_3_2[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_3_2[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_3_2[((16*2)+15):(16*2)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_3_2[((16*3)+15):(16*3)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10010101: begin
        adc_mux_enable_3_2 <= 1'b1;
        adc_mux_data_3_2[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_3_2[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_3_2[((16*2)+15):(16*2)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_3_2[((16*3)+15):(16*3)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10010110: begin
        adc_mux_enable_3_2 <= 1'b1;
        adc_mux_data_3_2[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_3_2[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_3_2[((16*2)+15):(16*2)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_3_2[((16*3)+15):(16*3)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10011001: begin
        adc_mux_enable_3_2 <= 1'b1;
        adc_mux_data_3_2[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_3_2[((16*1)+15):(16*1)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_3_2[((16*2)+15):(16*2)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_3_2[((16*3)+15):(16*3)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10011010: begin
        adc_mux_enable_3_2 <= 1'b1;
        adc_mux_data_3_2[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_3_2[((16*1)+15):(16*1)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_3_2[((16*2)+15):(16*2)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_3_2[((16*3)+15):(16*3)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10011100: begin
        adc_mux_enable_3_2 <= 1'b1;
        adc_mux_data_3_2[((16*0)+15):(16*0)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_3_2[((16*1)+15):(16*1)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_3_2[((16*2)+15):(16*2)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_3_2[((16*3)+15):(16*3)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10100011: begin
        adc_mux_enable_3_2 <= 1'b1;
        adc_mux_data_3_2[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_3_2[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_3_2[((16*2)+15):(16*2)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_3_2[((16*3)+15):(16*3)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10100101: begin
        adc_mux_enable_3_2 <= 1'b1;
        adc_mux_data_3_2[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_3_2[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_3_2[((16*2)+15):(16*2)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_3_2[((16*3)+15):(16*3)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10100110: begin
        adc_mux_enable_3_2 <= 1'b1;
        adc_mux_data_3_2[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_3_2[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_3_2[((16*2)+15):(16*2)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_3_2[((16*3)+15):(16*3)] <= adc_data[((16*7)+15):(16*7)];
      end
      default: begin
        adc_mux_enable_3_2 <= 'd0;
        adc_mux_data_3_2 <= 'd0;
      end
    endcase
  end

  always @(posedge adc_clk) begin
     case (adc_enable)
      8'b10101001: begin
        adc_mux_enable_3_3 <= 1'b1;
        adc_mux_data_3_3[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_3_3[((16*1)+15):(16*1)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_3_3[((16*2)+15):(16*2)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_3_3[((16*3)+15):(16*3)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10101010: begin
        adc_mux_enable_3_3 <= 1'b1;
        adc_mux_data_3_3[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_3_3[((16*1)+15):(16*1)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_3_3[((16*2)+15):(16*2)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_3_3[((16*3)+15):(16*3)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10101100: begin
        adc_mux_enable_3_3 <= 1'b1;
        adc_mux_data_3_3[((16*0)+15):(16*0)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_3_3[((16*1)+15):(16*1)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_3_3[((16*2)+15):(16*2)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_3_3[((16*3)+15):(16*3)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10110001: begin
        adc_mux_enable_3_3 <= 1'b1;
        adc_mux_data_3_3[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_3_3[((16*1)+15):(16*1)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_3_3[((16*2)+15):(16*2)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_3_3[((16*3)+15):(16*3)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10110010: begin
        adc_mux_enable_3_3 <= 1'b1;
        adc_mux_data_3_3[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_3_3[((16*1)+15):(16*1)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_3_3[((16*2)+15):(16*2)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_3_3[((16*3)+15):(16*3)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10110100: begin
        adc_mux_enable_3_3 <= 1'b1;
        adc_mux_data_3_3[((16*0)+15):(16*0)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_3_3[((16*1)+15):(16*1)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_3_3[((16*2)+15):(16*2)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_3_3[((16*3)+15):(16*3)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10111000: begin
        adc_mux_enable_3_3 <= 1'b1;
        adc_mux_data_3_3[((16*0)+15):(16*0)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_3_3[((16*1)+15):(16*1)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_3_3[((16*2)+15):(16*2)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_3_3[((16*3)+15):(16*3)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11000011: begin
        adc_mux_enable_3_3 <= 1'b1;
        adc_mux_data_3_3[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_3_3[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_3_3[((16*2)+15):(16*2)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_3_3[((16*3)+15):(16*3)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11000101: begin
        adc_mux_enable_3_3 <= 1'b1;
        adc_mux_data_3_3[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_3_3[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_3_3[((16*2)+15):(16*2)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_3_3[((16*3)+15):(16*3)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11000110: begin
        adc_mux_enable_3_3 <= 1'b1;
        adc_mux_data_3_3[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_3_3[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_3_3[((16*2)+15):(16*2)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_3_3[((16*3)+15):(16*3)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11001001: begin
        adc_mux_enable_3_3 <= 1'b1;
        adc_mux_data_3_3[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_3_3[((16*1)+15):(16*1)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_3_3[((16*2)+15):(16*2)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_3_3[((16*3)+15):(16*3)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11001010: begin
        adc_mux_enable_3_3 <= 1'b1;
        adc_mux_data_3_3[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_3_3[((16*1)+15):(16*1)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_3_3[((16*2)+15):(16*2)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_3_3[((16*3)+15):(16*3)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11001100: begin
        adc_mux_enable_3_3 <= 1'b1;
        adc_mux_data_3_3[((16*0)+15):(16*0)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_3_3[((16*1)+15):(16*1)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_3_3[((16*2)+15):(16*2)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_3_3[((16*3)+15):(16*3)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11010001: begin
        adc_mux_enable_3_3 <= 1'b1;
        adc_mux_data_3_3[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_3_3[((16*1)+15):(16*1)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_3_3[((16*2)+15):(16*2)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_3_3[((16*3)+15):(16*3)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11010010: begin
        adc_mux_enable_3_3 <= 1'b1;
        adc_mux_data_3_3[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_3_3[((16*1)+15):(16*1)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_3_3[((16*2)+15):(16*2)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_3_3[((16*3)+15):(16*3)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11010100: begin
        adc_mux_enable_3_3 <= 1'b1;
        adc_mux_data_3_3[((16*0)+15):(16*0)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_3_3[((16*1)+15):(16*1)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_3_3[((16*2)+15):(16*2)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_3_3[((16*3)+15):(16*3)] <= adc_data[((16*7)+15):(16*7)];
      end
      default: begin
        adc_mux_enable_3_3 <= 'd0;
        adc_mux_data_3_3 <= 'd0;
      end
    endcase
  end

  always @(posedge adc_clk) begin
     case (adc_enable)
      8'b11011000: begin
        adc_mux_enable_3_4 <= 1'b1;
        adc_mux_data_3_4[((16*0)+15):(16*0)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_3_4[((16*1)+15):(16*1)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_3_4[((16*2)+15):(16*2)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_3_4[((16*3)+15):(16*3)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11100001: begin
        adc_mux_enable_3_4 <= 1'b1;
        adc_mux_data_3_4[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_3_4[((16*1)+15):(16*1)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_3_4[((16*2)+15):(16*2)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_3_4[((16*3)+15):(16*3)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11100010: begin
        adc_mux_enable_3_4 <= 1'b1;
        adc_mux_data_3_4[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_3_4[((16*1)+15):(16*1)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_3_4[((16*2)+15):(16*2)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_3_4[((16*3)+15):(16*3)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11100100: begin
        adc_mux_enable_3_4 <= 1'b1;
        adc_mux_data_3_4[((16*0)+15):(16*0)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_3_4[((16*1)+15):(16*1)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_3_4[((16*2)+15):(16*2)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_3_4[((16*3)+15):(16*3)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11101000: begin
        adc_mux_enable_3_4 <= 1'b1;
        adc_mux_data_3_4[((16*0)+15):(16*0)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_3_4[((16*1)+15):(16*1)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_3_4[((16*2)+15):(16*2)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_3_4[((16*3)+15):(16*3)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11110000: begin
        adc_mux_enable_3_4 <= 1'b1;
        adc_mux_data_3_4[((16*0)+15):(16*0)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_3_4[((16*1)+15):(16*1)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_3_4[((16*2)+15):(16*2)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_3_4[((16*3)+15):(16*3)] <= adc_data[((16*7)+15):(16*7)];
      end
      default: begin
        adc_mux_enable_3_4 <= 'd0;
        adc_mux_data_3_4 <= 'd0;
      end
    endcase
  end

  // 5 channel(s)

  always @(posedge adc_clk) begin
     case (adc_enable)
      8'b00011111: begin
        adc_mux_enable_4_0 <= 1'b1;
        adc_mux_data_4_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_4_0[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_4_0[((16*2)+15):(16*2)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_4_0[((16*3)+15):(16*3)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_4_0[((16*4)+15):(16*4)] <= adc_data[((16*4)+15):(16*4)];
      end
      8'b00101111: begin
        adc_mux_enable_4_0 <= 1'b1;
        adc_mux_data_4_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_4_0[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_4_0[((16*2)+15):(16*2)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_4_0[((16*3)+15):(16*3)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_4_0[((16*4)+15):(16*4)] <= adc_data[((16*5)+15):(16*5)];
      end
      8'b00110111: begin
        adc_mux_enable_4_0 <= 1'b1;
        adc_mux_data_4_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_4_0[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_4_0[((16*2)+15):(16*2)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_4_0[((16*3)+15):(16*3)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_4_0[((16*4)+15):(16*4)] <= adc_data[((16*5)+15):(16*5)];
      end
      8'b00111011: begin
        adc_mux_enable_4_0 <= 1'b1;
        adc_mux_data_4_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_4_0[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_4_0[((16*2)+15):(16*2)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_4_0[((16*3)+15):(16*3)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_4_0[((16*4)+15):(16*4)] <= adc_data[((16*5)+15):(16*5)];
      end
      8'b00111101: begin
        adc_mux_enable_4_0 <= 1'b1;
        adc_mux_data_4_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_4_0[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_4_0[((16*2)+15):(16*2)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_4_0[((16*3)+15):(16*3)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_4_0[((16*4)+15):(16*4)] <= adc_data[((16*5)+15):(16*5)];
      end
      8'b00111110: begin
        adc_mux_enable_4_0 <= 1'b1;
        adc_mux_data_4_0[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_4_0[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_4_0[((16*2)+15):(16*2)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_4_0[((16*3)+15):(16*3)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_4_0[((16*4)+15):(16*4)] <= adc_data[((16*5)+15):(16*5)];
      end
      8'b01001111: begin
        adc_mux_enable_4_0 <= 1'b1;
        adc_mux_data_4_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_4_0[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_4_0[((16*2)+15):(16*2)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_4_0[((16*3)+15):(16*3)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_4_0[((16*4)+15):(16*4)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01010111: begin
        adc_mux_enable_4_0 <= 1'b1;
        adc_mux_data_4_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_4_0[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_4_0[((16*2)+15):(16*2)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_4_0[((16*3)+15):(16*3)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_4_0[((16*4)+15):(16*4)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01011011: begin
        adc_mux_enable_4_0 <= 1'b1;
        adc_mux_data_4_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_4_0[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_4_0[((16*2)+15):(16*2)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_4_0[((16*3)+15):(16*3)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_4_0[((16*4)+15):(16*4)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01011101: begin
        adc_mux_enable_4_0 <= 1'b1;
        adc_mux_data_4_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_4_0[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_4_0[((16*2)+15):(16*2)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_4_0[((16*3)+15):(16*3)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_4_0[((16*4)+15):(16*4)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01011110: begin
        adc_mux_enable_4_0 <= 1'b1;
        adc_mux_data_4_0[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_4_0[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_4_0[((16*2)+15):(16*2)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_4_0[((16*3)+15):(16*3)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_4_0[((16*4)+15):(16*4)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01100111: begin
        adc_mux_enable_4_0 <= 1'b1;
        adc_mux_data_4_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_4_0[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_4_0[((16*2)+15):(16*2)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_4_0[((16*3)+15):(16*3)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_4_0[((16*4)+15):(16*4)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01101011: begin
        adc_mux_enable_4_0 <= 1'b1;
        adc_mux_data_4_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_4_0[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_4_0[((16*2)+15):(16*2)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_4_0[((16*3)+15):(16*3)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_4_0[((16*4)+15):(16*4)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01101101: begin
        adc_mux_enable_4_0 <= 1'b1;
        adc_mux_data_4_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_4_0[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_4_0[((16*2)+15):(16*2)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_4_0[((16*3)+15):(16*3)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_4_0[((16*4)+15):(16*4)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01101110: begin
        adc_mux_enable_4_0 <= 1'b1;
        adc_mux_data_4_0[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_4_0[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_4_0[((16*2)+15):(16*2)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_4_0[((16*3)+15):(16*3)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_4_0[((16*4)+15):(16*4)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01110011: begin
        adc_mux_enable_4_0 <= 1'b1;
        adc_mux_data_4_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_4_0[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_4_0[((16*2)+15):(16*2)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_4_0[((16*3)+15):(16*3)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_4_0[((16*4)+15):(16*4)] <= adc_data[((16*6)+15):(16*6)];
      end
      default: begin
        adc_mux_enable_4_0 <= 'd0;
        adc_mux_data_4_0 <= 'd0;
      end
    endcase
  end

  always @(posedge adc_clk) begin
     case (adc_enable)
      8'b01110101: begin
        adc_mux_enable_4_1 <= 1'b1;
        adc_mux_data_4_1[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_4_1[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_4_1[((16*2)+15):(16*2)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_4_1[((16*3)+15):(16*3)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_4_1[((16*4)+15):(16*4)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01110110: begin
        adc_mux_enable_4_1 <= 1'b1;
        adc_mux_data_4_1[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_4_1[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_4_1[((16*2)+15):(16*2)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_4_1[((16*3)+15):(16*3)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_4_1[((16*4)+15):(16*4)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01111001: begin
        adc_mux_enable_4_1 <= 1'b1;
        adc_mux_data_4_1[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_4_1[((16*1)+15):(16*1)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_4_1[((16*2)+15):(16*2)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_4_1[((16*3)+15):(16*3)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_4_1[((16*4)+15):(16*4)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01111010: begin
        adc_mux_enable_4_1 <= 1'b1;
        adc_mux_data_4_1[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_4_1[((16*1)+15):(16*1)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_4_1[((16*2)+15):(16*2)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_4_1[((16*3)+15):(16*3)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_4_1[((16*4)+15):(16*4)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01111100: begin
        adc_mux_enable_4_1 <= 1'b1;
        adc_mux_data_4_1[((16*0)+15):(16*0)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_4_1[((16*1)+15):(16*1)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_4_1[((16*2)+15):(16*2)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_4_1[((16*3)+15):(16*3)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_4_1[((16*4)+15):(16*4)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b10001111: begin
        adc_mux_enable_4_1 <= 1'b1;
        adc_mux_data_4_1[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_4_1[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_4_1[((16*2)+15):(16*2)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_4_1[((16*3)+15):(16*3)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_4_1[((16*4)+15):(16*4)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10010111: begin
        adc_mux_enable_4_1 <= 1'b1;
        adc_mux_data_4_1[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_4_1[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_4_1[((16*2)+15):(16*2)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_4_1[((16*3)+15):(16*3)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_4_1[((16*4)+15):(16*4)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10011011: begin
        adc_mux_enable_4_1 <= 1'b1;
        adc_mux_data_4_1[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_4_1[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_4_1[((16*2)+15):(16*2)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_4_1[((16*3)+15):(16*3)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_4_1[((16*4)+15):(16*4)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10011101: begin
        adc_mux_enable_4_1 <= 1'b1;
        adc_mux_data_4_1[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_4_1[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_4_1[((16*2)+15):(16*2)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_4_1[((16*3)+15):(16*3)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_4_1[((16*4)+15):(16*4)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10011110: begin
        adc_mux_enable_4_1 <= 1'b1;
        adc_mux_data_4_1[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_4_1[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_4_1[((16*2)+15):(16*2)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_4_1[((16*3)+15):(16*3)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_4_1[((16*4)+15):(16*4)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10100111: begin
        adc_mux_enable_4_1 <= 1'b1;
        adc_mux_data_4_1[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_4_1[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_4_1[((16*2)+15):(16*2)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_4_1[((16*3)+15):(16*3)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_4_1[((16*4)+15):(16*4)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10101011: begin
        adc_mux_enable_4_1 <= 1'b1;
        adc_mux_data_4_1[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_4_1[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_4_1[((16*2)+15):(16*2)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_4_1[((16*3)+15):(16*3)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_4_1[((16*4)+15):(16*4)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10101101: begin
        adc_mux_enable_4_1 <= 1'b1;
        adc_mux_data_4_1[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_4_1[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_4_1[((16*2)+15):(16*2)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_4_1[((16*3)+15):(16*3)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_4_1[((16*4)+15):(16*4)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10101110: begin
        adc_mux_enable_4_1 <= 1'b1;
        adc_mux_data_4_1[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_4_1[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_4_1[((16*2)+15):(16*2)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_4_1[((16*3)+15):(16*3)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_4_1[((16*4)+15):(16*4)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10110011: begin
        adc_mux_enable_4_1 <= 1'b1;
        adc_mux_data_4_1[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_4_1[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_4_1[((16*2)+15):(16*2)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_4_1[((16*3)+15):(16*3)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_4_1[((16*4)+15):(16*4)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10110101: begin
        adc_mux_enable_4_1 <= 1'b1;
        adc_mux_data_4_1[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_4_1[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_4_1[((16*2)+15):(16*2)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_4_1[((16*3)+15):(16*3)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_4_1[((16*4)+15):(16*4)] <= adc_data[((16*7)+15):(16*7)];
      end
      default: begin
        adc_mux_enable_4_1 <= 'd0;
        adc_mux_data_4_1 <= 'd0;
      end
    endcase
  end

  always @(posedge adc_clk) begin
     case (adc_enable)
      8'b10110110: begin
        adc_mux_enable_4_2 <= 1'b1;
        adc_mux_data_4_2[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_4_2[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_4_2[((16*2)+15):(16*2)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_4_2[((16*3)+15):(16*3)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_4_2[((16*4)+15):(16*4)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10111001: begin
        adc_mux_enable_4_2 <= 1'b1;
        adc_mux_data_4_2[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_4_2[((16*1)+15):(16*1)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_4_2[((16*2)+15):(16*2)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_4_2[((16*3)+15):(16*3)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_4_2[((16*4)+15):(16*4)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10111010: begin
        adc_mux_enable_4_2 <= 1'b1;
        adc_mux_data_4_2[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_4_2[((16*1)+15):(16*1)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_4_2[((16*2)+15):(16*2)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_4_2[((16*3)+15):(16*3)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_4_2[((16*4)+15):(16*4)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10111100: begin
        adc_mux_enable_4_2 <= 1'b1;
        adc_mux_data_4_2[((16*0)+15):(16*0)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_4_2[((16*1)+15):(16*1)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_4_2[((16*2)+15):(16*2)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_4_2[((16*3)+15):(16*3)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_4_2[((16*4)+15):(16*4)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11000111: begin
        adc_mux_enable_4_2 <= 1'b1;
        adc_mux_data_4_2[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_4_2[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_4_2[((16*2)+15):(16*2)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_4_2[((16*3)+15):(16*3)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_4_2[((16*4)+15):(16*4)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11001011: begin
        adc_mux_enable_4_2 <= 1'b1;
        adc_mux_data_4_2[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_4_2[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_4_2[((16*2)+15):(16*2)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_4_2[((16*3)+15):(16*3)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_4_2[((16*4)+15):(16*4)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11001101: begin
        adc_mux_enable_4_2 <= 1'b1;
        adc_mux_data_4_2[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_4_2[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_4_2[((16*2)+15):(16*2)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_4_2[((16*3)+15):(16*3)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_4_2[((16*4)+15):(16*4)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11001110: begin
        adc_mux_enable_4_2 <= 1'b1;
        adc_mux_data_4_2[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_4_2[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_4_2[((16*2)+15):(16*2)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_4_2[((16*3)+15):(16*3)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_4_2[((16*4)+15):(16*4)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11010011: begin
        adc_mux_enable_4_2 <= 1'b1;
        adc_mux_data_4_2[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_4_2[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_4_2[((16*2)+15):(16*2)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_4_2[((16*3)+15):(16*3)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_4_2[((16*4)+15):(16*4)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11010101: begin
        adc_mux_enable_4_2 <= 1'b1;
        adc_mux_data_4_2[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_4_2[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_4_2[((16*2)+15):(16*2)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_4_2[((16*3)+15):(16*3)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_4_2[((16*4)+15):(16*4)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11010110: begin
        adc_mux_enable_4_2 <= 1'b1;
        adc_mux_data_4_2[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_4_2[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_4_2[((16*2)+15):(16*2)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_4_2[((16*3)+15):(16*3)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_4_2[((16*4)+15):(16*4)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11011001: begin
        adc_mux_enable_4_2 <= 1'b1;
        adc_mux_data_4_2[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_4_2[((16*1)+15):(16*1)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_4_2[((16*2)+15):(16*2)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_4_2[((16*3)+15):(16*3)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_4_2[((16*4)+15):(16*4)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11011010: begin
        adc_mux_enable_4_2 <= 1'b1;
        adc_mux_data_4_2[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_4_2[((16*1)+15):(16*1)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_4_2[((16*2)+15):(16*2)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_4_2[((16*3)+15):(16*3)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_4_2[((16*4)+15):(16*4)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11011100: begin
        adc_mux_enable_4_2 <= 1'b1;
        adc_mux_data_4_2[((16*0)+15):(16*0)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_4_2[((16*1)+15):(16*1)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_4_2[((16*2)+15):(16*2)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_4_2[((16*3)+15):(16*3)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_4_2[((16*4)+15):(16*4)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11100011: begin
        adc_mux_enable_4_2 <= 1'b1;
        adc_mux_data_4_2[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_4_2[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_4_2[((16*2)+15):(16*2)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_4_2[((16*3)+15):(16*3)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_4_2[((16*4)+15):(16*4)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11100101: begin
        adc_mux_enable_4_2 <= 1'b1;
        adc_mux_data_4_2[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_4_2[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_4_2[((16*2)+15):(16*2)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_4_2[((16*3)+15):(16*3)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_4_2[((16*4)+15):(16*4)] <= adc_data[((16*7)+15):(16*7)];
      end
      default: begin
        adc_mux_enable_4_2 <= 'd0;
        adc_mux_data_4_2 <= 'd0;
      end
    endcase
  end

  always @(posedge adc_clk) begin
     case (adc_enable)
      8'b11100110: begin
        adc_mux_enable_4_3 <= 1'b1;
        adc_mux_data_4_3[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_4_3[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_4_3[((16*2)+15):(16*2)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_4_3[((16*3)+15):(16*3)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_4_3[((16*4)+15):(16*4)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11101001: begin
        adc_mux_enable_4_3 <= 1'b1;
        adc_mux_data_4_3[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_4_3[((16*1)+15):(16*1)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_4_3[((16*2)+15):(16*2)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_4_3[((16*3)+15):(16*3)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_4_3[((16*4)+15):(16*4)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11101010: begin
        adc_mux_enable_4_3 <= 1'b1;
        adc_mux_data_4_3[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_4_3[((16*1)+15):(16*1)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_4_3[((16*2)+15):(16*2)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_4_3[((16*3)+15):(16*3)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_4_3[((16*4)+15):(16*4)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11101100: begin
        adc_mux_enable_4_3 <= 1'b1;
        adc_mux_data_4_3[((16*0)+15):(16*0)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_4_3[((16*1)+15):(16*1)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_4_3[((16*2)+15):(16*2)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_4_3[((16*3)+15):(16*3)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_4_3[((16*4)+15):(16*4)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11110001: begin
        adc_mux_enable_4_3 <= 1'b1;
        adc_mux_data_4_3[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_4_3[((16*1)+15):(16*1)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_4_3[((16*2)+15):(16*2)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_4_3[((16*3)+15):(16*3)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_4_3[((16*4)+15):(16*4)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11110010: begin
        adc_mux_enable_4_3 <= 1'b1;
        adc_mux_data_4_3[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_4_3[((16*1)+15):(16*1)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_4_3[((16*2)+15):(16*2)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_4_3[((16*3)+15):(16*3)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_4_3[((16*4)+15):(16*4)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11110100: begin
        adc_mux_enable_4_3 <= 1'b1;
        adc_mux_data_4_3[((16*0)+15):(16*0)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_4_3[((16*1)+15):(16*1)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_4_3[((16*2)+15):(16*2)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_4_3[((16*3)+15):(16*3)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_4_3[((16*4)+15):(16*4)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11111000: begin
        adc_mux_enable_4_3 <= 1'b1;
        adc_mux_data_4_3[((16*0)+15):(16*0)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_4_3[((16*1)+15):(16*1)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_4_3[((16*2)+15):(16*2)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_4_3[((16*3)+15):(16*3)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_4_3[((16*4)+15):(16*4)] <= adc_data[((16*7)+15):(16*7)];
      end
      default: begin
        adc_mux_enable_4_3 <= 'd0;
        adc_mux_data_4_3 <= 'd0;
      end
    endcase
  end

  // 6 channel(s)

  always @(posedge adc_clk) begin
     case (adc_enable)
      8'b00111111: begin
        adc_mux_enable_5_0 <= 1'b1;
        adc_mux_data_5_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_5_0[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_5_0[((16*2)+15):(16*2)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_5_0[((16*3)+15):(16*3)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_5_0[((16*4)+15):(16*4)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_5_0[((16*5)+15):(16*5)] <= adc_data[((16*5)+15):(16*5)];
      end
      8'b01011111: begin
        adc_mux_enable_5_0 <= 1'b1;
        adc_mux_data_5_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_5_0[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_5_0[((16*2)+15):(16*2)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_5_0[((16*3)+15):(16*3)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_5_0[((16*4)+15):(16*4)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_5_0[((16*5)+15):(16*5)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01101111: begin
        adc_mux_enable_5_0 <= 1'b1;
        adc_mux_data_5_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_5_0[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_5_0[((16*2)+15):(16*2)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_5_0[((16*3)+15):(16*3)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_5_0[((16*4)+15):(16*4)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_5_0[((16*5)+15):(16*5)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01110111: begin
        adc_mux_enable_5_0 <= 1'b1;
        adc_mux_data_5_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_5_0[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_5_0[((16*2)+15):(16*2)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_5_0[((16*3)+15):(16*3)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_5_0[((16*4)+15):(16*4)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_5_0[((16*5)+15):(16*5)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01111011: begin
        adc_mux_enable_5_0 <= 1'b1;
        adc_mux_data_5_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_5_0[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_5_0[((16*2)+15):(16*2)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_5_0[((16*3)+15):(16*3)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_5_0[((16*4)+15):(16*4)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_5_0[((16*5)+15):(16*5)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01111101: begin
        adc_mux_enable_5_0 <= 1'b1;
        adc_mux_data_5_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_5_0[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_5_0[((16*2)+15):(16*2)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_5_0[((16*3)+15):(16*3)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_5_0[((16*4)+15):(16*4)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_5_0[((16*5)+15):(16*5)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b01111110: begin
        adc_mux_enable_5_0 <= 1'b1;
        adc_mux_data_5_0[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_5_0[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_5_0[((16*2)+15):(16*2)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_5_0[((16*3)+15):(16*3)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_5_0[((16*4)+15):(16*4)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_5_0[((16*5)+15):(16*5)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b10011111: begin
        adc_mux_enable_5_0 <= 1'b1;
        adc_mux_data_5_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_5_0[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_5_0[((16*2)+15):(16*2)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_5_0[((16*3)+15):(16*3)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_5_0[((16*4)+15):(16*4)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_5_0[((16*5)+15):(16*5)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10101111: begin
        adc_mux_enable_5_0 <= 1'b1;
        adc_mux_data_5_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_5_0[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_5_0[((16*2)+15):(16*2)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_5_0[((16*3)+15):(16*3)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_5_0[((16*4)+15):(16*4)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_5_0[((16*5)+15):(16*5)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10110111: begin
        adc_mux_enable_5_0 <= 1'b1;
        adc_mux_data_5_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_5_0[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_5_0[((16*2)+15):(16*2)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_5_0[((16*3)+15):(16*3)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_5_0[((16*4)+15):(16*4)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_5_0[((16*5)+15):(16*5)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10111011: begin
        adc_mux_enable_5_0 <= 1'b1;
        adc_mux_data_5_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_5_0[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_5_0[((16*2)+15):(16*2)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_5_0[((16*3)+15):(16*3)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_5_0[((16*4)+15):(16*4)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_5_0[((16*5)+15):(16*5)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10111101: begin
        adc_mux_enable_5_0 <= 1'b1;
        adc_mux_data_5_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_5_0[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_5_0[((16*2)+15):(16*2)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_5_0[((16*3)+15):(16*3)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_5_0[((16*4)+15):(16*4)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_5_0[((16*5)+15):(16*5)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b10111110: begin
        adc_mux_enable_5_0 <= 1'b1;
        adc_mux_data_5_0[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_5_0[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_5_0[((16*2)+15):(16*2)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_5_0[((16*3)+15):(16*3)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_5_0[((16*4)+15):(16*4)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_5_0[((16*5)+15):(16*5)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11001111: begin
        adc_mux_enable_5_0 <= 1'b1;
        adc_mux_data_5_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_5_0[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_5_0[((16*2)+15):(16*2)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_5_0[((16*3)+15):(16*3)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_5_0[((16*4)+15):(16*4)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_5_0[((16*5)+15):(16*5)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11010111: begin
        adc_mux_enable_5_0 <= 1'b1;
        adc_mux_data_5_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_5_0[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_5_0[((16*2)+15):(16*2)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_5_0[((16*3)+15):(16*3)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_5_0[((16*4)+15):(16*4)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_5_0[((16*5)+15):(16*5)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11011011: begin
        adc_mux_enable_5_0 <= 1'b1;
        adc_mux_data_5_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_5_0[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_5_0[((16*2)+15):(16*2)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_5_0[((16*3)+15):(16*3)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_5_0[((16*4)+15):(16*4)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_5_0[((16*5)+15):(16*5)] <= adc_data[((16*7)+15):(16*7)];
      end
      default: begin
        adc_mux_enable_5_0 <= 'd0;
        adc_mux_data_5_0 <= 'd0;
      end
    endcase
  end

  always @(posedge adc_clk) begin
     case (adc_enable)
      8'b11011101: begin
        adc_mux_enable_5_1 <= 1'b1;
        adc_mux_data_5_1[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_5_1[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_5_1[((16*2)+15):(16*2)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_5_1[((16*3)+15):(16*3)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_5_1[((16*4)+15):(16*4)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_5_1[((16*5)+15):(16*5)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11011110: begin
        adc_mux_enable_5_1 <= 1'b1;
        adc_mux_data_5_1[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_5_1[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_5_1[((16*2)+15):(16*2)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_5_1[((16*3)+15):(16*3)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_5_1[((16*4)+15):(16*4)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_5_1[((16*5)+15):(16*5)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11100111: begin
        adc_mux_enable_5_1 <= 1'b1;
        adc_mux_data_5_1[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_5_1[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_5_1[((16*2)+15):(16*2)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_5_1[((16*3)+15):(16*3)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_5_1[((16*4)+15):(16*4)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_5_1[((16*5)+15):(16*5)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11101011: begin
        adc_mux_enable_5_1 <= 1'b1;
        adc_mux_data_5_1[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_5_1[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_5_1[((16*2)+15):(16*2)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_5_1[((16*3)+15):(16*3)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_5_1[((16*4)+15):(16*4)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_5_1[((16*5)+15):(16*5)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11101101: begin
        adc_mux_enable_5_1 <= 1'b1;
        adc_mux_data_5_1[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_5_1[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_5_1[((16*2)+15):(16*2)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_5_1[((16*3)+15):(16*3)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_5_1[((16*4)+15):(16*4)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_5_1[((16*5)+15):(16*5)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11101110: begin
        adc_mux_enable_5_1 <= 1'b1;
        adc_mux_data_5_1[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_5_1[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_5_1[((16*2)+15):(16*2)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_5_1[((16*3)+15):(16*3)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_5_1[((16*4)+15):(16*4)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_5_1[((16*5)+15):(16*5)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11110011: begin
        adc_mux_enable_5_1 <= 1'b1;
        adc_mux_data_5_1[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_5_1[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_5_1[((16*2)+15):(16*2)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_5_1[((16*3)+15):(16*3)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_5_1[((16*4)+15):(16*4)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_5_1[((16*5)+15):(16*5)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11110101: begin
        adc_mux_enable_5_1 <= 1'b1;
        adc_mux_data_5_1[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_5_1[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_5_1[((16*2)+15):(16*2)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_5_1[((16*3)+15):(16*3)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_5_1[((16*4)+15):(16*4)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_5_1[((16*5)+15):(16*5)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11110110: begin
        adc_mux_enable_5_1 <= 1'b1;
        adc_mux_data_5_1[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_5_1[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_5_1[((16*2)+15):(16*2)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_5_1[((16*3)+15):(16*3)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_5_1[((16*4)+15):(16*4)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_5_1[((16*5)+15):(16*5)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11111001: begin
        adc_mux_enable_5_1 <= 1'b1;
        adc_mux_data_5_1[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_5_1[((16*1)+15):(16*1)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_5_1[((16*2)+15):(16*2)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_5_1[((16*3)+15):(16*3)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_5_1[((16*4)+15):(16*4)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_5_1[((16*5)+15):(16*5)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11111010: begin
        adc_mux_enable_5_1 <= 1'b1;
        adc_mux_data_5_1[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_5_1[((16*1)+15):(16*1)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_5_1[((16*2)+15):(16*2)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_5_1[((16*3)+15):(16*3)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_5_1[((16*4)+15):(16*4)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_5_1[((16*5)+15):(16*5)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11111100: begin
        adc_mux_enable_5_1 <= 1'b1;
        adc_mux_data_5_1[((16*0)+15):(16*0)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_5_1[((16*1)+15):(16*1)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_5_1[((16*2)+15):(16*2)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_5_1[((16*3)+15):(16*3)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_5_1[((16*4)+15):(16*4)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_5_1[((16*5)+15):(16*5)] <= adc_data[((16*7)+15):(16*7)];
      end
      default: begin
        adc_mux_enable_5_1 <= 'd0;
        adc_mux_data_5_1 <= 'd0;
      end
    endcase
  end

  // 7 channel(s)

  always @(posedge adc_clk) begin
     case (adc_enable)
      8'b01111111: begin
        adc_mux_enable_6_0 <= 1'b1;
        adc_mux_data_6_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_6_0[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_6_0[((16*2)+15):(16*2)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_6_0[((16*3)+15):(16*3)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_6_0[((16*4)+15):(16*4)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_6_0[((16*5)+15):(16*5)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_6_0[((16*6)+15):(16*6)] <= adc_data[((16*6)+15):(16*6)];
      end
      8'b10111111: begin
        adc_mux_enable_6_0 <= 1'b1;
        adc_mux_data_6_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_6_0[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_6_0[((16*2)+15):(16*2)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_6_0[((16*3)+15):(16*3)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_6_0[((16*4)+15):(16*4)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_6_0[((16*5)+15):(16*5)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_6_0[((16*6)+15):(16*6)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11011111: begin
        adc_mux_enable_6_0 <= 1'b1;
        adc_mux_data_6_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_6_0[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_6_0[((16*2)+15):(16*2)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_6_0[((16*3)+15):(16*3)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_6_0[((16*4)+15):(16*4)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_6_0[((16*5)+15):(16*5)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_6_0[((16*6)+15):(16*6)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11101111: begin
        adc_mux_enable_6_0 <= 1'b1;
        adc_mux_data_6_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_6_0[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_6_0[((16*2)+15):(16*2)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_6_0[((16*3)+15):(16*3)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_6_0[((16*4)+15):(16*4)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_6_0[((16*5)+15):(16*5)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_6_0[((16*6)+15):(16*6)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11110111: begin
        adc_mux_enable_6_0 <= 1'b1;
        adc_mux_data_6_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_6_0[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_6_0[((16*2)+15):(16*2)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_6_0[((16*3)+15):(16*3)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_6_0[((16*4)+15):(16*4)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_6_0[((16*5)+15):(16*5)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_6_0[((16*6)+15):(16*6)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11111011: begin
        adc_mux_enable_6_0 <= 1'b1;
        adc_mux_data_6_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_6_0[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_6_0[((16*2)+15):(16*2)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_6_0[((16*3)+15):(16*3)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_6_0[((16*4)+15):(16*4)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_6_0[((16*5)+15):(16*5)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_6_0[((16*6)+15):(16*6)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11111101: begin
        adc_mux_enable_6_0 <= 1'b1;
        adc_mux_data_6_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_6_0[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_6_0[((16*2)+15):(16*2)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_6_0[((16*3)+15):(16*3)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_6_0[((16*4)+15):(16*4)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_6_0[((16*5)+15):(16*5)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_6_0[((16*6)+15):(16*6)] <= adc_data[((16*7)+15):(16*7)];
      end
      8'b11111110: begin
        adc_mux_enable_6_0 <= 1'b1;
        adc_mux_data_6_0[((16*0)+15):(16*0)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_6_0[((16*1)+15):(16*1)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_6_0[((16*2)+15):(16*2)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_6_0[((16*3)+15):(16*3)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_6_0[((16*4)+15):(16*4)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_6_0[((16*5)+15):(16*5)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_6_0[((16*6)+15):(16*6)] <= adc_data[((16*7)+15):(16*7)];
      end
      default: begin
        adc_mux_enable_6_0 <= 'd0;
        adc_mux_data_6_0 <= 'd0;
      end
    endcase
  end

  // 8 channel(s)

  always @(posedge adc_clk) begin
     case (adc_enable)
      8'b11111111: begin
        adc_mux_enable_7_0 <= 1'b1;
        adc_mux_data_7_0[((16*0)+15):(16*0)] <= adc_data[((16*0)+15):(16*0)];
        adc_mux_data_7_0[((16*1)+15):(16*1)] <= adc_data[((16*1)+15):(16*1)];
        adc_mux_data_7_0[((16*2)+15):(16*2)] <= adc_data[((16*2)+15):(16*2)];
        adc_mux_data_7_0[((16*3)+15):(16*3)] <= adc_data[((16*3)+15):(16*3)];
        adc_mux_data_7_0[((16*4)+15):(16*4)] <= adc_data[((16*4)+15):(16*4)];
        adc_mux_data_7_0[((16*5)+15):(16*5)] <= adc_data[((16*5)+15):(16*5)];
        adc_mux_data_7_0[((16*6)+15):(16*6)] <= adc_data[((16*6)+15):(16*6)];
        adc_mux_data_7_0[((16*7)+15):(16*7)] <= adc_data[((16*7)+15):(16*7)];
      end
      default: begin
        adc_mux_enable_7_0 <= 'd0;
        adc_mux_data_7_0 <= 'd0;
      end
    endcase
  end

endmodule

// ***************************************************************************
// ***************************************************************************
