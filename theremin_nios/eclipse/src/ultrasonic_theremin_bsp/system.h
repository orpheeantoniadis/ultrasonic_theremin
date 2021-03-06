/*
 * system.h - SOPC Builder system and BSP software package information
 *
 * Machine generated for CPU 'cpu' in SOPC Builder design 'nios'
 * SOPC Builder design path: Z:/fpga/mini_projet/theremin_nios/quartus/nios.sopcinfo
 *
 * Generated: Thu Apr 19 17:16:15 CEST 2018
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
#define ALT_CPU_BREAK_ADDR 0x00010820
#define ALT_CPU_CPU_ARCH_NIOS2_R1
#define ALT_CPU_CPU_FREQ 50000000u
#define ALT_CPU_CPU_ID_SIZE 1
#define ALT_CPU_CPU_ID_VALUE 0x00000000
#define ALT_CPU_CPU_IMPLEMENTATION "fast"
#define ALT_CPU_DATA_ADDR_WIDTH 0x11
#define ALT_CPU_DCACHE_BYPASS_MASK 0x80000000
#define ALT_CPU_DCACHE_LINE_SIZE 32
#define ALT_CPU_DCACHE_LINE_SIZE_LOG2 5
#define ALT_CPU_DCACHE_SIZE 2048
#define ALT_CPU_EXCEPTION_ADDR 0x00008020
#define ALT_CPU_FLASH_ACCELERATOR_LINES 0
#define ALT_CPU_FLASH_ACCELERATOR_LINE_SIZE 0
#define ALT_CPU_FLUSHDA_SUPPORTED
#define ALT_CPU_FREQ 50000000
#define ALT_CPU_HARDWARE_DIVIDE_PRESENT 0
#define ALT_CPU_HARDWARE_MULTIPLY_PRESENT 1
#define ALT_CPU_HARDWARE_MULX_PRESENT 0
#define ALT_CPU_HAS_DEBUG_CORE 1
#define ALT_CPU_HAS_DEBUG_STUB
#define ALT_CPU_HAS_EXTRA_EXCEPTION_INFO
#define ALT_CPU_HAS_ILLEGAL_INSTRUCTION_EXCEPTION
#define ALT_CPU_HAS_JMPI_INSTRUCTION
#define ALT_CPU_ICACHE_LINE_SIZE 32
#define ALT_CPU_ICACHE_LINE_SIZE_LOG2 5
#define ALT_CPU_ICACHE_SIZE 4096
#define ALT_CPU_INITDA_SUPPORTED
#define ALT_CPU_INST_ADDR_WIDTH 0x11
#define ALT_CPU_NAME "cpu"
#define ALT_CPU_NUM_OF_SHADOW_REG_SETS 0
#define ALT_CPU_OCI_VERSION 1
#define ALT_CPU_RESET_ADDR 0x00008000


/*
 * CPU configuration (with legacy prefix - don't use these anymore)
 *
 */

#define NIOS2_BIG_ENDIAN 0
#define NIOS2_BREAK_ADDR 0x00010820
#define NIOS2_CPU_ARCH_NIOS2_R1
#define NIOS2_CPU_FREQ 50000000u
#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0x00000000
#define NIOS2_CPU_IMPLEMENTATION "fast"
#define NIOS2_DATA_ADDR_WIDTH 0x11
#define NIOS2_DCACHE_BYPASS_MASK 0x80000000
#define NIOS2_DCACHE_LINE_SIZE 32
#define NIOS2_DCACHE_LINE_SIZE_LOG2 5
#define NIOS2_DCACHE_SIZE 2048
#define NIOS2_EXCEPTION_ADDR 0x00008020
#define NIOS2_FLASH_ACCELERATOR_LINES 0
#define NIOS2_FLASH_ACCELERATOR_LINE_SIZE 0
#define NIOS2_FLUSHDA_SUPPORTED
#define NIOS2_HARDWARE_DIVIDE_PRESENT 0
#define NIOS2_HARDWARE_MULTIPLY_PRESENT 1
#define NIOS2_HARDWARE_MULX_PRESENT 0
#define NIOS2_HAS_DEBUG_CORE 1
#define NIOS2_HAS_DEBUG_STUB
#define NIOS2_HAS_EXTRA_EXCEPTION_INFO
#define NIOS2_HAS_ILLEGAL_INSTRUCTION_EXCEPTION
#define NIOS2_HAS_JMPI_INSTRUCTION
#define NIOS2_ICACHE_LINE_SIZE 32
#define NIOS2_ICACHE_LINE_SIZE_LOG2 5
#define NIOS2_ICACHE_SIZE 4096
#define NIOS2_INITDA_SUPPORTED
#define NIOS2_INST_ADDR_WIDTH 0x11
#define NIOS2_NUM_OF_SHADOW_REG_SETS 0
#define NIOS2_OCI_VERSION 1
#define NIOS2_RESET_ADDR 0x00008000


/*
 * Define for each module class mastered by the CPU
 *
 */

#define __ALTERA_AVALON_JTAG_UART
#define __ALTERA_AVALON_ONCHIP_MEMORY2
#define __ALTERA_AVALON_PIO
#define __ALTERA_AVALON_SYSID_QSYS
#define __ALTERA_AVALON_TIMER
#define __ALTERA_NIOS2_GEN2
#define __ALTPLL
#define __I2S
#define __LEDMATRIX
#define __ULTRASOUND


/*
 * I2S_0 configuration
 *
 */

#define ALT_MODULE_CLASS_I2S_0 I2S
#define I2S_0_BASE 0x11150
#define I2S_0_IRQ -1
#define I2S_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define I2S_0_NAME "/dev/I2S_0"
#define I2S_0_SPAN 16
#define I2S_0_TYPE "I2S"


/*
 * Sys_ID configuration
 *
 */

#define ALT_MODULE_CLASS_Sys_ID altera_avalon_sysid_qsys
#define SYS_ID_BASE 0x11160
#define SYS_ID_ID 0
#define SYS_ID_IRQ -1
#define SYS_ID_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SYS_ID_NAME "/dev/Sys_ID"
#define SYS_ID_SPAN 8
#define SYS_ID_TIMESTAMP 1524150672
#define SYS_ID_TYPE "altera_avalon_sysid_qsys"


/*
 * System configuration
 *
 */

#define ALT_DEVICE_FAMILY "Cyclone IV E"
#define ALT_ENHANCED_INTERRUPT_API_PRESENT
#define ALT_IRQ_BASE NULL
#define ALT_LOG_PORT "/dev/null"
#define ALT_LOG_PORT_BASE 0x0
#define ALT_LOG_PORT_DEV null
#define ALT_LOG_PORT_TYPE ""
#define ALT_NUM_EXTERNAL_INTERRUPT_CONTROLLERS 0
#define ALT_NUM_INTERNAL_INTERRUPT_CONTROLLERS 1
#define ALT_NUM_INTERRUPT_CONTROLLERS 1
#define ALT_STDERR "/dev/jtag_uart"
#define ALT_STDERR_BASE 0x11168
#define ALT_STDERR_DEV jtag_uart
#define ALT_STDERR_IS_JTAG_UART
#define ALT_STDERR_PRESENT
#define ALT_STDERR_TYPE "altera_avalon_jtag_uart"
#define ALT_STDIN "/dev/jtag_uart"
#define ALT_STDIN_BASE 0x11168
#define ALT_STDIN_DEV jtag_uart
#define ALT_STDIN_IS_JTAG_UART
#define ALT_STDIN_PRESENT
#define ALT_STDIN_TYPE "altera_avalon_jtag_uart"
#define ALT_STDOUT "/dev/jtag_uart"
#define ALT_STDOUT_BASE 0x11168
#define ALT_STDOUT_DEV jtag_uart
#define ALT_STDOUT_IS_JTAG_UART
#define ALT_STDOUT_PRESENT
#define ALT_STDOUT_TYPE "altera_avalon_jtag_uart"
#define ALT_SYSTEM_NAME "nios"


/*
 * altpll_0 configuration
 *
 */

#define ALTPLL_0_BASE 0x11140
#define ALTPLL_0_IRQ -1
#define ALTPLL_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ALTPLL_0_NAME "/dev/altpll_0"
#define ALTPLL_0_SPAN 16
#define ALTPLL_0_TYPE "altpll"
#define ALT_MODULE_CLASS_altpll_0 altpll


/*
 * hal configuration
 *
 */

#define ALT_INCLUDE_INSTRUCTION_RELATED_EXCEPTION_API
#define ALT_MAX_FD 32
#define ALT_SYS_CLK TIMER_0
#define ALT_TIMESTAMP_CLK none


/*
 * jtag_uart configuration
 *
 */

#define ALT_MODULE_CLASS_jtag_uart altera_avalon_jtag_uart
#define JTAG_UART_BASE 0x11168
#define JTAG_UART_IRQ 0
#define JTAG_UART_IRQ_INTERRUPT_CONTROLLER_ID 0
#define JTAG_UART_NAME "/dev/jtag_uart"
#define JTAG_UART_READ_DEPTH 64
#define JTAG_UART_READ_THRESHOLD 8
#define JTAG_UART_SPAN 8
#define JTAG_UART_TYPE "altera_avalon_jtag_uart"
#define JTAG_UART_WRITE_DEPTH 64
#define JTAG_UART_WRITE_THRESHOLD 8


/*
 * ledmatrix_0 configuration
 *
 */

#define ALT_MODULE_CLASS_ledmatrix_0 LedMatrix
#define LEDMATRIX_0_BASE 0x11000
#define LEDMATRIX_0_IRQ -1
#define LEDMATRIX_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define LEDMATRIX_0_NAME "/dev/ledmatrix_0"
#define LEDMATRIX_0_SPAN 256
#define LEDMATRIX_0_TYPE "LedMatrix"


/*
 * ledsA configuration
 *
 */

#define ALT_MODULE_CLASS_ledsA altera_avalon_pio
#define LEDSA_BASE 0x11130
#define LEDSA_BIT_CLEARING_EDGE_REGISTER 0
#define LEDSA_BIT_MODIFYING_OUTPUT_REGISTER 0
#define LEDSA_CAPTURE 0
#define LEDSA_DATA_WIDTH 8
#define LEDSA_DO_TEST_BENCH_WIRING 0
#define LEDSA_DRIVEN_SIM_VALUE 0
#define LEDSA_EDGE_TYPE "NONE"
#define LEDSA_FREQ 50000000
#define LEDSA_HAS_IN 0
#define LEDSA_HAS_OUT 1
#define LEDSA_HAS_TRI 0
#define LEDSA_IRQ -1
#define LEDSA_IRQ_INTERRUPT_CONTROLLER_ID -1
#define LEDSA_IRQ_TYPE "NONE"
#define LEDSA_NAME "/dev/ledsA"
#define LEDSA_RESET_VALUE 0
#define LEDSA_SPAN 16
#define LEDSA_TYPE "altera_avalon_pio"


/*
 * ledsB configuration
 *
 */

#define ALT_MODULE_CLASS_ledsB altera_avalon_pio
#define LEDSB_BASE 0x11120
#define LEDSB_BIT_CLEARING_EDGE_REGISTER 0
#define LEDSB_BIT_MODIFYING_OUTPUT_REGISTER 0
#define LEDSB_CAPTURE 0
#define LEDSB_DATA_WIDTH 8
#define LEDSB_DO_TEST_BENCH_WIRING 0
#define LEDSB_DRIVEN_SIM_VALUE 0
#define LEDSB_EDGE_TYPE "NONE"
#define LEDSB_FREQ 50000000
#define LEDSB_HAS_IN 0
#define LEDSB_HAS_OUT 1
#define LEDSB_HAS_TRI 0
#define LEDSB_IRQ -1
#define LEDSB_IRQ_INTERRUPT_CONTROLLER_ID -1
#define LEDSB_IRQ_TYPE "NONE"
#define LEDSB_NAME "/dev/ledsB"
#define LEDSB_RESET_VALUE 0
#define LEDSB_SPAN 16
#define LEDSB_TYPE "altera_avalon_pio"


/*
 * onchip_ram configuration
 *
 */

#define ALT_MODULE_CLASS_onchip_ram altera_avalon_onchip_memory2
#define ONCHIP_RAM_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define ONCHIP_RAM_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define ONCHIP_RAM_BASE 0x8000
#define ONCHIP_RAM_CONTENTS_INFO ""
#define ONCHIP_RAM_DUAL_PORT 0
#define ONCHIP_RAM_GUI_RAM_BLOCK_TYPE "AUTO"
#define ONCHIP_RAM_INIT_CONTENTS_FILE "nios_onchip_ram"
#define ONCHIP_RAM_INIT_MEM_CONTENT 1
#define ONCHIP_RAM_INSTANCE_ID "NONE"
#define ONCHIP_RAM_IRQ -1
#define ONCHIP_RAM_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ONCHIP_RAM_NAME "/dev/onchip_ram"
#define ONCHIP_RAM_NON_DEFAULT_INIT_FILE_ENABLED 0
#define ONCHIP_RAM_RAM_BLOCK_TYPE "AUTO"
#define ONCHIP_RAM_READ_DURING_WRITE_MODE "DONT_CARE"
#define ONCHIP_RAM_SINGLE_CLOCK_OP 0
#define ONCHIP_RAM_SIZE_MULTIPLE 1
#define ONCHIP_RAM_SIZE_VALUE 32768
#define ONCHIP_RAM_SPAN 32768
#define ONCHIP_RAM_TYPE "altera_avalon_onchip_memory2"
#define ONCHIP_RAM_WRITABLE 1


/*
 * timer_0 configuration
 *
 */

#define ALT_MODULE_CLASS_timer_0 altera_avalon_timer
#define TIMER_0_ALWAYS_RUN 0
#define TIMER_0_BASE 0x11100
#define TIMER_0_COUNTER_SIZE 32
#define TIMER_0_FIXED_PERIOD 0
#define TIMER_0_FREQ 50000000
#define TIMER_0_IRQ 1
#define TIMER_0_IRQ_INTERRUPT_CONTROLLER_ID 0
#define TIMER_0_LOAD_VALUE 4999
#define TIMER_0_MULT 1.0E-6
#define TIMER_0_NAME "/dev/timer_0"
#define TIMER_0_PERIOD 100
#define TIMER_0_PERIOD_UNITS "us"
#define TIMER_0_RESET_OUTPUT 0
#define TIMER_0_SNAPSHOT 1
#define TIMER_0_SPAN 32
#define TIMER_0_TICKS_PER_SEC 10000
#define TIMER_0_TIMEOUT_PULSE_OUTPUT 0
#define TIMER_0_TYPE "altera_avalon_timer"


/*
 * ultrasound_0 configuration
 *
 */

#define ALT_MODULE_CLASS_ultrasound_0 Ultrasound
#define ULTRASOUND_0_BASE 0x1117c
#define ULTRASOUND_0_IRQ -1
#define ULTRASOUND_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ULTRASOUND_0_NAME "/dev/ultrasound_0"
#define ULTRASOUND_0_SPAN 4
#define ULTRASOUND_0_TYPE "Ultrasound"


/*
 * ultrasound_1 configuration
 *
 */

#define ALT_MODULE_CLASS_ultrasound_1 Ultrasound
#define ULTRASOUND_1_BASE 0x11178
#define ULTRASOUND_1_IRQ -1
#define ULTRASOUND_1_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ULTRASOUND_1_NAME "/dev/ultrasound_1"
#define ULTRASOUND_1_SPAN 4
#define ULTRASOUND_1_TYPE "Ultrasound"


/*
 * ultrasound_2 configuration
 *
 */

#define ALT_MODULE_CLASS_ultrasound_2 Ultrasound
#define ULTRASOUND_2_BASE 0x11174
#define ULTRASOUND_2_IRQ -1
#define ULTRASOUND_2_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ULTRASOUND_2_NAME "/dev/ultrasound_2"
#define ULTRASOUND_2_SPAN 4
#define ULTRASOUND_2_TYPE "Ultrasound"


/*
 * ultrasound_3 configuration
 *
 */

#define ALT_MODULE_CLASS_ultrasound_3 Ultrasound
#define ULTRASOUND_3_BASE 0x11170
#define ULTRASOUND_3_IRQ -1
#define ULTRASOUND_3_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ULTRASOUND_3_NAME "/dev/ultrasound_3"
#define ULTRASOUND_3_SPAN 4
#define ULTRASOUND_3_TYPE "Ultrasound"

#endif /* __SYSTEM_H_ */
