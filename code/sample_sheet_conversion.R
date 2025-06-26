# Sample sheet lane to sample sheet code

# Preparing the sample sheet:
# NOTE: This would not have been necessary if I made the sample sheet at the sample 
# level, but I made it at the lane level. 

# Read in sample sheet
samples <- read.csv(here("data/sample_sheet_lane.csv"))
samples$group <- samples$Group
samples$Group <- NULL

# Remove lane information from sample sheet
samples$group <- factor(samples$group)

# Discard lane info, and take the first occurrence for each sample.
# NOTE: This requires each lane to have identical batch, sample, mouse info etc. 
samples <- samples[!duplicated(samples$group), ]
samples$lane <- NULL
samples$Name <- NULL
rownames(samples) <- samples$group

# Drop 22YMFCLT3 from colnames
colnames(counts) <- gsub("_22YMFCLT3", "", colnames(counts))

# The sample sheet is already in the correct order
stopifnot(identical(samples$Sample_name, colnames(counts)))

write.csv(samples, here("data/sample_sheet.csv"), row.names = TRUE)
