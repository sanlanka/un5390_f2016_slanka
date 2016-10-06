// Factorial.c
//
// Computes factorial(n) where n is an integer (>=0). Compilation/Execution 
// takes less than one second on most modern hardware running Linux OS with GCC.
//
// Compilation and execution:
// gcc -Wall -g -pg Factorial.c -lm -o Factorial.x
// ./Factorial.x

// Headers
#include "functions.h"

// main()
int main() {

  // Variable declaration and initialization
  int n = 5; // User-supplied number
  int N = 1; // factorial(n)

  // Call problem_statement()
  printf("\n");
  printf("  This program computes factorial(n) where n is an integer (>=0)\n\n");

  // Compute factorial and print result
  N = factorial(n);
  printf("  factorial(%d) = %d\n\n", n, N);

  // Indicate termination
  return 0;
}
