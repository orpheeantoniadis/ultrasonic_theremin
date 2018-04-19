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

/*-------------------------------------------------------*/
/*									Switch led functions								 */
/*-------------------------------------------------------*/

static inline void init_switch_leds(void) {
	IOWR_8DIRECT(LEDSA_BASE, 0, 0xff);
	IOWR_8DIRECT(LEDSB_BASE, 0, 0xff);
}

static inline void set_switch_ledA(uint8_t data) { IOWR_8DIRECT(LEDSA_BASE, 0, data); }
static inline void set_switch_ledB(uint8_t data) { IOWR_8DIRECT(LEDSB_BASE, 0, data); }

/*-------------------------------------------------------*/
/*									Ultrasound functions								 */
/*-------------------------------------------------------*/

int get_distance(uint16_t ultrasound) {
	uint32_t ticks;
	uint8_t ticks_LSB, ticks_MSB;
	float time, dist;

	ticks = IORD_32DIRECT(ultrasound, 0);
	time = (ticks * 20) * 1e-3;
	dist = time / 58;

	ticks_LSB = (ticks >> 8) & 0xff;
	ticks_MSB = (ticks >> 16) & 0xff;

	set_switch_ledA(ticks_MSB);
	set_switch_ledB(ticks_LSB);

	return (int)dist;
}

int get_amplitude(int distance) {
	// hand very close to the ultrasound so max amplitude
	if (distance < 3) {
		return 8;
	// hand far from the ultrasound so min amplitude
	} else if (distance > 35) {
		return 0;
	// amplitude level calculation (we got 8 levels of 4 points of amplitude)
	} else {
		return (32 - (distance - 3)) / 4);
	}
}

/*-------------------------------------------------------*/
/*									LED MATRIX functions								 */
/*-------------------------------------------------------*/

#define PIXEL_COUNT		96
#define MATRIX_RED		4
#define MATRIX_GREEN	2
#define MATRIX_BLUE		1

const uint8_t empty_matrix[PIXEL_COUNT] =
{
		0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,
};

static inline void set_pixel(uint8_t x, uint8_t y, uint8_t rgb) { IOWR_16DIRECT(LEDMATRIX_0_BASE, (y*12+x)*2, rgb); }

void set_column(uint8_t x, uint8_t amplitude, uint8_t rgb) {
	int i;
	
	for (i = 7; i > (7-amplitude); i--) {
		set_pixel(x, i, rgb);
	}
}

void set_matrix(uint8_t matrix[PIXEL_COUNT]) {
	uint8_t i;

	for (i = 0; i < PIXEL_COUNT; i++) {
		IOWR_16DIRECT(LEDMATRIX_0_BASE, i*2, matrix[i]);
	}
}

/*-------------------------------------------------------*/
/*												Main													 */
/*-------------------------------------------------------*/

int main() {
	float distance;

	init_switch_leds();
	set_matrix(empty_matrix);

	while(1) {
		// display first ultrasound measure
		distance = get_distance(ULTRASOUND_0_BASE);
		set_column(2, get_amplitude(distance), MATRIX_GREEN);
	}
}
