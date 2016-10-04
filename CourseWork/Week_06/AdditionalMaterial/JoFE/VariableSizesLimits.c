// VariableSizesLimits.c
//
// C program to display the minimum and maximum values associated with 
// various data types. Compilation/Execution takes less the one second on most 
// modern hardware running Linux OS with GCC.
//
// Compliation and execution:
// gcc -Wall -g -pg VariableSizesLimits.c -o VariableSizesLimits.x -lm
// ./VariableSizesLimits.x

// Headers and functions
#include "functions.h"

// main()
int main() {

  // Variable declaration
  char                   x_char;
  unsigned char          x_unsigned_char;

  int                    x_int;
  unsigned int           x_unsigned_int;

  short int              x_short_int;
  unsigned short int     x_unsigned_short_int;

  long int               x_long_int;
  unsigned long int      x_unsigned_long_int;

  long long int          x_long_long_int;
  unsigned long long int x_unsigned_long_long_int;

  float                  x_float;
  double                 x_double;
  long double            x_long_double;

  // Print the minimum and maximum values associated with various data types
  // and the number of bytes necessary to store them in memory
  printf("\n");
  printf(" --------------------------------------------------------------------------------\n");
  printf("   %-22s %24s  %20s  %5s\n", "Data Type", "Minimum Value", "Maximum Value", "Bytes");
  printf(" --------------------------------------------------------------------------------\n");
  printf("   %-22s %24d  %20d  %5lu\n",     "(signed) char",
                                            CHAR_MIN, CHAR_MAX, sizeof(x_char));
  printf("   %-22s %24d  %20d  %5lu\n",     "unsigned char",
                                            0, UCHAR_MAX, sizeof(x_unsigned_char));
  printf(" --------------------------------------------------------------------------------\n");
  printf("   %-22s %24d  %20d  %5lu\n",     "(signed) int",
                                            INT_MIN, INT_MAX, sizeof(x_int));
  printf("   %-22s %24u  %20u  %5lu\n",     "unsigned int",
                                            0, UINT_MAX, sizeof(x_unsigned_int));

  printf("   %-22s %24d  %20d  %5lu\n",     "(unsigned) short int",
                                            SHRT_MIN, SHRT_MAX, sizeof(x_short_int));
  printf("   %-22s %24d  %20d  %5lu\n",     "unsigned short int",
                                            0, USHRT_MAX, sizeof(x_unsigned_short_int));

  printf("   %-22s %24ld  %20ld  %5lu\n",   "(signed) long int",
                                            LONG_MIN, LONG_MAX, sizeof(x_long_int));
  printf("   %-22s %24d  %20lu  %5lu\n",    "unsigned long int",
                                            0, ULONG_MAX, sizeof(x_unsigned_long_int));

  printf("   %-22s %24lld  %20lld  %5lu\n", "(signed) long long int",
                                            LLONG_MIN, LLONG_MAX, sizeof(x_long_long_int));
  printf("   %-22s %24d  %20llu  %5lu\n",   "unsigned long long int",
                                            0, ULLONG_MAX, sizeof(x_unsigned_long_long_int));
  printf(" --------------------------------------------------------------------------------\n");
  printf("   %-11s (%d digits)  %23.6g  %20.6g  %5lu\n",    "float",
                                                            FLT_DIG,  FLT_MIN,  FLT_MAX, sizeof(x_float));
  printf("   %-11s (%d digits)  %22.6g  %20.6g  %5lu\n",    "double",
                                                            DBL_DIG,  DBL_MIN,  DBL_MAX, sizeof(x_double));
  printf("   %-11s (%d digits)  %22.6Lg  %20.6Lg  %5lu\n",  "long double",
                                                            LDBL_DIG, LDBL_MIN, LDBL_MAX, sizeof(x_long_double));
  printf(" --------------------------------------------------------------------------------\n\n");

  // Indicate termination
  return 0;
}
