/*
 * ultrasonic_theremin.c
 *
 *  Created on: 18 avril 2018
 *      Author: Orphee Antoniadis & Mehmed Blazevic
 */


#include "io.h"
#include <stdio.h>
#include <stdint.h>
#include "system.h"
#include "sys/alt_irq.h"
#include "os/alt_hooks.h"
#include "alt_types.h"

#define PIXEL_COUNT	96

uint8_t happy_smiley[96] =
{
		0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,6,0,0,0,0,6,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,
		0,6,0,0,0,0,0,0,0,0,6,0,
		0,0,6,6,6,6,6,6,6,6,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,
};

static inline void init_switch_leds(void) {
	IOWR_8DIRECT(LEDSA_BASE, 0, 0xff);
	IOWR_8DIRECT(LEDSB_BASE, 0, 0xff);
}

static inline void set_switch_ledA(uint8_t data) { IOWR_8DIRECT(LEDSA_BASE, 0, data); }
static inline void set_switch_ledB(uint8_t data) { IOWR_8DIRECT(LEDSB_BASE, 0, data); }

float get_distance0(void) {
	uint32_t ticks;
	uint8_t ticks_LSB, ticks_MSB;
	float time, dist;

	ticks = IORD_32DIRECT(ULTRASOUND_0_BASE, 0);
	time = (ticks * 20) * 1e-3;
	dist = time / 58;

	ticks_LSB = (ticks >> 8) & 0xff;
	ticks_MSB = (ticks >> 16) & 0xff;

	set_switch_ledA(ticks_MSB);
	set_switch_ledB(ticks_LSB);

	return dist;
}

static inline void set_pixel(uint8_t x, uint8_t y, uint8_t rgb) { IOWR_16DIRECT(LEDMATRIX_0_BASE, (y*12+x)*2, rgb); }

void set_matrix(uint8_t matrix[PIXEL_COUNT]) {
	uint8_t i;

	for (i = 0; i < PIXEL_COUNT; i++) {
		IOWR_16DIRECT(LEDMATRIX_0_BASE, i*2, matrix[i]);
	}
}

int main() {
	float distance;

	init_switch_leds();
	set_matrix(happy_smiley);
	set_pixel(5, 4, 7);

	while(1) {
		distance = get_distance0();
	}
}
