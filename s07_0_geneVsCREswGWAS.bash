#!/bin/bash
#Subset out only gene features
zcat ../raw_data/GCF_000001735.4_TAIR10.1_genomic.gff.gz | awk '(($3 == "gene"))' | sort -k1,1 -k4,4n > GCF_000001735.4_TAIR10.1_genomic_genes.gff

#Merge gene features so that you don't double count if a SNP falls in an overlap
bedtools merge -i GCF_000001735.4_TAIR10.1_genomic_genes.gff > GCF_000001735.4_TAIR10.1_genomic_genes_merged.gff

#Subset out only open chromatin regions in wild-type arabidopsis
#zcat ../raw_data/GSE34318_dhsites_region.bed.gz | sed 's/_//g' > GSE34318_dhsites_region.bed
#awk '(($4 == "wtflower" || $4 == "wtleaf" || $5 == "wtflower" || $5 == "wtleaf" || $6 == "wtflower" || $6 == "wtleaf" || $7 == "wtflower" || $7 == "wtleaf"))' GSE34318_dhsites_region.bed | awk '{ print $1, $2, $3 }' | sed 's/ /\t/g' | sed 's/Chr1/NC_003070.9/g' | sed 's/Chr2/NC_003071.7/g' | sed 's/Chr3/NC_003074.8/g' | sed 's/Chr4/NC_003075.7/g' | sed 's/Chr5/NC_003076.8/g' | sort -k1,1 -k2,2n | bedtools merge -i - > GSE34318_wt_dhsites_region.bed
zcat GSM*.bed.txt.gz | sort -k1,1 -k2,2n | bedtools merge | grep "chr[1-5]" | sed 's/^chr1/NC_003070.9/g' | sed 's/^chr2/NC_003071.7/g' | sed 's/^chr3/NC_003074.8/g' | sed 's/^chr4/NC_003075.7/g' | sed 's/^chr5/NC_003076.8/g' | bedtools subtract -a - -b GCF_000001735.4_TAIR10.1_genomic_genes_merged.gff > dnaseHypersensitivityPeaksAllMergedNuclearNongenic.bed

#rm snpFT16GeneCounts.txt
#rm snpRGRGeneCounts.txt
rm snpGeneCounts.txt
rm snpCREcounts.txt

#Loop over window files
for file in ./output/window*.bed
	do
		bedtools coverage -counts -sortout -a GCF_000001735.4_TAIR10.1_genomic_genes_merged.gff -b $file | awk -F '\t' '(($4 > 0))' | sort -t $'\t' -rnk4 > gene_coverage_$(basename $file .bed).txt
		gene=$(cut -f 4 gene_coverage_$(basename $file .bed).txt | paste -sd+ | bc)
		total=$(wc -l $file | cut -f 1 --delimiter=" ")
		echo $file $total $gene >> snpGeneCounts.txt

		bedtools coverage -counts -sortout -a dnaseHypersensitivityPeaksAllMergedNuclearNongenic.bed -b $file | awk -F '\t' '(($4 > 0))' | sort -t $'\t' -rnk4 > cre_coverage_$(basename $file .bed).txt
		gene=$(cut -f 4 cre_coverage_$(basename $file .bed).txt | paste -sd+ | bc)
                total=$(wc -l $file | cut -f 1 --delimiter=" ")
                echo $file $total $gene >> snpCREcounts.txt
	done

#Remove intermediate files
rm gene_coverage_*.txt
rm cre_coverage_*.txt

#for file in window*RGR.bed
#        do
#                bedtools coverage -counts -sortout -a GCF_000001735.4_TAIR10.1_genomic_genes_merged.gff -b $file | awk -F '\t' '(($10 > 0))' | sort -t $'\t' -rnk10 > gene_coverage_$(basename $file .bed).txt
#                gene=$(cut -f 10 gene_coverage_$(basename $file .bed).txt | paste -sd+ | bc)
#                total=$(wc -l $file | cut -f 1 --delimiter=" ")
#                echo $file $total $gene >> snpRGRGeneCounts.txt
#        done
