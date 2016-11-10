// HelloWorld_p_01.c
//
// OpenMP C program to demonstrate parallelization. Each participating thread
// prints "Hello, World!". Compilation/Execution takes less the one second on 
// most modern hardware running linux OS with GCC 4.4.7.
//
// Compilation and execution
// gcc -Wall -g -pg -lm -fopenmp HelloWorld_p_01.c -o HelloWorld_p_01.x
//
// OMP_NUM_THREADS=2 (or 4 or 8 or 16, as appropriate)
// ./HelloWorld_p_01.x

// Headers and functions
#define PARALLEL_OMP   // Conditional inclusion of omp.h in functions.h
#include "functions.h"

// main()
int main (int argc, char **argv) {

  // Variable declaration
  int max_threads; // Maximum number of usable threads
  int thread_id;   // ID of each participating thread

  // Parallel region
  // Each thread has its own copy of variables
  #pragma omp parallel shared(max_threads) private(thread_id) 
  {

    // Maximum number of usable and thread ID
    max_threads = omp_get_max_threads(); // Same as OMP_NUM_THREADS
    thread_id   = omp_get_thread_num();

    // Print a message
    printf("  Hello, World! from thread %d out of %d\n", thread_id, max_threads);
  }  

  // Indicate termination
  return 0;
}
