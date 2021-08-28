CNF=$1
FILE=${CNF##*/}
BASE=${FILE%.*}

mkdir ~/log/

for i in {1..128}
do
  R=$RANDOM$RANDOM
  scranfilize -s $R -f 0 -v 0 -c 1 $CNF | kissat $2 $3 $4 $5 $6 $7 $8 $9 > ~/log/$BASE-K-$R.log &
done
wait
