// pi_2.c
//
// Function (module) to compute the value of 'pi' for a given number of terms 
// using the Madhava approximation. Not to be compiled/run independently but 
// from within pi.c

// Standard headers
#include <stdio.h>  // Core input/output operations
#include <stdlib.h> // Conversions, random numbers, memory allocation, etc.
#include <math.h>   // Common mathematical functions
#include <time.h>   // Converting between various date/time formats
#include <unistd.h> // Hostname, etc.

// pi_madhava()
// Compute the value of PI using the Madhava approximation
long double pi_madhava(int n) {

  // Variable declaration
  int i;                   // Loop index
  long double PI_2 = 0.00; // Computed value of PI_2
  long double numerator;   // Interim value
  long double denominator; // Interim value

  // Compute the value of PI using the Madhava approximation
  for (i = 0; i < n; i++) {
    numerator   = pow(-3, -i);
    denominator = 2*i + 1;
    PI_2        = PI_2 + (numerator/denominator);
  }

  PI_2 = sqrt(12.00) * PI_2;

  // Return PI_2 to parent module
  return PI_2;
}
