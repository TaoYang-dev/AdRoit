% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get.hvfs.R
\name{get.hvfs}
\alias{get.hvfs}
\title{Get highly variable genes}
\usage{
get.hvfs(ref.obj, annotations, n.top = 2000, balance = FALSE)
}
\arguments{
\item{ref.obj}{reference single cell matrix, data.frame or Seurat object.}

\item{annotations}{a vector annotates the cell types of cells.}

\item{n.top}{number of top highly variable genes to be selected.}

\item{balance}{whether to balance the sizes of the cell clusters. If TRUE, the function balances the number of cells in each cell
cluster to the median size of all by sampling cells from each cluster. Default is FALSE.}
}
\value{
a vector of top highly variable genes.
}
\description{
This function extract the highly variable genes from Seurat object. The function provides the option to balance the cluster sizes
before compute variations.
}
