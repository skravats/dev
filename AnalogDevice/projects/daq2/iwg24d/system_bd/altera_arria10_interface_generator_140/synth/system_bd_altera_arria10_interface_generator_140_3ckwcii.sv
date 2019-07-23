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


module system_bd_altera_arria10_interface_generator_140_3ckwcii(
// h2f_reset
  output wire [1 - 1 : 0 ] h2f_rst_n
// f2h_cold_reset_req
 ,input wire [1 - 1 : 0 ] f2h_cold_rst_req_n
// h2f_user0_clock
 ,output wire [1 - 1 : 0 ] s2f_user0_clk
// emif
 ,input wire [4096 - 1 : 0 ] emif_emif_to_hps
 ,output wire [4096 - 1 : 0 ] emif_hps_to_emif
 ,input wire [1 - 1 : 0 ] emif_emif_to_gp
 ,output wire [2 - 1 : 0 ] emif_gp_to_emif
// h2f_lw_axi_clock
 ,input wire [1 - 1 : 0 ] h2f_lw_axi_clk
// h2f_lw_axi_reset
 ,input wire [1 - 1 : 0 ] h2f_lw_axi_rst
// h2f_lw_axi_master
 ,output wire [4 - 1 : 0 ] h2f_lw_AWID
 ,output wire [21 - 1 : 0 ] h2f_lw_AWADDR
 ,output wire [4 - 1 : 0 ] h2f_lw_AWLEN
 ,output wire [3 - 1 : 0 ] h2f_lw_AWSIZE
 ,output wire [2 - 1 : 0 ] h2f_lw_AWBURST
 ,output wire [2 - 1 : 0 ] h2f_lw_AWLOCK
 ,output wire [4 - 1 : 0 ] h2f_lw_AWCACHE
 ,output wire [3 - 1 : 0 ] h2f_lw_AWPROT
 ,output wire [1 - 1 : 0 ] h2f_lw_AWVALID
 ,input wire [1 - 1 : 0 ] h2f_lw_AWREADY
 ,output wire [5 - 1 : 0 ] h2f_lw_AWUSER
 ,output wire [4 - 1 : 0 ] h2f_lw_WID
 ,output wire [32 - 1 : 0 ] h2f_lw_WDATA
 ,output wire [4 - 1 : 0 ] h2f_lw_WSTRB
 ,output wire [1 - 1 : 0 ] h2f_lw_WLAST
 ,output wire [1 - 1 : 0 ] h2f_lw_WVALID
 ,input wire [1 - 1 : 0 ] h2f_lw_WREADY
 ,input wire [4 - 1 : 0 ] h2f_lw_BID
 ,input wire [2 - 1 : 0 ] h2f_lw_BRESP
 ,input wire [1 - 1 : 0 ] h2f_lw_BVALID
 ,output wire [1 - 1 : 0 ] h2f_lw_BREADY
 ,output wire [4 - 1 : 0 ] h2f_lw_ARID
 ,output wire [21 - 1 : 0 ] h2f_lw_ARADDR
 ,output wire [4 - 1 : 0 ] h2f_lw_ARLEN
 ,output wire [3 - 1 : 0 ] h2f_lw_ARSIZE
 ,output wire [2 - 1 : 0 ] h2f_lw_ARBURST
 ,output wire [2 - 1 : 0 ] h2f_lw_ARLOCK
 ,output wire [4 - 1 : 0 ] h2f_lw_ARCACHE
 ,output wire [3 - 1 : 0 ] h2f_lw_ARPROT
 ,output wire [1 - 1 : 0 ] h2f_lw_ARVALID
 ,input wire [1 - 1 : 0 ] h2f_lw_ARREADY
 ,output wire [5 - 1 : 0 ] h2f_lw_ARUSER
 ,input wire [4 - 1 : 0 ] h2f_lw_RID
 ,input wire [32 - 1 : 0 ] h2f_lw_RDATA
 ,input wire [2 - 1 : 0 ] h2f_lw_RRESP
 ,input wire [1 - 1 : 0 ] h2f_lw_RLAST
 ,input wire [1 - 1 : 0 ] h2f_lw_RVALID
 ,output wire [1 - 1 : 0 ] h2f_lw_RREADY
// f2sdram0_clock
 ,input wire [1 - 1 : 0 ] f2sdram0_clk
// f2sdram0_reset
 ,input wire [1 - 1 : 0 ] f2s_sdram0_rst
// f2sdram0_data
 ,input wire [32 - 1 : 0 ] f2sdram0_ARADDR
 ,input wire [2 - 1 : 0 ] f2sdram0_ARBURST
 ,input wire [4 - 1 : 0 ] f2sdram0_ARCACHE
 ,input wire [4 - 1 : 0 ] f2sdram0_ARID
 ,input wire [4 - 1 : 0 ] f2sdram0_ARLEN
 ,input wire [2 - 1 : 0 ] f2sdram0_ARLOCK
 ,input wire [3 - 1 : 0 ] f2sdram0_ARPROT
 ,output wire [1 - 1 : 0 ] f2sdram0_ARREADY
 ,input wire [3 - 1 : 0 ] f2sdram0_ARSIZE
 ,input wire [5 - 1 : 0 ] f2sdram0_ARUSER
 ,input wire [1 - 1 : 0 ] f2sdram0_ARVALID
 ,input wire [32 - 1 : 0 ] f2sdram0_AWADDR
 ,input wire [2 - 1 : 0 ] f2sdram0_AWBURST
 ,input wire [4 - 1 : 0 ] f2sdram0_AWCACHE
 ,input wire [4 - 1 : 0 ] f2sdram0_AWID
 ,input wire [4 - 1 : 0 ] f2sdram0_AWLEN
 ,input wire [2 - 1 : 0 ] f2sdram0_AWLOCK
 ,input wire [3 - 1 : 0 ] f2sdram0_AWPROT
 ,output wire [1 - 1 : 0 ] f2sdram0_AWREADY
 ,input wire [3 - 1 : 0 ] f2sdram0_AWSIZE
 ,input wire [5 - 1 : 0 ] f2sdram0_AWUSER
 ,input wire [1 - 1 : 0 ] f2sdram0_AWVALID
 ,input wire [128 - 1 : 0 ] f2sdram0_WDATA
 ,input wire [4 - 1 : 0 ] f2sdram0_WID
 ,input wire [1 - 1 : 0 ] f2sdram0_WLAST
 ,output wire [1 - 1 : 0 ] f2sdram0_WREADY
 ,input wire [16 - 1 : 0 ] f2sdram0_WSTRB
 ,input wire [1 - 1 : 0 ] f2sdram0_WVALID
 ,output wire [4 - 1 : 0 ] f2sdram0_BID
 ,input wire [1 - 1 : 0 ] f2sdram0_BREADY
 ,output wire [2 - 1 : 0 ] f2sdram0_BRESP
 ,output wire [1 - 1 : 0 ] f2sdram0_BVALID
 ,output wire [128 - 1 : 0 ] f2sdram0_RDATA
 ,output wire [4 - 1 : 0 ] f2sdram0_RID
 ,output wire [1 - 1 : 0 ] f2sdram0_RLAST
 ,input wire [1 - 1 : 0 ] f2sdram0_RREADY
 ,output wire [2 - 1 : 0 ] f2sdram0_RRESP
 ,output wire [1 - 1 : 0 ] f2sdram0_RVALID
// f2h_irq0
 ,input wire [32 - 1 : 0 ] f2h_irq_p0
// f2h_irq1
 ,input wire [32 - 1 : 0 ] f2h_irq_p1
// i2c1_scl_in
 ,input wire [1 - 1 : 0 ] i2c1_scl_i
// i2c1_clk
 ,output wire [1 - 1 : 0 ] i2c1_scl_oe
// i2c1
 ,input wire [1 - 1 : 0 ] i2c1_sda_i
 ,output wire [1 - 1 : 0 ] i2c1_sda_oe
);


wire [14 - 1 : 0] intermediate;
assign intermediate[1:1] = intermediate[0:0];
assign intermediate[2:2] = intermediate[0:0];
assign intermediate[3:3] = intermediate[0:0];
assign intermediate[4:4] = intermediate[0:0];
assign intermediate[5:5] = intermediate[0:0];
assign intermediate[6:6] = intermediate[0:0];
assign intermediate[8:8] = intermediate[7:7];
assign intermediate[9:9] = intermediate[7:7];
assign intermediate[10:10] = intermediate[7:7];
assign intermediate[11:11] = intermediate[7:7];
assign intermediate[12:12] = intermediate[7:7];
assign intermediate[13:13] = intermediate[7:7];
assign intermediate[0:0] = h2f_lw_axi_clk[0:0];
assign intermediate[7:7] = f2sdram0_clk[0:0];

twentynm_hps_interface_clocks_resets clocks_resets(
 .f2s_cold_rst_req_n({
    f2h_cold_rst_req_n[0:0] // 0:0
  })
,.f2s_pending_rst_ack({
    1'b1 // 0:0
  })
,.s2f_user3_clk({
    h2f_rst_n[0:0] // 0:0
  })
,.f2s_free_clk({
    1'b0 // 0:0
  })
,.f2s_warm_rst_req_n({
    1'b1 // 0:0
  })
,.s2f_user0_clk({
    s2f_user0_clk[0:0] // 0:0
  })
,.f2s_dbg_rst_req_n({
    1'b1 // 0:0
  })
);


twentynm_hps_interface_dbg_apb debug_apb(
 .F2S_PCLKENDBG({
    1'b0 // 0:0
  })
,.F2S_DBGAPB_DISABLE({
    1'b0 // 0:0
  })
);


twentynm_hps_interface_boot_from_fpga boot_from_fpga(
 .f2s_bsel({
    3'b001 // 2:0
  })
,.f2s_boot_from_fpga_on_failure({
    1'b0 // 0:0
  })
,.f2s_boot_from_fpga_ready({
    1'b0 // 0:0
  })
,.f2s_bsel_en({
    1'b0 // 0:0
  })
);


a10_hps_emif_interface emif_interface(
 .hps_to_emif({
    emif_hps_to_emif[4095:0] // 4095:0
  })
,.emif_to_hps({
    emif_emif_to_hps[4095:0] // 4095:0
  })
);


twentynm_hps_rl_interface_fpga2hps fpga2hps(
 .port_size_config_1({
    1'b0 // 0:0
  })
,.port_size_config_2({
    1'b0 // 0:0
  })
,.port_size_config_3({
    1'b0 // 0:0
  })
,.port_size_config_0({
    1'b0 // 0:0
  })
);


twentynm_hps_rl_interface_hps2fpga_light_weight hps2fpga_light_weight(
 .aw_lock({
    h2f_lw_AWLOCK[1:0] // 1:0
  })
,.aw_clk({
    intermediate[6:6] // 0:0
  })
,.ar_user({
    h2f_lw_ARUSER[4:0] // 4:0
  })
,.w_strb({
    h2f_lw_WSTRB[3:0] // 3:0
  })
,.ar_valid({
    h2f_lw_ARVALID[0:0] // 0:0
  })
,.ar_burst({
    h2f_lw_ARBURST[1:0] // 1:0
  })
,.aw_size({
    h2f_lw_AWSIZE[2:0] // 2:0
  })
,.aw_addr({
    h2f_lw_AWADDR[20:0] // 20:0
  })
,.port_size_config_0({
    1'b1 // 0:0
  })
,.w_id({
    h2f_lw_WID[3:0] // 3:0
  })
,.r_clk({
    intermediate[5:5] // 0:0
  })
,.ar_lock({
    h2f_lw_ARLOCK[1:0] // 1:0
  })
,.r_resp({
    h2f_lw_RRESP[1:0] // 1:0
  })
,.b_clk({
    intermediate[3:3] // 0:0
  })
,.aw_cache({
    h2f_lw_AWCACHE[3:0] // 3:0
  })
,.b_resp({
    h2f_lw_BRESP[1:0] // 1:0
  })
,.aw_ready({
    h2f_lw_AWREADY[0:0] // 0:0
  })
,.aw_id({
    h2f_lw_AWID[3:0] // 3:0
  })
,.port_size_config_1({
    1'b0 // 0:0
  })
,.ar_addr({
    h2f_lw_ARADDR[20:0] // 20:0
  })
,.ar_size({
    h2f_lw_ARSIZE[2:0] // 2:0
  })
,.r_ready({
    h2f_lw_RREADY[0:0] // 0:0
  })
,.b_ready({
    h2f_lw_BREADY[0:0] // 0:0
  })
,.rst_n({
    h2f_lw_axi_rst[0:0] // 0:0
  })
,.b_id({
    h2f_lw_BID[3:0] // 3:0
  })
,.r_id({
    h2f_lw_RID[3:0] // 3:0
  })
,.ar_id({
    h2f_lw_ARID[3:0] // 3:0
  })
,.aw_valid({
    h2f_lw_AWVALID[0:0] // 0:0
  })
,.aw_burst({
    h2f_lw_AWBURST[1:0] // 1:0
  })
,.w_clk({
    intermediate[2:2] // 0:0
  })
,.w_data({
    h2f_lw_WDATA[31:0] // 31:0
  })
,.ar_len({
    h2f_lw_ARLEN[3:0] // 3:0
  })
,.b_valid({
    h2f_lw_BVALID[0:0] // 0:0
  })
,.r_valid({
    h2f_lw_RVALID[0:0] // 0:0
  })
,.w_last({
    h2f_lw_WLAST[0:0] // 0:0
  })
,.clk({
    intermediate[1:1] // 0:0
  })
,.r_data({
    h2f_lw_RDATA[31:0] // 31:0
  })
,.w_ready({
    h2f_lw_WREADY[0:0] // 0:0
  })
,.ar_clk({
    intermediate[4:4] // 0:0
  })
,.aw_prot({
    h2f_lw_AWPROT[2:0] // 2:0
  })
,.r_last({
    h2f_lw_RLAST[0:0] // 0:0
  })
,.ar_cache({
    h2f_lw_ARCACHE[3:0] // 3:0
  })
,.w_valid({
    h2f_lw_WVALID[0:0] // 0:0
  })
,.aw_len({
    h2f_lw_AWLEN[3:0] // 3:0
  })
,.aw_user({
    h2f_lw_AWUSER[4:0] // 4:0
  })
,.ar_prot({
    h2f_lw_ARPROT[2:0] // 2:0
  })
,.ar_ready({
    h2f_lw_ARREADY[0:0] // 0:0
  })
);

defparam hps2fpga_light_weight.DWIDTH = 32;

twentynm_hps_rl_interface_hps2fpga hps2fpga(
 .port_size_config_1({
    1'b0 // 0:0
  })
,.port_size_config_2({
    1'b0 // 0:0
  })
,.port_size_config_3({
    1'b0 // 0:0
  })
,.port_size_config_0({
    1'b0 // 0:0
  })
);


twentynm_hps_rl_mode2_fpga2sdram f2sdram(
 .fpga2sdram2_ar_len({
    4'b0000 // 3:0
  })
,.f2s_sdram2_aw_clk({
    1'b0 // 0:0
  })
,.fpga2sdram0_w_valid({
    f2sdram0_WVALID[0:0] // 0:0
  })
,.fpga2sdram0_ar_cache({
    f2sdram0_ARCACHE[3:0] // 3:0
  })
,.fpga2sdram0_aw_user({
    f2sdram0_AWUSER[4:0] // 4:0
  })
,.f2s_sdram2_r_clk({
    1'b0 // 0:0
  })
,.fpga2sdram0_ar_prot({
    f2sdram0_ARPROT[2:0] // 2:0
  })
,.fpga2sdram2_aw_user({
    5'b00000 // 4:0
  })
,.f2s_sdram0_rst_n({
    f2s_sdram0_rst[0:0] // 0:0
  })
,.fpga2sdram0_aw_lock({
    f2sdram0_AWLOCK[1:0] // 1:0
  })
,.fpga2sdram2_w_valid({
    1'b0 // 0:0
  })
,.fpga2sdram2_ar_prot({
    3'b000 // 2:0
  })
,.fpga2sdram0_w_strb({
    f2sdram0_WSTRB[15:0] // 15:0
  })
,.fpga2sdram2_aw_lock({
    2'b00 // 1:0
  })
,.fpga2sdram0_ar_burst({
    f2sdram0_ARBURST[1:0] // 1:0
  })
,.f2s_sdram0_w_clk({
    intermediate[9:9] // 0:0
  })
,.fpga2sdram0_aw_addr({
    f2sdram0_AWADDR[31:0] // 31:0
  })
,.fpga2sdram0_w_id({
    f2sdram0_WID[3:0] // 3:0
  })
,.fpga2sdram2_aw_addr({
    32'b00000000000000000000000000000000 // 31:0
  })
,.fpga2sdram_port_size_config({
    4'b1110 // 3:0
  })
,.fpga2sdram2_aw_cache({
    4'b0000 // 3:0
  })
,.fpga2sdram0_ar_size({
    f2sdram0_ARSIZE[2:0] // 2:0
  })
,.fpga2sdram0_r_id({
    f2sdram0_RID[3:0] // 3:0
  })
,.fpga2sdram0_b_ready({
    f2sdram0_BREADY[0:0] // 0:0
  })
,.fpga2sdram2_ar_size({
    3'b000 // 2:0
  })
,.fpga2sdram0_aw_valid({
    f2sdram0_AWVALID[0:0] // 0:0
  })
,.fpga2sdram2_b_ready({
    1'b0 // 0:0
  })
,.fpga2sdram2_aw_burst({
    2'b00 // 1:0
  })
,.fpga2sdram0_r_valid({
    f2sdram0_RVALID[0:0] // 0:0
  })
,.fpga2sdram0_ar_len({
    f2sdram0_ARLEN[3:0] // 3:0
  })
,.fpga2sdram2_w_data({
    128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 // 127:0
  })
,.fpga2sdram0_w_ready({
    f2sdram0_WREADY[0:0] // 0:0
  })
,.fpga2sdram0_r_data({
    f2sdram0_RDATA[127:0] // 127:0
  })
,.f2s_sdram0_aw_clk({
    intermediate[13:13] // 0:0
  })
,.fpga2sdram0_aw_prot({
    f2sdram0_AWPROT[2:0] // 2:0
  })
,.f2s_sdram0_b_clk({
    intermediate[10:10] // 0:0
  })
,.fpga2sdram2_aw_prot({
    3'b000 // 2:0
  })
,.fpga2sdram2_ar_cache({
    4'b0000 // 3:0
  })
,.fpga2sdram0_ar_valid({
    f2sdram0_ARVALID[0:0] // 0:0
  })
,.fpga2sdram0_aw_size({
    f2sdram0_AWSIZE[2:0] // 2:0
  })
,.fpga2sdram2_aw_size({
    3'b000 // 2:0
  })
,.fpga2sdram2_ar_burst({
    2'b00 // 1:0
  })
,.fpga2sdram0_aw_ready({
    f2sdram0_AWREADY[0:0] // 0:0
  })
,.fpga2sdram2_w_id({
    4'b0000 // 3:0
  })
,.fpga2sdram2_aw_id({
    4'b0000 // 3:0
  })
,.fpga2sdram0_r_ready({
    f2sdram0_RREADY[0:0] // 0:0
  })
,.fpga2sdram0_w_data({
    f2sdram0_WDATA[127:0] // 127:0
  })
,.f2s_sdram2_ar_clk({
    1'b0 // 0:0
  })
,.fpga2sdram2_r_ready({
    1'b0 // 0:0
  })
,.fpga2sdram2_aw_valid({
    1'b0 // 0:0
  })
,.fpga2sdram2_ar_id({
    4'b0000 // 3:0
  })
,.fpga2sdram2_w_last({
    1'b0 // 0:0
  })
,.f2s_sdram0_r_clk({
    intermediate[12:12] // 0:0
  })
,.fpga2sdram0_r_last({
    f2sdram0_RLAST[0:0] // 0:0
  })
,.fpga2sdram0_ar_ready({
    f2sdram0_ARREADY[0:0] // 0:0
  })
,.fpga2sdram2_aw_len({
    4'b0000 // 3:0
  })
,.f2s_sdram2_rst_n({
    1'b0 // 0:0
  })
,.fpga2sdram0_b_resp({
    f2sdram0_BRESP[1:0] // 1:0
  })
,.f2s_sdram0_clk({
    intermediate[8:8] // 0:0
  })
,.fpga2sdram2_ar_valid({
    1'b0 // 0:0
  })
,.f2s_sdram2_w_clk({
    1'b0 // 0:0
  })
,.f2s_sdram0_ar_clk({
    intermediate[11:11] // 0:0
  })
,.f2s_sdram2_clk({
    1'b0 // 0:0
  })
,.fpga2sdram0_w_last({
    f2sdram0_WLAST[0:0] // 0:0
  })
,.fpga2sdram0_aw_len({
    f2sdram0_AWLEN[3:0] // 3:0
  })
,.f2s_sdram2_b_clk({
    1'b0 // 0:0
  })
,.fpga2sdram0_ar_user({
    f2sdram0_ARUSER[4:0] // 4:0
  })
,.fpga2sdram2_ar_user({
    5'b00000 // 4:0
  })
,.fpga2sdram0_r_resp({
    f2sdram0_RRESP[1:0] // 1:0
  })
,.fpga2sdram0_aw_cache({
    f2sdram0_AWCACHE[3:0] // 3:0
  })
,.fpga2sdram0_ar_lock({
    f2sdram0_ARLOCK[1:0] // 1:0
  })
,.fpga2sdram2_w_strb({
    16'b0000000000000000 // 15:0
  })
,.fpga2sdram0_aw_id({
    f2sdram0_AWID[3:0] // 3:0
  })
,.fpga2sdram0_ar_addr({
    f2sdram0_ARADDR[31:0] // 31:0
  })
,.fpga2sdram2_ar_lock({
    2'b00 // 1:0
  })
,.fpga2sdram0_b_id({
    f2sdram0_BID[3:0] // 3:0
  })
,.fpga2sdram0_ar_id({
    f2sdram0_ARID[3:0] // 3:0
  })
,.fpga2sdram0_aw_burst({
    f2sdram0_AWBURST[1:0] // 1:0
  })
,.fpga2sdram2_ar_addr({
    32'b00000000000000000000000000000000 // 31:0
  })
,.fpga2sdram0_b_valid({
    f2sdram0_BVALID[0:0] // 0:0
  })
);

defparam f2sdram.DWIDTH0 = 128;
defparam f2sdram.DEPTH = 4;
defparam f2sdram.mode = 3;

twentynm_hps_interface_interrupts interrupts(
 .f2s_fpga_irq({
    f2h_irq_p1[31:0] // 63:32
   ,f2h_irq_p0[31:0] // 31:0
  })
);


twentynm_hps_interface_peripheral_i2c peripheral_i2c1(
 .sda_i({
    i2c1_sda_i[0:0] // 0:0
  })
,.scl_oe({
    i2c1_scl_oe[0:0] // 0:0
  })
,.scl_i({
    i2c1_scl_i[0:0] // 0:0
  })
,.sda_oe({
    i2c1_sda_oe[0:0] // 0:0
  })
);

endmodule

