#!/bin/bash --login
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=7-00:00:00
#SBATCH --mem-per-cpu=200G
#SBATCH --partition=josephsnodes
#SBATCH --account=josephsnodes
# output information about how this job is running using bash commands
echo "This job is running on $HOSTNAME on `date`"

#Load required dependencies for gemma if you don't want to use the binary
#ml -* foss/2018b Eigen/3.3.4 GSL/2.5 zlib/1.2.11

##Make kinship matrix
./gemma-0.98.4-linux-static-AMD64 -g allKmersMergedUniqueMAFfiltCatSub.bimbam.gz -p pheno_kmerGWAS_FT16_RGR_normalized.txt -gk 1 -maf 0 -o kinshipMatrix_FT16_RGR_normalized_kmers

##Impute missing phenoyptes
./gemma-0.98.4-linux-static-AMD64 -g allKmersMergedUniqueMAFfiltCat.bimbam.gz -p pheno_kmerGWAS_FT16_RGR_normalized.txt -c kmerCountCovariate.txt -k ./output/kinshipMatrix_FT16_RGR_normalized_kmers.cXX.txt -predict -n 1 2 -maf 0 -o pheno_kmerGWAS_FT16_RGR_normalized_imputed

##uvGWAS without gxe
#./gemma -g all_kmersFinalUniqueFilt.bimbam.gz -p ./output/pheno_kmerGWAS_FT16_RGR_normalized_imputed.prdt.txt -k ./output/kinshipMatrix_FT16_RGR_normalized_kmers.cXX.txt -maf 0.05 -lmm 1 -n 1 -o uvKmerGWASresults_normalized_FT16_NoGxe
#./gemma -g all_kmersFinalUniqueFilt.bimbam.gz -p ./output/pheno_kmerGWAS_FT16_RGR_normalized_imputed.prdt.txt -k ./output/kinshipMatrix_FT16_RGR_normalized_kmers.cXX.txt -maf 0.05 -lmm 1 -n 2 -o uvKmerGWASresults_normalized_RGR_NoGxe
