#!/bin/bash

# Declare variables
IN=../results/
PREFIX=Phalepensis_pruned
OUT=../results/admixture

# create output directory
mkdir -p $OUT

# ADMIXTURE does not accept chromosome names that are not human chromosomes. 
# We will thus just exchange the first column by 0
awk '{$1="0";print $0}' $IN$PREFIX.bim > $IN$PREFIX.bim.tmp
mv $IN$PREFIX.bim.tmp $IN$PREFIX.bim

# Run Admixture
for K in {1..5}
	do
	for i in {1..20}
		do admixture \
			-s time ${IN}${PREFIX}.bed ${K} \
		&& mv ${PREFIX}.${K}.Q ${PREFIX}.K${K}.i${i}.Q
		done
	done

mv ${PREFIX}.* ${OUT}

# How to choose the correct value for K
# Cross-validation procedure
for K in 1 2 3 4 5; \
	do admixture -s time --cv=10 ${IN}${PREFIX}.bed $K | tee ${OUT}/log${K}.out; done
	
