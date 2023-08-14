ICNF=$1
SPLIT=128
BASE=${ICNF%.*}
DIR=$2

for (( i=0; i<$SPLIT; i++ ))
do
  cat $ICNF | awk '!/a / {print $0} /a / {if ((NR % '$SPLIT') == '$i') print $0}' > $DIR/$BASE-x$i.icnf
done

for (( i=0; i<$SPLIT; i++ ))
do
  INIT=$(($i+1))
  ~/bridges/solve-assume.sh $DIR/$BASE-x$i.icnf $INIT $SPLIT &
done
wait
