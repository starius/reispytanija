#!/bin/bash

hg clone http://kodomo.fbb.msu.ru/hg/allpy
cp sets/set?.fasta allpy
cd allpy
make
export PYTHONPATH=
. SETPATH

for i in {1..3}; do
    muscle -in set$i.fasta -out set$i-muscle.fasta
    mafft set$i.fasta > set$i-mafft.fasta
done

for i in {1..3}; do
    ./pair_cores/compare_aln_3d.py \
    -a set$i-muscle.fasta -b set$i-mafft.fasta | \
    tail -n 1 > muscle-over-mafft-$i.score
done

