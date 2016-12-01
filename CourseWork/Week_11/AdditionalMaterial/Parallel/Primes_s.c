// Primes_s.c
//
// C program to compute the number of primes between 2 and M using the sieve
// of Eratosthenes -- a simple, ancient algorithm for finding all prime numbers
// up to any given limit. It does so by iteratively marking as composite (i.e.,
// not prime) the multiples of each prime, starting with the multiples of 2.
// Compilation/Execution tested in modern hardware (circa 2015) running linux
// OS with GCC 4.4.7.
//
// Compilation and execution
// gcc -Wall -g -pg -lm Primes_s.c -o Primes_s.x
// ./Primes_s.x

// Headers and functions
#include "functions.h"

// main()
int main(int argc, char **argv) {

  // Variable declaration
  int N = 1;                    // Used to get pow(10, N)
  long long int M = pow(10, N); // Primes from 2 to M
  long long int i, j;           // Running indices
  long long int primes = 0;     // Number of primes between 2 and M
  long long int P[M];           // 1D array of size M
  double wall_time = 0.00;      // Wall time
  clock_t start_time, end_time; // Start and end time

  // Start the timer
  start_time = clock();

  // Problem statement
  printf("\n" );
  printf("  C program to compute the number of primes between\n");
  printf("  2 and pow(10, %d) using the sieve of Eratosthenes.\n\n", N);

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
  end_time  = clock();
  wall_time = (double)(end_time - start_time)/CLOCKS_PER_SEC;

  // Print the results
  printf("  Number of primes between from 2 to pow(10, %d) : %lli\n", N, primes);
  printf("  Total time taken                              : %f seconds\n\n", wall_time);

  // Indicate termination
  return 0;
}
