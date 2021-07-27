#!/bin/bash --login
#SBATCH --nodes=1
#SBATCH --cpus-per-task=70
#SBATCH --ntasks-per-node=1
#SBATCH --time=7-00:00:00
#SBATCH --mem-per-cpu=1G
#SBATCH --array=0-100
#SBATCH --partition=josephsnodes
#SBATCH --account=josephsnodes
# output information about how this job is running using bash commands
echo "This job is running on $HOSTNAME on `date`"

#load fastqc modules
ml -* FastQC/0.11.7-Java-1.8.0_162

#Run fastqc
while read -u 3 -r SRA; do
	#If data is paired end, the first command will work and the second will fail
	#If data is single end, the second command will work and the first will fail
	fastqc -o fastqc_raw_reads -f fastq -t $SLURM_CPUS_PER_TASK $(echo $SRA)_1.fastq $(echo $SRA)_2.fastq
	fastqc -o fastqc_raw_reads -f fastq -t $SLURM_CPUS_PER_TASK $(echo $SRA).fastq
done 3<arabidopsis_wgs_accessions_split$SLURM_ARRAY_TASK_ID

