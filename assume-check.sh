ICNF=$1
INIT=$2
STEP=$3

if [ -z "$INIT" ]; then INIT=1; fi
if [ -z "$STEP" ]; then STEP=1; fi

NVAR=`cat $ICNF | grep -v "^a " | grep -v "c " | grep " 0" | awk 'BEGIN{max = -inf} {if ($1 > max) max = $1} END{print max}'`
NCLS=`cat $ICNF | grep -v "^a " | grep -v "c " | grep " 0" | wc | awk '{print $1}'`

#echo $NVAR" "$NCLS

SIZE=`cat $ICNF | grep "^a " | wc | awk '{print $1}'`
BASE=${ICNF%.*}

cat $ICNF | grep -v "^a " | awk '/p / {print "p cnf "'$NVAR'" "'$NCLS'} / 0/ {print $0}'> $BASE.cnf
cat $ICNF | grep "^a " > $BASE.cube

for (( i=1; i<=$SIZE; i++ ))
do
  mkfifo pipe$$
  CUBE=$((($i-1)*$STEP + $INIT))
  ~/bridges/apply.sh $BASE.cnf $BASE.cube $i > $BASE.tmp
  CHECK=`cake_lpr $BASE.tmp pipe$$ &`
  RUNT=`cadical --sat --plain --reducetarget=10 $BASE.tmp pipe$$ --lrat --no-binary | \
        grep -e "total real" -e "SATIS" | awk '/SATIS/ {print $2} /total/ {printf $7" "}'`
  MD=`cat $BASE.cube | head -n $i | tail -n 1 | md5sum | cut -c1-6`
  wait
  echo $CUBE" "$MD" "$RUNT" "$CHECK

  rm pipe$$
  rm $BASE.tmp

done
