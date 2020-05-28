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
#include <stdlib.h>
#include <string.h>
#include <sys/alt_timestamp.h>
#include <altera_eth_tse_regs.h>
#include "system.h"
#include "sys/alt_flash_types.h"
#include "sys/alt_flash.h"
#include "sys/alt_exceptions.h"
#include "sys/alt_irq.h"

#include "ethernet.h"
#include "crc.h"
#include "main.h"
#include "iioscope.h"
#include "jesd204b.h"

alt_exception_result exception_handler(alt_exception_cause cause, alt_u32 exception_pc, alt_u32 bad_addr)
{
   alt_exception_result result = NIOS2_EXCEPTION_RETURN_REISSUE_INST;

   return result;
}

int main()
{
   uint32_t net_ctx;

   alt_instruction_exception_register(exception_handler);
   alt_ic_irq_enable(0, 11);
   alt_ic_irq_enable(0, 13);

   /*
   if(memory_testing() != 0)
   {
      printf("RX/TX Memory test failed\n");
   }
   */

   printf("----- FMCDAQ2 Demo -------\n");
   daq2_init();

   daq2_transaction_dac();

   printf("----- Ethernet Init ------\n");
   net_ctx = network_init();

   while(1)
   {
      network_task(net_ctx);
   }

   printf("----- App Terminate ------\n");
   daq2_deinit();

   return 0;
}











