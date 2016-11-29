// HelloWorld_p_02.c
//
// OpenMP C program to demonstrate parallelization and master-worker work
// separation. Master thread prints maximum number of threads available,
// number of threads assigned and total time taken. Each participating thread 
// prints "Hello, World!". Master-Worker separation is identified implicitly.
// Compilation/Execution takes less the one second on most modern hardware
// running linux OS with GCC 4.4.7.
//
// Compilation and execution
// gcc -Wall -g -lm -fopenmp HelloWorld_p_02.c -o HelloWorld_p_02.x
// OMP_NUM_THREADS=2 (or 4 or 8 or 16, as appropriate)
// ./HelloWorld_p_02.x

// Headers and functions
#define PARALLEL_OMP   // Conditional inclusion of omp.h in functions.h
#include "functions.h"

// main()
int main(int argc, char **argv) {

  // Variable declaration
  int num_procs;           // Total number of available processors
  int max_threads;         // Maximum number of usable threads
  int thread_id;           // ID of each participating thread
  double wall_time = 0.00; // Wall time

  // Total number of available processors and maximum number of usable threads
  num_procs   = omp_get_num_procs();
  max_threads = omp_get_max_threads(); // Same as OMP_NUM_THREADS

  // Thread ID
  thread_id = omp_get_thread_num();

  // Start the timer
  wall_time = omp_get_wtime();

  // MASTER thread
  printf("\n");
  printf("  Total number of processors available : %d\n",   num_procs);
  printf("  Maximum number of usable threads     : %d\n\n", max_threads);

  // Parallel region
  // Each thread has its own copy of variables
  #pragma omp parallel shared(max_threads) private(thread_id) 
  {
    // Thread ID
    thread_id = omp_get_thread_num();

    // Print a message
    printf("  Hello, World! from thread %d out of %d\n", thread_id, max_threads);
  }

  // Stop the timer and count the time
  wall_time = omp_get_wtime() - wall_time;

  // MASTER thread
  printf("\n");
  printf("  Total time taken : %f seconds\n\n", wall_time);

  // Indicate termination
  return 0;
}
