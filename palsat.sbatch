#!/bin/bash
#SBATCH -A cis230065p
#SBATCH -N 1
#SBATCH -p RM
#SBATCH -t 12:00:00 # set duration of the job
#SBATCH --ntasks-per-node=128
#SBATCH -o palsat.o%j # set output name of log file

#echo commands to stdout
set -x

CNF=$1

palsat $CNF -v -v $RANDOM
