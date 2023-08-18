ICNF=$1

NVAR=`cat $ICNF | grep -v "^a " | grep -v "c " | grep " 0" | awk 'BEGIN{max = -inf} {if ($1 > max) max = $1} END{print max}'`
NCLS=`cat $ICNF | grep -v "^a " | grep -v "c " | grep " 0" | wc | awk '{print $1}'`

BASE=${ICNF%.*}

cat $ICNF | grep -v "^a " | awk '/p / {print "p cnf "'$NVAR'" "'$NCLS'} / 0/ {print $0}'> $BASE.cnf
cat $ICNF | grep "^a " > $BASE.cube
