library(Biostrings)
library(GenomicRanges)
library(AnnotationDbi)
library(org.Hs.eg.db)
library(rentrez)


# Question 1
# Download EGFR sequence:
egfr_sequence <- entrez_fetch(
  db = "nuccore",
  id = "NM_005228",
  rettype = "fasta"
)

# Save FASTA file
write(egfr_sequence, "egfr.fasta")
cat("EGFR FASTA file downloaded successfully\n\n")

# Reading EGFR sequence
egfr <- readDNAStringSet("egfr.fasta")
cat("EGFR sequence loaded into R\n\n")

# Sequence length
egfr_length <- width(egfr)
cat("Length of EGFR sequence:", egfr_length, "bases\n\n")




# Question 2:
# First 30 bases
first30 <- subseq(
  egfr,
  start = 1,
  end = 30
)

cat("First 30 bases of EGFR:", as.character(first30), "\n\n")




# Question 3:
# Counting ATG occurrences
atg_count <- vcountPattern(
  "ATG",
  egfr
)

cat("Number of ATG patterns:", atg_count, "\n\n")





# Question 4:
# Reverse complement
rev_comp <- reverseComplement(first30)
cat("Reverse complement of first 30 bases:", as.character(rev_comp), "\n\n")





# Question 5:
# Creating GRanges object for EGFR
egfr_range <- GRanges(
  
  seqnames = "chr7",
  
  ranges = IRanges(
    start = 55019017,
    end = 55211628
  ),
  
  strand = "+"
)

print(egfr_range)

cat("\nGenomic width:", width(egfr_range), "bases\n\n")






# Question 6:
# EGFR annotation
egfr_annotation <- select(
  org.Hs.eg.db,
  
  keys = "EGFR",
  
  columns = c(
    "ENTREZID",
    "GENENAME"
  ),
  
  keytype = "SYMBOL"
)

print(egfr_annotation)