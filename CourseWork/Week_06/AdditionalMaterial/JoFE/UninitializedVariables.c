// UninitializedVariables.c
//
// C program to demonstrate compiler/run time error. Compilation/Execution 
// takes less the one second on most modern hardware running Linux OS with GCC.
//
// Compilation and execution:
// gcc -Wall -g -pg UninitializedVariables.c -o UninitializedVariables.x -lm
// ./UninitializedVariables.x

// Headers and functions
#include "functions.h"

// Function declaration
int sum_initialized(int n);
int sum_uninitialized(int n);

// main()
int main() {

  // Variable declaration
  int N = 100;
  int sum_init;
  int sum_uninit;
  double squareroot_init;
  double squareroot_uninit;

  // Calculate the sum
  sum_init   = sum_initialized(N);
  sum_uninit = sum_uninitialized(N);

  // Calculate the square root
  squareroot_init   = sqrt(sum_init);
  squareroot_uninit = sqrt(sum_uninit);

  // Print the summary
  printf("\n");
  printf("  Sum of first N (= %d) integers\n\n", N);
  printf("  -------------------------------------------\n");
  printf("                 Initialized  Uninitialized\n");
  printf("  -------------------------------------------\n");
  printf("    Sum          %d         %d\n", sum_init, sum_uninit);
  printf("    Square root  %.6f    %.6f\n", squareroot_init, squareroot_uninit);
  printf("  -------------------------------------------\n\n");

  // Indicate termination
  return 0;
}

// sum_initialized(n)
int sum_initialized(int n) {

  // Variable declaration
  int i;
  int sum = 0;

  // Debug
  printf("\n");
  printf("  Sum in initialized loop (before)   : %d\n", sum);

  // Calculate the sum
  for (i = 1; i <= n; i++) {
    sum = sum + i;
  }

  // Debug
  printf("  Sum in initialized loop (after)    : %d\n", sum);

  // Indicate termination
  return sum;
}

// sum_uninitialized(n)
int sum_uninitialized(int n) {

  // Variable declaration
  int i;
  int sum;

  // Debug
  printf("  Sum in uninitialized loop (before) : %d\n", sum);

  // Calculate the sum
  for (i = 1; i <= n; i++) {
    sum = sum + i;
  }

  // Debug
  printf("  Sum in uninitialized loop (after)  : %d\n", sum);

  // Indicate termination
  return sum;
}
