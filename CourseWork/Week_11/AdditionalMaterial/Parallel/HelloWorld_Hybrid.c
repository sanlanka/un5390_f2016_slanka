// HelloWorld_Hybrid.c
//
// Hybrid MPI+OpenMP C program to demonstrate parallelization.
// Each participating thread from each process prints "Hello, World!".
// Compilation/Execution takes less the one second on most modern hardware
// (circa 2015) running Linux OS with GCC 4.4.7 and MPICH 3.2.
//
// Compilation and execution
// mpicc -Wall -g -lm -fopenmp HelloWorld_Hybrid.c -o HelloWorld_Hybrid.x
// OMP_NUM_THREADS=2 (or 4 or 8 or 16, as appropriate)
// mpirun -n NPROCS -f LIST-OF-MACHINE $(pwd)/HelloWorld_Hybrid.x
// NPROCS : Number of processors allocated to running this program

// Headers and functions
#define PARALLEL_OMP   // Conditional inclusion of omp.h in functions.h
#define PARALLEL_MPI   // Conditional inclusion of mpi.h in functions.h
#include "functions.h"

// main()
int main(int argc, char **argv) {

  // Variable declaration
  int num_procs;                          // Number of processors
  int proc_id;                            // ID of each participating processor
  int max_threads;                        // Maximum number of usable threads
  int thread_id;                          // ID of each participating thread
  int name_length;                        // Length of processor name
  char proc_name[MPI_MAX_PROCESSOR_NAME]; // Processsor name

  // Initialize MPI
  MPI_Init(&argc, &argv);

  // Number of processors, ID of each processor and processor name
  MPI_Comm_size(MPI_COMM_WORLD, &num_procs);
  MPI_Comm_rank(MPI_COMM_WORLD, &proc_id);
  MPI_Get_processor_name(proc_name, &name_length);

  // MASTER processor
  // Problem statement
  if (proc_id == 0) {
    printf("\n");
    printf("  Hybrid MPI+OpenMP program to 'Hello, World!'\n\n");

    printf("  ---------------------------------------------------------------\n");
    printf("    Hostname             MaxProcs  ProcID  MaxThreads  ThreadID\n");
    printf("  ---------------------------------------------------------------\n");
  }

  // Impose a barrier
  // MPI_Barrier(MPI_COMM_WORLD);

  // OpenMP
  #pragma omp parallel default(shared) private(max_threads, thread_id)
  {
    max_threads = omp_get_max_threads(); // Same as OMP_NUM_THREADS
    thread_id   = omp_get_thread_num();

    // Print message
    printf("    %-20s  %7d  %6d  %10d  %8d\n",
              proc_name, num_procs, proc_id, max_threads, thread_id);
  }

  // Impose a barrier
  // MPI_Barrier(MPI_COMM_WORLD);

  // MASTER processor
  // Draw line at the end of the table
  if (proc_id == 0) {
    printf("  ---------------------------------------------------------------\n\n");
  }

  // Finalize MPI
  MPI_Finalize();

  // Indicate termination
  return 0;
}
