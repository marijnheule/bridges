CNF=$1
FILE=${CNF##*/}
BASE=${FILE%.*}

mkdir ~/log/

for i in {1..128}
do
  R=$RANDOM$RANDOM
  scranfilize -s $R -f 0 -v 0 -c 1 $CNF | ubcsat -alg ddfw -cutoff 100000000 > ~/log/$BASE-U-$R.log &
done
wait
