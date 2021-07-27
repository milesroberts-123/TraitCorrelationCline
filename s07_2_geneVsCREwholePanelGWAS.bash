#!/bin/bash
#Build genome file
python3 s07_1_buildGenomeFile.py ../raw_data/GCF_000001735.4_TAIR10.1_genomic.fna arabidopsis.genome
sed -i -E 's/,/\t/g' arabidopsis.genome

sed '1d' wholePanelSNPmvGWASsignificantResults.csv | awk -F "," 'BEGIN {OFS = "\t"} {print $2, $3-1, $3+1}'| sed 's/^1/NC_003070.9/g' | sed 's/^2/NC_003071.7/g' | sed 's/^3/NC_003074.8/g' | sed 's/^4/NC_003075.7/g' | sed 's/^5/NC_003076.8/g' | bedtools merge > wholePanelSNPmvGWASsignificantResults.bed
bedtools flank -i wholePanelSNPmvGWASsignificantResults.bed -g arabidopsis.genome -b 5000 | sort -k1,1 -k2,2n | bedtools merge > wholePanelSNPmvGWASsignificantResultsFlanks.bed

bedtools coverage -counts -sortout -a GCF_000001735.4_TAIR10.1_genomic_genes.gff -b wholePanelSNPmvGWASsignificantResultsFlanks.bed | awk -F '\t' '(($10 > 0))' | sort -t $'\t' -rnk4 > genes_overlapped_wholePanelSNPmvGWAS.gff
bedtools coverage -counts -sortout -a GCF_000001735.4_TAIR10.1_genomic_genes_merged.gff -b wholePanelSNPmvGWASsignificantResultsFlanks.bed | awk -F '\t' '(($4 > 0))' | sort -t $'\t' -rnk4 > gene_coverage_wholePanelSNPmvGWAS.txt
