GC=ghdl
GFLAGS=--std=02 --ieee=synopsys
RFLAGS=--vcd=output.vcd --stop-time=400us

SRC=$(wildcard *.vhd)
OBJ=$(SRC:.vhd=.o)
TESTBENCH=$(wildcard tb_*)
UNIT=$(TESTBENCH:%.vhd=%)

all: compile mostlyclean

compile: $(OBJ) elaboration
	$(GC) -r  $(GFLAGS) $(UNIT) $(RFLAGS)

elaboration:
	$(GC) -e $(GFLAGS) $(UNIT)

%.o: %.vhd
	$(GC) -a $(GFLAGS) $^

mostlyclean:
	rm -rf *.cf *.o $(UNIT)

clean:
	rm -rf *.cf *.o $(UNIT) *.vcd
