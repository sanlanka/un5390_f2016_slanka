// pi_2.c
//
// C program to compute the value of 'pi' for a given number of terms using 
// the Madhava approximation. Compilation/Execution takes less than one second 
// on most modern hardware running linux OS with GCC 4.4.7.
//
// Compilation:
// With one command:
// gcc -g -Wall pi_2.c -lm -o pi_2.x
//
// With multiple commands:
// gcc -g -Wall -c pi_2.c
// gcc pi_2.o -lm -o pi_2.x
//
// Execution:
// ./pi_2.x

// Standard headers
#include <stdio.h>  // Core input/output operations
#include <stdlib.h> // Conversions, random numbers, memory allocation, etc.
#include <math.h>   // Common mathematical functions
#include <time.h>   // Converting between various date/time formats
#include <unistd.h> // Hostname, etc.

// main()
int main() {

  // Variable declaration
  long double PI = 3.141592653589793; // Known value of PI
  long double PI_2 = 0.00;            // Computed value of PI
  long double ERROR_PI_2 = 0.00;      // Error in computed value of PI
  long double numerator, denominator; // Interim values
  int n = 75;                         // Number of terms
  int i;                              // Loop index

  // Print the problem statement
  printf("\n");
  printf("  C program to evaluate PI using the Madhava approximation\n");

  // Compute the value of PI using the Madhava approximation
  for (i = 0; i < n; i++) {
    numerator   = pow(-3, -i);
    denominator = 2*i + 1;
    PI_2        = PI_2 + (numerator/denominator);
  }

  PI_2 = sqrt(12.00) * PI_2;

  // Calculate the error in PI_2
  ERROR_PI_2 = fabs((PI - PI_2)/PI) * 100;

  // Print the summary
  printf("\n");
  printf("                n : %d\n", n);
  printf("               PI : %16.15Lf\n", PI);
  printf("             PI_2 : %16.15Lf\n", PI_2);
  printf("      Error(PI_2) : %16.15Lf\n\n", ERROR_PI_2);

  // Indicate termination
  return 0;
}
