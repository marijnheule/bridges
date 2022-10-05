make
mkdir tools
cd tools
git clone https://github.com/arminbiere/kissat
git clone https://github.com/arminbiere/cadical
git clone https://github.com/arminbiere/scranfilize
git clone https://github.com/marijnheule/drat-trim
git clone https://github.com/tanyongkiam/cake_lpr
cd cadical
./configure
make
cd ..
cd kissat
./configure
make
cd ..
cd scranfilize
./configure
make
cd ..
cd drat-trim
make
cd ..
cd cake_lpr
make
cd ..
cd ubcsat
make
cd ..

wget http://fmv.jku.at/yalsat/yalsat-03v.zip
unzip yalsat-03v.zip
cd yalsat-03v
./configure.sh
make
cd ..

mkdir ~/bin/
cp kissat/build/kissat ~/bin/
cp cadical/build/cadical ~/bin/
cp scranfilize/scranfilize ~/bin/
cp yalsat-03v/palsat ~/bin
cp ubcsat/ubcsat ~/bin
cp drat-trim/drat-trim ~/bin
cp cake_lpr/cake_lpr ~/bin
cd ..


cp *.sbatch ~
