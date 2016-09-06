/// @file  HelloWorld.c
/// @brief Print 'Hello, World!' in a terminal.
///
/// Compilation/Execution takes less the one second on most modern hardware 
/// running linux OS with GCC 4.8.5.
///
/// Compilation and execution:
/// gcc -g -Wall HelloWorld.c -o HelloWorld.x
/// ./HelloWorld.x
///
/// @author Gowtham
/// @bug    No known bugs

/// Headers
#include <stdio.h>

/// main()
int main() {

  /// Print the message
  printf("\n  Hello, World!\n\n");

  /// Indicate termination
  return 0;
}
