#!/bin/bash

hg clone http://kodomo.fbb.msu.ru/hg/allpy
cp sets/set?.fasta allpy
cd allpy
make
export PYTHONPATH=
. SETPATH

for i in {1..3}; do
    ./pair_cores/pair_cores.py -i set$i.fasta -y set$i.homology -p set$i.pml
done

