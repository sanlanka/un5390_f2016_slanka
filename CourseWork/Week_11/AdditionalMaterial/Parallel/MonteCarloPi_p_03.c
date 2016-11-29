// MonteCarloPi_p_03.c
//
// OpenMP C program to demonstrate parallelization, master-worker work
// distribution and compute the value of PI using dart board algorithm
// (Monte Carlo method). Master thread prints the problem statement and 
// simulation parameters. Each participating thread computes a local value of
// PI using a subset of darts. Master thread then prints the summary.
// Master-Worker separation is identified using Thread ID. Implements
// reduction operation (collective communication). Compilation/Execution 
// tested in modern hardware (circa 2015) running linux OS with GCC 4.4.7.
//
// Compilation and execution
// gcc -Wall -g -lm -fopenmp MonteCarloPi_p_03.c -o MonteCarloPi_p_03.x
//
// OMP_NUM_THREADS=2 (or 4 or 8 or 16, as appropriate)
// ./MonteCarloPi_p_03.x

// Headers and functions
#define PARALLEL_OMP   // Conditional inclusion of omp.h in functions.h
#include "functions.h"

// main()
int main(int argc, char **argv) {

  // Variable declaration
  int num_procs;                 // Total number of available processors
  int max_threads;               // Maximum number of usable threads
  int thread_id;                 // ID of each participating thread
  int N = pow(2, 30);            // Total number of darts thrown
  int dart_chunk;                // Portion of the darts for each thread
  int n_circle = 0;              // Darts in the circle
  int i;                         // Running index
  double pi = 3.141592653589793; // Known value of PI
  double pi_computed = 0.00;     // Computed value of PI
  double pi_error = 0.00;        // Error in the computed value of PI
  double R = 2.00;               // Radius of the circle inscribed within square
  double x, y;                   // Random numbers in the range (-R, R)
  double z;                      // Square root of (x^2 + y^2)
  double wall_time = 0.00;       // Wall time

  // Total number of available processors and maximum number of usable threads
  num_procs   = omp_get_num_procs();
  max_threads = omp_get_max_threads(); // Same as OMP_NUM_THREADS

  // Portion of the darts for each thread
  dart_chunk = N / max_threads;

  // Thread ID
  thread_id = omp_get_thread_num();

  // Start the timer
  wall_time = omp_get_wtime();

  // MASTER thread
  if (thread_id == 0) {
    printf("\n");
    printf("  OpenMP C program to evaluate PI using Monte Carlo method\n");
    printf("  (Dart Board algorithm).\n\n");

    printf("  Total number of processors available : %d\n", num_procs);
    printf("  Maximum number of usable threads     : %d\n", max_threads);
    printf("  Total number of darts thrown         : %d\n", N);
    printf("  Number of darts per usable thread    : %d\n", dart_chunk);

    // Potential for improvement
    // #1. Check if the executable has been called with an appropriate 
    //     number of arguments
    // #2. Keep simulation parameters (i.e., # of darts) outside of the
    //     core program; incorporate input validation
    // #3. Check if the # of darts is integer-divisible by the number of 
    //     usable threads
    // #4. If writing to and/or reading from a file, check file/folder 
    //     permissions
  }

  // Parallel region
  // Each thread has its own copy of variables
  #pragma omp parallel shared(R) private(thread_id, i, x, y, z) 
  {
    // Thread ID
    thread_id = omp_get_thread_num();

    // Seed the random number generator
    // Each thread needs a different seed
    struct timeval t1;
    gettimeofday(&t1, NULL);
    srand(t1.tv_usec * t1.tv_sec * (thread_id + 1));

    // Throw dart_chunk darts
    // Apply sum reduction on n_circle
    #pragma omp for reduction(+: n_circle)
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
  }

  // MASTER thread
  if (thread_id == 0) {
    // Calculate the value of pi
    pi_computed = 4.0 * (double) n_circle/(double) N;
    pi_error    = fabs(pi - pi_computed);
  }

  // Stop the timer and count the time
  wall_time = omp_get_wtime() - wall_time;

  // MASTER thread
  if (thread_id == 0) {
    printf("  Total number of darts in the circle  : %d\n",           n_circle);
    printf("  Known value of PI                    : %16.15f\n",      pi);
    printf("  Computed value of PI                 : %16.15f\n",      pi_computed);
    printf("  Error in the computed value of PI    : %16.15f\n",      pi_error);
    printf("  Total time taken                     : %f seconds\n\n", wall_time);
  }

  // Indicate termination
  return 0;
}
