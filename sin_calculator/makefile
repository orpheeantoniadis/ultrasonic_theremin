CC = gcc
XFLAGS = -Wall -Wextra
CLAGS = -g $(XFLAGS) -std=c99 -O3
LDFLAGS = -lm
SRC=$(wildcard *.c)
OUT=$(SRC:%.c=%)

all: $(OUT)

%: %.c
	$(CC) $(FLAGS) $< -o $@ $(LDFLAGS)

clean:
	rm -rf $(OUT) *~ *.dSYM

rebuild: clean all
