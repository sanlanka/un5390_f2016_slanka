#! /bin/bash
#
#$ -cwd
#$ -j y
#$ -S /bin/bash
#$ -M slanka@mtu.edu
#$ -m abes
#$ -q all.q@compute-0-0.local
#$ -pe mpich 4
#fj;af;a
echo
echo "  User        : ${USER}"
echo "  Date/Time   : $(date -R)"
echo "  Hostname    : $(hostname)"
echo "  Location    : $(pwd -P)"
echo

/share/apps/matlab/R2015a/bin/matlab -nosplash -r apollo_mission -logfile apollo_mission.log
