#!/bin/sh

# Declare variables
VCF=../data/Phalepensis_filtSNPs_TARGET_GR_pops.vcf.gz
INTERMEDIATE=../results/Phalepensis
OUT=../results/Phalepensis_pruned

# create the output directory
mkdir -p ../results

# identify snps to prune
plink --vcf $VCF --double-id --allow-extra-chr \
  --set-missing-var-ids @_# \
  --geno 0.1 \
  --indep-pairwise 50 10 0.1 \
  --out $INTERMEDIATE

# prune and perform pca
plink --vcf $VCF --double-id --allow-extra-chr \
  --set-missing-var-ids @_# \
  --extract $INTERMEDIATE.prune.in \
  --make-bed \
  --pca \
  --out $OUT

# Make bed and output PCA res without any prior pruning
#plink --vcf $VCF --double-id --allow-extra-chr \
#--set-missing-var-ids @_# \
#--make-bed \
#--pca \
#--out $OUT
