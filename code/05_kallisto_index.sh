#!/bin/bash
#SBATCH --job-name=kallisto
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=64G
#SBATCH --time=8:00:00

# conda install -c bioconda kallisto

cd ../references

#######################################################


# Build index
kallisto index -i grcm39.idx "Mus_musculus.GRCm39.cdna.all.fa"


echo "kallisto index built."
echo "---------------------"
