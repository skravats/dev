/* 
 * "Small Hello World" example. 
 * 
 * This example prints 'Hello from Nios II' to the STDOUT stream. It runs on
 * the Nios II 'standard', 'full_featured', 'fast', and 'low_cost' example 
 * designs. It requires a STDOUT  device in your system's hardware. 
 *
 * The purpose of this example is to demonstrate the smallest possible Hello 
 * World application, using the Nios II HAL library.  The memory footprint
 * of this hosted application is ~332 bytes by default using the standard 
 * reference design.  For a more fully featured Hello World application
 * example, see the example titled "Hello World".
 *
 * The memory footprint of this example has been reduced by making the
 * following changes to the normal "Hello World" example.
 * Check in the Nios II Software Developers Manual for a more complete 
 * description.
 * 
 * In the SW Application project (small_hello_world):
 *
 *  - In the C/C++ Build page
 * 
 *    - Set the Optimization Level to -Os
 * 
 * In System Library project (small_hello_world_syslib):
 *  - In the C/C++ Build page
 * 
 *    - Set the Optimization Level to -Os
 * 
 *    - Define the preprocessor option ALT_NO_INSTRUCTION_EMULATION 
 *      This removes software exception handling, which means that you cannot 
 *      run code compiled for Nios II cpu with a hardware multiplier on a core 
 *      without a the multiply unit. Check the Nios II Software Developers 
 *      Manual for more details.
 *
 *  - In the System Library page:
 *    - Set Periodic system timer and Timestamp timer to none
 *      This prevents the automatic inclusion of the timer driver.
 *
 *    - Set Max file descriptors to 4
 *      This reduces the size of the file handle pool.
 *
 *    - Check Main function does not exit
 *    - Uncheck Clean exit (flush buffers)
 *      This removes the unneeded call to exit when main returns, since it
 *      won't.
 *
 *    - Check Don't use C++
 *      This builds without the C++ support code.
 *
 *    - Check Small C library
 *      This uses a reduced functionality C library, which lacks  
 *      support for buffering, file IO, floating point and getch(), etc. 
 *      Check the Nios II Software Developers Manual for a complete list.
 *
 *    - Check Reduced device drivers
 *      This uses reduced functionality drivers if they're available. For the
 *      standard design this means you get polled UART and JTAG UART drivers,
 *      no support for the LCD driver and you lose the ability to program 
 *      CFI compliant flash devices.
 *
 *    - Check Access device drivers directly
 *      This bypasses the device file system to access device drivers directly.
 *      This eliminates the space required for the device file system services.
 *      It also provides a HAL version of libc services that access the drivers
 *      directly, further reducing space. Only a limited number of libc
 *      functions are available in this configuration.
 *
 *    - Use ALT versions of stdio routines:
 *
 *           Function                  Description
 *        ===============  =====================================
 *        alt_printf       Only supports %s, %x, and %c ( < 1 Kbyte)
 *        alt_putstr       Smaller overhead than puts with direct drivers
 *                         Note this function doesn't add a newline.
 *        alt_putchar      Smaller overhead than putchar with direct drivers
 *        alt_getchar      Smaller overhead than getchar with direct drivers
 *
 */
#include <io.h>
#include <stdio.h>
#include <stdlib.h>

#include "sys/alt_stdio.h"
#include "sys/alt_sys_wrappers.h"
#include "sys/alt_irq.h"
#include "altera_avalon_i2c.h"
#include "system.h"
//#include "Si5345-RevD-C10GX01-Registers.h"
//#include "Si5345-RevD-C10GX01-new-Registers.h" // out9 = 100MHz
#include "Si5345-RevD-C10GX01-Registers-50MHz.h"


#pragma GCC push_options
#pragma GCC optimize ("O0")

ALT_AVALON_I2C_DEV_t *i2c_dev = NULL;

int set_register(ALT_AVALON_I2C_DEV_t *dev, unsigned char address, unsigned int reg, unsigned int value)
{
   int result = 0;
   unsigned char txbuffer[8];
   alt_avalon_i2c_master_target_set(dev, address);

   // set page
   txbuffer[0] = 0x01;
   txbuffer[1] = ((unsigned char)((reg >> 8) & 0x00ff));
   result = alt_avalon_i2c_master_tx(dev, txbuffer, 2, ALT_AVALON_I2C_NO_INTERRUPTS);
   if(result == 0)
   {
      txbuffer[0] = (unsigned char)(reg & 0x00ff);
      txbuffer[1] = (unsigned char)(value & 0x00ff);
      result = alt_avalon_i2c_master_tx(dev, txbuffer, 2, ALT_AVALON_I2C_NO_INTERRUPTS);
   }
   return result;
}

int get_register(ALT_AVALON_I2C_DEV_t *dev, unsigned int address, unsigned int reg, unsigned int *value)
{
   int result = 0;
   unsigned char txbuffer[8];
   unsigned char rxbuffer[8];
   alt_avalon_i2c_master_target_set(dev, address);

   // set page
   txbuffer[0] = 0x01;
   txbuffer[1] = ((unsigned char)((reg >> 8) & 0x00ff));
   result = alt_avalon_i2c_master_tx(dev, txbuffer, 2, ALT_AVALON_I2C_NO_INTERRUPTS);
   if(result == 0)
   {
      // get register
      txbuffer[0] = ((unsigned char)(reg & 0x00ff));
      result = alt_avalon_i2c_master_tx_rx(dev, txbuffer, 1, rxbuffer, 1, ALT_AVALON_I2C_NO_INTERRUPTS);
      if(result == 0)
      {
         *value = (unsigned int)rxbuffer[0];
      }
   }
   return result;
}


int i2c_init()
{
   unsigned char txbuffer[128] = { 0x00, 0x00, 0x00, 0x12, 0x34, 0x56, 0x78, 0x9a };
   unsigned char rxbuffer[128] = { 0x00, 0x00, 0x00, 0x00};
   int result = -1;
   ALT_AVALON_I2C_MASTER_CONFIG_t cfg;
   unsigned int speed;
   i2c_dev = alt_avalon_i2c_open("/dev/i2c");
   if(i2c_dev)
   {
      alt_avalon_i2c_master_config_get(i2c_dev, &cfg);
      //cfg.addr_mode = ALT_AVALON_I2C_ADDR_MODE_7_BIT;
      //cfg.speed_mode = ALT_AVALON_I2C_SPEED_STANDARD;
      result = alt_avalon_i2c_master_config_speed_get(i2c_dev, &cfg, &speed);

      alt_avalon_i2c_master_target_set(i2c_dev, 0x69);
      // set page
      //txbuffer[0] = 0x01;
      //txbuffer[1] = 0x00;
      //result = alt_avalon_i2c_master_tx_rx(i2c_dev, txbuffer, 2, 0, 0, ALT_AVALON_I2C_NO_INTERRUPTS);
      //result += alt_avalon_i2c_master_tx_rx(i2c_dev, txbuffer, 1, rxbuffer, 0x40, ALT_AVALON_I2C_NO_INTERRUPTS);
   }
   return result;
}

int main()
{
   unsigned int value = 0;
   unsigned int reg = 0;
   int result = 0, i;
   result = i2c_init();
   if(result == 0)
   {
      result += get_register(i2c_dev, 0x69, 0x0b, &value);
      for(i = 0; i < SI5345_REVD_REG_CONFIG_NUM_REGS; i++)
      {
         reg = si5345_revd_registers[i].address;
         value = si5345_revd_registers[i].value;
         result = set_register(i2c_dev, 0x69, reg, value);
         if(result != 0)
         {
            break;
         }
         if(i == 2)
         {
            ALT_USLEEP(300000);
         }
      }
   }
   else
   {
      // error
   }
   if(result == 0)
   {
      alt_putstr("PLL configuration done!\n");
   }
   else
   {
      alt_putstr("PLL configuration faied!\n");
   }

   /* Event loop never exits. */
   while (1);

   return 0;
}

#pragma GCC pop_options

