CNF=$1
FILE=${CNF##*/}
BASE=${FILE%.*}
ALG=$2
SETA=$3
SETB=$3
RUN=100
CUT=100000000

mkdir ~/log/

for i in {1..128}
do
   ~/bridges/UBCsat-loop.sh $CNF $ALG $RUN $CUT $SETA $SETB &
done
wait
