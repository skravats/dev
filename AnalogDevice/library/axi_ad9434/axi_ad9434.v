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

module axi_ad9434 #(

  parameter ID = 0,
  
  // set to 0 for Xilinx 7 Series or 1 for 6 Series
  parameter DEVICE_TYPE = 0,
  parameter IO_DELAY_GROUP = "dev_if_delay_group") (

  // physical interface
  input                   adc_clk_in_p,
  input                   adc_clk_in_n,
  input       [11:0]      adc_data_in_p,
  input       [11:0]      adc_data_in_n,
  input                   adc_or_in_p,
  input                   adc_or_in_n,

  // delay interface
  input                   delay_clk,

  // dma interface
  output                  adc_clk,
  output                  adc_enable,
  output                  adc_valid,
  output      [63:0]      adc_data,
  input                   adc_dovf,

  // axi interface
  input                   s_axi_aclk,
  input                   s_axi_aresetn,
  input                   s_axi_awvalid,
  input       [15:0]      s_axi_awaddr,
  output                  s_axi_awready,
  input                   s_axi_wvalid,
  input       [31:0]      s_axi_wdata,
  input       [ 3:0]      s_axi_wstrb,
  output                  s_axi_wready,
  output                  s_axi_bvalid,
  output      [ 1:0]      s_axi_bresp,
  input                   s_axi_bready,
  input                   s_axi_arvalid,
  input       [15:0]      s_axi_araddr,
  output                  s_axi_arready,
  output                  s_axi_rvalid,
  output      [ 1:0]      s_axi_rresp,
  output      [31:0]      s_axi_rdata,
  input                   s_axi_rready,
  input       [ 2:0]      s_axi_awprot,
  input       [ 2:0]      s_axi_arprot);

  // internal clocks & resets
  wire            adc_rst;
  wire            up_rstn;
  wire            mmcm_rst;
  wire            up_clk;

  // internal signals
  wire            up_wreq_s;
  wire            up_rreq_s;
  wire    [13:0]  up_waddr_s;
  wire    [13:0]  up_raddr_s;
  wire    [31:0]  up_wdata_s;
  wire    [31:0]  up_rdata_s;
  wire            up_wack_s;
  wire            up_rack_s;

  wire    [ 1:0]  up_status_pn_err_s;
  wire    [ 1:0]  up_status_pn_oos_s;
  wire    [ 1:0]  up_status_or_s;
  wire            adc_status_s;

  wire    [12:0]  up_dld_s;
  wire    [64:0]  up_dwdata_s;
  wire    [64:0]  up_drdata_s;
  wire            delay_clk_s;
  wire            delay_rst;
  wire            delay_locked_s;

  wire            up_drp_sel_s;
  wire            up_drp_wr_s;
  wire    [11:0]  up_drp_addr_s;
  wire    [31:0]  up_drp_wdata_s;
  wire    [31:0]  up_drp_rdata_s;
  wire            up_drp_ready_s;
  wire            up_drp_locked_s;

  wire    [47:0]  adc_data_if_s;
  wire            adc_or_if_s;

  // clock/reset assignments
  assign up_clk  = s_axi_aclk;
  assign up_rstn = s_axi_aresetn;

  axi_ad9434_if #(
    .DEVICE_TYPE(DEVICE_TYPE),
    .IO_DELAY_GROUP(IO_DELAY_GROUP))
  i_if(
    .adc_clk_in_p(adc_clk_in_p),
    .adc_clk_in_n(adc_clk_in_n),
    .adc_data_in_p(adc_data_in_p),
    .adc_data_in_n(adc_data_in_n),
    .adc_or_in_p(adc_or_in_p),
    .adc_or_in_n(adc_or_in_n),
    .adc_data(adc_data_if_s),
    .adc_or(adc_or_if_s),
    .adc_clk(adc_clk),
    .adc_rst(adc_rst),
    .adc_status(adc_status_s),
    .up_clk (up_clk),
    .up_adc_dld (up_dld_s),
    .up_adc_dwdata (up_dwdata_s),
    .up_adc_drdata (up_drdata_s),
    .delay_clk (delay_clk),
    .delay_rst (delay_rst),
    .delay_locked (delay_locked_s),
    .mmcm_rst(mmcm_rst),
    .up_rstn(up_rstn),
    .up_drp_sel(up_drp_sel_s),
    .up_drp_wr(up_drp_wr_s),
    .up_drp_addr(up_drp_addr_s),
    .up_drp_wdata(up_drp_wdata_s),
    .up_drp_rdata(up_drp_rdata_s),
    .up_drp_ready(up_drp_ready_s),
    .up_drp_locked(up_drp_locked_s));

  // common processor control
  axi_ad9434_core #(.ID(ID))
  i_core (
    .adc_clk(adc_clk),
    .adc_data(adc_data_if_s),
    .adc_or(adc_or_if_s),
    .mmcm_rst (mmcm_rst),
    .adc_rst (adc_rst),
    .adc_enable(adc_enable),
    .adc_status (adc_status_s),
    .dma_dvalid (adc_valid),
    .dma_data (adc_data),
    .dma_dovf (adc_dovf),
    .up_dld (up_dld_s),
    .up_dwdata (up_dwdata_s),
    .up_drdata (up_drdata_s),
    .delay_clk (delay_clk),
    .delay_rst (delay_rst),
    .delay_locked (delay_locked_s),
    .up_drp_sel (up_drp_sel_s),
    .up_drp_wr (up_drp_wr_s),
    .up_drp_addr (up_drp_addr_s),
    .up_drp_wdata (up_drp_wdata_s),
    .up_drp_rdata (up_drp_rdata_s),
    .up_drp_ready (up_drp_ready_s),
    .up_drp_locked (up_drp_locked_s),
    .up_rstn (up_rstn),
    .up_clk (up_clk),
    .up_wreq (up_wreq_s),
    .up_waddr (up_waddr_s),
    .up_wdata (up_wdata_s),
    .up_wack (up_wack_s),
    .up_rreq (up_rreq_s),
    .up_raddr (up_raddr_s),
    .up_rdata (up_rdata_s),
    .up_rack (up_rack_s));

  // up bus interface
  up_axi i_up_axi (
    .up_rstn (up_rstn),
    .up_clk (up_clk),
    .up_axi_awvalid (s_axi_awvalid),
    .up_axi_awaddr (s_axi_awaddr),
    .up_axi_awready (s_axi_awready),
    .up_axi_wvalid (s_axi_wvalid),
    .up_axi_wdata (s_axi_wdata),
    .up_axi_wstrb (s_axi_wstrb),
    .up_axi_wready (s_axi_wready),
    .up_axi_bvalid (s_axi_bvalid),
    .up_axi_bresp (s_axi_bresp),
    .up_axi_bready (s_axi_bready),
    .up_axi_arvalid (s_axi_arvalid),
    .up_axi_araddr (s_axi_araddr),
    .up_axi_arready (s_axi_arready),
    .up_axi_rvalid (s_axi_rvalid),
    .up_axi_rresp (s_axi_rresp),
    .up_axi_rdata (s_axi_rdata),
    .up_axi_rready (s_axi_rready),
    .up_wreq (up_wreq_s),
    .up_waddr (up_waddr_s),
    .up_wdata (up_wdata_s),
    .up_rdata (up_rdata_s),
    .up_wack (up_wack_s),
    .up_raddr (up_raddr_s),
    .up_rreq (up_rreq_s),
    .up_rack (up_rack_s));

endmodule
