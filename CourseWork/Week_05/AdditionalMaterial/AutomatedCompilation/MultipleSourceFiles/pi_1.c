// pi_1.c
//
// Function (module) to compute the value of 'pi' for a given number of terms 
// using the Newton approximation. Not to be compiled/run independently but 
// from within pi.c

// Headers
#include <stdio.h>  // Core input/output operations
#include <stdlib.h> // Conversions, random numbers, memory allocation, etc.
#include <math.h>   // Common mathematical functions
#include <time.h>   // Converting between various date/time formats
#include <unistd.h> // Hostname, etc.

// factorial()
// Calculates the factorial
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

// pi_newton()
// Compute the value of PI using the Newton approximation
long double pi_newton(int n) {

  // Variable declaration
  int i;                   // Loop index
  long double PI_1 = 0.00; // Computed value of PI_1
  long double numerator;   // Interim value
  long double denominator; // Interim value

  // Compute the value of PI using the Newton approximation
  for (i = 0; i < n; i++) {
    numerator   = pow(2, i) * pow(factorial(i), 2);
    denominator = factorial(2 * i + 1);
    PI_1        = PI_1 + (numerator/denominator);
  }

  PI_1 = 2.00 * PI_1;

  // Return PI_1 to parent module
  return PI_1;
}
