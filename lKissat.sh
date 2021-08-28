CNF=$1
OUT=$2

mkdir ~/log/

for i in {1..128}
do
  ~/bridges/Kissat-loop.sh $CNF $OUT $3 $4 $5 $6 $7 $8 $9 &
done
wait
