% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/synthesize.bulk.R
\name{synthesize.bulk}
\alias{synthesize.bulk}
\title{Synthesize bulk by pooling single cell, and with user specified percentages}
\usage{
synthesize.bulk(counts, annotations, SampleID, prop = "original")
}
\arguments{
\item{counts}{single cell UMI count matrix or sparse matrix (dgCMatrix), with rownames being genes and colnames being cell names.}

\item{annotations}{cell type annotation, a vector of length equal to the number of columns in counts.}

\item{SampleID}{sample identifications, a vector of length equal to the number of columns in counts.}

\item{prop}{either a string `original` or a vector of porportions with the length equal to the number of cell types and add up to 1.
Default is `original`. `original` pools all the cells in the provided single cell matrix. Alternatively, the cells will be sampled
to match the user-defined proportions, then pool.}
}
\value{
simulated bulk samples,  the ground truth cell counts and proportions per cell type per sample.
}
\description{
The function creates simualted bulk samples by pooling the reads from each single cell type per sample.
It also can be used to create synthetic bulk samples with user-defined proportions.
}
