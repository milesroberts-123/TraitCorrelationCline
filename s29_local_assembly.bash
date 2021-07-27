#!/bin/bash --login
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=7-00:00:00
#SBATCH --mem-per-cpu=100G
# output information about how this job is running using bash commands
echo "This job is running on $HOSTNAME on `date`"

#Load modules (SPADES and Bowtie)
ml -* GCC/5.4.0-2.26 OpenMPI/1.10.3 SPAdes/3.13.0 GCC/9.3.0 Bowtie2/2.4.1

#Index reference genome for alignments later
bowtie2-build GCF_000001735.4_TAIR10.1_genomic.fna arabidopsisIndex

#Assemble reads containing significant kmers, seperate out accessions with paired vs unpaired reads
while read -u 3 -r SRA; do
if test -f $(echo $SRA)_1_trim_filt.fastq; then

#Pair up filtered reads
	./seqkit pair -1 $(echo $SRA)_1_trim_filt.fastq -2 $(echo $SRA)_2_trim_filt.fastq -u

#If filtered reads aren't paired, try to find their trimmed partner
	./seqkit pair -1 $(echo $SRA)_1_trim_filt.unpaired.fastq -2 $(echo $SRA)_2_trim.fastq -u
	./seqkit pair -1 $(echo $SRA)_1_trim.fastq -2 $(echo $SRA)_2_trim_filt.unpaired.fastq -u

#Merge together paired reads
	cat $(echo $SRA)_1_trim_filt.unpaired.paired.fastq $(echo $SRA)_1_trim_filt.paired.fastq  $(echo $SRA)_1_trim.paired.fastq | ./seqkit sort -n > $(echo $SRA)_1_trim_filt.AllPaired.fastq
	cat $(echo $SRA)_2_trim_filt.unpaired.paired.fastq $(echo $SRA)_2_trim_filt.paired.fastq  $(echo $SRA)_2_trim.paired.fastq | ./seqkit sort -n > $(echo $SRA)_2_trim_filt.AllPaired.fastq

#Merge together unpaired reads
	cat $(echo $SRA)_1_trim_filt.unpaired.unpaired.fastq $(echo $SRA)_2_trim_filt.unpaired.unpaired.fastq | ./seqkit sort -n > $(echo $SRA)_trim_filt.AllUnpaired.fastq

#Get stats on final assembly files
	./seqkit stats $(echo $SRA)*_trim_filt.All*.fastq

#Create local assembly
	spades.py --careful --only-assembler --sc --pe1-1 $(echo $SRA)_1_trim_filt.AllPaired.fastq --pe1-2 $(echo $SRA)_2_trim_filt.AllPaired.fastq --pe1-s $(echo $SRA)_trim_filt.AllUnpaired.fastq -o spades_output_$(echo $SRA)

#Align reads to reference so that variants can be called
	bowtie2 --very-sensitive-local -x arabidopsisIndex -1 $(echo $SRA)_1_trim_filt.AllPaired.fastq -2 $(echo $SRA)_2_trim_filt.AllPaired.fastq -U $(echo $SRA)_trim_filt.AllUnpaired.fastq -S $(echo $SRA)_Alignment.sam

else
	spades.py --careful --only-assembler --sc -s $(echo $SRA)_trim_filt.fastq -o spades_output_$(echo $SRA)
	bowtie2 --very-sensitive-local -x arabidopsisIndex -U $(echo $SRA)_trim_filt.fastq -S $(echo $SRA)_Alignment.sam
fi

#Convert sam to bam, sort bam, call variants, then filter out low quality variants
samtools view -bS $(echo $SRA)_Alignment.sam > $(echo $SRA)_Alignment.bam
samtools sort -o $(echo $SRA)_Alignment.bam -O BAM $(echo $SRA)_Alignment_sorted.bam
bcftools mpileup -f GCF_000001735.4_TAIR10.1_genomic.fna $(echo $SRA)_Alignment_sorted.bam | bcftools call -mv -Ob -o $(echo $SRA)_Alignment_sorted_calls.bcf
bcftools view -i '%QUAL>=20' $(echo $SRA)_Alignment_sorted_calls.bcf > $(echo $SRA)_Alignment_sorted_calls.vcf

done 3<arabidopsis_wgs_accessions.txt

#Remove intermediate files
rm *filt.unpaired.unpaired.fastq
rm *filt.unpaired.paired.fastq
rm *filt.paired.fastq
rm *filt.unpaired.fastq
rm *trim.paired.fastq
rm *trim.unpaired.fastq
rm *.sam
rm *.bam
rm *.bcf
