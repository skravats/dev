/*
 * iioscope.c
 *
 *  Created on: May 13, 2020
 *      Author: A90282
 */
#include "iioscope.h"
#include "ethernet.h"
#include "support.h"


static app_ctx_t app_ctx;

#define APP_INTERVAL_MS    50
#define APP_DST_PORT       0x1020
#define APP_CTRL_DST_PORT  0x1021
#define APP_TARGET_IP      0x9c0aa8c0

static uint8_t iio_buffer_tx[5000];
static uint8_t iio_buffer_rx[5000];

void iioscope_init()
{
   app_ctx.net_socket   = 0;
   app_ctx.ts           = alt_timestamp();
   app_ctx.ts_frequency = alt_timestamp_freq();
   app_ctx.interval     = app_ctx.ts_frequency / 1000 * APP_INTERVAL_MS;
   memset(iio_buffer_rx, 0, sizeof(iio_buffer_rx));
   memset(iio_buffer_tx, 0, sizeof(iio_buffer_tx));
}

void iioscope_process_rx(uint8_t *buffer, uint32_t len)
{
   eth_udp_packet_t *udp = (eth_udp_packet_t*)buffer;
   app_data_packet_t *data = (app_data_packet_t*)(udp->data);
}

void iioscope_process_ctrl_rx(uint8_t *buffer, uint32_t len)
{
   eth_udp_packet_t *udp = (eth_udp_packet_t*)buffer;
   app_data_packet_t *data = (app_data_packet_t*)(udp->data);
}

void iioscope_process(uint32_t handle)
{
   ip_addr_t target_ip;
   alt_timestamp_type ts = alt_timestamp();
   if((ts - app_ctx.ts) >= app_ctx.interval)
   {
      app_ctx.ts = ts;
      if(app_ctx.net_socket == 0)
      {
         target_ip.addr32 = APP_TARGET_IP;
         app_ctx.net_socket = open_socket(target_ip, APP_DST_PORT, APP_DST_PORT, IPV4_PROTOCOL_UDP, iioscope_process_rx);
      }
      if(app_ctx.net_socket_ctrl == 0)
      {
         app_ctx.net_socket_ctrl = open_socket(target_ip, APP_CTRL_DST_PORT, APP_CTRL_DST_PORT, IPV4_PROTOCOL_UDP, iioscope_process_ctrl_rx);
      }


      if(app_ctx.net_socket != 0)
      {
         daq2_transaction_adc();
         udp_send(app_ctx.net_socket, (uint8_t*)get_adc_buffer(), DMA_NUMBER_OF_SAMPLES);
      }
   }
}
