// MonteCarloPi_p_01.c
//
// OpenMP C program compute the value of PI zation, master-worker work using
// dart board algorithm (Monte Carlo method). Compilation/Execution tested in 
// modern hardware (circa 2015) running linux OS with GCC 4.4.7.
//
// Compilation and execution
// gcc -Wall -g -lm -fopenmp MonteCarloPi_p_01.c -o MonteCarloPi_p_01.x
// OMP_NUM_THREADS=2 (or 4 or 8 or 16, as appropriate)
// ./MonteCarloPi_p_01.x

// Headers and functions
#define PARALLEL_OMP   // Conditional inclusion of omp.h in functions.h
#include "functions.h"

// main()
int main(int argc, char **argv) {

  // Variable declaration
  int N = pow(2, 30);            // Total number of darts thrown
  int n_circle = 0;              // Darts in the circle
  int i;                         // Running index
  double pi = 3.141592653589793; // Known value of PI
  double pi_computed = 0.00;     // Computed value of PI
  double pi_error = 0.00;        // Error in the computed value of PI
  double R = 2.00;               // Radius of the circle inscribed within square
  double x, y;                   // Random numbers in the range (-R, R)
  double z;                      // Square root of (x^2 + y^2)
  double wall_time = 0.00;       // Wall time
  clock_t start_time, end_time;  // Start and end time

  // Start the timer
  start_time = clock();

  printf("\n" );
  printf("  An OpenMP C program to demonstrate parallelization and \n");
  printf("  master-worker division of labor via Monte Carlo PI evaluation.\n\n");

  printf("  Total number of darts thrown        : %d\n", N);

  // Potential for improvement
  // #1. Check if the executable has been called with an appropriate 
  //     number of arguments
  // #2. Keep simulation parameters (i.e., # of darts) outside of the
  //     core program; incorporate input validation
  // #3. Check if the # of darts is integer-divisible by the number of 
  //     usable threads
  // #4. If writing to and/or reading from a file, check file/folder 
  //     permissions

  // Seed the random number generator
  struct timeval t1;
  gettimeofday(&t1, NULL);
  srand(t1.tv_usec * t1.tv_sec);

  #pragma omp parallel for default(shared), private(i), reduction(+:n_circle)
  // Throw darts
  for (i = 0; i < N; i++) {
    // Generate random numbers x and y between -R and R
    x = random_number_generator(-R, R);
    y = random_number_generator(-R, R);

    // If the dart is in the circle, increment n_circle
    z = sqrt((x * x) + (y * y));
    if (z <= R) {
      n_circle++;
    }
  }

  // Calculate the value of pi
  pi_computed = 4.0 * (double) n_circle/(double) N;
  pi_error    = fabs(pi - pi_computed);

  // Stop the timer
  end_time = clock();

  // Count the time
  wall_time = (double)(end_time - start_time)/CLOCKS_PER_SEC;

  printf("  Total number of darts in the circle : %d\n",           n_circle);
  printf("  Known value of PI                   : %16.15f\n",      pi);
  printf("  Computed value of PI                : %16.15f\n",      pi_computed);
  printf("  Error in the computed value of PI   : %16.15f\n",      pi_error);
  printf("  Total time taken                    : %f seconds\n\n", wall_time);

  // Indicate termination
  return 0;
}
