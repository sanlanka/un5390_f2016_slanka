// MissingHeaders.c
//
// C program to demonstrate compiler/run time error. Compilation/Execution 
// takes less the one second on most modern hardware running Linux OS with GCC.
//
// Compilation and execution:
// gcc -Wall -g -pg MissingHeaders.c -lm -o MissingHeaders.x
// ./MissingHeaders.x

// Headers and functions
#include <stdio.h>

// main()
int main() {

  // Variable declaration
  int i;                     // Loop index
  int n = 100;               // Max integer
  int sum = 0;               // Sum of n integers
  double square_root = 0.00; // Square root of sum

  // Calculate the sum
  for (i = 1; i <= n; i++) {
    sum = sum + i;
  } 

  // Calculate the square root
  square_root = sqrt(sum);

  // Print the result
  printf("\n");
  printf("  Sum of first %3d integers : %d\n", n, sum);
  printf("  Square root of %4d       : %f\n\n", sum, square_root);

  // Indicate termination
  return 0;
}
