// ArrayManipulation_omp_01.c
//
// OpenMP C program to manipulate array elements. Compilation/Execution tested
// in modern hardware (circa 2015) running linux OS with GCC 4.4.7.
//
// Compilation and execution
// gcc -Wall -g -lm -fopenmp ArrayManipulation_omp_01.c -o ArrayManipulation_omp_01.x
// OMP_NUM_THREADS=2 (or 4 or 8 or 16, as appropriate)
// $(pwd)/ArrayManipulation_omp_01.x

// Headers and functions
#define PARALLEL_OMP   // Conditional inclusion of omp.h in functions.h
#include "functions.h"

// main()
int main(int argc, char **argv) {

  // Variable declaration
  int N = pow(2, 30);           // Size of the array
  int i;                        // Running index
  double A[N], B[N], C[N];      // Three 1D arrays of size N
  double wall_time = 0.00;      // Wall time
  clock_t start_time, end_time; // Start and end time

  // Start the timer
  start_time = clock();

  printf("\n");
  printf("  OpenMP C program to demonstrate array manipulation.\n\n");

  printf("  Size of the array : %d\n", N);

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
  //
  // for (i = 0; i < N; i++) {
  //   printf("    %2d   %5.2f   %5.2f   %5.2f\n", i, A[i], B[i], C[i]);
  // }
  // printf("  ------------------------------\n\n");
  // DEBUG #1

  // Manipulate the array
  #pragma omp parallel for default(shared), private(i)
  for (i = 0; i < N; i++) {
    C[i] = A[i] + B[i];
  }

  // Stop the timer and count the time
  end_time  = clock();
  wall_time = (double)(end_time - start_time)/CLOCKS_PER_SEC;

  // DEBUG #2
  // Uncomment this section if necessary
  // printf("  Post-manipulation\n");
  // printf("  ------------------------------\n");
  // printf("     i    A[i]    B[i]    C[i]    \n");
  // printf("  ------------------------------\n");
  //
  // for (i = 0; i < N; i++) {
  //   printf("    %2d   %5.2f   %5.2f   %5.2f\n", i, A[i], B[i], C[i]);
  // }
  // printf("  ------------------------------\n\n");
  // DEBUG #2

  printf("  Total time taken  : %f seconds\n\n", wall_time);

  // Indicate termination
  return 0;
}
