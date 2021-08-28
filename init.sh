make
mkdir tools
cd tools
git clone https://github.com/arminbiere/kissat
git clone https://github.com/arminbiere/cadical
git clone https://github.com/arminbiere/scranfilize
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
mkdir ~/bin/
cp kissat/build/kissat ~/bin/
cp cadical/build/cadical ~/bin/
cp scranfilize/scranfilize ~/bin/
cd ..
