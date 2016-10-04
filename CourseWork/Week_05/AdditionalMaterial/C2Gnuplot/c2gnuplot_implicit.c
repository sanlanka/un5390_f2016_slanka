// c2gnuplot_implicit.c
//
// A program to demonstrate the integration of Gnuplot as a visualization tool
// with C. The program generates a pair of given number of pseudo random 
// numbers between specified lower and upper limits, and uses them as (x, y)
// coordinates to plot within the core computation loop. Compilation takes 
// less than one second, and execution can take several seconds (depending on 
// the values of N and interval variables) on most modern hardware running 
// Linux OS with GCC.
//
// Plots the data as and when the data is being generated without writing it
// to a file on the disk.
//
// Compilation and execution:
// gcc -Wall -g -pg c2gnuplot_implicit.c -lm -o c2gnuplot_implicit.x
// ./c2gnuplot_implicit.x

// Headers
#include <stdio.h>    // Core input/output operations
#include <stdlib.h>   // Conversions, random numbers, memory allocation, etc.
#include <string.h>   // String operations
#include <unistd.h>   // Access to the POSIX operating system API
#include <math.h>     // Common mathematical functions
#include <time.h>     // Converting between various date/time formats
#include <sys/time.h> // Additional time operations

// random_number_generator()
// Given two numbers, -R and R, this function generates a random number 
// between them.
double random_number_generator(double a, double b) {

  // Variable declaration
  double prn; // Pseudo-random number

  // Generate a pseudo-random number between a and b
  prn = ((b - a) * ((double) rand()/(double) RAND_MAX)) + a;

  // Return the value of pseudo-random number
  return prn;
}

// main()
int main() {

  // Variable declaration
  int i;                // Loop index
  int N = 256;          // Number of random numbers
  int seed = 1000000;   // Seed for random number generator
  int interval = 50000; // Sleep interval (micro seconds)
  double llimit = -1.0; // Lower limit for random numbers
  double ulimit = 1.0;  // Upper limit for random numbers
  double x, y;          // Random numbers
  FILE *pipe;           // File pointer for Gnuplot

  // Seed the random number generator
  srand(seed);  

  // Open a persistent connection to Gnuplot
  pipe = popen("gnuplot -persist", "w");

  // Gnuplot settings (basic)
  fprintf(pipe, "set title 'Distribution of %d random numbers (implicit plot)' \n", N);
  fprintf(pipe, "set xlabel 'x' \n");
  fprintf(pipe, "set ylabel 'y' \n");
  fprintf(pipe, "set grid \n");
  fprintf(pipe, "set pointsize 1 \n");
  fprintf(pipe, "set xrange[-1.1:1.1] \n");
  fprintf(pipe, "set yrange[-1.1:1.1] \n");

  // Core computation and visualization loop
  for (i = 1; i <= N; i++) {

    // Random number generation
    x = random_number_generator(llimit, ulimit);
    y = random_number_generator(llimit, ulimit);

    // Plot the data
    // It may not be necessary to plot every data point
    if (i == 1) {
      fprintf(pipe, "plot '< echo %lf, %lf' with points pt 6 notitle \n", x, y);
    } else {
      fprintf(pipe, "replot '< echo %lf, %lf' with points pt 6 notitle \n", x, y);
    }

    // Flush the pipe to update the plot
    fflush(pipe);

    // Pause the process for 'interval' micro seconds.
    // This will be unnecessary if the core computation takes a significant
    // amount of time.
    usleep(interval);
  }

  // Close the pipe
  fclose(pipe);

  // Indicate termination
  return 0;
}
