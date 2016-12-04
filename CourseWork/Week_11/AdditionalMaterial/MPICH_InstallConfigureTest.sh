#! /bin/bash
#
# BASH script to compile a specific version of MPICH using a specified version 
# of specific compiler. Requires student's GitHub repository for UN5390 be
# located in ${HOME}/git_work/un5390_f2016_${USER} for working completely and
# correctly.
#
# Usage:
# MPICH_InstallConfigureTest.sh MPICH_VERSION COMPILER COMPILER_VERSION

# Necessary variables
EXPECTED_ARGS=3               # Expected number of arguments
EXIT_CODE_ARG=64              # Error: Incorrect number of arguments
EXIT_CODE_GITWORK=65          # Error: GitHub repo not in the right location
EXIT_CODE_CURL=66             # Error: Curl error (downloading mpich*.tar.gz)
EXIT_CODE_TAR=67              # Error: Tar error
EXIT_CODE_CONFIGURE=68        # Error: configure error
EXIT_CODE_MAKE=69             # Error: make error
EXIT_CODE_MAKEINSTALL=70      # Error: make install error
EXIT_CODE_MAKEINSTALLCHECK=71 # Error: make installcheck error
EXIT_CODE_TMPDEL=72           # Error: cannot delete temporary folders

# Check the number of arguments
if [ $# -ne ${EXPECTED_ARGS} ]
then
  echo
  echo "  Usage: $(basename $0) MPICH_VERSION COMPILER COMPILER_VERSION"
  echo "   e.g.: $(basename $0) 3.2 gcc 4.8.5"
  echo
  exit ${EXIT_CODE_ARG}
fi

# Check if the GitHub repository is in ${HOME}/git_work/un5390_f2016_${USER}
if [ ! -d "${HOME}/git_work/un5390_f2016_${USER}" ]
then
  echo
  echo "  GitHub repository for UN5390 is not located in"
  echo "  ${HOME}/git_work/un5390_f2016_${USER}."
  echo "  Exiting the script."
  echo
  exit ${EXIT_CODE_GITWORK}
fi

# Additional variables
TODAY=$(date +"%Y%m%d_%H%M%S")
UN5390="${HOME}/git_work/un5390_f2016_${USER}"
UN5390_W11="${UN5390}/CourseWork/Week_11/${USER}_11/"
MPICH_VERSION="$1"
COMPILER="$2"
COMPILER_VERSION="$3"

# Record start time information
echo "#" > ${UN5390_W11}/${TODAY}-mpich-${MPICH_VERSION}_timing-information.txt
echo "# MPICH ${MPICH_VERSION} (w/ ${COMPILER} ${COMPILER_VERSION}) timing information" >> ${UN5390_W11}/${TODAY}-mpich-${MPICH_VERSION}_timing-information.txt
echo "" >> ${UN5390_W11}/${TODAY}-mpich-${MPICH_VERSION}_timing-information.txt
echo "  Start time : $(date -R) ($(date +"%s"))" >> ${UN5390_W11}/${TODAY}-mpich-${MPICH_VERSION}_timing-information.txt

# Create the installation location
# This folder name convention provides much of necessary details about
# the name of the software and its version (MPICH and 3.2 in this case), and
# the compiler and its version (GCC and 4.8.5 in this case) used to compile
# the software just by observing the installation path
mkdir -p ${HOME}/apps/mpich/${MPICH_VERSION}/${COMPILER}/${COMPILER_VERSION}

# Create temporary locations to save the source and build the software
mkdir -p /tmp/${USER}/src
mkdir -p /tmp/${USER}/mpich/build

# Additional necessary variables dependent on the compiler
case "${COMPILER}" in
  # GCC
  gcc)
    CC="gcc"
    CXX="g++"
    FC="gfortran"
    F77="gfortran"
  ;;

  # Default option (used when COMPILER is set to "nothing")
  *)
    echo
    echo "  Nothing to be done"
  ;;
esac

# Download and save the source in /tmp/${USER}/src
cd /tmp/${USER}/src
curl -O http://www.mpich.org/static/downloads/${MPICH_VERSION}/mpich-${MPICH_VERSION}.tar.gz
if [ $? -gt 0 ]
then
  echo
  echo "  Error downloading mpich-${MPICH_VERSION}.tar.gz from MPICH website."
  echo "  Exiting the script."
  echo
  exit ${EXIT_CODE_CURL}
fi

# Extract the mpich*.tar.gz
tar -zxvf mpich-${MPICH_VERSION}.tar.gz
if [ $? -gt 0 ]
then
  echo
  echo "  Error extracting mpich-${MPICH_VERSION}.tar.gz."
  echo "  Exiting the script."
  echo
  exit ${EXIT_CODE_TAR}
fi

# configure, make, make install and make installcheck
# Using a separate build directory helps keep the source folder pristine and
# re-usable for re-compilation using other compilers/compiler versions, if and
# when necessary. Saving the log files with compile/make information can come
# in handy when things don't go well: software developers may require "what
# exactly went wrong" information to be able to diagnose the issue or help.
cd /tmp/${USER}/mpich/build
../../src/mpich-${MPICH_VERSION}/configure \
  --prefix=${HOME}/apps/mpich/${MPICH_VERSION}/${COMPILER}/${COMPILER_VERSION} \
  CC=gcc \
  CXX=g++ \
  FC=gfortran \
  F77=gfortran \
  --enable-debuginfo \
  --enable-g=dbg,mem,log \
  --enable-shared 2>&1 | tee ${UN5390_W11}/${TODAY}-mpich-${MPICH_VERSION}_configure.txt
if [ $? -gt 0 ]
then
  echo
  echo "  Error running configure."
  echo "  Exiting the script."
  echo
  exit ${EXIT_CODE_CONFIGURE}
fi

make 2>&1 | tee ${UN5390_W11}/${TODAY}-mpich-${MPICH_VERSION}_make.txt
if [ $? -gt 0 ]
then
  echo
  echo "  Error running make."
  echo "  Exiting the script."
  echo
  exit ${EXIT_CODE_MAKE}
fi

make install 2>&1 | tee ${UN5390_W11}/${TODAY}-mpich-${MPICH_VERSION}_make-install.txt
if [ $? -gt 0 ]
then
  echo
  echo "  Error running make install."
  echo "  Exiting the script."
  echo
  exit ${EXIT_CODE_MAKEINSTALL}
fi

make installcheck 2>&1 | tee ${UN5390_W11}/${TODAY}-mpich-${MPICH_VERSION}_make-installcheck.txt
if [ $? -gt 0 ]
then
  echo
  echo "  Error running make installcheck."
  echo "  Exiting the script."
  echo
  exit ${EXIT_CODE_MAKEINSTALLCHECK}
fi

# Delete the src and build folders
cd /tmp/
\rm -r ${USER}
if [ $? -gt 0 ]
then
  echo "  Error deleting src and build folders in /tmp/${USER}."
  echo "  Exiting the script."
  echo
  exit ${EXIT_CODE_TMPDEL}
fi

# Update ${HOME}/.bash_${USER}
cat <<EOF >> ${HOME}/.bash_${USER}

# MPICH ${MPICH_VERSION} (w/ ${COMPILER} ${COMPILER_VERSION}) settings
MPICH="\${HOME}/apps/mpich/${MPICH_VERSION}/${COMPILER}/${COMPILER_VERSION}"
PATH="\${PATH}:\${MPICH}/bin"
LD_LIBRARY_PATH="\${LD_LIBRARY_PATH}:\${MPICH}/lib"
MANPATH="\${MANPATH}:\${MPICH}/share/man"
EOF

# Source ${HOME}/.bashrc
source ${HOME}/.bashrc

# Verify the installation
cat <<EOF > ${UN5390_W11}/${TODAY}-mpich-${MPICH_VERSION}_verification.txt
#
# MPICH ${MPICH_VERSION} (w/ ${COMPILER} ${COMPILER_VERSION}) verification

  mpicc   : $(which mpicc)
  mpicxx  : $(which mpicxx)
  mpif77  : $(which mpif77)
  mpif90  : $(which mpif90)
  mpiexec : $(which mpiexec)
  mpirun  : $(which mpirun) 

  mpichversion
  $(mpichversion)

  mpivars
  $(mpivars)

EOF

# Record end time information
echo "  End time   : $(date -R) ($(date +"%s"))" >> ${UN5390_W11}/${TODAY}-mpich-${MPICH_VERSION}_timing-information.txt
echo >> ${UN5390_W11}/${TODAY}-mpich-${MPICH_VERSION}_timing-information.txt

# Add necessary files to the repository, commit changes and push to GitHub
cd ${UN5390_W11}
git pull
git add ${TODAY}-mpich-*.txt
git commit -m "MPICH ${MPICH_VERSION} compilation using ${COMPILER} ${COMPILER_VERSION}"
git push origin master

# Below commands are not related to MPICH installation but required for
# re-organization of MATLAB and OpenMP samples to facilitate inclusion of
# MPICH samples during week #14
cd ${UN5390_W11}
git pull
cd Parallel
rm -f *.c
cd ${UN5390}/CourseWork/Week_11/AdditionalMaterial
rsync -avhP ./Parallel/ ../${USER}_11/Parallel/
cd ${UN5390}/CourseWork/Week_11/
git add ${USER}_11
git commit -m "PM: Re-organized OpenMP samples #13"
git push origin master
