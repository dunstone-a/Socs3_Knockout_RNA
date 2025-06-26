#!/bin/bash
#SBATCH --job-name=kallisto
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=64G
#SBATCH --array=0-5
#SBATCH --time=24:00:00

# conda install -c bioconda kallisto

OUTDIR="../data"

grcm39="../references/grcm39.idx"

# Read information into arrays
readarray -t SAMPLES < ../data/sample_names.txt

SAMPLE="${SAMPLES[SLURM_ARRAY_TASK_ID]}"
# SAMPLE="${SAMPLES[0]}"

echo $SAMPLE

mkdir -p ../data/kallisto

kallisto quant \
  -i $grcm39 \
  -o "${OUTDIR}/kallisto/${SAMPLE}_output" \
  -b 100 \
  -t 8 \
  "${OUTDIR}/merged_fastq/${SAMPLE}_R1_merged.fastq.gz" \
  "${OUTDIR}/merged_fastq/${SAMPLE}_R2_merged.fastq.gz"

echo "kallisto complete."
echo "---------------------"

