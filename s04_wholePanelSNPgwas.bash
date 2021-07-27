#!/bin/bash --login
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=7-00:00:00
#SBATCH --mem-per-cpu=70G
#SBATCH --partition=josephsnodes
#SBATCH --account=josephsnodes
# output information about how this job is running using bash commands
echo "This job is running on $HOSTNAME on `date`"

##Make kinship matrix
./gemma-0.98.4-linux-static-AMD64 -g Genos_FT16_RGR.bimbam.gz -p phenos_FT16_RGR_normalized.txt -gk 1 -maf 0.01 -o kinshipMatrix_wholePanelSNPgwas

##Impute missing phenoyptes
./gemma-0.98.4-linux-static-AMD64 -g Genos_FT16_RGR.bimbam.gz -p phenos_FT16_RGR_normalized.txt -k ./output/kinshipMatrix_wholePanelSNPgwas.cXX.txt -predict -n 1 2 -maf 0.01 -o phenos_FT16_RGR_imputed

##mvGWAS without gxe
./gemma-0.98.4-linux-static-AMD64 -g Genos_FT16_RGR.bimbam.gz -p ./output/phenos_FT16_RGR_imputed.prdt.txt -k ./output/kinshipMatrix_wholePanelSNPgwas.cXX.txt -maf 0.01 -lmm 1 -n 1 2 -o mvGWASresults_FT16_RGR_NoGxe

##uvGWAS without gxe
./gemma-0.98.4-linux-static-AMD64 -g Genos_FT16_RGR.bimbam.gz -p ./output/phenos_FT16_RGR_imputed.prdt.txt -k ./output/kinshipMatrix_wholePanelSNPgwas.cXX.txt -maf 0.01 -lmm 1 -n 1 -o uvGWASresults_FT16_NoGxe
./gemma-0.98.4-linux-static-AMD64 -g Genos_FT16_RGR.bimbam.gz -p ./output/phenos_FT16_RGR_imputed.prdt.txt -k ./output/kinshipMatrix_wholePanelSNPgwas.cXX.txt -maf 0.01 -lmm 1 -n 2 -o uvGWASresults_RGR_NoGxe
