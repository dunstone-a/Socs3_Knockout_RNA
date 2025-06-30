#!/bin/bash
#SBATCH --job-name=cutadapt
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=64G
#SBATCH --array=0-47
#SBATCH --time=2:00:00

# Run cutadapt for many files in parallel.
# Each file will have a slurm job with the above resources.
# JOBID's are ######_##, indicating the slurm job number as well as the array number.

# Working directory: location of this document (code/ folder)

OUTDIR="../data"

#######################################################

# Read information into arrays
readarray -t FILE_PATHS < ../data/all_file_paths.txt
readarray -t ADAPTER_SEQS < ../data/adapter_sequences.txt
readarray -t SAMPLES < ../data/sample_lane_names.txt

FILE_PATH="${FILE_PATHS[SLURM_ARRAY_TASK_ID]}"
ADAPTER_SEQ="${ADAPTER_SEQS[SLURM_ARRAY_TASK_ID]}"
SAMPLE="${SAMPLES[SLURM_ARRAY_TASK_ID]}"
# FILE_PATH="${FILE_PATHS[0]}"
# ADAPTER_SEQ="${ADAPTER_SEQS[0]}"
# SAMPLE="${SAMPLES[0]}"

# For paired end reads, use -a for R1 and -A for R2.

mkdir -p ${OUTDIR}/cutadapt

# Print sample and adapter sequence
echo "Running:"
echo "SAMPLE=$SAMPLE"
echo "Adapter=$ADAPTER_SEQ"

cutadapt -a "$ADAPTER_SEQ" -A "$ADAPTER_SEQ" \
     --minimum-length 20 \
     -o "${OUTDIR}/cutadapt/${SAMPLE}_R1.fastq.gz" \
     -p "${OUTDIR}/cutadapt/${SAMPLE}_R2.fastq.gz" \
     "${FILE_PATH}_R1.fastq.gz" \
     "${FILE_PATH}_R2.fastq.gz"

echo "cutadapt complete."
echo "---------------------"
