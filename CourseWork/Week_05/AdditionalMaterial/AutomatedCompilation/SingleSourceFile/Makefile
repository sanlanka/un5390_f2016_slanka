# Makefile
# Makefile used to systematically compile pi_1.c taking into account its
# dependencies, and produce pi_1.x.
#
# Usage:
#   make

# Default target
all: pi_1.x

# pi_1.x (depends on pi_1.o)
pi_1.x: pi_1.o
	gcc pi_1.o -lm -o pi_1.x

# pi_1.o (depends on pi_1.c)
pi_1.o: pi_1.c
	gcc -Wall -g -pg -c pi_1.c

# Clean (delete pi_1.o and pi_1.x)
clean:
	rm -f pi_1.o pi_1.x
