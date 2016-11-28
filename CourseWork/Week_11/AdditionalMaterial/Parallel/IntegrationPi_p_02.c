// IntegrationPi_p_02.c
//
// OpenMP C program compute the value of PI using numerical integration 
// (trapzeoidal method) and reduction (sum) operation. Compilation/Execution 
// tested in modern hardware (circa 2015) running linux OS with GCC 4.4.7.
//
// Compilation and execution
// gcc -Wall -g -lm -fopenmp IntegrationPi_p_02.c -o IntegrationPi_p_02.x
// OMP_NUM_THREADS=2 (or 4 or 8 or 16, as appropriate)
// ./IntegrationPi_p_02.x

// Headers and functions
#define PARALLEL_OMP   // Conditional inclusion of omp.h in functions.h
#include "functions.h"

// main()
int main(int argc, char **argv) {

  // Variable declaration
  int num_procs;                 // Total number of available processors
  int max_threads;               // Maximum number of usable threads
  int thread_id;                 // ID of each participating thread
  int N = pow(2, 30);            // Total number of intervals in [a, b]
  int interval_chunk;            // Portion of N for each thread
  int i;                         // Running index
  double a = 0.00;               // Lower limit of integration
  double b = 1.00;               // Upper limit of integration
  double h = 0.00;               // Width of the interval, (b - a)/N
  double pi = 3.141592653589793; // Known value of PI
  double pi_computed = 0.00;     // Computed value of PI (value of integral)
  double pi_error = 0.00;        // Error in the computed value of PI
  double wall_time = 0.00;       // Wall time

  // Total number of available processors and maximum number of usable threads
  num_procs   = omp_get_num_procs();
  max_threads = omp_get_max_threads(); // Same as OMP_NUM_THREADS

  // Portion of N for each thread
  interval_chunk = N / max_threads;

  // Width of the interval
  h = (b - a)/N;

  // Thread ID
  thread_id = omp_get_thread_num();

  // Start the timer
  wall_time = omp_get_wtime();

  // MASTER thread
  if (thread_id == 0) {
    printf("\n" );
    printf("  An OpenMP C program to demonstrate parallelization and \n");
    printf("  master-worker division of labor via PI evaluation using trapezoidal rule.\n\n");

    printf("  Total number of processors available : %d\n", num_procs);
    printf("  Maximum number of usable threads     : %d\n", max_threads);
    printf("  Lower limit of integration           : %f\n", a);
    printf("  Upper limit of integration           : %f\n", b);
    printf("  Total number of intervals in [a, b]  : %d\n", N);
    printf("  Number of intervals for each thread  : %d\n", interval_chunk);
    printf("  Width of each interval               : %e\n", h);

    // Potential for improvement
    // #1. Check if the executable has been called with an appropriate 
    //     number of arguments
    // #2. Keep simulation parameters (i.e., # of intervals) outside of the
    //     core program; incorporate input validation
    // #3. Check if the # of intervals is integer-divisible by the number of 
    //     usable threads
    // #4. If writing to and/or reading from a file, check file/folder 
    //     permissions
  }

  // Parallel region
  // Each thread has its own copy of variables
  #pragma omp parallel shared(h)
  { 
    #pragma omp for reduction(+: pi_computed) 
    // Integral evaluation (part #1; for loop)
    for(i = 1; i < N; i++) {
      pi_computed = pi_computed + f_x(a + i * h);
    }
  }

  // MASTER thread
  if (thread_id == 0) {
    // Integral evaluation (part #2)
    pi_computed = 4.00 * h * (pi_computed + (0.50 * (f_x(a) + f_x(b))));

    // Compute the error in pi
    pi_error = fabs(pi - pi_computed);
  }

  // Stop the timer
  wall_time = omp_get_wtime() - wall_time;

  // MASTER thread
  if (thread_id == 0) {
    printf("  Known value of PI                    : %16.15f\n",      pi);
    printf("  Computed value of PI                 : %16.15f\n",      pi_computed);
    printf("  Error in the computed value of PI    : %16.15f\n",      pi_error);
    printf("  Total time taken                     : %f seconds\n\n", wall_time);
  }

  // Indicate termination
  return 0;
}
