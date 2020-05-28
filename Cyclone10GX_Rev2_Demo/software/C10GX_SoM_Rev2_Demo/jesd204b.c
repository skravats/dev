/*
 * jesd204b.c
 *
 *  Created on: May 15, 2020
 *      Author: A90282
 */
#include "jesd204b.h"

/******************************************************************************/
/********************** Macros and Constants Definitions **********************/
/******************************************************************************/

#define GPIO_TRIG          43
#define GPIO_ADC_PD        42
#define GPIO_DAC_TXEN      41
#define GPIO_DAC_RESET     40
#define GPIO_CLKD_SYNC     38
#define GPIO_ADC_FDB       36
#define GPIO_ADC_FDA       35
#define GPIO_DAC_IRQ       34
#define GPIO_CLKD_STATUS_1 33
#define GPIO_CLKD_STATUS_0 32

#define DMA_BUFFER         1

static fmcdaq2_ctx_t fmcdaq2_ctx;

uint32_t *get_adc_buffer()
{
   return fmcdaq2_ctx.rx_xfer_buf;
}

int memory_testing()
{
   int result = 0, temp = 0;
   unsigned long rx_size = sizeof(fmcdaq2_ctx.rx_xfer_buf) / sizeof(uint32_t);
   unsigned long tx_size = sizeof(fmcdaq2_ctx.tx_xfer_buf) / sizeof(uint32_t);
   unsigned long i;
   printf("saving test data in RX buffer\n");
   for(i = 0; i < rx_size; i++)
   {
      fmcdaq2_ctx.rx_xfer_buf[i] = i + 1;
   }
   printf("saving test data in RX buffer - done\n");
   printf("saving test data in TX buffer\n");
   for(i = 0; i < tx_size; i++)
   {
      fmcdaq2_ctx.tx_xfer_buf[i] = i + 1;
   }
   printf("saving test data in TX buffer - done\n");
   printf("checking data in RX buffer\n");
   for(i = 0; i < rx_size; i++)
   {
      if(fmcdaq2_ctx.rx_xfer_buf[i] != i + 1)
      {
         temp = -1;
         result = -1;
         break;
      }
   }
   if(temp != 0)
   {
      printf("RX buffer failed at: %d\n", i);
   }
   temp = 0;
   printf("checking data in TX buffer\n");
   for(i = 0; i < tx_size; i++)
   {
      if(fmcdaq2_ctx.tx_xfer_buf[i] != i + 1)
      {
         temp = -1;
         result = -1;
         break;
      }
   }
   if(temp != 0)
   {
      printf("TX buffer failed at: %d\n", i);
   }

   return result;
}

int fmcdaq2_reconfig(struct ad9144_init_param *p_ad9144_param,
           xcvr_core *p_ad9144_xcvr,
           struct ad9680_init_param *p_ad9680_param,
           xcvr_core *p_ad9680_xcvr,
           struct ad9523_platform_data *p_ad9523_param, int8_t rate)
{
   uint8_t mode = 0;

   printf ("Available sampling rates:\n");
   printf ("\t1 - ADC 1000 MSPS; DAC 1000 MSPS\n");
   printf ("\t2 - ADC  500 MSPS; DAC 1000 MSPS\n");
   printf ("\t3 - ADC  500 MSPS; DAC  500 MSPS\n");
   printf ("\t4 - ADC  600 MSPS; DAC  600 MSPS\n");
   printf ("\t5 - ADC 1000 MSPS; DAC 2000 MSPS (2x interpolation)\n");
   printf ("choose an option [default 1]:\n");

   if(rate < 0)
   {
      mode = ad_uart_read();
   }
   else
   {
      mode = (uint8_t)'0' + rate;
   }

   switch (mode) {
   case '5':
      // REF clock = 100 MHz
      p_ad9523_param->channels[DAC_DEVICE_CLK].channel_divider = 10;
      p_ad9144_param->pll_ref_frequency_khz = 100000;

      // DAC at 2 GHz using the internal PLL and 2 times interpolation
      p_ad9144_param->interpolation = 2;
      p_ad9144_param->pll_enable = 1;
      p_ad9144_param->pll_dac_frequency_khz = 2000000;
      break;
   case '4':
      printf ("4 - ADC  600 MSPS; DAC  600 MSPS\n");
      p_ad9523_param->pll2_vco_diff_m1 = 5;
      (&p_ad9523_param->channels[DAC_FPGA_CLK])->channel_divider = 2;
      (&p_ad9523_param->channels[DAC_DEVICE_CLK])->channel_divider = 1;
      (&p_ad9523_param->channels[DAC_DEVICE_SYSREF])->channel_divider = 128;
      (&p_ad9523_param->channels[DAC_FPGA_SYSREF])->channel_divider = 128;
      (&p_ad9523_param->channels[ADC_FPGA_CLK])->channel_divider = 2;
      (&p_ad9523_param->channels[ADC_DEVICE_CLK])->channel_divider = 1;
      (&p_ad9523_param->channels[ADC_DEVICE_SYSREF])->channel_divider = 128;
      (&p_ad9523_param->channels[ADC_FPGA_SYSREF])->channel_divider = 128;
      p_ad9144_xcvr->reconfig_bypass = 0;
      p_ad9144_param->lane_rate_kbps = 6000000;
      p_ad9144_xcvr->lane_rate_kbps = 6000000;
#ifdef XILINX
      p_ad9144_xcvr->ref_rate_khz = 300000;
#endif
      p_ad9680_xcvr->reconfig_bypass = 0;
      p_ad9680_param->lane_rate_kbps = 6000000;
      p_ad9680_xcvr->lane_rate_kbps = 6000000;
#ifdef XILINX
      p_ad9680_xcvr->ref_rate_khz = 300000;
#endif
#ifdef XILINX
      p_ad9144_xcvr->dev.lpm_enable = 0;
      p_ad9144_xcvr->dev.cpll_enable = 1;
      p_ad9144_xcvr->dev.out_clk_sel = 4;

      p_ad9680_xcvr->dev.lpm_enable = 1;
      p_ad9680_xcvr->dev.cpll_enable = 1;
      p_ad9680_xcvr->dev.out_clk_sel = 4;
#endif
      break;
   case '3':
      printf ("3 - ADC  500 MSPS; DAC  500 MSPS\n");
      p_ad9523_param->pll2_vco_diff_m1                                  = 3;
      (&p_ad9523_param->channels[DAC_FPGA_CLK])->channel_divider        = 4;
      (&p_ad9523_param->channels[DAC_DEVICE_CLK])->channel_divider      = 2;
      (&p_ad9523_param->channels[DAC_DEVICE_SYSREF])->channel_divider   = 256;
      (&p_ad9523_param->channels[DAC_FPGA_SYSREF])->channel_divider     = 256;

      (&p_ad9523_param->channels[ADC_FPGA_CLK])->channel_divider        = 4;
      (&p_ad9523_param->channels[ADC_DEVICE_CLK])->channel_divider      = 2;
      (&p_ad9523_param->channels[ADC_DEVICE_SYSREF])->channel_divider   = 256;
      (&p_ad9523_param->channels[ADC_FPGA_SYSREF])->channel_divider     = 256;

      p_ad9144_xcvr->reconfig_bypass                                    = 0;
      p_ad9144_param->lane_rate_kbps                                    = 5000000;
      p_ad9144_xcvr->lane_rate_kbps                                     = 5000000;
#ifdef XILINX
      p_ad9144_xcvr->ref_rate_khz = 250000;
#endif
      p_ad9680_xcvr->reconfig_bypass                                    = 0;
      p_ad9680_param->lane_rate_kbps                                    = 5000000;
      p_ad9680_xcvr->lane_rate_kbps                                     = 5000000;

      p_ad9144_xcvr->ref_clock_khz                                      = 250000;
      p_ad9680_xcvr->ref_clock_khz                                      = 250000;

#ifdef XILINX
      p_ad9680_xcvr->ref_rate_khz = 250000;
#endif
#ifdef XILINX
      p_ad9144_xcvr->dev.lpm_enable = 1;
      p_ad9144_xcvr->dev.cpll_enable = 1;
      p_ad9144_xcvr->dev.out_clk_sel = 4;

      p_ad9680_xcvr->dev.lpm_enable = 1;
      p_ad9680_xcvr->dev.cpll_enable = 1;
      p_ad9680_xcvr->dev.out_clk_sel = 4;
#endif
      break;
   case '2':
      printf ("2 - ADC  500 MSPS; DAC 1000 MSPS\n");
      p_ad9523_param->pll2_vco_diff_m1 = 3;
      (&p_ad9523_param->channels[DAC_FPGA_CLK])->channel_divider = 2;
      (&p_ad9523_param->channels[DAC_DEVICE_CLK])->channel_divider = 1;
      (&p_ad9523_param->channels[DAC_DEVICE_SYSREF])->channel_divider = 128;
      (&p_ad9523_param->channels[DAC_FPGA_SYSREF])->channel_divider = 128;
      (&p_ad9523_param->channels[ADC_FPGA_CLK])->channel_divider = 4;
      (&p_ad9523_param->channels[ADC_DEVICE_CLK])->channel_divider = 2;
      (&p_ad9523_param->channels[ADC_DEVICE_SYSREF])->channel_divider = 256;
      (&p_ad9523_param->channels[ADC_FPGA_SYSREF])->channel_divider = 256;
      p_ad9144_xcvr->reconfig_bypass = 0;
      p_ad9144_param->lane_rate_kbps = 10000000;
      p_ad9144_xcvr->lane_rate_kbps = 10000000;
#ifdef XILINX
      p_ad9144_xcvr->ref_rate_khz = 500000;
#endif
      p_ad9680_xcvr->reconfig_bypass = 0;
      p_ad9680_param->lane_rate_kbps = 5000000;
      p_ad9680_xcvr->lane_rate_kbps = 5000000;
#ifdef XILINX
      p_ad9680_xcvr->ref_rate_khz = 250000;
#endif
#ifdef XILINX
      p_ad9144_xcvr->dev.lpm_enable = 0;
      p_ad9144_xcvr->dev.cpll_enable = 0;
      p_ad9144_xcvr->dev.out_clk_sel = 4;

      p_ad9680_xcvr->dev.lpm_enable = 1;
      p_ad9680_xcvr->dev.cpll_enable = 1;
      p_ad9680_xcvr->dev.out_clk_sel = 4;
#endif
      break;
   default:
      printf ("1 - ADC 1000 MSPS; DAC 1000 MSPS\n");
#ifdef XILINX
      p_ad9144_xcvr->ref_rate_khz = 500000;
      p_ad9680_xcvr->ref_rate_khz = 500000;
#endif
      break;
   }
   return(0);
}

int daq2_deinit()
{
   // Memory deallocation for devices and spi
   ad9144_remove(fmcdaq2_ctx.ad9144_device);
   ad9523_remove(fmcdaq2_ctx.ad9523_device);
   ad9680_remove(fmcdaq2_ctx.ad9680_device);

   // Memory deallocation for gpios
   gpio_remove(fmcdaq2_ctx.clkd_sync);
   gpio_remove(fmcdaq2_ctx.dac_reset);
   gpio_remove(fmcdaq2_ctx.dac_txen);
   gpio_remove(fmcdaq2_ctx.adc_pd);

   return 0;
}

int daq2_init()
{
   int n;
   uint8_t status0, status1;

   // register interrupts
   //alt_ic_isr_register(0, 11, axi_jesd204_tx_irq, 0, 0);
   //alt_ic_isr_register(0, 13, axi_jesd204_rx_irq, 0, 0);

   fmcdaq2_ctx.ad9523_spi_param.type = NIOS_II_SPI;
   fmcdaq2_ctx.ad9144_spi_param.type = NIOS_II_SPI;
   fmcdaq2_ctx.ad9680_spi_param.type = NIOS_II_SPI;

   fmcdaq2_ctx.ad9523_spi_param.chip_select = SPI_CHIP_SELECT(0);
   fmcdaq2_ctx.ad9144_spi_param.chip_select = SPI_CHIP_SELECT(1);
   fmcdaq2_ctx.ad9680_spi_param.chip_select = SPI_CHIP_SELECT(2);
   fmcdaq2_ctx.ad9523_spi_param.cpha = 0;
   fmcdaq2_ctx.ad9144_spi_param.cpha = 0;
   fmcdaq2_ctx.ad9680_spi_param.cpha = 0;
   fmcdaq2_ctx.ad9523_spi_param.cpol = 0;
   fmcdaq2_ctx.ad9144_spi_param.cpol = 0;
   fmcdaq2_ctx.ad9680_spi_param.cpol = 0;

   // R. Gisko
   memset(fmcdaq2_ctx.ad9523_channels, 0, sizeof(fmcdaq2_ctx.ad9523_channels));
   memset(&fmcdaq2_ctx.ad9523_pdata, 0, sizeof(fmcdaq2_ctx.ad9523_pdata));
   memset(&fmcdaq2_ctx.ad9523_param, 0, sizeof(fmcdaq2_ctx.ad9523_param));


   fmcdaq2_ctx.ad9523_param.spi_init = fmcdaq2_ctx.ad9523_spi_param;
   fmcdaq2_ctx.ad9144_param.spi_init = fmcdaq2_ctx.ad9144_spi_param;
   fmcdaq2_ctx.ad9680_param.spi_init = fmcdaq2_ctx.ad9680_spi_param;

   // 9144 XCVR
   fmcdaq2_ctx.ad9144_xcvr.base_address              = AD9144_JESD204_LINK_MANAGEMENT_BASE;
   fmcdaq2_ctx.ad9144_xcvr.dev.link_pll.base_address = AD9144_JESD204_LINK_PLL_RECONFIG_BASE;
   fmcdaq2_ctx.ad9144_xcvr.dev.atx_pll.base_address  = AD9144_JESD204_LANE_PLL_RECONFIG_BASE;
   fmcdaq2_ctx.ad9144_core.base_address              = AD9144_CORE_BASE;
   fmcdaq2_ctx.ad9680_xcvr.base_address              = AD9680_JESD204_LINK_MANAGEMENT_BASE;
   fmcdaq2_ctx.ad9680_xcvr.dev.link_pll.base_address = AD9680_JESD204_LINK_PLL_RECONFIG_BASE;
   fmcdaq2_ctx.ad9680_core.base_address              = AD9680_CORE_BASE;
   fmcdaq2_ctx.ad9144_jesd.base_address              = AD9144_JESD204_LINK_RECONFIG_BASE;
   fmcdaq2_ctx.ad9680_jesd.base_address              = AD9680_JESD204_LINK_RECONFIG_BASE;

   fmcdaq2_ctx.ad9144_xcvr.dev.channel_pll[0].type         = cmu_tx_type;
   fmcdaq2_ctx.ad9680_xcvr.dev.channel_pll[0].type         = cmu_cdr_type;
   fmcdaq2_ctx.ad9144_xcvr.dev.channel_pll[0].base_address = AVL_ADXCFG_0_RCFG_S0_BASE;
   fmcdaq2_ctx.ad9144_xcvr.dev.channel_pll[1].base_address = AVL_ADXCFG_1_RCFG_S0_BASE;
   fmcdaq2_ctx.ad9144_xcvr.dev.channel_pll[2].base_address = AVL_ADXCFG_2_RCFG_S0_BASE;
   fmcdaq2_ctx.ad9144_xcvr.dev.channel_pll[3].base_address = AVL_ADXCFG_3_RCFG_S0_BASE;

   fmcdaq2_ctx.ad9680_xcvr.dev.channel_pll[0].base_address = AVL_ADXCFG_0_RCFG_S1_BASE;
   fmcdaq2_ctx.ad9680_xcvr.dev.channel_pll[1].base_address = AVL_ADXCFG_1_RCFG_S1_BASE;
   fmcdaq2_ctx.ad9680_xcvr.dev.channel_pll[2].base_address = AVL_ADXCFG_2_RCFG_S1_BASE;
   fmcdaq2_ctx.ad9680_xcvr.dev.channel_pll[3].base_address = AVL_ADXCFG_3_RCFG_S1_BASE;

   fmcdaq2_ctx.ad9680_dma.base_address = AD9680_DMA_BASE;
   fmcdaq2_ctx.ad9144_dma.base_address = AD9144_DMA_BASE;
   fmcdaq2_ctx.rx_xfer.start_address   = (uint32_t)fmcdaq2_ctx.rx_xfer_buf;;
   fmcdaq2_ctx.tx_xfer.start_address   = (uint32_t)fmcdaq2_ctx.tx_xfer_buf;;

   //******************************************************************************
   // clock distribution device (AD9523) configuration
   //******************************************************************************
   fmcdaq2_ctx.ad9523_pdata.num_channels = 8;
   fmcdaq2_ctx.ad9523_pdata.channels     = &fmcdaq2_ctx.ad9523_channels[0];
   fmcdaq2_ctx.ad9523_param.pdata        = &fmcdaq2_ctx.ad9523_pdata;
   ad9523_init(&fmcdaq2_ctx.ad9523_param);

   // dac device-clk-sysref, fpga-clk-sysref

   // 1  => DAC CLK
   // 4  => ADC CLK (FMC)
   // 5  => ADC SYSREF
   // 6  => ADC SYSREF (FMC)
   // 7  => DAC SYSREF (FMC)
   // 8  => DAC SYSREF
   // 9  => DAC CLK (FMC)
   // 13 => ADC CLK
   //

   fmcdaq2_ctx.ad9523_channels[DAC_DEVICE_CLK].channel_num = 1;
   fmcdaq2_ctx.ad9523_channels[DAC_DEVICE_CLK].channel_divider = 1;

   fmcdaq2_ctx.ad9523_channels[DAC_DEVICE_SYSREF].channel_num = 8;
   fmcdaq2_ctx.ad9523_channels[DAC_DEVICE_SYSREF].channel_divider = 128;

   fmcdaq2_ctx.ad9523_channels[DAC_FPGA_CLK].channel_num = 9;
   fmcdaq2_ctx.ad9523_channels[DAC_FPGA_CLK].channel_divider = 2;

   fmcdaq2_ctx.ad9523_channels[DAC_FPGA_SYSREF].channel_num = 7;
   fmcdaq2_ctx.ad9523_channels[DAC_FPGA_SYSREF].channel_divider = 128;

   // adc device-clk-sysref, fpga-clk-sysref

   fmcdaq2_ctx.ad9523_channels[ADC_DEVICE_CLK].channel_num = 13;
   fmcdaq2_ctx.ad9523_channels[ADC_DEVICE_CLK].channel_divider = 1;

   fmcdaq2_ctx.ad9523_channels[ADC_DEVICE_SYSREF].channel_num = 5;
   fmcdaq2_ctx.ad9523_channels[ADC_DEVICE_SYSREF].channel_divider = 128;

   fmcdaq2_ctx.ad9523_channels[ADC_FPGA_CLK].channel_num = 4;
   fmcdaq2_ctx.ad9523_channels[ADC_FPGA_CLK].channel_divider = 2;

   fmcdaq2_ctx.ad9523_channels[ADC_FPGA_SYSREF].channel_num = 6;
   fmcdaq2_ctx.ad9523_channels[ADC_FPGA_SYSREF].channel_divider = 128;

   // VCXO 125MHz

   fmcdaq2_ctx.ad9523_pdata.vcxo_freq = 125000000;
   fmcdaq2_ctx.ad9523_pdata.spi3wire = 1;
   fmcdaq2_ctx.ad9523_pdata.osc_in_diff_en = 1;
   fmcdaq2_ctx.ad9523_pdata.pll2_charge_pump_current_nA = 413000;
   fmcdaq2_ctx.ad9523_pdata.pll2_freq_doubler_en = 0;
   fmcdaq2_ctx.ad9523_pdata.pll2_r2_div = 1;
   fmcdaq2_ctx.ad9523_pdata.pll2_ndiv_a_cnt = 0;
   fmcdaq2_ctx.ad9523_pdata.pll2_ndiv_b_cnt = 6;
   fmcdaq2_ctx.ad9523_pdata.pll2_vco_diff_m1 = 3;
   fmcdaq2_ctx.ad9523_pdata.pll2_vco_diff_m2 = 0;
   fmcdaq2_ctx.ad9523_pdata.rpole2 = 0;
   fmcdaq2_ctx.ad9523_pdata.rzero = 7;
   fmcdaq2_ctx.ad9523_pdata.cpole1 = 2;

#ifdef XILINX
   ad9144_xcvr.ref_rate_khz = 500000;
   ad9680_xcvr.ref_rate_khz = 500000;
#endif

   //ad9144_xcvr.ref_clock_khz= 125000;
   //ad9680_xcvr.ref_clock_khz= 125000;
   //******************************************************************************
   // DAC (AD9144) and the transmit path (AXI_ADXCVR,
   // JESD204, AXI_AD9144, TX DMAC) configuration
   //******************************************************************************

   xcvr_getconfig(&fmcdaq2_ctx.ad9144_xcvr);
   fmcdaq2_ctx.ad9144_xcvr.reconfig_bypass = 1;

   fmcdaq2_ctx.ad9144_xcvr.lane_rate_kbps = 10000000;

   //ad9144_jesd.rx_tx_n = 0;
   fmcdaq2_ctx.ad9144_jesd.scramble_enable = 1;
   fmcdaq2_ctx.ad9144_jesd.octets_per_frame = 1;
   fmcdaq2_ctx.ad9144_jesd.frames_per_multiframe = 32;
   fmcdaq2_ctx.ad9144_jesd.subclass_mode = 1;

   fmcdaq2_ctx.ad9144_channels[0].dds_dual_tone = 0;
   fmcdaq2_ctx.ad9144_channels[0].dds_frequency_0 = 33*1000*1000;
   fmcdaq2_ctx.ad9144_channels[0].dds_phase_0 = 0;
   fmcdaq2_ctx.ad9144_channels[0].dds_scale_0 = 500000;
   fmcdaq2_ctx.ad9144_channels[0].pat_data = 0xb1b0a1a0;
   fmcdaq2_ctx.ad9144_channels[1].dds_dual_tone = 0;
   fmcdaq2_ctx.ad9144_channels[1].dds_frequency_0 = 11*1000*1000;
   fmcdaq2_ctx.ad9144_channels[1].dds_phase_0 = 0;
   fmcdaq2_ctx.ad9144_channels[1].dds_scale_0 = 500000;
   fmcdaq2_ctx.ad9144_channels[1].pat_data = 0xd1d0c1c0;
   fmcdaq2_ctx.ad9144_channels[0].sel = DAC_SRC_DDS;
   fmcdaq2_ctx.ad9144_channels[1].sel = DAC_SRC_DDS;

   fmcdaq2_ctx.ad9144_param.lane_rate_kbps = 10000000;
   fmcdaq2_ctx.ad9144_param.spi3wire = 1;
   fmcdaq2_ctx.ad9144_param.interpolation = 1;
   fmcdaq2_ctx.ad9144_param.pll_enable = 0;
   fmcdaq2_ctx.ad9144_param.jesd204_subclass = 1;
   fmcdaq2_ctx.ad9144_param.jesd204_scrambling = 1;
   fmcdaq2_ctx.ad9144_param.jesd204_mode = 4;
   for(n=0; n<ARRAY_SIZE(fmcdaq2_ctx.ad9144_param.jesd204_lane_xbar); n++) {
      fmcdaq2_ctx.ad9144_param.jesd204_lane_xbar[n] = n;
   }

   // R. Gisko => added
   fmcdaq2_ctx.ad9144_param.jesd204_lane_xbar[0] = 0;// ok
   fmcdaq2_ctx.ad9144_param.jesd204_lane_xbar[1] = 3;// ok
   fmcdaq2_ctx.ad9144_param.jesd204_lane_xbar[2] = 1;
   fmcdaq2_ctx.ad9144_param.jesd204_lane_xbar[3] = 2;

   fmcdaq2_ctx.ad9144_core.no_of_channels = 2;
   fmcdaq2_ctx.ad9144_core.resolution = 16;
   fmcdaq2_ctx.ad9144_core.channels = &fmcdaq2_ctx.ad9144_channels[0];

   fmcdaq2_ctx.ad9144_param.stpl_samples[0][0] = (fmcdaq2_ctx.ad9144_channels[0].pat_data >> 0)  & 0xffff;
   fmcdaq2_ctx.ad9144_param.stpl_samples[0][1] = (fmcdaq2_ctx.ad9144_channels[0].pat_data >> 16) & 0xffff;
   fmcdaq2_ctx.ad9144_param.stpl_samples[0][2] = (fmcdaq2_ctx.ad9144_channels[0].pat_data >> 0)  & 0xffff;
   fmcdaq2_ctx.ad9144_param.stpl_samples[0][3] = (fmcdaq2_ctx.ad9144_channels[0].pat_data >> 16) & 0xffff;
   fmcdaq2_ctx.ad9144_param.stpl_samples[1][0] = (fmcdaq2_ctx.ad9144_channels[1].pat_data >> 0)  & 0xffff;
   fmcdaq2_ctx.ad9144_param.stpl_samples[1][1] = (fmcdaq2_ctx.ad9144_channels[1].pat_data >> 16) & 0xffff;
   fmcdaq2_ctx.ad9144_param.stpl_samples[1][2] = (fmcdaq2_ctx.ad9144_channels[1].pat_data >> 0)  & 0xffff;
   fmcdaq2_ctx.ad9144_param.stpl_samples[1][3] = (fmcdaq2_ctx.ad9144_channels[1].pat_data >> 16) & 0xffff;

   //******************************************************************************
   // ADC (AD9680) and the receive path ( AXI_ADXCVR,
   // JESD204, AXI_AD9680, TX DMAC) configuration
   //******************************************************************************

   fmcdaq2_ctx.ad9680_param.lane_rate_kbps = 10000000;

   xcvr_getconfig(&fmcdaq2_ctx.ad9680_xcvr);
   fmcdaq2_ctx.ad9680_xcvr.reconfig_bypass = 1;

   fmcdaq2_ctx.ad9680_xcvr.rx_tx_n = 1;
   fmcdaq2_ctx.ad9680_xcvr.lane_rate_kbps = fmcdaq2_ctx.ad9680_param.lane_rate_kbps;

   fmcdaq2_ctx.ad9680_jesd.scramble_enable = 1;
   fmcdaq2_ctx.ad9680_jesd.octets_per_frame = 1;
   fmcdaq2_ctx.ad9680_jesd.frames_per_multiframe = 32;
   fmcdaq2_ctx.ad9680_jesd.subclass_mode = 1;

   fmcdaq2_ctx.ad9680_core.no_of_channels = 2;
   fmcdaq2_ctx.ad9680_core.resolution = 14;

   //******************************************************************************
   // configure the receiver DMA
   //******************************************************************************

   fmcdaq2_ctx.ad9680_dma.type = DMAC_RX;
   fmcdaq2_ctx.ad9680_dma.transfer = &fmcdaq2_ctx.rx_xfer;
   fmcdaq2_ctx.rx_xfer.id = 0;
   fmcdaq2_ctx.rx_xfer.no_of_samples = DMA_NUMBER_OF_SAMPLES;

   fmcdaq2_ctx.ad9144_dma.type = DMAC_TX;
   fmcdaq2_ctx.ad9144_dma.transfer = &fmcdaq2_ctx.tx_xfer;
   fmcdaq2_ctx.ad9144_dma.flags = DMAC_FLAGS_TLAST;
   fmcdaq2_ctx.tx_xfer.id = 0;
   fmcdaq2_ctx.tx_xfer.no_of_samples = dac_buffer_load(fmcdaq2_ctx.ad9144_core, fmcdaq2_ctx.tx_xfer.start_address);

   // change the default JESD configurations, if required
   fmcdaq2_reconfig(&fmcdaq2_ctx.ad9144_param,
          &fmcdaq2_ctx.ad9144_xcvr,
          &fmcdaq2_ctx.ad9680_param,
          &fmcdaq2_ctx.ad9680_xcvr,
          fmcdaq2_ctx.ad9523_param.pdata, 3);


   //******************************************************************************
   // bring up the system
   //******************************************************************************

   // setup GPIOs

   gpio_get(&fmcdaq2_ctx.clkd_sync, GPIO_CLKD_SYNC, 1);
   gpio_get(&fmcdaq2_ctx.dac_reset, GPIO_DAC_RESET, 1);
   gpio_get(&fmcdaq2_ctx.dac_txen,  GPIO_DAC_TXEN,  1);
   gpio_get(&fmcdaq2_ctx.adc_pd,    GPIO_ADC_PD,    1);

   gpio_set_value(fmcdaq2_ctx.clkd_sync, 0);
   gpio_set_value(fmcdaq2_ctx.dac_reset, 0);
   gpio_set_value(fmcdaq2_ctx.dac_txen,  0);
   gpio_set_value(fmcdaq2_ctx.adc_pd,    1);
   mdelay(250);

   gpio_set_value(fmcdaq2_ctx.clkd_sync, 1);
   gpio_set_value(fmcdaq2_ctx.dac_reset, 1);
   gpio_set_value(fmcdaq2_ctx.dac_txen,  1);
   gpio_set_value(fmcdaq2_ctx.adc_pd,    0);

   mdelay(250);

   // setup clocks
   ad9523_setup(&fmcdaq2_ctx.ad9523_device, &fmcdaq2_ctx.ad9523_param);

   // Recommended DAC JESD204 link startup sequence
   //   1. FPGA JESD204 Link Layer
   //   2. FPGA JESD204 PHY Layer
   //   3. DAC
   //
   // Recommended ADC JESD204 link startup sequence
   //   1. ADC
   //   2. FPGA JESD204 PHY Layer
   //   2. FPGA JESD204 Link Layer
   //
   // Both sequences are interleaved here so that the transceivers which might
   // be shared between the DAC and ADC link are enabled at the same time.


   // ADC
   ad9680_setup(&fmcdaq2_ctx.ad9680_device, &fmcdaq2_ctx.ad9680_param);

   // DAC FPGA JESD204 link layer
   jesd_setup(&fmcdaq2_ctx.ad9144_jesd);

   // ADC and DAC FPGA JESD204 PHY layer
#ifdef ALTERA
   printf("AD9144 Setup\n");
   fmcdaq2_ctx.ad9144_xcvr.rx_tx_n = 0;
   xcvr_setup(&fmcdaq2_ctx.ad9144_xcvr);

   printf("AD9680 Setup\n");
   xcvr_setup(&fmcdaq2_ctx.ad9680_xcvr);
#endif

   // ADC FPGA JESD204 link layer
   jesd_setup(&fmcdaq2_ctx.ad9680_jesd);

   // DAC
   ad9144_setup(&fmcdaq2_ctx.ad9144_device, &fmcdaq2_ctx.ad9144_param);

   // JESD core status
   axi_jesd204_tx_status_read(&fmcdaq2_ctx.ad9144_jesd);
   axi_jesd204_rx_status_read(&fmcdaq2_ctx.ad9680_jesd);

   // interface core set up
   adc_setup(fmcdaq2_ctx.ad9680_core);
   dac_setup(&fmcdaq2_ctx.ad9144_core);

   ad9144_status(fmcdaq2_ctx.ad9144_device);

   axi_jesd204_rx_laneinfo_read(&fmcdaq2_ctx.ad9680_jesd, 0);
   axi_jesd204_rx_laneinfo_read(&fmcdaq2_ctx.ad9680_jesd, 1);
   axi_jesd204_rx_laneinfo_read(&fmcdaq2_ctx.ad9680_jesd, 2);
   axi_jesd204_rx_laneinfo_read(&fmcdaq2_ctx.ad9680_jesd, 3);

   //******************************************************************************
   // transport path testing
   //******************************************************************************

   fmcdaq2_ctx.ad9144_channels[0].sel = DAC_SRC_SED;
   fmcdaq2_ctx.ad9144_channels[1].sel = DAC_SRC_SED;
   dac_data_setup(&fmcdaq2_ctx.ad9144_core);
   ad9144_short_pattern_test(fmcdaq2_ctx.ad9144_device, &fmcdaq2_ctx.ad9144_param);

   // PN7 data path test

   fmcdaq2_ctx.ad9144_channels[0].sel = DAC_SRC_PN23;
   fmcdaq2_ctx.ad9144_channels[1].sel = DAC_SRC_PN23;
   dac_data_setup(&fmcdaq2_ctx.ad9144_core);
   fmcdaq2_ctx.ad9144_param.prbs_type = AD9144_PRBS7;
   ad9144_datapath_prbs_test(fmcdaq2_ctx.ad9144_device, &fmcdaq2_ctx.ad9144_param);

   // PN15 data path test

   fmcdaq2_ctx.ad9144_channels[0].sel = DAC_SRC_PN31;
   fmcdaq2_ctx.ad9144_channels[1].sel = DAC_SRC_PN31;
   dac_data_setup(&fmcdaq2_ctx.ad9144_core);
   fmcdaq2_ctx.ad9144_param.prbs_type = AD9144_PRBS15;
   ad9144_datapath_prbs_test(fmcdaq2_ctx.ad9144_device, &fmcdaq2_ctx.ad9144_param);

   //******************************************************************************
   // receive path testing
   //******************************************************************************

   ad9680_test(fmcdaq2_ctx.ad9680_device, AD9680_TEST_PN9);
   if(adc_pn_mon(fmcdaq2_ctx.ad9680_core, ADC_PN9) == -1) {
      printf("%s ad9680 - PN9 sequence mismatch!\n", __func__);
   };
   ad9680_test(fmcdaq2_ctx.ad9680_device, AD9680_TEST_PN23);
   if(adc_pn_mon(fmcdaq2_ctx.ad9680_core, ADC_PN23A) == -1) {
      printf("%s ad9680 - PN23 sequence mismatch!\n", __func__);
   };

   //daq2_transaction_adc();
   //daq2_transaction_adc();

   return 0;
}


int daq2_transaction_adc()
{
   //******************************************************************************
   // external loopback - capture data with DMA
   //******************************************************************************

   ad9680_test(fmcdaq2_ctx.ad9680_device, AD9680_TEST_OFF);
   if(!dmac_start_transaction(fmcdaq2_ctx.ad9680_dma)) {
      printf("daq2: RX capture done.\n");

      for(int i = 0; i < 16; i++) {
         printf("%8.4f\t", ((float)((short)(fmcdaq2_ctx.rx_xfer_buf[i] & 0x0000ffff)))/16384);
      }
      printf("\n");
      for(int i = 0; i < 16; i++) {
         printf("%8.4f\t", ((float)((short)((fmcdaq2_ctx.rx_xfer_buf[i]>>16) & 0x0000ffff)))/16384);
      }
      printf("\n");

   };

   return 0;
}

int daq2_transaction_dac()
{
   // default data

#if DMA_BUFFER
   fmcdaq2_ctx.ad9144_channels[0].sel = DAC_SRC_DMA;
   fmcdaq2_ctx.ad9144_channels[1].sel = DAC_SRC_DMA;
   dac_data_setup(&fmcdaq2_ctx.ad9144_core);

   if(!dmac_start_transaction(fmcdaq2_ctx.ad9144_dma)) {
      printf("daq2: transmit data from memory\n");
   };
#else
   ad9144_channels[0].sel = DAC_SRC_DDS;
   ad9144_channels[1].sel = DAC_SRC_DDS;
   dac_data_setup(&ad9144_core);

   printf("daq2: setup and configuration is done\n");
#endif

   return 0;
}


void mem_writing(unsigned int size)
{
   unsigned int i;
   volatile unsigned int *ptr;
   ptr = (volatile unsigned int*)DDR3_CTRL_AMM_0_BASE;
   memset(ptr, 0, sizeof(int)*size);
   for(i = 0; i < size; i++)
   {
      ptr[i] = i;
   }
}

unsigned int mem_reading(unsigned int size)
{
   unsigned int value, i;
   unsigned int result = 0;
   volatile unsigned int *ptr;

   ptr = (volatile unsigned int*)DDR3_CTRL_AMM_0_BASE;
   for(i = 0; i < size; i++)
   {
      value = ptr[i];
      if(value != i)
      {
         result++;
      }
   }
   return result;
}

unsigned int mem_testing(unsigned int size)
{
   unsigned int i, value;
   unsigned int result  = 0;
   volatile unsigned int *ptr;

   ptr = (volatile unsigned int*)DDR3_CTRL_AMM_0_BASE;

   mem_writing(size);
   result = mem_reading(size);

   return result;
}

static void axi_jesd204_tx_irq (void *context)
{
   unsigned int pending;
   pending = IORD_32DIRECT(AD9144_JESD204_LINK_MANAGEMENT_BASE, JESD204_REG_IRQ_PENDING);
   if(pending)
   {
      IOWR_32DIRECT(AD9144_JESD204_LINK_MANAGEMENT_BASE, JESD204_REG_IRQ_PENDING, pending);
   }
}

static void axi_jesd204_rx_irq (void *context)
{
   unsigned int pending;
   pending = IORD_32DIRECT(AD9680_JESD204_LINK_MANAGEMENT_BASE, JESD204_REG_IRQ_PENDING);
   if(pending)
   {
      IOWR_32DIRECT(AD9680_JESD204_LINK_MANAGEMENT_BASE, JESD204_REG_IRQ_PENDING, pending);
   }
}


