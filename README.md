# AdRoit
Accurate and robust method to infer complex transcriptome composition

Tao Yang <xadmyangt@gmail.com>

## Term of use
ADROIT IS A PROPRIETARY ALGORITHM DEVELOPED BY REGENERON PHARMACEUTICALS INC. 
THE RELEASED PACKAGE MAY ONLY BE APPLIED IN ACADEMIC RESEARCH AND IS RESTRICTED FROM OTHER ACTIVITIES INCLUDING BUT NOT LIMITED TO RESEARCH AND COMMERCIAL USAGES IN FOR-PROFIT ORGNIZATIONS.

## Introduction
RNA sequencing technology promises an unprecedented opportunity in learning disease mechanisms and discovering new treatment targets. Recent spatial transcriptomics methods further enable the transcriptome profiling at spatially resolved spots in a tissue section. In controlled experiments, it is often of immense importance to know the cell composition in different samples. Understanding the cell type content in each tissue spot is also crucial to the spatial transcriptome data interpretation. Though single cell RNA-seq has the power to reveal cell type composition and expression heterogeneity in different cells, it remains costly and sometimes infeasible when live cells cannot be obtained or sufficiently dissociated. To computationally resolve the cell composition in RNA-seq data of mixed cells, we present AdRoit, an accurate and robust method to infer transcriptome composition. The method estimates the proportions of each cell type in the compound RNA-seq data using known single cell data of relevant cell types. It uniquely uses an adaptive learning approach to correct the bias gene-wise due to the difference in sequencing techniques. AdRoit also utilizes cell type specific genes while control their cross-sample variability. Our systematic benchmarking, spanning from simple to complex tissues, shows that AdRoit has superior sensitivity and specificity compared to other existing methods. Its performance holds for multiple single cell and compound RNA-seq platforms. In addition, AdRoit is computationally efficient and runs one to two orders of magnitude faster than some of the state-of-the-art methods. 

## System requirement
### Hardware requirement: 
        Linux, MacOS, Windows
### Software requirement: 
        R version > 3.5.0 (lower version may work, but not tested)
### Dependencies: 
          Seurat (>= 3.0.1),
          fitdistrplus,
          nnls,
          reshape2,
          utils,
          stats,
          dplyr, 
          data.table, 
          matrixStats, 
          doParallel,
          parallel,
          foreach, 
          ggplot2.
### Installation:
1. Install from Github:
```
devtools::install_github("TaoYang-dev/AdRoit/AdRoit")
```

2. Install from source
Download the source code `AdRoit_0.2.2.tar.gz` and install it in R:
```
install.packages("/PATH/TO/AdRoit_0.2.2.tar.gz", repo = NULL, type = "source")
```

## Tutorial
To be released.
