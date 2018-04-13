#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define PI 3.1415926
#define SIZE 1024

float sin_tab[SIZE];

int main(int argc, char **argv) {
	printf("const sin_tab[SIZE] = {\n");
	for (int i = 0; i < SIZE; i++) {
		sin_tab[i] = sinf(((2 * PI) / SIZE) * i);
		if ((i % 8) == 0 && i != 0) {
			printf("%f, \n", sin_tab[i]);
		} else {
			printf("%f, ", sin_tab[i]);
		}
	}
	printf("}\n");
	return EXIT_SUCCESS;
}