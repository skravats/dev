/*
 * "Hello World" example.
 *
 * This example prints 'Hello from Nios II' to the STDOUT stream. It runs on
 * the Nios II 'standard', 'full_featured', 'fast', and 'low_cost' example
 * designs. It runs with or without the MicroC/OS-II RTOS and requires a STDOUT
 * device in your system's hardware.
 * The memory footprint of this hosted application is ~69 kbytes by default
 * using the standard reference design.
 *
 * For a reduced footprint version of this template, and an explanation of how
 * to reduce the memory footprint for a given application, see the
 * "small_hello_world" template.
 *
 */
#include <stdio.h>
#include <string.h>
#include "system.h"
#include "sys/alt_flash_types.h"
#include "sys/alt_flash.h"

#include "fmc/common_drivers/platform_drivers/platform_drivers.h"
#include "fmc/ad9144/ad9144.h"
#include "fmc/ad9523/ad9523.h"
#include "fmc/ad9680/ad9680.h"
#include "fmc/common_drivers/adc_core/adc_core.h"
#include "fmc/common_drivers/dac_core/dac_core.h"
#include "fmc/common_drivers/dmac_core/dmac_core.h"
#include "fmc/common_drivers/dac_buffer/dac_buffer.h"
#include "fmc/common_drivers/xcvr_core/xcvr_core.h"
#include "fmc/common_drivers/jesd_core/jesd_core.h"


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

#define DMA_BUFFER         0

enum ad9523_channels {
   DAC_DEVICE_CLK,
   DAC_DEVICE_SYSREF,
   DAC_FPGA_CLK,
   DAC_FPGA_SYSREF,
   ADC_DEVICE_CLK,
   ADC_DEVICE_SYSREF,
   ADC_FPGA_CLK,
   ADC_FPGA_SYSREF,
};

static uint32_t rx_xfer_buf[0x1000000];
static uint32_t tx_xfer_buf[0x1000000];

int fmcdaq2_reconfig(struct ad9144_init_param *p_ad9144_param,
           xcvr_core *p_ad9144_xcvr,
           struct ad9680_init_param *p_ad9680_param,
           xcvr_core *p_ad9680_xcvr,
           struct ad9523_platform_data *p_ad9523_param)
{
   uint8_t mode = 0;

   printf ("Available sampling rates:\n");
   printf ("\t1 - ADC 1000 MSPS; DAC 1000 MSPS\n");
   printf ("\t2 - ADC  500 MSPS; DAC 1000 MSPS\n");
   printf ("\t3 - ADC  500 MSPS; DAC  500 MSPS\n");
   printf ("\t4 - ADC  600 MSPS; DAC  600 MSPS\n");
   printf ("\t5 - ADC 1000 MSPS; DAC 2000 MSPS (2x interpolation)\n");
   printf ("choose an option [default 1]:\n");

   mode = ad_uart_read();

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
      p_ad9144_xcvr->ref_rate_khz = 300000;
      p_ad9680_xcvr->reconfig_bypass = 0;
      p_ad9680_param->lane_rate_kbps = 6000000;
      p_ad9680_xcvr->lane_rate_kbps = 6000000;
      p_ad9680_xcvr->ref_rate_khz = 300000;
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
      p_ad9523_param->pll2_vco_diff_m1 = 3;
      (&p_ad9523_param->channels[DAC_FPGA_CLK])->channel_divider = 4;
      (&p_ad9523_param->channels[DAC_DEVICE_CLK])->channel_divider = 2;
      (&p_ad9523_param->channels[DAC_DEVICE_SYSREF])->channel_divider = 256;
      (&p_ad9523_param->channels[DAC_FPGA_SYSREF])->channel_divider = 256;
      (&p_ad9523_param->channels[ADC_FPGA_CLK])->channel_divider = 4;
      (&p_ad9523_param->channels[ADC_DEVICE_CLK])->channel_divider = 2;
      (&p_ad9523_param->channels[ADC_DEVICE_SYSREF])->channel_divider = 256;
      (&p_ad9523_param->channels[ADC_FPGA_SYSREF])->channel_divider = 256;
      p_ad9144_xcvr->reconfig_bypass = 0;
      p_ad9144_param->lane_rate_kbps = 5000000;
      p_ad9144_xcvr->lane_rate_kbps = 5000000;
      p_ad9144_xcvr->ref_rate_khz = 250000;
      p_ad9680_xcvr->reconfig_bypass = 0;
      p_ad9680_param->lane_rate_kbps = 5000000;
      p_ad9680_xcvr->lane_rate_kbps = 5000000;
      p_ad9680_xcvr->ref_rate_khz = 250000;
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
      p_ad9144_xcvr->ref_rate_khz = 500000;
      p_ad9680_xcvr->reconfig_bypass = 0;
      p_ad9680_param->lane_rate_kbps = 5000000;
      p_ad9680_xcvr->lane_rate_kbps = 5000000;
      p_ad9680_xcvr->ref_rate_khz = 250000;
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
      p_ad9144_xcvr->ref_rate_khz = 500000;
      p_ad9680_xcvr->ref_rate_khz = 500000;
      break;
   }

   return(0);
}


int daq2_init()
{
   int n;

   spi_init_param ad9523_spi_param;
   spi_init_param ad9144_spi_param;
   spi_init_param ad9680_spi_param;

   ad9523_spi_param.type = NIOS_II_SPI;
   ad9144_spi_param.type = NIOS_II_SPI;
   ad9680_spi_param.type = NIOS_II_SPI;

   ad9523_spi_param.chip_select = SPI_CHIP_SELECT(0);
   ad9144_spi_param.chip_select = SPI_CHIP_SELECT(1);
   ad9680_spi_param.chip_select = SPI_CHIP_SELECT(2);
   ad9523_spi_param.cpha = 0;
   ad9144_spi_param.cpha = 0;
   ad9680_spi_param.cpha = 0;
   ad9523_spi_param.cpol = 0;
   ad9144_spi_param.cpol = 0;
   ad9680_spi_param.cpol = 0;

   struct ad9523_channel_spec ad9523_channels[8];
   struct ad9523_platform_data   ad9523_pdata;
   struct ad9523_init_param   ad9523_param;
   struct ad9144_init_param   ad9144_param;
   struct ad9680_init_param   ad9680_param;

   ad9523_param.spi_init = ad9523_spi_param;
   ad9144_param.spi_init = ad9144_spi_param;
   ad9680_param.spi_init = ad9680_spi_param;

   struct ad9523_dev *ad9523_device;
   struct ad9144_dev *ad9144_device;
   struct ad9680_dev *ad9680_device;

   dac_core       ad9144_core;
   dac_channel    ad9144_channels[2];
   jesd_core      ad9144_jesd;
   dmac_core      ad9144_dma;
   xcvr_core      ad9144_xcvr;
   adc_core       ad9680_core;
   jesd_core      ad9680_jesd;
   xcvr_core      ad9680_xcvr;
   dmac_core      ad9680_dma;
   dmac_xfer      rx_xfer;
   dmac_xfer      tx_xfer;

   ad9144_xcvr.base_address              = AD9144_JESD204_LINK_MANAGEMENT_BASE;
   ad9144_xcvr.dev.link_pll.base_address = AD9144_JESD204_LINK_PLL_RECONFIG_BASE;
   ad9144_xcvr.dev.atx_pll.base_address  = AD9144_JESD204_LANE_PLL_RECONFIG_BASE;
   ad9144_core.base_address              = AD9144_CORE_BASE;
   ad9680_xcvr.base_address              = AD9680_JESD204_LINK_MANAGEMENT_BASE;
   ad9680_xcvr.dev.link_pll.base_address = AD9680_JESD204_LINK_PLL_RECONFIG_BASE;
   ad9680_core.base_address              = AD9680_CORE_BASE;
   ad9144_jesd.base_address              = AD9144_JESD204_LINK_RECONFIG_BASE;
   ad9680_jesd.base_address              = AD9680_JESD204_LINK_RECONFIG_BASE;

   ad9144_xcvr.dev.channel_pll[0].type         = cmu_tx_type;
   ad9680_xcvr.dev.channel_pll[0].type         = cmu_cdr_type;
   ad9144_xcvr.dev.channel_pll[0].base_address = AVL_ADXCFG_0_RCFG_S0_BASE;
   ad9680_xcvr.dev.channel_pll[0].base_address = AVL_ADXCFG_0_RCFG_S1_BASE;

   ad9680_dma.base_address = AD9680_DMA_BASE;
   ad9144_dma.base_address = AD9144_DMA_BASE;
   rx_xfer.start_address   = (uint32_t)rx_xfer_buf;//0x800000;
   tx_xfer.start_address   = (uint32_t)tx_xfer_buf;//0x900000;

   //******************************************************************************
   // clock distribution device (AD9523) configuration
   //******************************************************************************
   ad9523_pdata.num_channels = 8;
   ad9523_pdata.channels     = &ad9523_channels[0];
   ad9523_param.pdata        = &ad9523_pdata;
   ad9523_init(&ad9523_param);

   // dac device-clk-sysref, fpga-clk-sysref

   ad9523_channels[DAC_DEVICE_CLK].channel_num = 1;
   ad9523_channels[DAC_DEVICE_CLK].channel_divider = 1;
   ad9523_channels[DAC_DEVICE_SYSREF].channel_num = 7;
   ad9523_channels[DAC_DEVICE_SYSREF].channel_divider = 128;
   ad9523_channels[DAC_FPGA_CLK].channel_num = 9;
   ad9523_channels[DAC_FPGA_CLK].channel_divider = 2;
   ad9523_channels[DAC_FPGA_SYSREF].channel_num = 8;
   ad9523_channels[DAC_FPGA_SYSREF].channel_divider = 128;

   // adc device-clk-sysref, fpga-clk-sysref

   ad9523_channels[ADC_DEVICE_CLK].channel_num = 13;
   ad9523_channels[ADC_DEVICE_CLK].channel_divider = 1;
   ad9523_channels[ADC_DEVICE_SYSREF].channel_num = 6;
   ad9523_channels[ADC_DEVICE_SYSREF].channel_divider = 128;
   ad9523_channels[ADC_FPGA_CLK].channel_num = 4;
   ad9523_channels[ADC_FPGA_CLK].channel_divider = 2;
   ad9523_channels[ADC_FPGA_SYSREF].channel_num = 5;
   ad9523_channels[ADC_FPGA_SYSREF].channel_divider = 128;

   // VCXO 125MHz

   ad9523_pdata.vcxo_freq = 125000000;
   ad9523_pdata.spi3wire = 1;
   ad9523_pdata.osc_in_diff_en = 1;
   ad9523_pdata.pll2_charge_pump_current_nA = 413000;
   ad9523_pdata.pll2_freq_doubler_en = 0;
   ad9523_pdata.pll2_r2_div = 1;
   ad9523_pdata.pll2_ndiv_a_cnt = 0;
   ad9523_pdata.pll2_ndiv_b_cnt = 6;
   ad9523_pdata.pll2_vco_diff_m1 = 3;
   ad9523_pdata.pll2_vco_diff_m2 = 0;
   ad9523_pdata.rpole2 = 0;
   ad9523_pdata.rzero = 7;
   ad9523_pdata.cpole1 = 2;

   ad9144_xcvr.ref_rate_khz = 500000;
   ad9680_xcvr.ref_rate_khz = 500000;

   //******************************************************************************
   // DAC (AD9144) and the transmit path (AXI_ADXCVR,
   // JESD204, AXI_AD9144, TX DMAC) configuration
   //******************************************************************************

   xcvr_getconfig(&ad9144_xcvr);
   ad9144_xcvr.reconfig_bypass = 1;

   ad9144_xcvr.lane_rate_kbps = 10000000;

   ad9144_jesd.rx_tx_n = 0;
   ad9144_jesd.scramble_enable = 1;
   ad9144_jesd.octets_per_frame = 1;
   ad9144_jesd.frames_per_multiframe = 32;
   ad9144_jesd.subclass_mode = 1;

   ad9144_channels[0].dds_dual_tone = 0;
   ad9144_channels[0].dds_frequency_0 = 33*1000*1000;
   ad9144_channels[0].dds_phase_0 = 0;
   ad9144_channels[0].dds_scale_0 = 500000;
   ad9144_channels[0].pat_data = 0xb1b0a1a0;
   ad9144_channels[1].dds_dual_tone = 0;
   ad9144_channels[1].dds_frequency_0 = 11*1000*1000;
   ad9144_channels[1].dds_phase_0 = 0;
   ad9144_channels[1].dds_scale_0 = 500000;
   ad9144_channels[1].pat_data = 0xd1d0c1c0;
   ad9144_channels[0].sel = DAC_SRC_DDS;
   ad9144_channels[1].sel = DAC_SRC_DDS;

   ad9144_param.lane_rate_kbps = 10000000;
   ad9144_param.spi3wire = 1;
   ad9144_param.interpolation = 1;
   ad9144_param.pll_enable = 0;
   ad9144_param.jesd204_subclass = 1;
   ad9144_param.jesd204_scrambling = 1;
   ad9144_param.jesd204_mode = 4;
   for(n=0; n<ARRAY_SIZE(ad9144_param.jesd204_lane_xbar); n++) {
      ad9144_param.jesd204_lane_xbar[n] = n;
   }

   ad9144_core.no_of_channels = 2;
   ad9144_core.resolution = 16;
   ad9144_core.channels = &ad9144_channels[0];

   ad9144_param.stpl_samples[0][0] = (ad9144_channels[0].pat_data >> 0)  & 0xffff;
   ad9144_param.stpl_samples[0][1] = (ad9144_channels[0].pat_data >> 16) & 0xffff;
   ad9144_param.stpl_samples[0][2] = (ad9144_channels[0].pat_data >> 0)  & 0xffff;
   ad9144_param.stpl_samples[0][3] = (ad9144_channels[0].pat_data >> 16) & 0xffff;
   ad9144_param.stpl_samples[1][0] = (ad9144_channels[1].pat_data >> 0)  & 0xffff;
   ad9144_param.stpl_samples[1][1] = (ad9144_channels[1].pat_data >> 16) & 0xffff;
   ad9144_param.stpl_samples[1][2] = (ad9144_channels[1].pat_data >> 0)  & 0xffff;
   ad9144_param.stpl_samples[1][3] = (ad9144_channels[1].pat_data >> 16) & 0xffff;

   //******************************************************************************
   // ADC (AD9680) and the receive path ( AXI_ADXCVR,
   // JESD204, AXI_AD9680, TX DMAC) configuration
   //******************************************************************************

   ad9680_param.lane_rate_kbps = 10000000;

   xcvr_getconfig(&ad9680_xcvr);
   ad9680_xcvr.reconfig_bypass = 1;

   ad9680_xcvr.rx_tx_n = 1;
   ad9680_xcvr.lane_rate_kbps = ad9680_param.lane_rate_kbps;

   ad9680_jesd.scramble_enable = 1;
   ad9680_jesd.octets_per_frame = 1;
   ad9680_jesd.frames_per_multiframe = 32;
   ad9680_jesd.subclass_mode = 1;

   ad9680_core.no_of_channels = 2;
   ad9680_core.resolution = 14;


   //******************************************************************************
   // configure the receiver DMA
   //******************************************************************************

   ad9680_dma.type = DMAC_RX;
   ad9680_dma.transfer = &rx_xfer;
   rx_xfer.id = 0;
   rx_xfer.no_of_samples = 32768;

   ad9144_dma.type = DMAC_TX;
   ad9144_dma.transfer = &tx_xfer;
   ad9144_dma.flags = DMAC_FLAGS_TLAST;
   tx_xfer.id = 0;
   tx_xfer.no_of_samples = dac_buffer_load(ad9144_core, tx_xfer.start_address);

   // change the default JESD configurations, if required
   fmcdaq2_reconfig(&ad9144_param,
          &ad9144_xcvr,
          &ad9680_param,
          &ad9680_xcvr,
          ad9523_param.pdata);

   //******************************************************************************
   // bring up the system
   //******************************************************************************

   // setup GPIOs

   gpio_desc *clkd_sync;
   gpio_desc *dac_reset;
   gpio_desc *dac_txen;
   gpio_desc *adc_pd;

   gpio_get(&clkd_sync, GPIO_CLKD_SYNC);
   gpio_get(&dac_reset, GPIO_DAC_RESET);
   gpio_get(&dac_txen,  GPIO_DAC_TXEN);
   gpio_get(&adc_pd,    GPIO_ADC_PD);

   gpio_set_value(clkd_sync, 0);
   gpio_set_value(dac_reset, 0);
   gpio_set_value(dac_txen,  0);
   gpio_set_value(adc_pd,    1);
   mdelay(5);

   gpio_set_value(clkd_sync, 1);
   gpio_set_value(dac_reset, 1);
   gpio_set_value(dac_txen,  1);
   gpio_set_value(adc_pd,    0);

   // setup clocks

   ad9523_setup(&ad9523_device, &ad9523_param);

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
   ad9680_setup(&ad9680_device, &ad9680_param);

   // DAC FPGA JESD204 link layer
   jesd_setup(&ad9144_jesd);

   // ADC and DAC FPGA JESD204 PHY layer
#ifdef ALTERA
   xcvr_setup(&ad9144_xcvr);
   xcvr_setup(&ad9680_xcvr);
#endif

   // ADC FPGA JESD204 link layer
   jesd_setup(&ad9680_jesd);

   // DAC
   ad9144_setup(&ad9144_device, &ad9144_param);

   // JESD core status
   axi_jesd204_tx_status_read(&ad9144_jesd);
   axi_jesd204_rx_status_read(&ad9680_jesd);

   // interface core set up
   adc_setup(ad9680_core);
   dac_setup(&ad9144_core);

   ad9144_status(ad9144_device);

   //******************************************************************************
   // transport path testing
   //******************************************************************************

   ad9144_channels[0].sel = DAC_SRC_SED;
   ad9144_channels[1].sel = DAC_SRC_SED;
   dac_data_setup(&ad9144_core);
   ad9144_short_pattern_test(ad9144_device, &ad9144_param);

   // PN7 data path test

   ad9144_channels[0].sel = DAC_SRC_PN23;
   ad9144_channels[1].sel = DAC_SRC_PN23;
   dac_data_setup(&ad9144_core);
   ad9144_param.prbs_type = AD9144_PRBS7;
   ad9144_datapath_prbs_test(ad9144_device, &ad9144_param);

   // PN15 data path test

   ad9144_channels[0].sel = DAC_SRC_PN31;
   ad9144_channels[1].sel = DAC_SRC_PN31;
   dac_data_setup(&ad9144_core);
   ad9144_param.prbs_type = AD9144_PRBS15;
   ad9144_datapath_prbs_test(ad9144_device, &ad9144_param);

   //******************************************************************************
   // receive path testing
   //******************************************************************************

   ad9680_test(ad9680_device, AD9680_TEST_PN9);
   if(adc_pn_mon(ad9680_core, ADC_PN9) == -1) {
      printf("%s ad9680 - PN9 sequence mismatch!\n", __func__);
   };
   ad9680_test(ad9680_device, AD9680_TEST_PN23);
   if(adc_pn_mon(ad9680_core, ADC_PN23A) == -1) {
      printf("%s ad9680 - PN23 sequence mismatch!\n", __func__);
   };

   // default data

#if DMA_BUFFER
   ad9144_channels[0].sel = DAC_SRC_DMA;
   ad9144_channels[1].sel = DAC_SRC_DMA;
   dac_data_setup(&ad9144_core);

   if(!dmac_start_transaction(ad9144_dma)) {
      printf("daq2: transmit data from memory\n");
   };
#else
   ad9144_channels[0].sel = DAC_SRC_DDS;
   ad9144_channels[1].sel = DAC_SRC_DDS;
   dac_data_setup(&ad9144_core);

   printf("daq2: setup and configuration is done\n");
#endif
   //******************************************************************************
   // external loopback - capture data with DMA
   //******************************************************************************

   ad9680_test(ad9680_device, AD9680_TEST_OFF);
   if(!dmac_start_transaction(ad9680_dma)) {
      printf("daq2: RX capture done.\n");
   };

   // Memory deallocation for devices and spi
   ad9144_remove(ad9144_device);
   ad9523_remove(ad9523_device);
   ad9680_remove(ad9680_device);

   // Memory deallocation for gpios
   gpio_remove(clkd_sync);
   gpio_remove(dac_reset);
   gpio_remove(dac_txen);
   gpio_remove(adc_pd);

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


int main()
{
   alt_flash_fd* fd;
   int number_of_regions;
   flash_region region;
   char buffer[1024] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16 };
   unsigned int table[64];


   volatile unsigned int *ptr, *csr;
   unsigned int i, counter, size;
   unsigned int reg;
   unsigned int result = 1;
   unsigned int value;

   daq2_init();

   printf("Hello from Nios II!\n");


/*
   reg = *((volatile unsigned int*)(PHY_INTERLAKEN_0_PHY_DATA_CTRL_BASE + (0x18 << 2)));


   *((volatile unsigned int*)(PHY_INTERLAKEN_0_PHY_DATA_CTRL_BASE + (0x06))) = 0x00;
   *((volatile unsigned int*)(PHY_INTERLAKEN_1_PHY_DATA_CTRL_BASE + (0x06))) = 0x00;

   *((volatile unsigned int*)(PHY_INTERLAKEN_0_PHY_DATA_CTRL_BASE + (0x07))) = 0x01;
   *((volatile unsigned int*)(PHY_INTERLAKEN_1_PHY_DATA_CTRL_BASE + (0x07))) = 0x01;

   fd = alt_flash_open_dev(QSPI_CONTROLLER2_0_AVL_MEM_NAME);

   printf("Hello from Nios II!\n");

   // qspi_controller2_0
   // flash_region **info, int *number_of_regions
   alt_qspi_controller2_get_info(fd, &region, &number_of_regions);

   alt_qspi_controller2_read(fd, 0, buffer, 256);

   //alt_qspi_controller2_erase_block(fd, 0);
   //alt_qspi_controller2_write(fd, 0, "Hello World 123456789\0", 22);

   //alt_qspi_controller2_read(fd, 0, buffer, 256);
*/
   return 0;
}
