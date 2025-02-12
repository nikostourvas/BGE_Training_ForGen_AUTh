#!/bin/sh
VCF=../data/Phalepensis_filtSNPs_TARGET_GR_pops.vcf.gz
PREFIX=Phalepensis_filtSNPs_TARGET_GR_pops
OUT=../results/pcadapt

mkdir -p ${OUT}

# remove outlier SNPs and SNPs with missing data
plink --vcf ${VCF} --double-id --allow-extra-chr \
  --set-missing-var-ids @_# \
  --geno 0.1 \
  --make-bed \
  --out ${OUT}/${PREFIX}
