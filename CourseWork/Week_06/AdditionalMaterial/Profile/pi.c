// pi.c
//
// C program to compute the value of 'pi' for a given number of terms 
// using the Newton and Madhava approximations. Compilation/Execution takes
// less the one second on most modern hardware running Linux OS with GCC.
//
// Compilation and execution:
// gcc -Wall -g -pg pi.c -lm -o pi.x
// ./pi.x

// Headers and functions
#include "functions.h"

// main()
int main() {

  // Variable declaration
  long double PI = 3.141592653589793; // Known value of PI
  long double PI_1 = 0.00;            // Newton approximation
  long double PI_2 = 0.00;            // Madhava approximation
  long double ERROR_PI_1 = 0.00;      // Error in PI_1
  long double ERROR_PI_2 = 0.00;      // Error in PI_2
  int n = 90;                         // Number of terms
  int m = 100000;                     // Max loop index
  int i = 0;                          // Loop index

  // Print the problem statement
  printf("\n");
  printf("  C program to evaluate PI using the Newton and Madhava approximations\n");

  // Evaluate PI_1 and PI_2
  // Repeat the process m times just so that program takes a humanly measurable 
  // amount of time to complete
  for (i = 1; i <= m; i++) {
    PI_1 = pi_newton(n);
    PI_2 = pi_madhava(n);
  }

  // Calculate the error in PI_1 and PI_2
  ERROR_PI_1 = pi_error(PI, PI_1);
  ERROR_PI_2 = pi_error(PI, PI_2);

  // Print the summary
  printf("\n");
  printf("                n : %d\n", n);
  printf("               PI : %16.15Lf\n", PI);
  printf("     PI_1 (Error) : %16.15Lf (%16.15Lf) \n", PI_1, ERROR_PI_1);
  printf("     PI_2 (Error) : %16.15Lf (%16.15Lf) \n\n", PI_2, ERROR_PI_2);

  // Indicate termination
  return 0;
}
