#!/bin/bash --login
#SBATCH --nodes=1
#SBATCH --cpus-per-task=40
#SBATCH --ntasks-per-node=1
#SBATCH --time=7-00:00:00
#SBATCH --mem-per-cpu=2G
# output information about how this job is running using bash commands
echo "This job is running on $HOSTNAME on `date`"

#Change directory
cd $SLURM_SUBMIT_DIR

#Load R
module purge
module load GCC/8.3.0 OpenMPI/3.1.4
module load R/4.0.2

#Execute R-script
Rscript s25_plotKmerGWASresults.R mvKmerGWASresults_FT16_RGR_gxe.assoc.txt.gz kmerGWASmanhattanPlot_NoCountCovariate.pdf
Rscript s25_plotKmerGWASresults.R mvKmerGWASresults_FT16_RGR_gxe_CountCovariate.assoc.txt.gz kmerGWASmanhattanPlot_WithCountCovariate.pdf
