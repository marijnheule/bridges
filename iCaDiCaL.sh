ICNF=$1

for i in {0..127}
do
  cat $ICNF | awk '!/a / {print $0} /a / {if ((NR % 128) == '$i') print $0}' | cadical --forcephase --phase &
done
wait

