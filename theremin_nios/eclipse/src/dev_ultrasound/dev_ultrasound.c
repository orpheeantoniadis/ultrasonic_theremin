/*
 * dev_ultrasound.c
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

int main() {
	uint32_t ticks;
	uint8_t ticks_LSB, ticks_MSB;
	float time, dist;

	IOWR_8DIRECT(LEDSA_BASE, 0, 0xff);
	IOWR_8DIRECT(LEDSB_BASE, 0, 0xff);

	while(1) {
		ticks = IORD_32DIRECT(ULTRASOUND_0_BASE, 0);
		time = (ticks * 20) * 1e-3;
		dist = time / 58;

		ticks_LSB = (ticks >> 8) & 0xff;
		ticks_MSB = (ticks >> 16) & 0xff;

		IOWR_8DIRECT(LEDSA_BASE, 0, ticks_MSB);
		IOWR_8DIRECT(LEDSB_BASE, 0, ticks_LSB);

		printf("Distance = %d cm\n", (int)dist);
	}
}
