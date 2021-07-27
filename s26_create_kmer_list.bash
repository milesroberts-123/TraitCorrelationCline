#!/bin/bash
cd ./output

#Print out list of significant kmers, convert to fasta format, give unique names to each sequence so that common sequences can be easily pulled out
echo Printing significant kmers...
awk '{ if ($13 < 1.105053e-6) { print $2 } }' mvKmerGWASresults_FT16_RGR_gxe.assoc.txt | awk '{print ">" NR "\n" $s}' > sig_kmers_mvGWAS.fasta
awk '{ if ($12 < 1.916545e-4) { print $2 } }' uvKmerGWASresults_RGR_gxe.assoc.txt | awk '{print ">" NR "\n" $s}' > sig_kmers_uvGWAS_RGR.fasta
awk '{ if ($12 < 1.642279e-4) { print $2 } }' uvKmerGWASresults_FT16_gxe.assoc.txt | awk '{print ">" NR "\n" $s}' > sig_kmers_uvGWAS_FT16.fasta


#Identify which kmers are significant in all three tests
../seqkit common sig_kmers*.fasta -s -i -o common.fasta
