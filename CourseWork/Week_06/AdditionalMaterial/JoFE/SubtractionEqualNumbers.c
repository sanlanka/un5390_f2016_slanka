// SubtractionEqualNumbers.c
//
// C program to demonstrate the problems associated with addition (or
// subtraction)  of small (or really small) numbers. Subtraction, when
// involving numbers of nearly equal magnitude, can and often will result in 
// complete loss of precision. If two numbers are not equal in theory but they 
// are equal in their machine representation, their difference will be 
// calculated as zero, 100% loss of precision. Compilation/Execution takes 
// less the one second on most modern hardware running Linux OS with GCC.
//
// Compliation and execution:
// gcc -Wall -g -pg SubtractionEqualNumbers.c -o SubtractionEqualNumbers.x -lm
// ./SubtractionEqualNumbers.x

// Headers and functions
#include "functions.h"

// main()
int main() {

  // Variable declaration
  int i;
  int N                        = 20;
  double h                     = 0.00;
  double analytical_derivative = 0.00;
  double functional_derivative = 0.00;
  double error                 = 0.00;

  // Print the results to the screen
  // The accuracy of functional_derivative improves as h gets smaller 
  // until h = 10^-8. Beyond that point, accuracy degrades due to loss of 
  // precision in the subtraction. When h = 10^-16 or smaller, the output 
  // is exactly zero because sin(1.0+h) equals sin(1.0) in machine precision.
  printf("\n");
  printf("  --------------------------------------------------------------\n");
  printf("    h      Functional derivative  Analytical derivative  Error\n");
  printf("  --------------------------------------------------------------\n");
   
  for (i = 0; i <= N; i = i+2) {
    h = pow(10.0, -i);

    functional_derivative = (sin (1.0 + h) - sin(1.0))/h;
    analytical_derivative = cos(1.0);
    error                 = fabs(functional_derivative - analytical_derivative);
    printf("    %.e  %.16lf     %.16lf     %.e\n", 
                h, functional_derivative, analytical_derivative, error);
  }

  printf("  --------------------------------------------------------------\n");

  // Indicate termination
  return 0;
}
