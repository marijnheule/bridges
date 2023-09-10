#!/bin/bash
#SBATCH -A cis230065p
#SBATCH -N 1
#SBATCH -p RM
#SBATCH -t 48:00:00 # set duration of the job
#SBATCH --ntasks-per-node=128
#SBATCH -o cCaDiCaL.o%j # set output name of log file

#echo commands to stdout
set -x

ICNF=$1
DIR=$PROJECT/6hole

~/bridges/cCaDiCaL.sh $ICNF $DIR
