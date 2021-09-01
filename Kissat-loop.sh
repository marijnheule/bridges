CNF=$1
FILE=${CNF##*/}
BASE=${FILE%.*}
OUT=$2

while true
do
  R=$RANDOM$RANDOM
  scranfilize -s $R -f 0 -v 0 -c 1 $CNF | timeout $OUT kissat $3 $4 $5 $6 $7 $8 $9 > ~/log/$BASE-K-$R.log
  sleep 1
done
