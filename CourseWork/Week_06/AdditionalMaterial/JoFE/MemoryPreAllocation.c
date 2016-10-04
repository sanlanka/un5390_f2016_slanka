// MemoryPreAllocation.c
//
// C program to demonstrate pre-allocation of memory. Compilation/Execution 
// takes less the one second on most modern hardware running Linux OS with GCC.
//
// Compliation and execution:
// gcc -Wall -g -pg MemoryPreAllocation.c -o MemoryPreAllocation.x -lm
// ./MemoryPreAllocation.x

// Headers and functions
#include "functions.h"

// main()
int main() {

  // Variable declaration
  int N = 10;

  // Declaring an array iff there is enough memory to do so
  int *x_ptr = (int *) malloc(N * sizeof(int));
  int *y_ptr = (int *) malloc(N * N * sizeof(int));

  // If there isn't enough memory, display an appropriate message
  if (x_ptr == NULL) {
    printf("\n");
    printf("  Not enough memory to assign x[%d]\n", N);
    exit(1);
  }

  if (y_ptr == NULL) {
    printf("\n");
    printf("  Not enough memory to assign y[%d][%d]\n", N, N);
    exit(1);
  }

  // There is enough memory; declare the arrays
  // int x[N];
  // int y[N][N];

  // Array arithmetic and/or manipulation
  printf("\n");
  printf("  There is enough memory to declare and intialize x[%d] and y[%d][%d].\n\n", N, N, N);

  // Free up the memory
  free(x_ptr);
  free(y_ptr);

  // 'Point to data' must not be used again, unless re-assigned using malloc()
  x_ptr = NULL;
  y_ptr = NULL;

  // Indicate termination
  return 0;
}
