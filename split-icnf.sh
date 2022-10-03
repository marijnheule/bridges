ICNF=$1
SPLIT=$2
BASE=${ICNF%.*}


for (( i=0; i<$SPLIT; i++ ))
do
  cat $ICNF | awk '!/a / {print $0} /a / {if ((NR % '$SPLIT') == '$i') print $0}' > $BASE-x$i.icnf
done

