/*
 * system.h - SOPC Builder system and BSP software package information
 *
 * Machine generated for CPU 'mcu_subsystem_cpu_0' in SOPC Builder design 'mcu_subsystem'
 * SOPC Builder design path: ../../mcu_subsystem/mcu_subsystem.sopcinfo
 *
 * Generated: Tue Jul 23 00:51:06 CEST 2019
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

#ifndef __SYSTEM_H_
#define __SYSTEM_H_

/* Include definitions from linker script generator */
#include "linker.h"


/*
 * CPU configuration
 *
 */

#define ALT_CPU_ARCHITECTURE "altera_nios2_gen2"
#define ALT_CPU_BIG_ENDIAN 0
#define ALT_CPU_BREAK_ADDR 0x00020020
#define ALT_CPU_CPU_ARCH_NIOS2_R1
#define ALT_CPU_CPU_FREQ 125000000u
#define ALT_CPU_CPU_ID_SIZE 1
#define ALT_CPU_CPU_ID_VALUE 0x00000000
#define ALT_CPU_CPU_IMPLEMENTATION "fast"
#define ALT_CPU_DATA_ADDR_WIDTH 0x20
#define ALT_CPU_DCACHE_LINE_SIZE 32
#define ALT_CPU_DCACHE_LINE_SIZE_LOG2 5
#define ALT_CPU_DCACHE_SIZE 2048
#define ALT_CPU_EXCEPTION_ADDR 0x80000020
#define ALT_CPU_FLASH_ACCELERATOR_LINES 0
#define ALT_CPU_FLASH_ACCELERATOR_LINE_SIZE 0
#define ALT_CPU_FLUSHDA_SUPPORTED
#define ALT_CPU_FREQ 125000000
#define ALT_CPU_HARDWARE_DIVIDE_PRESENT 1
#define ALT_CPU_HARDWARE_MULTIPLY_PRESENT 1
#define ALT_CPU_HARDWARE_MULX_PRESENT 1
#define ALT_CPU_HAS_DEBUG_CORE 1
#define ALT_CPU_HAS_DEBUG_STUB
#define ALT_CPU_HAS_DIVISION_ERROR_EXCEPTION
#define ALT_CPU_HAS_EXTRA_EXCEPTION_INFO
#define ALT_CPU_HAS_ILLEGAL_INSTRUCTION_EXCEPTION
#define ALT_CPU_HAS_JMPI_INSTRUCTION
#define ALT_CPU_ICACHE_LINE_SIZE 32
#define ALT_CPU_ICACHE_LINE_SIZE_LOG2 5
#define ALT_CPU_ICACHE_SIZE 2048
#define ALT_CPU_INITDA_SUPPORTED
#define ALT_CPU_INST_ADDR_WIDTH 0x20
#define ALT_CPU_NAME "mcu_subsystem_cpu_0"
#define ALT_CPU_NUM_OF_SHADOW_REG_SETS 0
#define ALT_CPU_OCI_VERSION 1
#define ALT_CPU_RESET_ADDR 0x80000000


/*
 * CPU configuration (with legacy prefix - don't use these anymore)
 *
 */

#define NIOS2_BIG_ENDIAN 0
#define NIOS2_BREAK_ADDR 0x00020020
#define NIOS2_CPU_ARCH_NIOS2_R1
#define NIOS2_CPU_FREQ 125000000u
#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0x00000000
#define NIOS2_CPU_IMPLEMENTATION "fast"
#define NIOS2_DATA_ADDR_WIDTH 0x20
#define NIOS2_DCACHE_LINE_SIZE 32
#define NIOS2_DCACHE_LINE_SIZE_LOG2 5
#define NIOS2_DCACHE_SIZE 2048
#define NIOS2_EXCEPTION_ADDR 0x80000020
#define NIOS2_FLASH_ACCELERATOR_LINES 0
#define NIOS2_FLASH_ACCELERATOR_LINE_SIZE 0
#define NIOS2_FLUSHDA_SUPPORTED
#define NIOS2_HARDWARE_DIVIDE_PRESENT 1
#define NIOS2_HARDWARE_MULTIPLY_PRESENT 1
#define NIOS2_HARDWARE_MULX_PRESENT 1
#define NIOS2_HAS_DEBUG_CORE 1
#define NIOS2_HAS_DEBUG_STUB
#define NIOS2_HAS_DIVISION_ERROR_EXCEPTION
#define NIOS2_HAS_EXTRA_EXCEPTION_INFO
#define NIOS2_HAS_ILLEGAL_INSTRUCTION_EXCEPTION
#define NIOS2_HAS_JMPI_INSTRUCTION
#define NIOS2_ICACHE_LINE_SIZE 32
#define NIOS2_ICACHE_LINE_SIZE_LOG2 5
#define NIOS2_ICACHE_SIZE 2048
#define NIOS2_INITDA_SUPPORTED
#define NIOS2_INST_ADDR_WIDTH 0x20
#define NIOS2_NUM_OF_SHADOW_REG_SETS 0
#define NIOS2_OCI_VERSION 1
#define NIOS2_RESET_ADDR 0x80000000


/*
 * Define for each module class mastered by the CPU
 *
 */

#define __ADI_JESD204
#define __ALTERA_AVALON_I2C
#define __ALTERA_AVALON_JTAG_UART
#define __ALTERA_AVALON_ONCHIP_MEMORY2
#define __ALTERA_AVALON_PIO
#define __ALTERA_AVALON_SPI
#define __ALTERA_AVALON_TIMER
#define __ALTERA_EMIF_C10
#define __ALTERA_GENERIC_QUAD_SPI_CONTROLLER2
#define __ALTERA_NIOS2_GEN2
#define __ALTERA_XCVR_ATX_PLL_A10
#define __AVL_ADXCFG
#define __AXI_AD9144
#define __AXI_AD9680
#define __AXI_DMAC
#define __XCVR_DATA_FLOW_CONTROLLER


/*
 * System configuration
 *
 */

#define ALT_DEVICE_FAMILY "Cyclone 10 GX"
#define ALT_ENHANCED_INTERRUPT_API_PRESENT
#define ALT_IRQ_BASE NULL
#define ALT_LOG_PORT "/dev/null"
#define ALT_LOG_PORT_BASE 0x0
#define ALT_LOG_PORT_DEV null
#define ALT_LOG_PORT_TYPE ""
#define ALT_NUM_EXTERNAL_INTERRUPT_CONTROLLERS 0
#define ALT_NUM_INTERNAL_INTERRUPT_CONTROLLERS 1
#define ALT_NUM_INTERRUPT_CONTROLLERS 1
#define ALT_STDERR "/dev/jtag_uart_0"
#define ALT_STDERR_BASE 0x21000
#define ALT_STDERR_DEV jtag_uart_0
#define ALT_STDERR_IS_JTAG_UART
#define ALT_STDERR_PRESENT
#define ALT_STDERR_TYPE "altera_avalon_jtag_uart"
#define ALT_STDIN "/dev/jtag_uart_0"
#define ALT_STDIN_BASE 0x21000
#define ALT_STDIN_DEV jtag_uart_0
#define ALT_STDIN_IS_JTAG_UART
#define ALT_STDIN_PRESENT
#define ALT_STDIN_TYPE "altera_avalon_jtag_uart"
#define ALT_STDOUT "/dev/jtag_uart_0"
#define ALT_STDOUT_BASE 0x21000
#define ALT_STDOUT_DEV jtag_uart_0
#define ALT_STDOUT_IS_JTAG_UART
#define ALT_STDOUT_PRESENT
#define ALT_STDOUT_TYPE "altera_avalon_jtag_uart"
#define ALT_SYSTEM_NAME "mcu_subsystem"


/*
 * ad9144_core configuration
 *
 */

#define AD9144_CORE_BASE 0x40000
#define AD9144_CORE_IRQ -1
#define AD9144_CORE_IRQ_INTERRUPT_CONTROLLER_ID -1
#define AD9144_CORE_NAME "/dev/ad9144_core"
#define AD9144_CORE_SPAN 65536
#define AD9144_CORE_TYPE "axi_ad9144"
#define ALT_MODULE_CLASS_ad9144_core axi_ad9144


/*
 * ad9144_dma configuration
 *
 */

#define AD9144_DMA_BASE 0x2e000
#define AD9144_DMA_IRQ 9
#define AD9144_DMA_IRQ_INTERRUPT_CONTROLLER_ID 0
#define AD9144_DMA_NAME "/dev/ad9144_dma"
#define AD9144_DMA_SPAN 4096
#define AD9144_DMA_TYPE "axi_dmac"
#define ALT_MODULE_CLASS_ad9144_dma axi_dmac


/*
 * ad9144_jesd204_lane_pll_reconfig configuration
 *
 */

#define AD9144_JESD204_LANE_PLL_RECONFIG_BASE 0x5b000
#define AD9144_JESD204_LANE_PLL_RECONFIG_IRQ -1
#define AD9144_JESD204_LANE_PLL_RECONFIG_IRQ_INTERRUPT_CONTROLLER_ID -1
#define AD9144_JESD204_LANE_PLL_RECONFIG_NAME "/dev/ad9144_jesd204_lane_pll_reconfig"
#define AD9144_JESD204_LANE_PLL_RECONFIG_SPAN 4096
#define AD9144_JESD204_LANE_PLL_RECONFIG_TYPE "adi_jesd204"
#define ALT_MODULE_CLASS_ad9144_jesd204_lane_pll_reconfig adi_jesd204


/*
 * ad9144_jesd204_link_management configuration
 *
 */

#define AD9144_JESD204_LINK_MANAGEMENT_BASE 0x5a000
#define AD9144_JESD204_LINK_MANAGEMENT_IRQ -1
#define AD9144_JESD204_LINK_MANAGEMENT_IRQ_INTERRUPT_CONTROLLER_ID -1
#define AD9144_JESD204_LINK_MANAGEMENT_NAME "/dev/ad9144_jesd204_link_management"
#define AD9144_JESD204_LINK_MANAGEMENT_SPAN 4096
#define AD9144_JESD204_LINK_MANAGEMENT_TYPE "adi_jesd204"
#define ALT_MODULE_CLASS_ad9144_jesd204_link_management adi_jesd204


/*
 * ad9144_jesd204_link_pll_reconfig configuration
 *
 */

#define AD9144_JESD204_LINK_PLL_RECONFIG_BASE 0x58000
#define AD9144_JESD204_LINK_PLL_RECONFIG_IRQ -1
#define AD9144_JESD204_LINK_PLL_RECONFIG_IRQ_INTERRUPT_CONTROLLER_ID -1
#define AD9144_JESD204_LINK_PLL_RECONFIG_NAME "/dev/ad9144_jesd204_link_pll_reconfig"
#define AD9144_JESD204_LINK_PLL_RECONFIG_SPAN 4096
#define AD9144_JESD204_LINK_PLL_RECONFIG_TYPE "adi_jesd204"
#define ALT_MODULE_CLASS_ad9144_jesd204_link_pll_reconfig adi_jesd204


/*
 * ad9144_jesd204_link_reconfig configuration
 *
 */

#define AD9144_JESD204_LINK_RECONFIG_BASE 0x28000
#define AD9144_JESD204_LINK_RECONFIG_IRQ -1
#define AD9144_JESD204_LINK_RECONFIG_IRQ_INTERRUPT_CONTROLLER_ID -1
#define AD9144_JESD204_LINK_RECONFIG_NAME "/dev/ad9144_jesd204_link_reconfig"
#define AD9144_JESD204_LINK_RECONFIG_SPAN 16384
#define AD9144_JESD204_LINK_RECONFIG_TYPE "adi_jesd204"
#define ALT_MODULE_CLASS_ad9144_jesd204_link_reconfig adi_jesd204


/*
 * ad9680_core configuration
 *
 */

#define AD9680_CORE_BASE 0x30000
#define AD9680_CORE_IRQ -1
#define AD9680_CORE_IRQ_INTERRUPT_CONTROLLER_ID -1
#define AD9680_CORE_NAME "/dev/ad9680_core"
#define AD9680_CORE_SPAN 65536
#define AD9680_CORE_TYPE "axi_ad9680"
#define ALT_MODULE_CLASS_ad9680_core axi_ad9680


/*
 * ad9680_dma configuration
 *
 */

#define AD9680_DMA_BASE 0x2d000
#define AD9680_DMA_IRQ 11
#define AD9680_DMA_IRQ_INTERRUPT_CONTROLLER_ID 0
#define AD9680_DMA_NAME "/dev/ad9680_dma"
#define AD9680_DMA_SPAN 4096
#define AD9680_DMA_TYPE "axi_dmac"
#define ALT_MODULE_CLASS_ad9680_dma axi_dmac


/*
 * ad9680_jesd204_link_management configuration
 *
 */

#define AD9680_JESD204_LINK_MANAGEMENT_BASE 0x59000
#define AD9680_JESD204_LINK_MANAGEMENT_IRQ -1
#define AD9680_JESD204_LINK_MANAGEMENT_IRQ_INTERRUPT_CONTROLLER_ID -1
#define AD9680_JESD204_LINK_MANAGEMENT_NAME "/dev/ad9680_jesd204_link_management"
#define AD9680_JESD204_LINK_MANAGEMENT_SPAN 4096
#define AD9680_JESD204_LINK_MANAGEMENT_TYPE "adi_jesd204"
#define ALT_MODULE_CLASS_ad9680_jesd204_link_management adi_jesd204


/*
 * ad9680_jesd204_link_pll_reconfig configuration
 *
 */

#define AD9680_JESD204_LINK_PLL_RECONFIG_BASE 0x57000
#define AD9680_JESD204_LINK_PLL_RECONFIG_IRQ -1
#define AD9680_JESD204_LINK_PLL_RECONFIG_IRQ_INTERRUPT_CONTROLLER_ID -1
#define AD9680_JESD204_LINK_PLL_RECONFIG_NAME "/dev/ad9680_jesd204_link_pll_reconfig"
#define AD9680_JESD204_LINK_PLL_RECONFIG_SPAN 4096
#define AD9680_JESD204_LINK_PLL_RECONFIG_TYPE "adi_jesd204"
#define ALT_MODULE_CLASS_ad9680_jesd204_link_pll_reconfig adi_jesd204


/*
 * ad9680_jesd204_link_reconfig configuration
 *
 */

#define AD9680_JESD204_LINK_RECONFIG_BASE 0x24000
#define AD9680_JESD204_LINK_RECONFIG_IRQ -1
#define AD9680_JESD204_LINK_RECONFIG_IRQ_INTERRUPT_CONTROLLER_ID -1
#define AD9680_JESD204_LINK_RECONFIG_NAME "/dev/ad9680_jesd204_link_reconfig"
#define AD9680_JESD204_LINK_RECONFIG_SPAN 16384
#define AD9680_JESD204_LINK_RECONFIG_TYPE "adi_jesd204"
#define ALT_MODULE_CLASS_ad9680_jesd204_link_reconfig adi_jesd204


/*
 * avl_adxcfg_0_rcfg_s0 configuration
 *
 */

#define ALT_MODULE_CLASS_avl_adxcfg_0_rcfg_s0 avl_adxcfg
#define AVL_ADXCFG_0_RCFG_S0_BASE 0x56000
#define AVL_ADXCFG_0_RCFG_S0_IRQ -1
#define AVL_ADXCFG_0_RCFG_S0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define AVL_ADXCFG_0_RCFG_S0_NAME "/dev/avl_adxcfg_0_rcfg_s0"
#define AVL_ADXCFG_0_RCFG_S0_SPAN 4096
#define AVL_ADXCFG_0_RCFG_S0_TYPE "avl_adxcfg"


/*
 * avl_adxcfg_0_rcfg_s1 configuration
 *
 */

#define ALT_MODULE_CLASS_avl_adxcfg_0_rcfg_s1 avl_adxcfg
#define AVL_ADXCFG_0_RCFG_S1_BASE 0x52000
#define AVL_ADXCFG_0_RCFG_S1_IRQ -1
#define AVL_ADXCFG_0_RCFG_S1_IRQ_INTERRUPT_CONTROLLER_ID -1
#define AVL_ADXCFG_0_RCFG_S1_NAME "/dev/avl_adxcfg_0_rcfg_s1"
#define AVL_ADXCFG_0_RCFG_S1_SPAN 4096
#define AVL_ADXCFG_0_RCFG_S1_TYPE "avl_adxcfg"


/*
 * avl_adxcfg_1_rcfg_s0 configuration
 *
 */

#define ALT_MODULE_CLASS_avl_adxcfg_1_rcfg_s0 avl_adxcfg
#define AVL_ADXCFG_1_RCFG_S0_BASE 0x55000
#define AVL_ADXCFG_1_RCFG_S0_IRQ -1
#define AVL_ADXCFG_1_RCFG_S0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define AVL_ADXCFG_1_RCFG_S0_NAME "/dev/avl_adxcfg_1_rcfg_s0"
#define AVL_ADXCFG_1_RCFG_S0_SPAN 4096
#define AVL_ADXCFG_1_RCFG_S0_TYPE "avl_adxcfg"


/*
 * avl_adxcfg_1_rcfg_s1 configuration
 *
 */

#define ALT_MODULE_CLASS_avl_adxcfg_1_rcfg_s1 avl_adxcfg
#define AVL_ADXCFG_1_RCFG_S1_BASE 0x51000
#define AVL_ADXCFG_1_RCFG_S1_IRQ -1
#define AVL_ADXCFG_1_RCFG_S1_IRQ_INTERRUPT_CONTROLLER_ID -1
#define AVL_ADXCFG_1_RCFG_S1_NAME "/dev/avl_adxcfg_1_rcfg_s1"
#define AVL_ADXCFG_1_RCFG_S1_SPAN 4096
#define AVL_ADXCFG_1_RCFG_S1_TYPE "avl_adxcfg"


/*
 * avl_adxcfg_2_rcfg_s0 configuration
 *
 */

#define ALT_MODULE_CLASS_avl_adxcfg_2_rcfg_s0 avl_adxcfg
#define AVL_ADXCFG_2_RCFG_S0_BASE 0x54000
#define AVL_ADXCFG_2_RCFG_S0_IRQ -1
#define AVL_ADXCFG_2_RCFG_S0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define AVL_ADXCFG_2_RCFG_S0_NAME "/dev/avl_adxcfg_2_rcfg_s0"
#define AVL_ADXCFG_2_RCFG_S0_SPAN 4096
#define AVL_ADXCFG_2_RCFG_S0_TYPE "avl_adxcfg"


/*
 * avl_adxcfg_2_rcfg_s1 configuration
 *
 */

#define ALT_MODULE_CLASS_avl_adxcfg_2_rcfg_s1 avl_adxcfg
#define AVL_ADXCFG_2_RCFG_S1_BASE 0x50000
#define AVL_ADXCFG_2_RCFG_S1_IRQ -1
#define AVL_ADXCFG_2_RCFG_S1_IRQ_INTERRUPT_CONTROLLER_ID -1
#define AVL_ADXCFG_2_RCFG_S1_NAME "/dev/avl_adxcfg_2_rcfg_s1"
#define AVL_ADXCFG_2_RCFG_S1_SPAN 4096
#define AVL_ADXCFG_2_RCFG_S1_TYPE "avl_adxcfg"


/*
 * avl_adxcfg_3_rcfg_s0 configuration
 *
 */

#define ALT_MODULE_CLASS_avl_adxcfg_3_rcfg_s0 avl_adxcfg
#define AVL_ADXCFG_3_RCFG_S0_BASE 0x53000
#define AVL_ADXCFG_3_RCFG_S0_IRQ -1
#define AVL_ADXCFG_3_RCFG_S0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define AVL_ADXCFG_3_RCFG_S0_NAME "/dev/avl_adxcfg_3_rcfg_s0"
#define AVL_ADXCFG_3_RCFG_S0_SPAN 4096
#define AVL_ADXCFG_3_RCFG_S0_TYPE "avl_adxcfg"


/*
 * avl_adxcfg_3_rcfg_s1 configuration
 *
 */

#define ALT_MODULE_CLASS_avl_adxcfg_3_rcfg_s1 avl_adxcfg
#define AVL_ADXCFG_3_RCFG_S1_BASE 0x2f000
#define AVL_ADXCFG_3_RCFG_S1_IRQ -1
#define AVL_ADXCFG_3_RCFG_S1_IRQ_INTERRUPT_CONTROLLER_ID -1
#define AVL_ADXCFG_3_RCFG_S1_NAME "/dev/avl_adxcfg_3_rcfg_s1"
#define AVL_ADXCFG_3_RCFG_S1_SPAN 4096
#define AVL_ADXCFG_3_RCFG_S1_TYPE "avl_adxcfg"


/*
 * fmc_gpio configuration
 *
 */

#define ALT_MODULE_CLASS_fmc_gpio altera_avalon_pio
#define FMC_GPIO_BASE 0x210c0
#define FMC_GPIO_BIT_CLEARING_EDGE_REGISTER 0
#define FMC_GPIO_BIT_MODIFYING_OUTPUT_REGISTER 1
#define FMC_GPIO_CAPTURE 0
#define FMC_GPIO_DATA_WIDTH 32
#define FMC_GPIO_DO_TEST_BENCH_WIRING 0
#define FMC_GPIO_DRIVEN_SIM_VALUE 0
#define FMC_GPIO_EDGE_TYPE "NONE"
#define FMC_GPIO_FREQ 125000000
#define FMC_GPIO_HAS_IN 1
#define FMC_GPIO_HAS_OUT 1
#define FMC_GPIO_HAS_TRI 0
#define FMC_GPIO_IRQ 14
#define FMC_GPIO_IRQ_INTERRUPT_CONTROLLER_ID 0
#define FMC_GPIO_IRQ_TYPE "LEVEL"
#define FMC_GPIO_NAME "/dev/fmc_gpio"
#define FMC_GPIO_RESET_VALUE 0
#define FMC_GPIO_SPAN 32
#define FMC_GPIO_TYPE "altera_avalon_pio"


/*
 * fmc_i2c configuration
 *
 */

#define ALT_MODULE_CLASS_fmc_i2c altera_avalon_i2c
#define FMC_I2C_BASE 0x21080
#define FMC_I2C_FIFO_DEPTH 4
#define FMC_I2C_FREQ 125000000
#define FMC_I2C_IRQ 13
#define FMC_I2C_IRQ_INTERRUPT_CONTROLLER_ID 0
#define FMC_I2C_NAME "/dev/fmc_i2c"
#define FMC_I2C_SPAN 64
#define FMC_I2C_TYPE "altera_avalon_i2c"
#define FMC_I2C_USE_AV_ST 0


/*
 * fmc_spi configuration
 *
 */

#define ALT_MODULE_CLASS_fmc_spi altera_avalon_spi
#define FMC_SPI_BASE 0x21020
#define FMC_SPI_CLOCKMULT 1
#define FMC_SPI_CLOCKPHASE 0
#define FMC_SPI_CLOCKPOLARITY 0
#define FMC_SPI_CLOCKUNITS "Hz"
#define FMC_SPI_DATABITS 8
#define FMC_SPI_DATAWIDTH 16
#define FMC_SPI_DELAYMULT "1.0E-9"
#define FMC_SPI_DELAYUNITS "ns"
#define FMC_SPI_EXTRADELAY 0
#define FMC_SPI_INSERT_SYNC 0
#define FMC_SPI_IRQ 12
#define FMC_SPI_IRQ_INTERRUPT_CONTROLLER_ID 0
#define FMC_SPI_ISMASTER 1
#define FMC_SPI_LSBFIRST 0
#define FMC_SPI_NAME "/dev/fmc_spi"
#define FMC_SPI_NUMSLAVES 8
#define FMC_SPI_PREFIX "spi_"
#define FMC_SPI_SPAN 32
#define FMC_SPI_SYNC_REG_DEPTH 2
#define FMC_SPI_TARGETCLOCK 10000000u
#define FMC_SPI_TARGETSSDELAY "0.0"
#define FMC_SPI_TYPE "altera_avalon_spi"


/*
 * hal configuration
 *
 */

#define ALT_INCLUDE_INSTRUCTION_RELATED_EXCEPTION_API
#define ALT_MAX_FD 32
#define ALT_SYS_CLK TIMER_0
#define ALT_TIMESTAMP_CLK none


/*
 * jtag_uart_0 configuration
 *
 */

#define ALT_MODULE_CLASS_jtag_uart_0 altera_avalon_jtag_uart
#define JTAG_UART_0_BASE 0x21000
#define JTAG_UART_0_IRQ 1
#define JTAG_UART_0_IRQ_INTERRUPT_CONTROLLER_ID 0
#define JTAG_UART_0_NAME "/dev/jtag_uart_0"
#define JTAG_UART_0_READ_DEPTH 64
#define JTAG_UART_0_READ_THRESHOLD 8
#define JTAG_UART_0_SPAN 8
#define JTAG_UART_0_TYPE "altera_avalon_jtag_uart"
#define JTAG_UART_0_WRITE_DEPTH 64
#define JTAG_UART_0_WRITE_THRESHOLD 8


/*
 * mcu_subsystem_ram_0 configuration
 *
 */

#define ALT_MODULE_CLASS_mcu_subsystem_ram_0 altera_avalon_onchip_memory2
#define MCU_SUBSYSTEM_RAM_0_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define MCU_SUBSYSTEM_RAM_0_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define MCU_SUBSYSTEM_RAM_0_BASE 0x0
#define MCU_SUBSYSTEM_RAM_0_CONTENTS_INFO ""
#define MCU_SUBSYSTEM_RAM_0_DUAL_PORT 0
#define MCU_SUBSYSTEM_RAM_0_GUI_RAM_BLOCK_TYPE "AUTO"
#define MCU_SUBSYSTEM_RAM_0_INIT_CONTENTS_FILE "mcu_subsystem_ram_0_mcu_subsystem_ram_0"
#define MCU_SUBSYSTEM_RAM_0_INIT_MEM_CONTENT 1
#define MCU_SUBSYSTEM_RAM_0_INSTANCE_ID "NONE"
#define MCU_SUBSYSTEM_RAM_0_IRQ -1
#define MCU_SUBSYSTEM_RAM_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define MCU_SUBSYSTEM_RAM_0_NAME "/dev/mcu_subsystem_ram_0"
#define MCU_SUBSYSTEM_RAM_0_NON_DEFAULT_INIT_FILE_ENABLED 0
#define MCU_SUBSYSTEM_RAM_0_RAM_BLOCK_TYPE "AUTO"
#define MCU_SUBSYSTEM_RAM_0_READ_DURING_WRITE_MODE "DONT_CARE"
#define MCU_SUBSYSTEM_RAM_0_SINGLE_CLOCK_OP 0
#define MCU_SUBSYSTEM_RAM_0_SIZE_MULTIPLE 1
#define MCU_SUBSYSTEM_RAM_0_SIZE_VALUE 131072
#define MCU_SUBSYSTEM_RAM_0_SPAN 131072
#define MCU_SUBSYSTEM_RAM_0_TYPE "altera_avalon_onchip_memory2"
#define MCU_SUBSYSTEM_RAM_0_WRITABLE 1


/*
 * phy_interlaken_0_phy_data_ctrl configuration
 *
 */

#define ALT_MODULE_CLASS_phy_interlaken_0_phy_data_ctrl xcvr_data_flow_controller
#define PHY_INTERLAKEN_0_PHY_DATA_CTRL_BASE 0x20c00
#define PHY_INTERLAKEN_0_PHY_DATA_CTRL_IRQ -1
#define PHY_INTERLAKEN_0_PHY_DATA_CTRL_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PHY_INTERLAKEN_0_PHY_DATA_CTRL_NAME "/dev/phy_interlaken_0_phy_data_ctrl"
#define PHY_INTERLAKEN_0_PHY_DATA_CTRL_SPAN 1024
#define PHY_INTERLAKEN_0_PHY_DATA_CTRL_TYPE "xcvr_data_flow_controller"


/*
 * phy_interlaken_0_serial_clock configuration
 *
 */

#define ALT_MODULE_CLASS_phy_interlaken_0_serial_clock altera_xcvr_atx_pll_a10
#define PHY_INTERLAKEN_0_SERIAL_CLOCK_BASE 0x2c000
#define PHY_INTERLAKEN_0_SERIAL_CLOCK_IRQ -1
#define PHY_INTERLAKEN_0_SERIAL_CLOCK_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PHY_INTERLAKEN_0_SERIAL_CLOCK_NAME "/dev/phy_interlaken_0_serial_clock"
#define PHY_INTERLAKEN_0_SERIAL_CLOCK_SPAN 4096
#define PHY_INTERLAKEN_0_SERIAL_CLOCK_TYPE "altera_xcvr_atx_pll_a10"


/*
 * phy_interlaken_1_phy_data_ctrl configuration
 *
 */

#define ALT_MODULE_CLASS_phy_interlaken_1_phy_data_ctrl xcvr_data_flow_controller
#define PHY_INTERLAKEN_1_PHY_DATA_CTRL_BASE 0x20800
#define PHY_INTERLAKEN_1_PHY_DATA_CTRL_IRQ -1
#define PHY_INTERLAKEN_1_PHY_DATA_CTRL_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PHY_INTERLAKEN_1_PHY_DATA_CTRL_NAME "/dev/phy_interlaken_1_phy_data_ctrl"
#define PHY_INTERLAKEN_1_PHY_DATA_CTRL_SPAN 1024
#define PHY_INTERLAKEN_1_PHY_DATA_CTRL_TYPE "xcvr_data_flow_controller"


/*
 * phy_interlaken_1_serial_clock configuration
 *
 */

#define ALT_MODULE_CLASS_phy_interlaken_1_serial_clock altera_xcvr_atx_pll_a10
#define PHY_INTERLAKEN_1_SERIAL_CLOCK_BASE 0x23000
#define PHY_INTERLAKEN_1_SERIAL_CLOCK_IRQ -1
#define PHY_INTERLAKEN_1_SERIAL_CLOCK_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PHY_INTERLAKEN_1_SERIAL_CLOCK_NAME "/dev/phy_interlaken_1_serial_clock"
#define PHY_INTERLAKEN_1_SERIAL_CLOCK_SPAN 4096
#define PHY_INTERLAKEN_1_SERIAL_CLOCK_TYPE "altera_xcvr_atx_pll_a10"


/*
 * qspi_controller2_0_avl_csr configuration
 *
 */

#define ALT_MODULE_CLASS_qspi_controller2_0_avl_csr altera_generic_quad_spi_controller2
#define QSPI_CONTROLLER2_0_AVL_CSR_BASE 0x21040
#define QSPI_CONTROLLER2_0_AVL_CSR_FLASH_TYPE "MT25QU01G"
#define QSPI_CONTROLLER2_0_AVL_CSR_IRQ 0
#define QSPI_CONTROLLER2_0_AVL_CSR_IRQ_INTERRUPT_CONTROLLER_ID 0
#define QSPI_CONTROLLER2_0_AVL_CSR_IS_EPCS 0
#define QSPI_CONTROLLER2_0_AVL_CSR_NAME "/dev/qspi_controller2_0_avl_csr"
#define QSPI_CONTROLLER2_0_AVL_CSR_NUMBER_OF_SECTORS 2048
#define QSPI_CONTROLLER2_0_AVL_CSR_PAGE_SIZE 256
#define QSPI_CONTROLLER2_0_AVL_CSR_SECTOR_SIZE 65536
#define QSPI_CONTROLLER2_0_AVL_CSR_SPAN 64
#define QSPI_CONTROLLER2_0_AVL_CSR_SUBSECTOR_SIZE 4096
#define QSPI_CONTROLLER2_0_AVL_CSR_TYPE "altera_generic_quad_spi_controller2"


/*
 * qspi_controller2_0_avl_mem configuration
 *
 */

#define ALT_MODULE_CLASS_qspi_controller2_0_avl_mem altera_generic_quad_spi_controller2
#define QSPI_CONTROLLER2_0_AVL_MEM_BASE 0x8000000
#define QSPI_CONTROLLER2_0_AVL_MEM_FLASH_TYPE "MT25QU01G"
#define QSPI_CONTROLLER2_0_AVL_MEM_IRQ -1
#define QSPI_CONTROLLER2_0_AVL_MEM_IRQ_INTERRUPT_CONTROLLER_ID -1
#define QSPI_CONTROLLER2_0_AVL_MEM_IS_EPCS 0
#define QSPI_CONTROLLER2_0_AVL_MEM_NAME "/dev/qspi_controller2_0_avl_mem"
#define QSPI_CONTROLLER2_0_AVL_MEM_NUMBER_OF_SECTORS 2048
#define QSPI_CONTROLLER2_0_AVL_MEM_PAGE_SIZE 256
#define QSPI_CONTROLLER2_0_AVL_MEM_SECTOR_SIZE 65536
#define QSPI_CONTROLLER2_0_AVL_MEM_SPAN 134217728
#define QSPI_CONTROLLER2_0_AVL_MEM_SUBSECTOR_SIZE 4096
#define QSPI_CONTROLLER2_0_AVL_MEM_TYPE "altera_generic_quad_spi_controller2"


/*
 * sdram_ctrl_amm_0 configuration
 *
 */

#define ALT_MODULE_CLASS_sdram_ctrl_amm_0 altera_emif_c10
#define SDRAM_CTRL_AMM_0_BASE 0x80000000
#define SDRAM_CTRL_AMM_0_IRQ -1
#define SDRAM_CTRL_AMM_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SDRAM_CTRL_AMM_0_NAME "/dev/sdram_ctrl_amm_0"
#define SDRAM_CTRL_AMM_0_SPAN 2147483648
#define SDRAM_CTRL_AMM_0_TYPE "altera_emif_c10"


/*
 * sdram_ctrl_mmr_slave_0 configuration
 *
 */

#define ALT_MODULE_CLASS_sdram_ctrl_mmr_slave_0 altera_emif_c10
#define SDRAM_CTRL_MMR_SLAVE_0_BASE 0x22000
#define SDRAM_CTRL_MMR_SLAVE_0_IRQ -1
#define SDRAM_CTRL_MMR_SLAVE_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SDRAM_CTRL_MMR_SLAVE_0_NAME "/dev/sdram_ctrl_mmr_slave_0"
#define SDRAM_CTRL_MMR_SLAVE_0_SPAN 4096
#define SDRAM_CTRL_MMR_SLAVE_0_TYPE "altera_emif_c10"


/*
 * timer_0 configuration
 *
 */

#define ALT_MODULE_CLASS_timer_0 altera_avalon_timer
#define TIMER_0_ALWAYS_RUN 0
#define TIMER_0_BASE 0x210e0
#define TIMER_0_COUNTER_SIZE 32
#define TIMER_0_FIXED_PERIOD 0
#define TIMER_0_FREQ 125000000
#define TIMER_0_IRQ 3
#define TIMER_0_IRQ_INTERRUPT_CONTROLLER_ID 0
#define TIMER_0_LOAD_VALUE 124999
#define TIMER_0_MULT 0.001
#define TIMER_0_NAME "/dev/timer_0"
#define TIMER_0_PERIOD 1
#define TIMER_0_PERIOD_UNITS "ms"
#define TIMER_0_RESET_OUTPUT 0
#define TIMER_0_SNAPSHOT 1
#define TIMER_0_SPAN 32
#define TIMER_0_TICKS_PER_SEC 1000
#define TIMER_0_TIMEOUT_PULSE_OUTPUT 0
#define TIMER_0_TYPE "altera_avalon_timer"


/*
 * timer_1 configuration
 *
 */

#define ALT_MODULE_CLASS_timer_1 altera_avalon_timer
#define TIMER_1_ALWAYS_RUN 0
#define TIMER_1_BASE 0x21100
#define TIMER_1_COUNTER_SIZE 32
#define TIMER_1_FIXED_PERIOD 0
#define TIMER_1_FREQ 125000000
#define TIMER_1_IRQ 2
#define TIMER_1_IRQ_INTERRUPT_CONTROLLER_ID 0
#define TIMER_1_LOAD_VALUE 124
#define TIMER_1_MULT 1.0E-6
#define TIMER_1_NAME "/dev/timer_1"
#define TIMER_1_PERIOD 1
#define TIMER_1_PERIOD_UNITS "us"
#define TIMER_1_RESET_OUTPUT 0
#define TIMER_1_SNAPSHOT 1
#define TIMER_1_SPAN 32
#define TIMER_1_TICKS_PER_SEC 1000000
#define TIMER_1_TIMEOUT_PULSE_OUTPUT 0
#define TIMER_1_TYPE "altera_avalon_timer"

#endif /* __SYSTEM_H_ */
