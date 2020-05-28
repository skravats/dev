/*
 * crc.c
 *
 *  Created on: Apr 21, 2020
 *      Author: A90282
 */

#include "crc.h"


// used for calculating checksum in ethernet frame
uint32_t fcs_crc32(uint8_t *buffer, uint16_t size)
{
   uint32_t byte, crc = 0xFFFFFFFF, mask = 0xFFFFFFFF;
   int i = 0, j;
   while (i < size)
   {
      byte = buffer[i];
      crc = crc ^ byte;
      for (j = 7; j >= 0; j--)
      {
         mask = (uint32_t)(-((int)(crc & (uint32_t)0x1)));
         crc = (crc >> 1) ^ (0xEDB88320 & mask);
      }
      i++;
   }
   return ~crc;
}

