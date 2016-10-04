// AdditionAssociation.c
//
// C program to demonstrate that addition is not associative.
// Compilation/Execution takes less the one second on most modern hardware 
// running Linux OS with GCC.
//
// Compliation and execution:
// gcc -Wall -g -pg AdditionAssociation.c -o AdditionAssociation.x -lm
// ./AdditionAssociation.x

// Headers and functions
#include "functions.h"

// main()
int main() {

  // Variable declaration
  double a = 2E-63;
  double b = 1.0;
  double c = -1.0;
  double d = 0.0;

  // Print the results to the screen
  printf ("\n");
  printf ("  a = %.1e; b = %.1f; c = %.1f\n\n", a, b, c);

  d = a + b + c;
  printf ("    a + b + c   = %.1e\n", d);

  d = (a + b) + c;
  printf ("    (a + b) + c = %.1e\n", d);

  d = a + (b + c);
  printf ("    a + (b + c) = %.1e\n\n", d);

  // Indicate termination
  return 0;
}
