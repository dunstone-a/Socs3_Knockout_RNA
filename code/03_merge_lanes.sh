#!/bin/bash
#SBATCH --job-name=merge-reads
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=64G
#SBATCH --array=0-11
#SBATCH --time=0:45:00

# Concatenate the FASTQ files so that each sample and read combination is in one file.
# Amelia Dunstone
# 2025-07-16

# Working directory: inside code folder.

RAWDIR="../extdata/AGRF_data/"
DATADIR="../data/merged_fastq"

mkdir -p "$DATADIR"

# Read information into array
readarray -t SAMPLE_READS < ../data/sample_read_names.txt

# Pick the correct line based on SLURM_ARRAY_TASK_ID
SAMPLE_READ="${SAMPLE_READS[$SLURM_ARRAY_TASK_ID]}"
# SAMPLE_READ="${SAMPLE_READS[0]}"

# Replace R with *R so that the barcode can be in the file name
PATTERN="${SAMPLE_READ/_R/_*R}"

# Expand wildcard and concatenate matching files into one
cat "$RAWDIR"/${PATTERN}.fastq.gz > "$DATADIR/${SAMPLE_READ}_merged.fastq.gz"
