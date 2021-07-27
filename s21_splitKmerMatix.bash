#!/bin/bash --login
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=7-00:00:00
#SBATCH --mem-per-cpu=32G
#SBATCH --partition=josephsnodes
#SBATCH --account=josephsnodes
# output information about how this job is running using bash commands
echo "This job is running on $HOSTNAME on `date`"


echo Calculating total number of lines in full kmer matrix...
n=$(wc -l allKmersMergedUnique.txt | cut -f 1 -d ' ')
d=100
q=$(( n / d ))
echo Splitting the full kmer matrix with $n lines into $d submatrices with at most $q lines, plus remainder...
split --numeric-suffixes -l $q allKmersMergedUnique.txt allKmersMergedUnique_split

echo renaming split files...
#rename -n 's/split0/split/' *split*
#rename 's/split0/split/' *split*

mv allKmersMergedUnique_split00 allKmersMergedUnique_split0
mv allKmersMergedUnique_split01 allKmersMergedUnique_split1
mv allKmersMergedUnique_split02 allKmersMergedUnique_split2
mv allKmersMergedUnique_split03 allKmersMergedUnique_split3
mv allKmersMergedUnique_split04 allKmersMergedUnique_split4
mv allKmersMergedUnique_split05 allKmersMergedUnique_split5
mv allKmersMergedUnique_split06 allKmersMergedUnique_split6
mv allKmersMergedUnique_split07 allKmersMergedUnique_split7
mv allKmersMergedUnique_split08 allKmersMergedUnique_split8
mv allKmersMergedUnique_split09 allKmersMergedUnique_split9
