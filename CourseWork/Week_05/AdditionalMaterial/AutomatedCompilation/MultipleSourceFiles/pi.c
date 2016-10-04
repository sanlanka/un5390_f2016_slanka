// pi.c
//
// C program to compute the value of 'pi' for a given number of terms using 
// the Newton and Madhava approximations. Compilation/Execution takes less 
// than one second on most modern hardware running Linux OS with GCC.
//
// Compilation (without Makefile; with one command):
// gcc -Wall -g -pg pi.c pi_1.c pi_2.c -lm -o pi.x
//
// Compilation (without Makefile; with multiple commands):
// gcc -Wall -g -pg -c pi.c
// gcc -Wall -g -pg -c pi_1.c
// gcc -Wall -g -pg -c pi_2.c
// gcc pi.o pi_1.o pi_2.o -lm -o pi.x
//
// Compilation (with Makefile; one of the following commands):
// cp Makefile_[Simple|Concise|Elegant] Makefile
// make 
// make all
// make pi.x
//
// Execution:
// ./pi.x

// Headers
#include <stdio.h>  // Core input/output operations
#include <stdlib.h> // Conversions, random numbers, memory allocation, etc.
#include <math.h>   // Common mathematical functions
#include <time.h>   // Converting between various date/time formats
#include <unistd.h> // Hostname, etc.

// Function declaration
long double pi_newton(int n);
long double pi_madhava(int n);
long double pi_error(long double PI, long double PI_C);

// main()
int main() {

  // Variable declaration
  long double PI = 3.141592653589793; // Known value of PI
  int n = 75;                         // Number of terms

  // Print the problem statement
  printf("\n");
  printf("  C program to evaluate PI using the Newton and Madhava approximations\n");

  // Evaluate PI_1 and PI_2
  long double PI_1 = pi_newton(n);
  long double PI_2 = pi_madhava(n);

  // Calculate the error in PI_1 and PI_2
  long double ERROR_PI_1 = pi_error(PI, PI_1);
  long double ERROR_PI_2 = pi_error(PI, PI_2);

  // Print the summary
  printf("\n");
  printf("                n : %d\n", n);
  printf("               PI : %16.15Lf\n", PI);
  printf("     PI_1 (Error) : %16.15Lf (%16.15Lf) \n", PI_1, ERROR_PI_1);
  printf("     PI_2 (Error) : %16.15Lf (%16.15Lf) \n\n", PI_2, ERROR_PI_2);

  // Indicate termination
  return 0;
}

// pi_error()
// Evaluates the error in computed value of PI
long double pi_error(long double PI, long double PI_C) {

  // Calculate the error in PI_C
  long double PI_ERROR = fabs((PI - PI_C)/PI) * 100;

  // Return error to parent module
  return PI_ERROR;
}
