#!/usr/bin/env bash
#SBATCH --job-name=fastqc
#SBATCH --mem=8G
#SBATCH --nodes=1
#SBATCH --time=24:00:00

# Run FastQC (and MultiQC on the output).
# Amelia Dunstone, based on code by Peter Hickey
# 2025-06-05

# Working directory: location of this document (code/ folder)

OUTDIR="../output/FastQC_merged"
mkdir -p ${OUTDIR}

######################## For cutadapt files: Need to run cutadapt first in 03_cutadapt.sh

# FastQC again, after using cutadapt

mkdir -p ${OUTDIR}

fastqc -o ${OUTDIR} \
       --threads 10 \
       ../data/merged_fastq/*fastq.gz

multiqc --title Socs3_MultiQC_merged \
        --outdir ${OUTDIR}/.. \
        --no-megaqc-upload \
        ${OUTDIR}

