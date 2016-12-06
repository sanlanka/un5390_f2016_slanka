// MonteCarloPi_mpi.c
//
// MPICH C program to demonstrate parallelization, master-worker work
// distribution and compute the value of PI using dart board algorithm
// (Monte Carlo method). Master processor prints the problem statement and 
// simulation parameters. Each participating processor keeps a local count of
// number of darts that landed within the circle. These local values are summed
// up using reduction operation. Master processor then prints the summary.
// Master-Worker separation is identified using processor ID. Implements
// reduction operation (collective communication). Compilation/Execution 
// tested in modern hardware (circa 2015) running Linux OS with MPICH 3.2.
//
// Compilation and execution:
// mpicc -Wall -g -lm MonteCarloPi_mpi.c -o MonteCarloPi_mpi.x
// mpirun -n NPROCS $(pwd)/MonteCarloPi_mpi.x
// NPROCS : Number of processors allocated to running this program

// Headers and functions
#define PARALLEL_MPI   // Conditional inclusion of mpi.h in functions.h
#include "functions.h"

// main()
int main (int argc, char *argv[]) {

  // Variable declaration
  int num_procs;                 // Number of processors
  int proc_id;                   // ID of each participating processor
  int N = pow(2, 30);            // Total number of darts thrown
  int dart_chunk;                // Portion of the darts for each processor
  int n_circle = 0;              // Darts in the circle (global)
  int n_circle_local = 0;        // Darts in the circle (local)
  int i;                         // Running index
  double pi = 3.141592653589793; // Known value of PI
  double pi_computed = 0.00;     // Computed value of PI
  double pi_error = 0.00;        // Error in the computed value of PI
  double R = 2.00;               // Radius of the circle inscribed within square
  double x, y;                   // Random numbers in the range (-R, R)
  double z;                      // Square root of (x^2 + y^2)
  double wall_time = 0.00;       // Wall time

  // Initialize MPI
  MPI_Init(&argc, &argv);

  // Number of processors and processor ID
  MPI_Comm_size(MPI_COMM_WORLD, &num_procs);
  MPI_Comm_rank(MPI_COMM_WORLD, &proc_id);

  // Variable initialization
  dart_chunk = N/num_procs; // dart_chunk needs to be an integer

  // MASTER processor
  if (proc_id == 0) {
    printf("\n" );
    printf("  MPICH C program to demonstrate parallelization and \n");
    printf("  master-worker division of labor via Monte Carlo PI evaluation.\n\n");

    printf("  Total number of processors          : %d\n", num_procs);
    printf("  Total number of darts thrown        : %d\n", N);
    printf("  Number of darts per processor       : %d\n", dart_chunk);

    // Potential for improvement
    // #1. Check if the executable has been called with an appropriate 
    //     number of arguments
    // #2. Keep simulation parameters (i.e., # of darts) outside of the
    //     core program; incorporate input validation
    // #3. Check if the # of darts is integer-divisible by the number of 
    //     usable threads
    // #4. If writing to and/or reading from a file, check file/folder 
    //     permissions

    // Start the timer
    wall_time = MPI_Wtime();
  }

  // Impose a barrier
  MPI_Barrier(MPI_COMM_WORLD);

  // Parallel region
  // Seed for random number generator
  // srand((unsigned)time(NULL));
  struct timeval t1;
  gettimeofday(&t1, NULL);
  srand(t1.tv_usec * t1.tv_sec);

  // Throw dart_chunk darts
  for (i = 1; i <= dart_chunk; i++) {
    // Generate random numbers x and y between -R and R
    x = random_number_generator(-R, R);
    y = random_number_generator(-R, R);

    // If the dart is in the circle, increment n_circle
    z = sqrt((x * x) + (y * y));
    if (z <= R) {
     n_circle_local++;
    }
  } 

  // Impose a barrier
  MPI_Barrier(MPI_COMM_WORLD);

  // Sum up the values of pi_local across all WORKERS (including master)
  // MPI_Reduce(send_buf, recv_buf, count, data type, operation, destination, communicator)
  MPI_Reduce(&n_circle_local,
             &n_circle,
             1,
             MPI_INT,
             MPI_SUM,
             0,
             MPI_COMM_WORLD);

  // Impose a barrier
  MPI_Barrier(MPI_COMM_WORLD);

  // MASTER processor
  if (proc_id == 0) {

    // Calculate the value of pi
    pi_computed = 4.0 * (double) n_circle/(double) N;
    pi_error    = fabs(pi - pi_computed);

    // Stop the timer
    wall_time = MPI_Wtime() - wall_time;

    printf("  Total number of darts in the circle : %d\n",           n_circle);
    printf("  Known value of PI                   : %16.15f\n",      pi);
    printf("  Computed value of PI                : %16.15f\n",      pi_computed);
    printf("  Error in the computed value of PI   : %16.15f\n",      pi_error);
    printf("  Total time taken                    : %f seconds\n\n", wall_time);
  }

  // Finalize MPI
  MPI_Finalize();

  // Indicate termination
  return 0;
}
