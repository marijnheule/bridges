CNF=$1
FILE=${CNF##*/}
BASE=${FILE%.*}

ALG=$2
RUN=$3
CUT=$4
SETA=$5
SETB=$6

TARGET=0

LABEL=$RANDOM
for (( i=1; i<=$RUN; i++ ))
do
  SEED=$RANDOM$RANDOM
#  scranfilize -s $SEED -f 0 -v 0 -c 1 $CNF | ubcsat -target $TARGET -alg $ALG -runs 1 -cutoff $CUT -seed $SEED -solve >> ~/log/$BASE-UBC-$ALG-$LABEL.log
  scranfilize -s $SEED -f 0 -v 0 -c 1 $CNF | ubcsat -target $TARGET -alg $ALG -wp 0.2 -runs 1 -cutoff $CUT -seed $SEED -solve >> ~/log/$BASE-UBC-$ALG-$LABEL.log
#  scranfilize -s $SEED -f 0 -v 0 -c 1 $CNF | ubcsat -target $TARGET -alg rots -tabu 3 -tabuinterval 35 -runs 1 -cutoff $CUT -seed $SEED -solve >> ~/log/$BASE-UBC-$ALG-$LABEL.log
done
