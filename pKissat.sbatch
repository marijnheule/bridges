#!/bin/bash
#SBATCH -A cis230065p
#SBATCH -N 1
#SBATCH -p RM
#SBATCH -t 12:00:00 # set duration of the job
#SBATCH --ntasks-per-node=128
#SBATCH -o pKissat.o%j # set output name of log file

#echo commands to stdout
set -x

CNF=$1

~/bridges/pKissat.sh $CNF $2 $3 $4 $5 $6 $7 $8 $9
