// ArrayIndex.c
//
// C program to demonstrate segmentation fault. Compilation/Execution takes
// less the one second on most modern hardware running Linux OS with GCC.
//
// Compilation and execution:
// gcc -Wall -g -pg ArrayIndex.c -lm -o ArrayIndex.x
// ./ArrayIndex.x

// Headers and functions
#include "functions.h"

// main()
int main() {

  // Variable declaration
  int i;           // Loop index
  int student[30]; // Array

  // Print the problem statement
  printf("\n");
  printf("  This program populates an array\n\n");

  // Populate the array
  for (i = 0; i <= 300; i++) {
    student[i] = i;
  }

  // Indicate termination
  return 0;
}
