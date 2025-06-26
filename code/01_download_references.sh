# Download some reference files
# 2025-06-07

# Working directory: code

# Download from gencode: https://www.gencodegenes.org/mouse/
# Download comprehensive gene annotation (PRI)
cd ../references
wget https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_mouse/release_M37/gencode.vM37.primary_assembly.annotation.gtf.gz
# Download Genome sequence, primary assembly (GRCm39)
wget https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_mouse/release_M37/GRCm39.primary_assembly.genome.fa.gz

# Unzip files
gunzip gencode.vM37.primary_assembly.annotation.gtf.gz
gunzip GRCm39.primary_assembly.genome.fa.gz

# Concatenate genomes
# cat GRCm39.primary_assembly.genome.fa X03453.1.fasta > mouse_and_cre.fa

# Concatenate gtf files
# cat gencode.vM37.chr_patch_hapl_scaff.annotation.gtf cre.gtf > mouse_and_cre.gtf

## KALLISTO --------------------------------------------------------------------

# Download transcript reference
wget https://ftp.ensembl.org/pub/release-114/fasta/mus_musculus/cdna/Mus_musculus.GRCm39.cdna.all.fa.gz
gunzip Mus_musculus.GRCm39.cdna.all.fa.gz

