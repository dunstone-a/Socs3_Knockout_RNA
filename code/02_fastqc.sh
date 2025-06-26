#!/usr/bin/env bash
#SBATCH --job-name=fastqc
#SBATCH --mem=64G
#SBATCH --nodes=1
#SBATCH --time=48:00:00

# Run FastQC (and MultiQC on the output).
# Amelia Dunstone, based on code by Peter Hickey
# 2025-06-05

# Working directory: location of this document (code/ folder)


OUTDIR="../output/FastQC"
mkdir -p ${OUTDIR}

# Create symbolic links to data
# Inside extdata folder (not code folder):
# ln -s /mnt/beegfs/mccarthy/general/backed_up/adunstone/AGRF_NXGSQCAGRF25020355-1_22YMFCLT3/ AGRF_data

fastqc -o ${OUTDIR} \
       --threads 10 \
       ../extdata/AGRF_data/*fastq.gz

multiqc --title Socs3_MultiQC \
        --outdir ${OUTDIR}/.. \
        --no-megaqc-upload \
        ${OUTDIR}
