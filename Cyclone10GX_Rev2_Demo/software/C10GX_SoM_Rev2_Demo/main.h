/*
 * main.h
 *
 *  Created on: Apr 22, 2020
 *      Author: A90282
 */

#ifndef MAIN_H_
#define MAIN_H_

#include <stdint.h>
#include <altera_eth_tse_regs.h>

static inline void _nios2_icache_flush(uint32_t offset)
{
   __asm__ volatile ("flushi %0" :: "r" (offset));
}

static inline void _nios2_pipeline_flush(void)
{
   __asm__ volatile ("flushp");
}

static inline void _nios2_dcache_flush(uint32_t offset)
{
   __asm__ volatile ("flushd (%0)" :: "r" (offset));
}


#endif /* MAIN_H_ */
