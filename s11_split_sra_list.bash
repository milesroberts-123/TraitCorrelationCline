#!/bin/bash
n=$(wc -l arabidopsis_wgs_sras.txt | cut -f 1 -d ' ')
d=100
echo $n
q=$((n / d))
split --numeric-suffixes -l $q arabidopsis_wgs_sras.txt arabidopsis_wgs_sras_split
split --numeric-suffixes -l $q arabidopsis_wgs_accessions.txt arabidopsis_wgs_accessions_split

rename -n 's/split0/split/' *split*
rename 's/split0/split/' *split*

rename -n 's/split900/split9/' *split*
rename 's/split900/split9/' *split*

rename -n 's/split901/split10/' *split*
rename 's/split901/split10/' *split*

rename -n 's/split902/split11/' *split*
rename 's/split902/split11/' *split*

rename -n 's/split903/split12/' *split*
rename 's/split903/split12/' *split*

rename -n 's/split904/split13/' *split*
rename 's/split904/split13/' *split*

