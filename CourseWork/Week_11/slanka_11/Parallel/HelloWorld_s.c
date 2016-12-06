// HelloWorld_s.c
//
// C program to print "Hello, World!". Compilation/Execution takes less the 
// one second on most modern hardware running linux OS with GCC 4.4.7.
//
// Compilation and execution
// gcc -Wall -g -pg -lm HelloWorld_s.c -o HelloWorld_s.x
// $(pwd)/HelloWorld_s.x

// Headers and functions
#include "functions.h"

// main()
int main (int argc, char **argv) {

  // Print a message
  printf("  Hello, World!\n");

  // Indicate termination
  return 0;
}
