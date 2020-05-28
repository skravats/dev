/*
 * iioscope.h
 *
 *  Created on: May 13, 2020
 *      Author: A90282
 */

#ifndef IIOSCOPE_H_
#define IIOSCOPE_H_

#include <sys/alt_timestamp.h>
#include <stdint.h>
#include "jesd204b.h"

typedef struct _app_data_packet_t
{
   uint8_t  type;
   uint8_t  session_id;
   uint32_t chunk_id;
   uint16_t len;
   uint32_t total_len;
   uint8_t data[0];
}__attribute__((packed, aligned(1))) app_data_packet_t;

typedef struct _app_ctx_t
{
   uint32_t             net_socket;
   uint32_t             net_socket_ctrl;
   alt_timestamp_type   ts;
   uint32_t             ts_frequency;
   alt_timestamp_type   interval;
}app_ctx_t;

void iioscope_process(uint32_t handle);
void iioscope_init();

#endif /* IIOSCOPE_H_ */
