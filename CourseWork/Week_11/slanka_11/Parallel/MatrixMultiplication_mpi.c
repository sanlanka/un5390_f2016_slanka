// MatrixMultiplication_mpi.c
//
// MPICH C program to perform matrix multiplication. Checks the order of 
// involved matrices before proceeding ahead with multiplication. 
// Compilation/Execution tested in modern hardware (circa 2015) running Linux
// OS with MPICH 3.2
// 
// Matrix elements generated within the program
// A[NRAxNCA]
// B[NRBxNCB]
// C[NRAxNCB]
//
// Compilation and execution:
// mpicc -Wall -g -lm MatrixMultiplication_mpi.c -o MatrixMultiplication_mpi.x
// mpirun -n NPROCS $(pwd)/MatrixMultiplication_mpi.x
// NPROCS : Number of processors allocated to running this program

// Headers and functions
#define PARALLEL_MPI   // Conditional inclusion of mpi.h in functions.h
#include "functions.h"

// main()
int main(int argc, char **argv) {

  // Variable declaration 
  int num_procs;           // Number of processors
  int proc_id;             // ID of each participating thread
  int NRA = pow(2, 10);    // Number of rows in A (and C)
  int NCA = pow(2, 10);    // Number of columns in A
  int NRB = pow(2, 10);    // Number of rows in B
  int NCB = pow(2, 10);    // Number of columns in B (and C)
  int A[NRA][NCA];         // Matrix A - NRAxNCA
  int Atmp[NRA][NCA];      // Matrix Atmp - NRAxNCA
  int B[NRB][NCB];         // Matrix B - NRBxNCB
  int C[NRA][NCB];         // Matrix C - NRAxNCB
  int Ctmp[NRA][NCB];      // Matrix Ctmp - NRAxNCB
  int i, j, k;             // Running indices
  double wall_time = 0.00; // Wall time

  // Initializae MPI
  MPI_Init(&argc, &argv);

  // Number of processors and processor ID
  MPI_Comm_size(MPI_COMM_WORLD, &num_procs);
  MPI_Comm_rank(MPI_COMM_WORLD, &proc_id);

  // MASTER processor
  if (proc_id == 0) {

    // Check for the order and dimension of matrices. If number of columns in A 
    // does not equal the number of rows in B, quit the program with a helpful 
    // error message
    if (NCA != NRB) {
      printf("\n    Number of columns in A does not equal the number of rows in B.");
      printf("\n    Exiting.\n\n");
      exit(1);
    }

    // Potential for improvement
    // #1. Keep simulation parameters (i.e., matrix order) outside of the
    //     core program; incorporate input validation
    // #2. Check if the matrix dimensions are integer-divisible by the number 
    //     of usable processors
    // #3. Perform memory pre-allocation prior to populating the arrays
    // #4. If writing to and/or reading from a file, check file/folder 
    //     permissions

    // Problem statement
    printf("\n" );
    printf("  MPICH C program to demonstrate parallelization and \n");
    printf("  master-worker division of labor via matrix multiplication.\n\n");

    printf("  Total number of processors     : %d\n", num_procs);
    printf("  Number of rows in A (and C)    : %d\n", NRA);
    printf("  Number of columns in A         : %d\n", NCA);
    printf("  Number of rows in B            : %d\n", NRB);
    printf("  Number of columns in B (and C) : %d\n", NCB);

    // Start the timer
    wall_time = MPI_Wtime();

    // Populate A, B, C
    for (i = 0; i < NRA; i++) {
      for (j = 0; j < NCA; j++) {
        A[i][j] = i * (NRA - i - 1) * j * (NCA - j - 1);
      }
    }

    for (i = 0; i < NRB; i++) {
      for (j = 0; j < NCB; j++) {
        B[i][j] = i + j + 2;
      }
    }

//     // DEBUG #1
//     // Uncomment for debugging purposes
//     for (i = 0; i < NRB; i++) {
//       for (j = 0; j < NCB; j++) {
//         if (i == j) {
//           B[i][j] = 1;
//         } else {
//           B[i][j] = 0;
//         }
//       }
//     }
//     // DEBUG #1

    for (i = 0; i < NRA; i++) {
      for (j = 0; j < NCB; j++) {
        C[i][j] = 0;
      }
    }
  }

  // Impose a barrier
  MPI_Barrier(MPI_COMM_WORLD);

  // Parallel region
  // Send all of B[NRBxNCB] to every processor
  // MPI_Bcast(buffer, count, data type, source, communicator) 
  MPI_Bcast(&B,
            NRB*NCB,
            MPI_INT,
            0,
            MPI_COMM_WORLD);

  // Send portions of A[NRAxNCA] to every processor
  // These portions are received as Atmp[NRAxNRA]
  // MPI_Scatter(send_buf, send_count, send_data_type, 
  //             recv_buf, recv_count, recv_data_type, source, communicator)
  MPI_Scatter(&A,
              NRA*NCA/num_procs,
              MPI_INT,
              &Atmp,
              NRA*NCA/num_procs,
              MPI_INT,
              0,
              MPI_COMM_WORLD);

  // Impose a barrier
  MPI_Barrier(MPI_COMM_WORLD);

  // Matrix multiplication
  // The result is stored in Ctmp[NRAxNCB]
  for (i = 0; i < NRA/num_procs; i++) {
    for (j = 0; j < NCB; j++) {
      Ctmp[i][j] = 0;
      for (k = 0; k < NCA; k++) {
        Ctmp[i][j] += Atmp[i][k] * B[k][j];
      }
    }
  }

  // Impose a barrier
  MPI_Barrier(MPI_COMM_WORLD);

  // Gather portions of Ctmp[NRAxNCB] from every processor
  // These portions are gathered into C[NRAxNCB] by MASTER
  // MPI_Gather(send_buffer, send_count, send_data_type, 
  //            recv_buffer, recv_count, recv_data_type, destination, 
  //            communicator)
  MPI_Gather(&Ctmp,
             NRA*NCB/num_procs,
             MPI_INT,
             &C,
             NRA*NCB/num_procs,
             MPI_INT,
             0,
             MPI_COMM_WORLD);

  // Impose a barrier
  MPI_Barrier(MPI_COMM_WORLD);

  // MASTER processor
  if (proc_id == 0) {

    // Stop the timer
    wall_time = MPI_Wtime() - wall_time;

//     // DEBUG #2
//     // Print A, B, C
//     // Uncomment the section below (for 'smaller' matrices) if necessary
//     printf("\n\n  A, B, C\n\n");
//     for (i = 0; i < NRA; i++) {
//       for (j = 0; j < NCA; j++) {
//         printf("  %6d", A[i][j]);
//       }
//       printf("\n");
//     }
// 
//     printf("\n\n");
//     for (i = 0; i < NRB; i++) {
//       for (j = 0; j < NCB; j++) {
//         printf("  %6d", B[i][j]);
//       }
//       printf("\n");
//     }
// 
//     printf("\n\n");
//     for (i = 0; i < NRA; i++) {
//       for (j = 0; j < NCB; j++) {
//         printf("  %6d", C[i][j]);
//       }
//       printf("\n");
//     }
//     printf("\n\n");
//     // DEBUG #2

    printf("  Total time taken               : %f seconds\n\n", wall_time);
  }

  // Finalize MPI
  MPI_Finalize();

  // Indicate termination
  return 0;
}
