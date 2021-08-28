#!/bin/bash
#SBATCH -A mth210009p
#SBATCH -N 1
#SBATCH -p RM
#SBATCH -t 12:00:00 # set duration of the job
#SBATCH --ntasks-per-node=128
#SBATCH -o pCaDiCal.o%j # set output name of log file

#echo commands to stdout
set -x

CNF=$1

~/bridges/pCaDiCaL.sh $CNF --forcephase=1 --phase=0 --sat $2 $3 $4 $5 $6
