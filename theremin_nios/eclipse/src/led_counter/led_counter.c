/*
 * led_counter.c
 *
 *  Created on: 29 mars 2018
 *      Author: orphee.antoniad
 */


#include "io.h"
#include <stdio.h>
#include <stdint.h>
#include "system.h"
#include "sys/alt_irq.h"
#include "os/alt_hooks.h"
#include "alt_types.h"

uint16_t counter = 0;

void timer_interrupt(void *context, alt_u32 id) {
	counter++;
	IOWR_16DIRECT(LEDSA_BASE, 4, counter);
	IOWR_16DIRECT(TIMER_0_BASE, 0, 1);
}

int main() {
	IOWR_16DIRECT(LEDSA_BASE, 0, 0xffff);
	IOWR_16DIRECT(LEDSA_BASE, 4, counter);
	alt_irq_register(TIMER_0_IRQ, (void* )2, (alt_isr_func)timer_interrupt);
	IOWR_16DIRECT(TIMER_0_BASE, 4, 7); // start timer + cont + ir
}
