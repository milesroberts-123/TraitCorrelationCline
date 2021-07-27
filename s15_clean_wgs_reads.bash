#!/bin/bash --login
#SBATCH --nodes=1
#SBATCH --cpus-per-task=30
#SBATCH --ntasks-per-node=1
#SBATCH --time=7-00:00:00
#SBATCH --mem-per-cpu=1G
#SBATCH --array=0-100
#SBATCH --partition=josephsnodes
#SBATCH --account=josephsnodes
# output information about how this job is running using bash commands
echo "This job is running on $HOSTNAME on `date`"

#Load modules
ml -* GCC/7.3.0-2.30 OpenMPI/3.1.1 cutadapt/2.1-Python-3.6.6

#Use cutadapt
while read -u 3 -r SRA; do

if [ -f "$(echo $SRA)_1.fastq" ]; then

	#For paired-end data
	cutadapt \
	-f fastq \
	-j $SLURM_CPUS_PER_TASK \
	-q 20 \
	--trim-n \
	-m 31 \
	-n 3 \
	-b CTCGGCATTCCTGCTGAACCGCTCTTCCGATCT \
	-B CTCGGCATTCCTGCTGAACCGCTCTTCCGATCT \
	-b CTGTCTCTTATA \
	-B CTGTCTCTTATA \
	-b AGATCGGAAGAG \
	-B AGATCGGAAGAG \
	-b GATCGGAAGAGCGGTTCAGCAGGAATGCCGAGACCGATCTCGTATGCCGT \
	-B GATCGGAAGAGCGGTTCAGCAGGAATGCCGAGACCGATCTCGTATGCCGT \
	-b CGGCATTCCTGCTGAACCGAGATCGGAAGAGCGTCGTGTAGGGAAAGAGT \
	-B CGGCATTCCTGCTGAACCGAGATCGGAAGAGCGTCGTGTAGGGAAAGAGT \
	-o $(echo $SRA)_1_trim.fastq \
	-p $(echo $SRA)_2_trim.fastq \
	$(echo $SRA)_1.fastq \
	$(echo $SRA)_2.fastq

else
	#For single-end data
        cutadapt \
        -f fastq \
        -j $SLURM_CPUS_PER_TASK \
        -q 20 \
        --trim-n \
        -m 31 \
	-n 3 \
	-b CTCGGCATTCCTGCTGAACCGCTCTTCCGATCT \
        -b CTGTCTCTTATA \
        -b AGATCGGAAGAG \
        -b GATCGGAAGAGCGGTTCAGCAGGAATGCCGAGACCGATCTCGTATGCCGT \
        -b CGGCATTCCTGCTGAACCGAGATCGGAAGAGCGTCGTGTAGGGAAAGAGT \
        -o $(echo $SRA)_trim.fastq \
        $(echo $SRA).fastq

fi

done 3<arabidopsis_wgs_accessions_split$SLURM_ARRAY_TASK_ID

#Delete empty files made by erroneous runs in cutadapt
#find $SLURM_SUBMIT_DIR -empty -type f -delete
