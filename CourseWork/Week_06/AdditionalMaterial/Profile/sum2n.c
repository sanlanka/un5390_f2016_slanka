// sum2n.c
//
// C program to compute and compare the sum of first n integers using two
// different methods. Compilation/Execution takes less the one second on
// most modern hardware running Linux OS with GCC.
//
// Compilation and execution:
// gcc -Wall -g -pg sum2n.c -lm -o sum2n.x
// ./sum2n.x

// Headers and functions
#include "functions.h"

// main()
int main() {

  // Variable declaration
  int i = 0;              // Loop index  
  int m = 9;              // Power of 10
  long int n = 0;         // 10^{m}
  long int sum_loop  = 0; // Sum using for loop
  long int sum_gauss = 0; // Sum using Gauss' formula

  printf("\n");
  printf("  This program evaluates the sum of first n integers\n\n");
  printf("  ---------------------------------------------------------\n");
  printf("    #  %10s  %-18s  %18s\n", "n", "sum_loop", "sum_gauss");
  printf("  ---------------------------------------------------------\n");

  // Call sum2n_loop() and sum2n_gauss()
  // Repeat the process m times just so that program takes 
  // humanly measurable amount of time to complete
  for (i = 1; i <= m; i++) {
    n = pow(10, i);
    sum_loop  = sum2n_loop(n);
    sum_gauss = sum2n_gauss(n);

    // Print the summary
    printf("    %d  %10ld  %-18ld  %18ld\n", i, n, sum_loop, sum_gauss);
  }

  printf("  ---------------------------------------------------------\n\n");

  // Indicate termination
  return 0;
}
