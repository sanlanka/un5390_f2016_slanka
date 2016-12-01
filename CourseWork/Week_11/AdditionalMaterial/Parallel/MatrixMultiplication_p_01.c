// matrix_multiplication_omp_01.c
//
// OpenMP C program to perform matrix multiplication. Checks the order of 
// involved matrices before proceeding ahead with multiplication. 
// Compilation/Execution tested in modern hardware (circa 2015) running linux 
// OS with GCC 4.4.7.
// 
// Matrix elements generated within the program
// A[NRAxNCA]
// B[NRBxNCB]
// C[NRAxNCB]
//
// Compilation and execution:
// gcc -Wall -g -lm -fopenmp matrix_multiplication_omp_01.c -o matrix_multiplication_omp_01.x
// OMP_NUM_THREADS=2 (or 4 or 8 or 16, as appropriate)
// ./matrix_multiplication_omp_02.x NROWS_A NCOLS_A NROWS_B NCOLS_B

// Headers and functions
#define PARALLEL_OMP   // Conditional inclusion of omp.h in functions.h
#include "functions.h"
#define NUM_ARGS 5     // Number of required arguments

// main()
int main(int argc, char **argv) {

  // Variable declaration 
  int NRA;                      // Number of rows in A (and C)
  int NCA;                      // Number of columns in A
  int NRB;                      // Number of rows in B
  int NCB;                      // Number of columns in B (and C)
  int i, j, k;                  // Running indices
  double wall_time = 0.00;      // Wall time
  clock_t start_time, end_time; // Start and end time

  // If not called with an appropriate number of arguments, quit the program 
  // with a helpful error message
  if (argc != NUM_ARGS) {
    printf("\n    Usage   : %s NROWS_A NCOLS_A NROWS_B NCOLS_B", argv[0]);
    printf("\n    Example : %s 1024 1024 1024 1024", argv[0]);
    printf("\n              %s 1024 1024 1024 1\n\n", argv[0]);
    exit(1);
  }

  // Start the timer
  start_time = clock();

  // Variable initialization and matrix declaration
  NRA = atoi(argv[1]);
  NCA = atoi(argv[2]);
  NRB = atoi(argv[3]);
  NCB = atoi(argv[4]);
  int A[NRA][NCA];     // Matrix A - NRAxNCA
  int B[NRB][NCB];     // Matrix B - NRBxNCB
  int C[NRA][NCB];     // Matrix C - NRAxNCB

  // Problem statement
  printf("\n" );
  printf("  OpenMP C program to perform matrix multiplication.\n\n");

  printf("  Number of rows in A (and C)          : %d\n", NRA);
  printf("  Number of columns in A               : %d\n", NCA);
  printf("  Number of rows in B                  : %d\n", NRB);
  printf("  Number of columns in B (and C)       : %d\n", NCB);

  // Check for the order and dimension of matrices. If number of columns in A 
  // does not equal the number of rows in B, quit the program with a helpful 
  // error message
  if (NCA != NRB) {
    printf("\n    Number of columns in A does not equal the number of rows in B.");
    printf("\n    Exiting.\n\n");
    exit(1);
  }

  // Potential for improvement
  // #1. Incorporate input validation
  // #2. Check if the matrix dimensions are integer-divisible by the number 
  //     of usable threads
  // #3. Perform memory pre-allocation prior to populating the arrays
  // #4. If writing to and/or reading from a file, check file/folder 
  //     permissions

  // Populate A, B, C
  for (i = 0; i < NRA; i++) {
    for (j = 0; j < NCA; j++) {
      A[i][j] = i * (NRA - i - 1) * j * (NCA - j - 1);
    }
  }

  for (i = 0; i < NRB; i++) {
    for (j = 0; j < NCB; j++) {
      B[i][j] = i + j + 2;
    }
  }

  for (i = 0; i < NRA; i++) {
    for (j = 0; j < NCB; j++) {
      C[i][j] = 0;
    }
  }

  // Matrix multiplication
  #pragma omp parallel
  {
    #pragma omp for
      for (i = 0; i < NRA; i++) {
        for (j = 0; j < NCB; j++) {
          for (k = 0; k < NCA; k++) {
            C[i][j] = C[i][j] + (A[i][k] * B[k][j]);
          }
        }
      }
  }

  // Stop the timer
  end_time = clock();

  // Count the time
  wall_time = (double)(end_time - start_time)/CLOCKS_PER_SEC;

//   // DEBUG #1
//   // Print A, B, C
//   // Uncomment the section below (for 'smaller' matrices) if necessary
//   printf("\n\n  A, B, C\n\n");
//   for (i = 0; i < NRA; i++) {
//     for (j = 0; j < NCA; j++) {
//       printf("  %6d", A[i][j]);
//     }
//     printf("\n");
//   }
// 
//   printf("\n\n");
//   for (i = 0; i < NRB; i++) {
//     for (j = 0; j < NCB; j++) {
//       printf("  %6d", B[i][j]);
//     }
//     printf("\n");
//   }
// 
//   printf("\n\n");
//   for (i = 0; i < NRA; i++) {
//     for (j = 0; j < NCB; j++) {
//       printf("  %6d", C[i][j]);
//     }
//     printf("\n");
//   }
//   printf("\n\n");
//   // DEBUG #1

  printf("  Total time taken                     : %f seconds\n\n", wall_time);

  // Indicate termination
  return 0;
}
