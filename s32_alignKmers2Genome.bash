#!/bin/bash
##ALIGNING KMERS TO REFERENCE GENOME WITH BOWTIE V1
ml -* GCC/8.3.0 Bowtie/1.2.3

#Index reference genome
bowtie-build GCF_000001735.4_TAIR10.1_genomic.fna arabidopsisIndex

#Align k-mers to genome
bowtie --best --all --strata -f --sam arabidopsisIndex output/common.fa arabidopsisKmerAlignments_mvGWAS_GxE.sam

#Convert sam to bam
ml -* GCC/9.3.0 SAMtools/1.11
samtools view -bS -o arabidopsisKmerAlignments_mvGWAS_GxE.bam arabidopsisKmerAlignments_mvGWAS_GxE.sam

#Sort bam file
samtools sort -o arabidopsisKmerAlignments_mvGWAS_GxE.sorted.bam -O BAM arabidopsisKmerAlignments_mvGWAS_GxE.bam

#Call variants
ml -* GCC/8.3.0 BCFtools/1.10.2
bcftools mpileup -f GCF_000001735.4_TAIR10.1_genomic.fna arabidopsisKmerAlignments_mvGWAS_GxE.sorted.bam | bcftools call -mv -Ob -o arabidopsisKmerAlignments_mvGWAS_GxE_calls.bcf

#Filter low quality calls and convert to vcf format
bcftools view -i '%QUAL>=20' arabidopsisKmerAlignments_mvGWAS_GxE_calls.bcf > arabidopsisKmerAlignments_mvGWAS_GxE_goodCalls.vcf

#Count number of variants in final output
echo Number of variants in final output
grep -c -v "^#" arabidopsisKmerAlignments_mvGWAS_GxE_goodCalls.vcf

#Now where are these SNPs located in the genome?
##Crete bed file of locations
grep -v "^#" arabidopsisKmerAlignments_mvGWAS_GxE_goodCalls.vcf | cut -f 1,2 | awk -v s=1 '{print $1, $2-s, $2}' | sed 's/ /\t/g' > arabidopsisKmerAlignments_mvGWAS_GxE_goodCalls.bed

##Which SNPs fall in genes?
ml -* GCC/5.4.0-2.26 OpenMPI/1.10.3 BEDTools/2.27.1
bedtools coverage -counts -sortout -a GCF_000001735.4_TAIR10.1_genomic_genes.gff -b arabidopsisKmerAlignments_mvGWAS_GxE_goodCalls.bed | awk -F '\t' '(($10 > 0))' | sort -t $'\t' -rnk10 > gene_coverage_KmerAlignments_mvGWAS_GxE.txt

##How many SNPs fall in genes?
echo How many SNPs fall in genes?
cut -f 10 gene_coverage_KmerAlignments_mvGWAS_GxE.txt | paste -sd+ | bc
