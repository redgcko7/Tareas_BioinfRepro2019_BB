#### script to download four sequence of Coleonyx geckos and search for TGCA occurences#####
##created by Brett Butler####
# create loop to download each sequence into own .fasta file
# search each fasta file for TGCA repeat
# print how many times TGCA repeats in each sequence

#!/bin/bash
for seq in AB308462.1 HM012686.1 HM012687.1 AB028761.1 AY140999.1; do curl -s "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nucleotide&rettype=fasta&id=$seq" > $seq.fasta;
	grep ">" $seq.fasta #check to see if all downloaded correctly
	occ=$(grep -o "TGCA" $seq.fasta | wc -l); #see how many times TGCA repeats
	name=$(grep -oE "Coleonyx \w+" $seq.fasta); # find species name
	echo "The pattern 'GTCA' appears $occ times within the $name 16s sequence ID $seq"; # echos how many times each repeat is found in each sequence
	done;