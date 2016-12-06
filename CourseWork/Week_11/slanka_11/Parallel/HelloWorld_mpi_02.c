// HelloWorld_mpi_02.c
//
// MPICH C program to demonstrate parallelization. Each participating
// processor prints "Hello, World!". Includes timing information using
// MPI_Wtime() function. Compilation/Execution takes less the one second on 
// most modern hardware (circa 2015) running Linux OS with MPICH 3.2.
//
// Compilation and execution:
// mpicc -Wall -g -lm HelloWorld_mpi_02.c -o HelloWorld_mpi_02.x
// mpirun -n NPROCS $(pwd)/HelloWorld_mpi_02.x
// NPROCS : Number of processors allocated to running this program

// Headers and functions
#define PARALLEL_MPI   // Conditional inclusion of mpi.h in functions.h
#include "functions.h"

// main()
int main (int argc, char **argv) {

  // Variable declaration
  int num_procs;                          // Number of processors
  int proc_id;                            // ID of each participating processor
  int name_length;                        // Length of processor name
  char proc_name[MPI_MAX_PROCESSOR_NAME]; // Processsor name
  double wall_time = 0.00;                // Wall time

  // Initialize MPI
  MPI_Init(&argc, &argv);

  // Number of processors, ID of each processor and processor name
  MPI_Comm_size(MPI_COMM_WORLD, &num_procs);
  MPI_Comm_rank(MPI_COMM_WORLD, &proc_id);
  MPI_Get_processor_name(proc_name, &name_length);

  // Start the timer
  wall_time = MPI_Wtime();

  // MASTER processor
  if (proc_id == 0) {
    printf("\n");
    printf("  Total number of processors : %d\n\n", num_procs);
  }

  // Print message
  printf("  Hello, World! from processor %d out of %d in %s\n", 
            proc_id, num_procs, proc_name);

  // Stop the timer
  wall_time = MPI_Wtime() - wall_time;

  // MASTER processor
  if (proc_id == 0) {
    printf("\n");
    printf("  Total time taken           : %f seconds\n\n", wall_time);
  }

  // Finalize MPI
  MPI_Finalize();

  // Indicate termination
  return 0;
}
