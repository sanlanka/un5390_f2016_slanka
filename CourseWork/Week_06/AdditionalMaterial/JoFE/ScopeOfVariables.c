// ScopeOfVariables.c
//
// C program to demonstrate the scope (of existence) of a variable. Prints 
// the value of a variable before and after a 'while' loop. Also, prints the 
// value of another variable, with the same name, that exists just within the 
// aforementioned 'while' loop. Compilation/Execution takes less the one 
// second on most modern hardware running Linux OS with GCC.
//
// Compliation and execution:
// gcc -Wall -g -pg ScopeOfVariables.c -o ScopeOfVariables.x -lm
// ./ScopeOfVariables.x

// Headers and functions
#include "functions.h"

// main()
int main() {

  // Variable declaration
  int i = 1;
  int N = 5;
  double x = 3.1415;

  // Print x before the 'while' loop
  printf("\n");
  printf(" ------------------------------------------\n");
  printf("   Location                        x\n");
  printf(" ------------------------------------------\n");
  printf("   Before the while loop begins    %5.4f\n\n", x); 
  printf("   Within the while loop\n"); 

  // while loop begins
  // A similar behavior shows up for 'for' loop as well
  while (i <= N) {

    // Variable declaration
    double x = i * 1.0101;

    // Print x within the 'while' loop
    printf("     # %02d                          %5.4f\n", i, x); 

    // Increment i by 1
    i++;
  }
  // while loop ends

  // Print x before the 'while' loop
  printf("\n");
  printf("   After the while loop ends       %5.4f\n", x); 
  printf(" ------------------------------------------\n\n");

  // Indicate termination
  return 0;
}
