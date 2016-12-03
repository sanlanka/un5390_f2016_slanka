// IntegrationPi_s.c
//
// C program to compute the value of PI using numerical integration (trapzeoidal
// method). Compilation/Execution tested in modern hardware (circa 2015) 
// running linux OS with GCC 4.4.7.
//
// Compilation and execution
// gcc -Wall -g -pg -lm IntegrationPi_s.c -o IntegrationPi_s.x
// $(pwd)/IntegrationPi_s.x

// Headers and functions
#include "functions.h"

// main()
int main(int argc, char **argv) {

  // Variable declaration
  int N = pow(2, 30);            // Total number of intervals in [a, b]
  int i;                         // Running index
  double a = 0.00;               // Lower limit of integration
  double b = 1.00;               // Upper limit of integration
  double h;                      // Width of the interval, (b - a)/N
  double pi = 3.141592653589793; // Known value of PI
  double pi_computed = 0.00;     // Computed value of PI (value of integral)
  double pi_error = 0.00;        // Error in the computed value of PI
  double wall_time = 0.00;       // Wall time
  clock_t start_time, end_time;  // Start and end time

  // Start the timer
  start_time = clock();

  // Width of the interval
  h = (b - a)/N;

  printf("\n");
  printf("  C program to compute the value of PI using trapezoidal rule.\n\n");

  printf("  Lower limit of integration          : %f\n", a);
  printf("  Upper limit of integration          : %f\n", b);
  printf("  Total number of intervals in [a, b] : %d\n", N);
  printf("  Width of each interval              : %e\n", h);

  // Potential for improvement
  // #1. Check if the executable has been called with an appropriate 
  //     number of arguments
  // #2. Keep simulation parameters (i.e., # of intervals) outside of the
  //     core program; incorporate input validation
  // #3. Check if the # of intervals is integer-divisible by the number of 
  //     usable threads
  // #4. If writing to and/or reading from a file, check file/folder 
  //     permissions

  // Integral evaluation (part #1; for loop)
  for(i = 1; i <= N - 1; i++) {
    pi_computed = pi_computed + f_x(a + i * h);
  }

  // Integral evaluation (part #2)
  pi_computed = 4.00 * h * (pi_computed + (0.50 * (f_x(a) + f_x(b))));

  // Compute the error in pi
  pi_error = fabs(pi - pi_computed);

  // Stop the timer and count the time
  end_time  = clock();
  wall_time = (double)(end_time - start_time)/CLOCKS_PER_SEC;

  printf("  Known value of PI                   : %16.15f\n",      pi);
  printf("  Computed value of PI                : %16.15f\n",      pi_computed);
  printf("  Error in the computed value of PI   : %16.15f\n",      pi_error);
  printf("  Total time taken                    : %f seconds\n\n", wall_time);

  // Indicate termination
  return 0;
}
