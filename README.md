# TP53 and EGFR Analysis

## Overview

This project performs an **in silico analysis of the TP53 and EGFR cancer-associated genes using R and Bioconductor**.

The analysis includes:
- NCBI nucleotide sequence retrieval
- Sequence length analysis
- Extraction of the first 30 bases
- ATG pattern counting
- Reverse complement analysis
- Genomic location analysis using `GRanges`
- Gene annotation using `AnnotationDbi`

## Packages Required:

- `Biostrings`
- `GenomicRanges`
- `AnnotationDbi`
- `org.Hs.eg.db`
- `rentrez`

## Installation:

Install `BiocManager` and `rentrez`:

```r
install.packages("BiocManager")
install.packages("rentrez")


Install the required Bioconductor packages:

BiocManager::install(c(
  "Biostrings",
  "GenomicRanges",
  "AnnotationDbi",
  "org.Hs.eg.db"
))
```



## Load Packages:
```
library(Biostrings)
library(GenomicRanges)
library(AnnotationDbi)
library(org.Hs.eg.db)
library(rentrez)
```

## Gene Anazlyzed:
| Gene | NCBI Accession | Chromosome | Strand |
| ---- | -------------- | ---------- | ------ |
| TP53 | NM_000546      | chr17      | -      |
| EGFR | NM_005228      | chr7       | +      |



## Tools:
R | Bioconductor | RStudio | NCBI


## Author

Sristanka Adhikary
Biotechnology | Bioinformatics & Computational Biology
