#' Synthesize bulk by pooling single cell, and with user specified percentages
#'
#' The function creates simualted bulk samples by pooling the reads from each single cell type per sample.
#' It also can be used to create synthetic bulk samples with user-defined proportions.
#'
#' @param counts single cell UMI count matrix or sparse matrix (dgCMatrix), with rownames being genes and colnames being cell names.
#' @param annotations cell type annotation, a vector of length equal to the number of columns in counts.
#' @param SampleID sample identifications, a vector of length equal to the number of columns in counts.
#' @param prop either a string `original` or a vector of porportions with the length equal to the number of cell types and add up to 1.
#' Default is `original`. `original` pools all the cells in the provided single cell matrix. Alternatively, the cells will be sampled
#' to match the user-defined proportions, then pool.
#'
#' @return simulated bulk samples,  the ground truth cell counts and proportions per cell type per sample.
#' @export

synthesize.bulk <- function(counts, annotations, SampleID, prop = "original"){

  clusters = unique(sort(as.vector(annotations)))
  if (prop == "original") {
    s.SCcounts = counts
    s.annotations = annotations
    s.SampleID = SampleID
  } else if (length(prop) == length(clusters) & sum(prop) ==
             1) {
    names(SampleID)=colnames(counts)
    N = ncol(counts)/length(unique(SampleID))
    ns = round(prop * N)
    all.sampled.cells=c()
    for(each in unique(SampleID)){
      sampled.cells <- NULL
      for (i in 1:length(ns)) {
        cluster.cells = colnames(counts)[which(SampleID == each & 
                                                 annotations == clusters[i])]
        sampled.cells = c(sampled.cells, sample(cluster.cells,
                                                ns[i], replace = T))
      }
      all.sampled.cells=c(all.sampled.cells,sampled.cells)
    }

    s.SCcounts = counts[, all.sampled.cells]
    s.annotations = annotations[all.sampled.cells]
    s.SampleID = SampleID[all.sampled.cells]
  } else {
    message("prop needs to be either \"original\" or a vector of length\n        
            \tequal to number of cluster and sums to 1")
  }

  simbulk <- NULL
  for (i in unique(s.SampleID)){
    idx = which(s.SampleID == i)
    simbulk <- cbind(simbulk, rowSums(s.SCcounts[,idx]))
  }

  count.table = table(s.SampleID, s.annotations) %>% as.data.frame.matrix() %>%
    t()
  prop.table = sweep(count.table, 2, colSums(count.table),
                     `/`)
  rownames(simbulk) = rownames(counts)
  colnames(simbulk) = unique(s.SampleID)
  return(list(simbulk, prop.table, count.table))
}

