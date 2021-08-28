# bridges
scripts to run solvers in parallel on PSC

pCaDiCaL is a script that runs 128 copies of CaDiCaL in
parallel, each run using a different shuffle of the clauses.
This script focuses on solving hard *satisfiable* formulas.
The input to the script is a formula in DIMACS format. 
Additionally, other options to CaDiCaL can be provided. 

sbatch pCaDiCaL ~/bridges/cnf/MM23-cut6.cnf


pKissat is a script that runs 128 copies of Kissat in
parallel, each run using a different shuffle of the clauses.
This script focuses on solving hard *satisfiable* formulas.
The input to the script is a formula in DIMACS format. 
Additionally, other options to Kissat can be provided. 

sbatch pKissat ~/bridges/cnf/MM23-cut6.cnf


lCaDiCaL is a script that runs 128 loops of CaDiCaL. Each
loop runs CaDiCaL for a limited time. After the timeout 
of finding a solution, it starts solving using a different
seed, which changes the clause order. This script requires
a formula in DIMACS format and a timeout in seconds.

sbatch lCaDiCaL ~/bridges/cnf/MM23-cut6.cnf 500


lKissat is a script that runs 128 loops of Kissat. Each
loop runs Kissat for a limited time. After the timeout 
of finding a solution, it starts solving using a different
seed, which changes the clause order. This script requires
a formula in DIMACS format and a timeout in seconds.

sbatch lKissat ~/bridges/cnf/MM23-cut6.cnf 500


The scripts store the output of the solvers in the directory
~/log/ .
