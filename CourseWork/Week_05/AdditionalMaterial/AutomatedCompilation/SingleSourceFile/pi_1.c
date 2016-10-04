// pi_1.c
//
// C program to compute the value of 'pi' for a given number of terms using 
// the Newton approximation. Compilation/Execution takes less than one second 
// on most modern hardware running Linux OS with GCC.
//
// Compilation (without Makefile; with one command):
// gcc -Wall -g -pg pi_1.c -lm -o pi_1.x
//
// Compilation (without Makefile; with multiple commands):
// gcc -Wall -g -pg -c pi_1.c
// gcc pi_1.o -lm -o pi_1.x
//
// Compilation (with Makefile; one of the following commands):
// make
// make all
// make pi_1.x
//
// Execution:
// ./pi_1.x

// Headers
#include <stdio.h>  // Core input/output operations
#include <stdlib.h> // Conversions, random numbers, memory allocation, etc.
#include <math.h>   // Common mathematical functions
#include <time.h>   // Converting between various date/time formats
#include <unistd.h> // Hostname, etc.

// Function declaration
long double factorial(int n);

// main()
int main() {

  // Variable declaration
  long double PI = 3.141592653589793; // Known value of PI
  long double PI_1 = 0.00;            // Computed value of PI
  long double ERROR_PI_1 = 0.00;      // Error in computed value of PI
  long double numerator, denominator; // Interim values
  int n = 75;                         // Number of terms
  int i;                              // Loop index

  // Print the problem statement
  printf("\n");
  printf("  C program to evaluate PI using the Newton approximation\n");

  // Compute the value of PI using the Newton approximation
  for (i = 0; i < n; i++) {
    numerator   = pow(2, i) * pow(factorial(i), 2);
    denominator = factorial(2 * i + 1);
    PI_1        = PI_1 + (numerator/denominator);
  }

  PI_1 = 2.00 * PI_1;

  // Calculate the error in PI_1
  ERROR_PI_1 = fabs((PI - PI_1)/PI) * 100;

  // Print the summary
  printf("\n");
  printf("                n : %d\n", n);
  printf("               PI : %16.15Lf\n", PI);
  printf("             PI_1 : %16.15Lf\n", PI_1);
  printf("      Error(PI_1) : %16.15Lf\n\n", ERROR_PI_1);

  // Indicate termination
  return 0;
}

// factorial()
long double factorial(int n) {

  // Variable declaration
  int  i;                 // Loop index
  long double result = 1; // Takes care of factorial(0)

  // factorial(n)
  for (i = 1; i <= n; i++) {
    result = result * i;
  }

  // Return factorial to parent module
  return result;
}
