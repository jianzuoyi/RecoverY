#!/bin/sh

#uses dsk2.2.0
#run as ./run_dsk.sh FASTQ_file_to_be_kmerized

if [ $# -ne 1 ]
then
	echo "Usage: $0 <FASTQ_file_to_be_kmerized>"
	exit 1
fi


R1_fsY_reads=$1

echo "Counting k-mers from the following file : " $R1_fsY_reads

dsk-v2.2.0-bin-Linux/bin/dsk -file $R1_fsY_reads -abundance-min 0 -kmer-size 25 -out R1_dsk -verbose 0

dsk-v2.2.0-bin-Linux/bin/dsk2ascii -file R1_dsk -out kmer_counts_from_dsk -verbose 0

rm R1_dsk.h5

rm -rf dsk_output
mkdir dsk_output
mv kmer_counts_from_dsk dsk_output/

echo "Counting finished! K-mer counts are in the folder './dsk_output'"
