/*
 * jesd204b.h
 *
 *  Created on: May 15, 2020
 *      Author: A90282
 */

#ifndef JESD204B_H_
#define JESD204B_H_

#include <stdint.h>
#include <system.h>

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

#define DMA_NUMBER_OF_SAMPLES 4096

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

typedef struct _fmcdaq2_ctx_t
{
   spi_init_param                ad9523_spi_param;
   spi_init_param                ad9144_spi_param;
   spi_init_param                ad9680_spi_param;

   // R. Gisko
   struct ad9523_channel_spec    ad9523_channels[8];
   struct ad9523_platform_data   ad9523_pdata;
   struct ad9523_init_param      ad9523_param;
   struct ad9144_init_param      ad9144_param;
   struct ad9680_init_param      ad9680_param;

   struct ad9523_dev             *ad9523_device;
   struct ad9144_dev             *ad9144_device;
   struct ad9680_dev             *ad9680_device;

   dac_core                      ad9144_core;
   dac_channel                   ad9144_channels[2];
   jesd_core                     ad9144_jesd;         // https://wiki.analog.com/resources/fpga/peripherals/jesd204/axi_jesd204_tx
   dmac_core                     ad9144_dma;
   xcvr_core                     ad9144_xcvr;
   adc_core                      ad9680_core;
   jesd_core                     ad9680_jesd;
   xcvr_core                     ad9680_xcvr;
   dmac_core                     ad9680_dma;
   dmac_xfer                     rx_xfer;
   dmac_xfer                     tx_xfer;

   gpio_desc                     *clkd_sync;
   gpio_desc                     *dac_reset;
   gpio_desc                     *dac_txen;
   gpio_desc                     *adc_pd;

   uint32_t                      rx_xfer_buf[0x1000000];
   uint32_t                      tx_xfer_buf[0x1000000];
}fmcdaq2_ctx_t;


static void axi_jesd204_tx_irq (void *context);
static void axi_jesd204_rx_irq (void *context);
int daq2_init();
int daq2_deinit();
int daq2_transaction_adc();
int daq2_transaction_dac();
uint32_t *get_adc_buffer();

#endif /* JESD204B_H_ */
