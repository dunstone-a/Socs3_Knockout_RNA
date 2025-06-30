# Code directory information

I have run the following pre-processing bash script to convert FastQ files into a count matrix. 

Most of these steps require the use of a computing cluster, as they require a large amount of memory (64GB) and a large amount of storage space (1TB). 

`01_download_references.sh`
- Download GRCm39 gene reference
- Download GRCm39 transcript reference (cDNA)

`02_fastqc.sh`
- Produce FastQC and MultiQC reports of the FastQ files (lane and sample based).
- These reports include basic quality control metrics like number of reads, GC content, PCR duplicates, and overrepresented sequences. 
- **NOTE**: I did a full alignment of these 48 samples and found that the lanes were very consistent with each other. 

`03_merge_lanes.sh`
- Concatenate the reads from the same samples across the 8 lanes. 

`04_fastqc_merged.sh`
- Produce FastQC and MultiQC reports on the 6 merged FastQ files (sample based).

`05_kallisto_index.sh`
- Build the kallisto index based on the cDNA mouse reference. 

`06_kallisto_align.sh`
- Align the reads to the kallisto index and output abundance.h5 files for each sample. These files can be loaded in as count matrices in R. 
