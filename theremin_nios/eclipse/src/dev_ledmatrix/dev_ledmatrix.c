/*
 * dev_ledmatrix.c
 *
 *  Created on: 12 april 2018
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

void set_pixel(uint8_t x, uint8_t y, uint8_t rgb) {
	uint16_t pos = y*12+x;
	IOWR_16DIRECT(LEDMATRIX_0_BASE, pos*2, rgb);
}

int main() {
	uint8_t i;

	for (i = 0; i < 96; i++) {
		IOWR_16DIRECT(LEDMATRIX_0_BASE, i*2, happy_smiley[i]);
	}
	set_pixel(5, 4, 7);
}
