#!/bin/bash --login
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=7-00:00:00
#SBATCH --mem-per-cpu=2G
#SBATCH --array=0-100
#SBATCH --partition=josephsnodes
#SBATCH --account=josephsnodes
# output information about how this job is running using bash commands
echo "This job is running on $HOSTNAME on `date`"

#Load modules
module purge
module load sra-toolkit

#Run download script
./s12_download_rename_sra.bash -s arabidopsis_wgs_sras_split$(echo $SLURM_ARRAY_TASK_ID) -n arabidopsis_wgs_accessions_split$(echo $SLURM_ARRAY_TASK_ID)
