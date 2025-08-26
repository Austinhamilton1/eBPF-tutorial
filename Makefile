BPF_TARGETS=$(patsubst %.bpf.c, %.bpf.o, $(wildcard *.bpf.c))
ARCH=x86

.PHONY: all clean

all: $(BPF_TARGETS)

%.bpf.o: %.bpf.c
	clang \
		-target bpf \
		-D __TARGET_ARCH_$(ARCH) \
		-I/usr/include/$(shell uname -m)-linux-gnu \
		-Wall \
		-O2 -g \
		-c $< -o $@
	llvm-strip -g $@