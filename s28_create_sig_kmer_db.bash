#!/bin/bash
#!/bin/bash --login
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=7-00:00:00
#SBATCH --mem-per-cpu=25G
# output information about how this job is running using bash commands
echo "This job is running on $HOSTNAME on `date`"

cd $SLURM_SUBMIT_DIR
rm -r tmp
mkdir tmp

#Create databases of significant kmers
#./kmc -k31 -ci1 -cs1 common_FTD.fastq common_FTD tmp
#./kmc -k31 -ci1 -cs1 common_MT.fastq common_MT tmp
#./kmc -k31 -ci1 -cs1 common_FT.fastq common_FT tmp
./kmc -k31 -ci1 -cs1 common.fastq common tmp

#Check that expected kmer is in database
#./kmc_tools transform common dump common_dump.txt

#Filter reads by kmer in database
while read -u 3 -r SRA; do
        echo Filtering reads with significant kmers for sample $SRA ...
       	./kmc_tools filter common -ci1 $(echo $SRA)_trim.fastq -ci1 $(echo $SRA)_trim_filt.fastq
       	./kmc_tools filter common -ci1 $(echo $SRA)_1_trim.fastq -ci1 $(echo $SRA)_1_trim_filt.fastq
       	./kmc_tools filter common -ci1 $(echo $SRA)_2_trim.fastq -ci1 $(echo $SRA)_2_trim_filt.fastq

#       	./kmc_tools filter common_FTD -ci1 $(echo $SRA)_1_trim.fastq -ci1 $(echo $SRA)_1_trim_filt_FTD.fastq
#       	./kmc_tools filter common_FTD -ci1 $(echo $SRA)_2_trim.fastq -ci1 $(echo $SRA)_2_trim_filt_FTD.fastq

#       	./kmc_tools filter common_MT -ci1 $(echo $SRA)_1_trim.fastq -ci1 $(echo $SRA)_1_trim_filt_MT.fastq
#       	./kmc_tools filter common_MT -ci1 $(echo $SRA)_2_trim.fastq -ci1 $(echo $SRA)_2_trim_filt_MT.fastq

#       	./kmc_tools filter common_FT -ci1 $(echo $SRA)_1_trim.fastq -ci1 $(echo $SRA)_1_trim_filt_FT.fastq
#       	./kmc_tools filter common_FT -ci1 $(echo $SRA)_2_trim.fastq -ci1 $(echo $SRA)_2_trim_filt_FT.fastq
done 3<arabidopsis_wgs_accessions.txt
