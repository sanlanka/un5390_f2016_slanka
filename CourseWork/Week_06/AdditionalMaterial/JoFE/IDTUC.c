// IDTUC.c
//
// C program to demonstrate the caveats associated with integer division,
// type upgradation and the concept of casting. Compilation/Execution takes 
// less the one second on most modern hardware running Linux OS with GCC.
//
// Compliation and execution:
// gcc -Wall -g -pg IDTUC.c -o IDTUC.x -lm
// ./IDTUC.x

// Headers and functions
#include "functions.h"

// main()
int main() {

  // Variable declaration
  int a = 5;
  int b = 4;
  double p = 5.0;
  double q = 4.0;

  printf("\n");
  printf(" -------------------------------------------------------------------------\n");

  // Division with no 'type upgradation' or 'casting'
  int c = a / b;
  double r = p / q;

  printf("   No 'type upgradation' or 'casting'\n");
  printf(" -------------------------------------------------------------------------\n");
  printf("   a  b  c = a/b                       p     q     r = p/q\n");
  printf("   %d  %d  %d                             %4.2f  %4.2f  %4.2f\n",
             a, b, c, p, q, r);
  printf(" -------------------------------------------------------------------------\n");

  // Division with 'type upgradation' but before 'casting'
  // In this case, 'int' is the narrower type (with less range) and 'double'
  // is the wider type (with more range). As such, a (int) and b (int) are
  // converted to 'double', and the result is 'double'.
  double d = a / q;
  double s = p / b;

  printf("   With 'type upgradation' but before 'casting'\n");
  printf(" -------------------------------------------------------------------------\n");
  printf("   a  b  c = a/q                       p     q     r = p/b\n");
  printf("   %d  %d  %4.2f                          %4.2f  %4.2f  %4.2f\n",
             a, b, d, p, q, s);
  printf(" -------------------------------------------------------------------------\n");

  // Division with 'casting'
  double e = (double) a / (double) b;
  int t = (int) p / (int) q;

  printf("   With 'casting'\n");
  printf(" -------------------------------------------------------------------------\n");
  printf("   a  b  c = (double) a / (double) b   p     q     r = (int) p / (int) q\n");
  printf("   %d  %d  %4.2f                          %4.2f  %4.2f  %d\n", 
             a, b, e, p, q, t);
  printf(" -------------------------------------------------------------------------\n\n");

  // Indicate termination
  return 0;
}
