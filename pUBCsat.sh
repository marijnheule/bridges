CNF=$1
FILE=${CNF##*/}
BASE=${FILE%.*}

mkdir ~/log/

for SEED in `cat ~/seeds.txt`
do
  scranfilize -s $SEED -f 0 -v 0 -c 1 $CNF | ubcsat -alg ddfw -cutoff 10000000000 -seed $SEED -solve > ~/log/$BASE-UL-$SEED.log &
done
wait
