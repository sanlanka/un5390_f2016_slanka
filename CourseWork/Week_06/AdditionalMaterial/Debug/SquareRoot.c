// SquareRoot.c
//
// C program to produce NaN error by taking a square root of a number.
// Compilation/Execution takes less the one second on most modern hardware 
// running Linux OS with GCC.
//
// Compilation and execution:
// gcc -Wall -g -pg SquareRoot.c -lm -o SquareRoot.x
// ./SquareRoot.x

// Headers and functions
#include "functions.h"

// main()
int main() {

  // Variable declaration
  double a = -100.0;
  double c = 0.00;

  // Compute the square root
  c = sqrt(a);

  // Print the summary
  printf("\n");
  printf("  This program calculates square root of a number\n\n");
  printf("    a : %f\n", a);
  printf("    c : %f\n\n", c);

  // Indicate termination
  return 0;
}
