// ArrayManipulation_p_02.c
//
// OpenMP C program to demonstrate parallelization and master-worker work
// distribution. Master thread prints the problem statement, simulation
// parameters, and populates the array. Each participating thread manipulates
// a relevant portion of the array. Master thread then prints the summary.
// Master-Worker separation is identified using Thread ID. 
// Compilation/Execution tested in modern hardware (circa 2015) running linux
// OS with GCC 4.4.7.
//
// Compilation and execution
// gcc -Wall -g -lm -fopenmp ArrayManipulation_p_02.c -o ArrayManipulation_p_02.x
//
// OMP_NUM_THREADS=2 (or 4 or 8 or 16, as appropriate)
// ./ArrayManipulation_p_02.x

// Headers and functions
#define PARALLEL_OMP   // Conditional inclusion of omp.h in functions.h
#include "functions.h"

// main()
int main(int argc, char **argv) {

  // Variable declaration
  int num_procs;           // Total number of available processors
  int max_threads;         // Maximum number of usable threads
  int thread_id;           // ID of each participating thread
  int N = pow(2, 30);      // Size of the array
  int array_chunk;         // Portion of the array for each thread
  int array_llimit;        // Lower limit of the array index for each thread
  int array_ulimit;        // Upper limit of the array index for each thread
  int i;                   // Running index
  double A[N], B[N], C[N]; // Three 1D arrays of size N
  double wall_time = 0.00; // Wall time

  // Total number of available processors and maximum number of usable threads
  num_procs   = omp_get_num_procs();
  max_threads = omp_get_max_threads(); // Same as OMP_NUM_THREADS

  // Portion of the array for each thread
  array_chunk = N / max_threads;

  // Thread ID
  thread_id = omp_get_thread_num();

  // Start the timer
  wall_time = omp_get_wtime();

  // MASTER thread
  if (thread_id == 0) {
    printf("\n");
    printf("  OpenMP C program to demonstrate parallelization and \n");
    printf("  master-worker division of labor via array manipulation.\n\n");

    printf("  Total number of processors available : %d\n",   num_procs);
    printf("  Maximum number of usable threads     : %d\n",   max_threads);
    printf("  Size of the array                    : %d\n\n", N);

    // Potential for improvement
    // #1. Check if the executable has been called with an appropriate 
    //     number of arguments
    // #2. Keep simulation parameters (i.e., the array size) outside of the
    //     core program; incorporate input validation
    // #3. Check if the size of the array is integer-divisible by the number of 
    //     usable threads
    // #4. Perform memory pre-allocation prior to populating the arrays
    // #5. If writing to and/or reading from a file, check file/folder 
    //     permissions

    // Populate the arrays
    for (i = 0; i < N; i++) {
      A[i] = i;
      B[i] = i + 1;
      C[i] = 0.00;
    }

    // DEBUG #1
    // Uncomment this section if necessary
    // printf("  Pre-manipulation\n");
    // printf("  ------------------------------\n");
    // printf("     i    A[i]    B[i]    C[i]    \n");
    // printf("  ------------------------------\n");

    // for (i = 0; i < N; i++) {
    //   printf("    %2d   %5.2f   %5.2f   %5.2f\n", i, A[i], B[i], C[i]);
    // }
    // printf("  ------------------------------\n\n");
    // DEBUG #1
  }

  // DEBUG #2
  // Uncomment this section if necessary
  // printf("  Division of labor\n");
  // printf("  -----------------------------------------\n");
  // printf("    %9s  %12s  %12s\n", "thread_id", "array_llimit", "array_ulimit");
  // printf("  -----------------------------------------\n");
  // DEBUG #2

  // Parallel region
  // Each thread has its own copy of variables
  #pragma omp parallel shared(j, max_threads, N, array_chunk) private(thread_id, i, array_llimit, array_ulimit) 
  {
    // Thread ID
    thread_id = omp_get_thread_num();

    // Identify the relevant portion of the array to work on
    array_llimit = thread_id * array_chunk;
    array_ulimit = array_llimit + array_chunk - 1;

    // DEBUG #2
    // Uncomment this section if necessary
    // printf("    %9d  %12d  %12d\n", thread_id, array_llimit, array_ulimit);
    // DEBUG #2

    // Manipulate the relevant portion of the array
    for (i = array_llimit; i <= array_ulimit; i++) {
      C[i] = A[i] + B[i];
    }
  }

  // DEBUG #2
  // Uncomment this section if necessary
  // printf("  -----------------------------------------\n");
  // DEBUG #2

  // Stop the timer and count the time 
  wall_time = omp_get_wtime() - wall_time;

  // MASTER thread
  if (thread_id == 0) {
    printf("\n" );

    // DEBUG #3
    // Uncomment this section if necessary
    // printf("  Post-manipulation\n");
    // printf("  ------------------------------\n");
    // printf("     i    A[i]    B[i]    C[i]    \n");
    // printf("  ------------------------------\n");

    // for (i = 0; i < N; i++) {
    //   printf("    %2d   %5.2f   %5.2f   %5.2f\n", i, A[i], B[i], C[i]);
    // }
    // printf("  ------------------------------\n\n");
    // DEBUG #3

    printf("  Total time taken : %f seconds\n\n", wall_time);
  }

  // Indicate termination
  return 0;
}
