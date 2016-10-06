// DivisionByZero.c
//
// C program to divide a number by zero. Compilation/Execution takes less than
// one second on most modern hardware running Linux OS with GCC.
//
// Compilation and execution:
// gcc -Wall -g -pg DivisionByZero.c -lm -o DivisionByZero.x
// ./DivisionByZero.x

// Headers and functions
#include "functions.h"

// main()
int main() {

  // Variable declaration
  int a = 10;
  int b = 0;
  int c = a / b;

  // Print the summary
  printf("\n");
  printf("  This program divides two numbers\n\n");
  printf("    a : %d\n", a);
  printf("    b : %d\n", b);
  printf("    c : %d\n\n", c);

  // Indicate termination
  return 0;
}
