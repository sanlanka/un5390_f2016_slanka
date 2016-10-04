// SingleDoublePrecision_1.c
//
// C program to compare single and double precision variables.
// Compilation/Execution takes less the one second on most modern hardware 
// running Linux OS with GCC.
//
// Compliation and execution:
// gcc -Wall -g -pg SingleDoublePrecision_1.c -lm -o SingleDoublePrecision_1.x
// ./SingleDoublePrecision_1.x

// Headers and functions
#include "functions.h"

// main()
int main() {

  // Variable declaration
  int i;
  int N        = 1000000000; // One billion 
  float x      = 0.0;        // Same as REAL in FORTRAN
  double y     = 0.0;        // Same as DOUBLE PRECISION in FORTRAN
  float x_ppb  = 1.0/N;      // One part in a billion (part per billion)
  double y_ppb = 1.0/N;      // One part in a billion (part per billion)

  // Add one part in a billion, a billion times
  for (i = 1; i <= N; i++) {
    x = x + x_ppb;
    y = y + y_ppb;
  }

  // Add 1 to the final values of x and y
  x = x + 1.0;
  y = y + 1.0;

  // Print the results to the screen
  printf ("\n");
  printf ("  Adding one part in a billion a billion times to one\n\n");
  printf ("    x [single precision] : %f\n", x);
  printf ("    y [double precision] : %lf\n\n", y);

  // Indicate termination
  return 0;
}
