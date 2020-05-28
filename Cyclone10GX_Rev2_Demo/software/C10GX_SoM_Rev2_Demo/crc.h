/*
 * crc.h
 *
 *  Created on: Apr 21, 2020
 *      Author: A90282
 */

#ifndef CRC_H_
#define CRC_H_

#include <stdint.h>

uint32_t fcs_crc32(uint8_t *buffer, uint16_t size);

#endif /* CRC_H_ */
