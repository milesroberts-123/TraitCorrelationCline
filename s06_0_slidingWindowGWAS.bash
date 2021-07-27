#!/bin/bash
#!/bin/bash --login
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=7-00:00:00
#SBATCH --mem-per-cpu=16G
#SBATCH --partition=josephsnodes
#SBATCH --account=josephsnodes
#SBATCH --array=0-19
# output information about how this job is running using bash commands
echo "This job is running on $HOSTNAME on `date`"

#Build kinship matrix
./gemma-0.98.4-linux-static-AMD64 -g swGWAS_window$(echo $SLURM_ARRAY_TASK_ID)_genos.txt.gz -p swGWAS_window$(echo $SLURM_ARRAY_TASK_ID)_FTphenos.txt -gk 1 -maf 0.05 -o kinshipMatrix_window$(echo $SLURM_ARRAY_TASK_ID)

#Impute missing phenotypes
./gemma-0.98.4-linux-static-AMD64 -g swGWAS_window$(echo $SLURM_ARRAY_TASK_ID)_genos.txt.gz -p swGWAS_window$(echo $SLURM_ARRAY_TASK_ID)_FTphenos.txt -k ./output/kinshipMatrix_window$(echo $SLURM_ARRAY_TASK_ID).cXX.txt -predict -n 1 -maf 0.05 -o swGWAS_window$(echo $SLURM_ARRAY_TASK_ID)_FTphenos_imputed
./gemma-0.98.4-linux-static-AMD64 -g swGWAS_window$(echo $SLURM_ARRAY_TASK_ID)_genos.txt.gz -p swGWAS_window$(echo $SLURM_ARRAY_TASK_ID)_RGRphenos.txt -k ./output/kinshipMatrix_window$(echo $SLURM_ARRAY_TASK_ID).cXX.txt -predict -n 1 -maf 0.05 -o swGWAS_window$(echo $SLURM_ARRAY_TASK_ID)_RGRphenos_imputed

#If phenotypes aren't missing, then just use non-imputed phenotype file
#swGWAS for FT16
if [ -f "./output/swGWAS_window$(echo $SLURM_ARRAY_TASK_ID)_FTphenos_imputed.prdt.txt" ]; then
	./gemma-0.98.4-linux-static-AMD64 -g swGWAS_window$(echo $SLURM_ARRAY_TASK_ID)_genos.txt.gz -p ./output/swGWAS_window$(echo $SLURM_ARRAY_TASK_ID)_FTphenos_imputed.prdt.txt -k ./output/kinshipMatrix_window$(echo $SLURM_ARRAY_TASK_ID).cXX.txt -maf 0.05 -lmm 1 -n 1 -o uvGWASresults_FT_window$SLURM_ARRAY_TASK_ID
else
	./gemma-0.98.4-linux-static-AMD64 -g swGWAS_window$(echo $SLURM_ARRAY_TASK_ID)_genos.txt.gz -p swGWAS_window$(echo $SLURM_ARRAY_TASK_ID)_FTphenos.txt -k ./output/kinshipMatrix_window$(echo $SLURM_ARRAY_TASK_ID).cXX.txt -maf 0.05 -lmm 1 -n 1 -o uvGWASresults_FT_window$SLURM_ARRAY_TASK_ID
fi

#swGWAS for RGR
if [ -f "./output/swGWAS_window$(echo $SLURM_ARRAY_TASK_ID)_RGRphenos_imputed.prdt.txt" ]; then
        ./gemma-0.98.4-linux-static-AMD64 -g swGWAS_window$(echo $SLURM_ARRAY_TASK_ID)_genos.txt.gz -p ./output/swGWAS_window$(echo $SLURM_ARRAY_TASK_ID)_RGRphenos_imputed.prdt.txt -k ./output/kinshipMatrix_window$(echo $SLURM_ARRAY_TASK_ID).cXX.txt -maf 0.05 -lmm 1 -n 1 -o uvGWASresults_RGR_window$SLURM_ARRAY_TASK_ID
else
        ./gemma-0.98.4-linux-static-AMD64 -g swGWAS_window$(echo $SLURM_ARRAY_TASK_ID)_genos.txt.gz -p swGWAS_window$(echo $SLURM_ARRAY_TASK_ID)_RGRphenos.txt -k ./output/kinshipMatrix_window$(echo $SLURM_ARRAY_TASK_ID).cXX.txt -maf 0.05 -lmm 1 -n 1 -o uvGWASresults_RGR_window$SLURM_ARRAY_TASK_ID
fi
