/*
 * alt_sys_init.c - HAL initialization source
 *
 * Machine generated for CPU 'mcu_subsystem_cpu_0' in SOPC Builder design 'mcu_subsystem'
 * SOPC Builder design path: ../../mcu_subsystem/mcu_subsystem.sopcinfo
 *
 * Generated: Fri May 15 21:30:18 CEST 2020
 */

/*
 * DO NOT MODIFY THIS FILE
 *
 * Changing this file will have subtle consequences
 * which will almost certainly lead to a nonfunctioning
 * system. If you do modify this file, be aware that your
 * changes will be overwritten and lost when this file
 * is generated again.
 *
 * DO NOT MODIFY THIS FILE
 */

/*
 * License Agreement
 *
 * Copyright (c) 2008
 * Altera Corporation, San Jose, California, USA.
 * All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * This agreement shall be governed in all respects by the laws of the State
 * of California and by the laws of the United States of America.
 */

#include "system.h"
#include "sys/alt_irq.h"
#include "sys/alt_sys_init.h"

#include <stddef.h>

/*
 * Device headers
 */

#include "altera_nios2_gen2_irq.h"
#include "altera_avalon_i2c.h"
#include "altera_avalon_jtag_uart.h"
#include "altera_avalon_spi.h"
#include "altera_avalon_timer.h"
#include "altera_eth_tse.h"
#include "altera_generic_quad_spi_controller2.h"
#include "altera_msgdma.h"

/*
 * Allocate the device storage
 */

ALTERA_NIOS2_GEN2_IRQ_INSTANCE ( MCU_SUBSYSTEM_CPU_0, mcu_subsystem_cpu_0);
ALTERA_AVALON_I2C_INSTANCE ( I2C, i2c);
ALTERA_AVALON_JTAG_UART_INSTANCE ( JTAG_UART_0, jtag_uart_0);
ALTERA_AVALON_SPI_INSTANCE ( SPI, spi);
ALTERA_AVALON_TIMER_INSTANCE ( TIMER_0, timer_0);
ALTERA_AVALON_TIMER_INSTANCE ( TIMER_1, timer_1);
ALTERA_ETH_TSE_INSTANCE ( ETHERNET_MAC, ethernet_mac);
ALTERA_GENERIC_QUAD_SPI_CONTROLLER2_AVL_MEM_AVL_CSR_INSTANCE ( QSPI_CONTROLLER2_0, QSPI_CONTROLLER2_0_AVL_MEM, QSPI_CONTROLLER2_0_AVL_CSR, qspi_controller2_0);
ALTERA_MSGDMA_CSR_DESCRIPTOR_SLAVE_INSTANCE ( ETHERNET_DMA_TX, ETHERNET_DMA_TX_CSR, ETHERNET_DMA_TX_DESCRIPTOR_SLAVE, ethernet_dma_tx);
ALTERA_MSGDMA_CSR_DESCRIPTOR_SLAVE_RESPONSE_INSTANCE ( ETHERNET_DMA_RX, ETHERNET_DMA_RX_CSR, ETHERNET_DMA_RX_DESCRIPTOR_SLAVE, ETHERNET_DMA_RX_RESPONSE, ethernet_dma_rx);

/*
 * Initialize the interrupt controller devices
 * and then enable interrupts in the CPU.
 * Called before alt_sys_init().
 * The "base" parameter is ignored and only
 * present for backwards-compatibility.
 */

void alt_irq_init ( const void* base )
{
    ALTERA_NIOS2_GEN2_IRQ_INIT ( MCU_SUBSYSTEM_CPU_0, mcu_subsystem_cpu_0);
    alt_irq_cpu_enable_interrupts();
}

/*
 * Initialize the non-interrupt controller devices.
 * Called after alt_irq_init().
 */

void alt_sys_init( void )
{
    ALTERA_AVALON_TIMER_INIT ( TIMER_0, timer_0);
    ALTERA_AVALON_TIMER_INIT ( TIMER_1, timer_1);
    ALTERA_AVALON_I2C_INIT ( I2C, i2c);
    ALTERA_AVALON_JTAG_UART_INIT ( JTAG_UART_0, jtag_uart_0);
    ALTERA_AVALON_SPI_INIT ( SPI, spi);
    ALTERA_ETH_TSE_INIT ( ETHERNET_MAC, ethernet_mac);
    ALTERA_GENERIC_QUAD_SPI_CONTROLLER2_INIT ( QSPI_CONTROLLER2_0, qspi_controller2_0);
    ALTERA_MSGDMA_INIT ( ETHERNET_DMA_RX, ethernet_dma_rx);
    ALTERA_MSGDMA_INIT ( ETHERNET_DMA_TX, ethernet_dma_tx);
}
