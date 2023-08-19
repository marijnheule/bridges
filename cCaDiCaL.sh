ICNF=$1
SPLIT=128
BASE=${ICNF%.*}
DIR=$2

for (( i=0; i<$SPLIT; i++ ))
do
  cat $ICNF | awk 'BEGIN{l=1} !/a / {print $0} /a / {if ((l % '$SPLIT') == '$i') print $0; l=l+1}' > $DIR/$BASE-x$i.icnf
done

for (( i=0; i<$SPLIT; i++ ))
do
  INIT=$i
  if [ "$INIT" -eq "0" ]; then INIT=$SPLIT; fi
  ~/bridges/assume-check.sh $DIR/$BASE-x$i.icnf $INIT $SPLIT &
done
wait
