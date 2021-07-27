#!/bin/bash
#Crete bed file of locations
grep -v "^#" allKmerContainingReadsVariantCalls.vcf | cut -f 1,2 | awk -v s=1 '{print $1, $2-s, $2}' | sed 's/ /\t/g' > allKmerContainingReadsVariantCalls.bed

#How many variants fall in genes?
ml -* GCC/5.4.0-2.26 OpenMPI/1.10.3 BEDTools/2.27.1
awk '(($3 == "gene"))' GCF_000001735.4_TAIR10.1_genomic.gff | sort -k1,1 -k4,4n > GCF_000001735.4_TAIR10.1_genomic_genes.gff
bedtools merge -i GCF_000001735.4_TAIR10.1_genomic_genes.gff | sort -k1,1 -k2,2n > GCF_000001735.4_TAIR10.1_genomic_genes_merged.gff
bedtools coverage -counts -sortout -a GCF_000001735.4_TAIR10.1_genomic_genes_merged.gff -b allKmerContainingReadsVariantCalls.bed | awk -F '\t' '(($4 > 0))' | sort -t $'\t' -rnk4 > gene_coverage_readAlignments_mvGWAS_GxE.txt
cut -f 4 gene_coverage_readAlignments_mvGWAS_GxE.txt | paste -sd+ | bc

#How many variants fall in open chromatin regions?
sed -i 's/_//g' GSE34318_dhsites_region.bed
awk '(($4 == "wtflower" || $4 == "wtleaf" || $5 == "wtflower" || $5 == "wtleaf" || $6 == "wtflower" || $6 == "wtleaf" || $7 == "wtflower" || $7 == "wtleaf"))' GSE34318_dhsites_region.bed | awk '{ print $1, $2, $3 }' | sed 's/ /\t/g' | sed 's/Chr1/NC_003070.9/g' | sed 's/Chr2/NC_003071.7/g' | sed 's/Chr3/NC_003074.8/g' | sed 's/Chr4/NC_003075.7/g' | sed 's/Chr5/NC_003076.8/g' | sort -k1,1 -k2,2n > GSE34318_wt_dhsites_region.bed
bedtools merge -i GSE34318_wt_dhsites_region.bed > GSE34318_wt_dhsites_region_merged.bed
bedtools coverage -counts -sortout -a GSE34318_wt_dhsites_region_merged.bed -b allKmerContainingReadsVariantCalls.bed | awk -F '\t' '(($4 > 0))' | sort -t $'\t' -rnk4 > cre_coverage_readAlignments_mvGWAS_GxE.txt
cut -f 4 cre_coverage_readAlignments_mvGWAS_GxE.txt | paste -sd+ | bc

###How many variants fall in non-coding, open-chromatin regions?
#Create genome file
ml -* GCC/9.3.0 SAMtools/1.11
samtools faidx GCF_000001735.4_TAIR10.1_genomic.fna
awk -v OFS='\t' {'print $1,$2'} GCF_000001735.4_TAIR10.1_genomic.fna.fai | sort -k1,1 -k2,2n > GCF_000001735.4_TAIR10.1_genomic.genome

#Create gff file of non-coding regions
ml -* GCC/5.4.0-2.26 OpenMPI/1.10.3 BEDTools/2.27.1
bedtools complement -i GCF_000001735.4_TAIR10.1_genomic_genes_merged.gff -g GCF_000001735.4_TAIR10.1_genomic.genome > GCF_000001735.4_TAIR10.1_genomic_noncoding_merged.gff

#Intersect non-coding regions and openchromatin regions
bedtools intersect -a GCF_000001735.4_TAIR10.1_genomic_noncoding_merged.gff -b GSE34318_wt_dhsites_region_merged.bed > noncodingOpenChromatin.bed

#Calculate coverage
bedtools coverage -counts -sortout -a noncodingOpenChromatin.bed -b allKmerContainingReadsVariantCalls.bed | awk -F '\t' '(($4 > 0))' | sort -t $'\t' -rnk4 > noncodingOpenChromatin_readAlignments_mvGWAS_GxE.txt
cut -f 4 noncodingOpenChromatin_readAlignments_mvGWAS_GxE.txt | paste -sd+ | bc
 
###SUMMARY STATISTICS###
#How many bp are in gene regions?
awk '{print $3-$2}' GCF_000001735.4_TAIR10.1_genomic_genes_merged.gff | paste -sd+ | bc
#How many bp are in open chromatin regions?
awk '{print $3-$2}' GSE34318_wt_dhsites_region_merged.bed | paste -sd+ | bc
#How many bp are in the arabidopsis genome total
./seqkit stats GCF_000001735.4_TAIR10.1_genomic.fna
#How many variants are there in total?
grep -c -v "^#" allKmerContainingReadsVariantCalls.vcf
#How many variants are SNPs vs INDELS?
ml -* GCC/7.3.0-2.30 OpenMPI/3.1.1 VCFtools/0.1.15-Perl-5.28.0
vcftools --vcf allKmerContainingReadsVariantCalls.vcf --keep-only-indels
#How many variants are lineage specific?
vcftools --vcf allKmerContainingReadsVariantCalls.vcf --missing-site
#How many bp are in non-coding open chromatin?
awk '{print $3-$2}' noncodingOpenChromatin.bed | paste -sd+ | bc
