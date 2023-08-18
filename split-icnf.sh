ICNF=$1
SPLIT=$2
BASE=${ICNF%.*}

for (( i=0; i<$SPLIT; i++ ))
do
  cat $ICNF | awk 'BEGIN{l=1} !/a / {print $0} /a / {if ((l % '$SPLIT') == '$i') print $0; l=l+1}' > $BASE-x$i.icnf
done

