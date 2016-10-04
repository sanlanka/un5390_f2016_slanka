// ZeroIsNotReallyZero.c
//
// C program to demonstrate that it is better to use tolerance rather than
// checking equality of two variables OR checking if value of one variable
// is zero. Compilation/Execution takes less the one second on most modern 
// hardware running Linux OS with GCC.
// 
// Compliation and execution:
// gcc -Wall -g -pg ZeroIsNotReallyZero.c -o ZeroIsNotReallyZero.x -lm
// ./ZeroIsNotReallyZero.x

// Headers and functions
#include "functions.h"

// main()
int main() {

  // Variable declaration
  int i             = 0;
  double pi_known   = 3.141592653589793;
  double pi_madhava = 0.00;
  double pi_diff    = 0.00;
  double tolerance  = 1.0E-6;
  double numerator, denominator;

  // Print the results to the screen
  printf("\n");

  // Compute the value of PI and print intermediate results
  printf ("  --------------------------------------------\n");
  printf ("    ##  pi_madhava         pi_diff\n");
  printf ("  --------------------------------------------\n");
  while (tolerance <= fabs(pi_known - pi_madhava)) {
    numerator   = sqrt(12.00) * pow(-3, -i);
    denominator = (2 * i) + 1;
    pi_madhava  = pi_madhava + (numerator/denominator);
    pi_diff     = fabs(pi_known - pi_madhava);
    i++;

    printf ("    %02d  %.15f  %.15f\n", i, pi_madhava, pi_diff);
  }
  printf ("  --------------------------------------------\n\n");

  // Print the results to the screen
  printf("  Tolerance                  : %g\n", tolerance);
  printf("  PI (known value)           : %.15f\n", pi_known);
  printf("  PI (Madhava approximation) : %.15f\n", pi_madhava);
  printf("  # of terms                 : %d\n\n", i);
    
  // Indicate termination
  return 0;
}
