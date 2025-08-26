CC=clang
CFLAGS=-target bpf -I/usr/include/$(shell uname -m)-linux-gnu
TARGETS=$(patsubst %.bpf.c, %.bpf.o, $(wildcard *.bpf.c))

.PHONY: all clean

all: $(TARGETS)

%.bpf.o: %.bpf.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm *.o