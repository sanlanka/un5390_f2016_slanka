// Primes_omp_02.c
//
// OpenMP C program to compute the number of primes between 2 and M using the
// sieve of Eratosthenes -- a simple, ancient algorithm for finding all prime
// numbers up to any given limit. It does so by iteratively marking as
// composite (i.e., not prime) the multiples of each prime, starting with the
// multiples of 2. Compilation/Execution tested in modern hardware (circa 2015)
// running linux OS with GCC 4.4.7.
//
// Compilation and execution
// gcc -Wall -g -lm -fopenmp Primes_omp_02.c -o Primes_omp_02.x
// OMP_NUM_THREADS=2 (or 4 or 8 or 16, as appropriate)
// $(omp)/Primes_omp_02.x

// Headers and functions
#define PARALLEL_OMP   // Conditional inclusion of omp.h in functions.h
#include "functions.h"

// main()
int main(int argc, char **argv) {

  // Variable declaration
  int N = 1;       ;            // Used to get pow(10, N)
  long long int M = pow(10, N); // Primes from 2 to M
  long long int i, j;           // Running indices
  long long int primes = 0;     // Number of primes between 2 and M
  long long int P[M];           // 1D array of size M
  int num_procs;                // Total number of available processors
  int max_threads;              // Maximum number of usable threads
  int thread_id;                // ID of each participating thread
  double wall_time = 0.00;      // Wall time

  // Total number of available processors and maximum number of usable threads
  num_procs   = omp_get_num_procs();
  max_threads = omp_get_max_threads(); // Same as OMP_NUM_THREADS

  // Thread ID
  thread_id = omp_get_thread_num();

  // Start the timer
  wall_time = omp_get_wtime();

  // Problem statement
  printf("\n" );
  printf("  OpenMP C program to count the number of primes between\n");
  printf("  2 and pow(10, %d) using using the sieve of Eratosthenes.\n\n", N);
  printf("  Total number of processors available          : %d\n",   num_procs);
  printf("  Maximum number of usable threads              : %d\n",   max_threads);

  // Potential for improvement
  // #1. Check if the executable has been called with an appropriate 
  //     number of arguments
  // #2. Keep simulation parameters (i.e., N) outside of thea core program; 
  //     incorporate input validation
  // #3. Memory pre-allocation in arrays    
  // #4. If writing to and/or reading from a file, check file/folder 
  //     permissions

  // Populate the array, P[M]
  P[0] = 0;
  P[1] = 0;
  for (i = 2; i < M; i++) {
    P[i] = 1;
  }

  // Sieve of Eratosthenes
  // If the number is prime, then retain P[i] = 1.
  // If not, then set P[i] = 0
  for (i = 2; i * i <= M; i++) {
    if (P[i] == 1) {
      // 'pragma omp parallel for' did not work for the outer loop
      #pragma omp parallel for
      for (j = i * i; j <= M; j = j + i) {
        P[j] = 0;
      }
    }
  }

  // Count the number of array elements that are 1
  for (i = 2; i <= M; i++) {
    if (P[i] == 1) {
      primes = primes + 1;
    }
  }

  // Stop the timer and count the time
  wall_time = omp_get_wtime() - wall_time;

  // Print the results
  printf("  Number of primes between from 2 to pow(10, %d) : %lli\n", N, primes);
  printf("  Total time taken                              : %f seconds\n\n", wall_time);

  // Indicate termination
  return 0;
}
