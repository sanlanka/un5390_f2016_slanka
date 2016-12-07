#! /bin/bash
# slanka for Do AT Home 
# BASH script to compile a specific 
# Usage:
# compile.sh FILE_NAME.EXTN
# Compile using gcc compiler #can be edited to work for any compilation
# Necessary variables
EXPECTED_ARGS=1               # Expected number of arguments
EXIT_CODE_ARG=64              # Error: Incorrect number of arguments
EXIT_CODE_ARG=2 
EXIT_CODE_LOC=13

TODAY=$(date +"%Y%m%d_%H%M%S")
SOURCEFILE="$1"
SOURCECODE=${SOURCEFILE:-2}
PWD=`pwd`
# Check the number of arguments
if [ $# -ne ${EXPECTED_ARGS} ]
then
  echo
  echo "  Usage: compile.sh SOURCE_FILE"
  echo "   e.g.: compile.sh clean"
  echo
  exit ${EXIT_CODE_ARG}
fi

# Check if the file is valid and it exits
if [ ! -f "${PWD}/${SOURCEFILE}" ]
then
  echo
  echo "  File you are looking to compile is not located in"
  echo "  ${PWD}"
  echo "  Exiting the script."
  echo
  exit ${EXIT_CODE_LOC}
fi
# check to see if the file is empty 
if [ -s "${SOURCEFILE}" ] 
then
	echo " "
	
	echo "  Checking the validity....."
        # do something as file has data
else
	echo "  Error: File is empty: Nothing to Compile"
	
exit ${EXIT_CODE_SIZE}        # do something as file is empty 
fi
# Additional variables
TODAY=$(date +"%Y%m%d_%H%M%S")
SOURCEFILE="$1"
echo ""
# Record start time information
echo "  Start time : $(date -R) ($(date +"%s"))" 
echo " "
echo "  The file is Valid and Present in the given location"
echo " "
echo "  and ready for compilation"
echo " "

#compile
gcc -Wall -g -pg ${SOURCECODE} -lm -o ${SOURCECODE}.x 
#execute
./${SOURCECODE}.x
