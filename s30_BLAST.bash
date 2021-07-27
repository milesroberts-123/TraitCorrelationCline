#!/bin/bash

#Load modules
module purge
module load GCC/8.2.0-2.31.1
module load OpenMPI/3.1.3
module load BLAST+/2.9.0

#Create blast database
makeblastdb -in GCF_000001735.4_TAIR10.1_genomic.fna -dbtype nucl -parse_seqids -out GCF_000001735.4_TAIR10.1_genomic

#Perform blast
while read -u 3 -r SRA; do
	echo Filtering out short scaffolds...
	./seqkit seq -m 500 ./spades_output_$(echo $SRA)/scaffolds.fasta > long_scaffolds_$(echo $SRA).fasta
	echo Blast search...
	blastn -query long_scaffolds_$(echo $SRA).fasta -db GCF_000001735.4_TAIR10.1_genomic -num_threads 15 -evalue 1e-100 -outfmt 6 -max_hsps 1 -perc_identity 95 -qcov_hsp_perc 95 -out $(echo $SRA)_scaffolds_to_tair10.blast
done 3<arabidopsis_wgs_accessions.txt
