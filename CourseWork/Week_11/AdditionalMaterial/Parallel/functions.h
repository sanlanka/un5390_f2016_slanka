// functions.h
//
// A common file that contains a list of all necessary header files as well
// as user-defined functions. It will help minimize errors associated with
// duplication and will save time when making necessary edits. This file is 
// not to be directly compiled or executed but should included by other .c 
// files in the same folder. 
//
// Usage (not #include <functions.h>):
// #include "functions.h"

// Headers
#include <complex.h>  // Manipulating compelx numbers
#include <float.h>    // Various limits (float and double)
#include <limits.h>   // Various limits (integer)
#include <math.h>     // Common mathematical functions
#include <stdio.h>    // Core input/output operations
#include <stdlib.h>   // Conversions, random numbers, memory allocation, etc.
#include <string.h>   // String handling functions
#include <time.h>     // Converting between various date/time formats
#include <sys/time.h> // Additional time operations
#include <unistd.h>   // Hostname, etc.

// Conditional inclusion of header files
#ifdef PARALLEL_OMP
  #include <omp.h>    // OpenMP parallelization
#endif

#ifdef PARALLEL_MPI
  #include <mpi.h>    // MPICH parallelization
#endif

// random_number_generator()
// Given two numbers, -R and R, this function generates a random number 
// between them.
double random_number_generator(double a, double b) {

  // Variable declaration
  double prn; // Pseudo-random number

  // Generate a pseudo-random number between a and b
  prn = ((b - a) * ((double) rand()/(double) RAND_MAX)) + a;

  // Return the value of pseudo-random number
  return prn;
}
// random_number_generator()

// f(x) for trapezoidal rule
double f_x(double x) {

  // Variable declaration
  double y; // Value of f(x) for given x

  // Evaluate f(x) for a given x
  y = sqrt(1 - (x * x));

  // Return to parent module
  return y;
}

// factorial()
// Computes the factorial
long double factorial(int n) {

  // Variable declaration
  int i = 0;               // Loop index
  long double result = 1;  // Takes care of factorial(0)

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

  // Compute the value of PI using the Newton approximation
  for (i = 0; i < n; i++) {
    PI_1 = PI_1 + (pow(2, i) * pow(factorial(i), 2))/(factorial(2*i + 1));
  }

  PI_1 = 2.00 * PI_1;

  // Return PI_1 to parent module
  return PI_1;
}

// pi_madhava()
// Compute the value of PI using the Madhava approximation
long double pi_madhava(int n) {

  // Variable declaration
  int i;                   // Dummy index
  long double PI_2 = 0.00; // Computed value of PI_2

  // Compute the value of PI using the Madhava approximation
  for (i = 0; i < n; i++) {
    PI_2 = PI_2 + (pow(-3, -i))/(2*i + 1);
  }

  PI_2 = sqrt(12.00) * PI_2;

  // Return PI_2 to parent module
  return PI_2;
}

// pi_error()
// Evaluates the error in computed value of PI
long double pi_error(long double PI, long double PI_C) {

  // Compute the error in PI_C
  long double PI_ERROR = fabs((PI - PI_C)/PI) * 100;

  // Return PI_ERROR to parent module
  return PI_ERROR;
}

// sum2n_loop()
// This function evaluates the sum using a for loop
long int sum2n_loop(long int n) {

  // Variable declaration
  long int i   = 0; // Loop index
  long int sum = 0; // Sum

  // Compute the sum
  for (i = 1; i <= n; i++) {
    sum = sum + i;
  }

  // Return sum to parent module
  return sum;
}

// sum2n_gauss()
// This function evaluates the sum using the n(n+1)/2 formula
long int sum2n_gauss(long int n) {

  // Variable declaration
  long int sum = 0; // Sum

  // Compute the sum
  sum = n * (n + 1)/2;

  // Return sum to parent module
  return sum;
}
