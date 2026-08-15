library(Biostrings)
library(GenomicRanges)
library(AnnotationDbi)
library(org.Hs.eg.db)
library(rentrez)

# Question 1
# downloading TP53 sequence:
tp53_sequence <- entrez_fetch(
  db = "nuccore",
  id = "NM_000546",
  rettype = "fasta"
)

# save fasta file:
write(tp53_sequence, "tp53.fasta")
cat("TP53 FASTA file downloaded successfully\n\n")

# Reading FASTA sequence
tp53 <- readDNAStringSet("tp53.fasta")
cat("TP53 sequence loaded into R\n\n")

# Sequence length
tp53_length <- width(tp53)
cat("Length of TP53 sequence:",tp53_length,"bases\n\n")



# Question 2:
# First 30 nucleotide bases
first30 <- subseq(
  tp53,
  start = 1,
  end = 30
)

cat("First 30 bases of TP53:", as.character(first30), "\n\n")



# Question 3:
# Counting ATG occurrences:
atg_count <- vcountPattern("ATG",tp53)
cat("Number of ATG patterns:",atg_count,"\n\n")



# Question 4
# Reverse complement
rev_comp <- reverseComplement(first30)
cat("Reverse complement of first 30 bases:",as.character(rev_comp),"\n\n")



# Question 5
# Creating GRanges object for TP53
tp53_range <- GRanges(
  seqnames = "chr17",
  
  ranges = IRanges(
    start = 7668402,
    end = 7687550
  ),
  
  strand = "-"
)

print(tp53_range)

cat("\nGenomic width:", width(tp53_range), "bases\n\n")




# Question 6:
# TP53 annotation
tp53_annotation <- select(
  org.Hs.eg.db,
  
  keys = "TP53",
  
  columns = c(
    "ENTREZID",
    "GENENAME"
  ),
  
  keytype = "SYMBOL"
)

print(tp53_annotation)