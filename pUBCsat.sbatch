#!/bin/bash
#SBATCH -A mth210009p
#SBATCH -N 1
#SBATCH -p RM
#SBATCH -t 48:00:00 # set duration of the job
#SBATCH --ntasks-per-node=128
#SBATCH -o pUBCsat.o%j # set output name of log file

#echo commands to stdout
set -x

CNF=$1
ALG=$2
SETA=$3
SETB=$4

~/bridges/pUBCsat.sh $CNF $ALG $SETA $SETB
