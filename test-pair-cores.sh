#!/bin/bash

hg clone http://kodomo.fbb.msu.ru/hg/allpy
cp fasta/* allpy
cd allpy
make
export PYTHONPATH=
. SETPATH

./pair_cores/pair_cores.py -i test_corr1.fasta \
    -y test_corr1.homology --high-blocks-html test_corr1.html

./pair_cores/pair_cores.py  -i test_wrong1.fasta \
    -y test_wrong1.homology --high-blocks-html test_wrong1.html

./pair_cores/compare_aln_3d.py  -a ex1.fasta -b ex2.fasta

./pair_cores/compare_aln_3d.py  -a wrong_ex1.fasta -b wrong_ex2.fasta

