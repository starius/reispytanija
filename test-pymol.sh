#!/bin/bash

hg clone --branch 1.4.2 http://kodomo.fbb.msu.ru/hg/allpy
cp sets/set?.fasta allpy
cd allpy
make
export PYTHONPATH=
. SETPATH

for i in {1..3}; do
    ./pair_cores/pair_cores.py -i set$i.fasta -y set$i.homology \
        --high-blocks-pymol set$i.pml --high-blocks-html set$i.html
done

