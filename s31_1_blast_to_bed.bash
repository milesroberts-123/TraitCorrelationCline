#!/bin/bash
module purge
module load GCC/5.4.0-2.26
module load OpenMPI/1.10.3
module load BEDTools/2.27.1

#Convert blast output to bed format
while read -u 3 -r SRA; do
		python s31_0_blast_to_bed.py $(echo $SRA)_scaffolds_to_tair10.blast $(echo $SRA)_scaffolds_to_tair10.bed
done 3<arabidopsis_wgs_accessions.txt

#Merge all bed formatted files together
#cat *.bed > all_scaffolds_to_tair10.bed

#Calculate coverage fro genomic features
echo Filtering out non-gene records from gff file...
awk '{ if ($3 == "gene") { print } }' GCF_000001735.4_TAIR10.1_genomic.gff > GCF_000001735.4_TAIR10.1_genomic_genes.gff

#Calculate coverage of genes with bedtools
echo calculate gene coverage from these files
ls *.bed
echo Calculating coverage...
bedtools coverage -counts -sortout -a GCF_000001735.4_TAIR10.1_genomic_genes.gff -b *.bed > gene_coverage.txt
