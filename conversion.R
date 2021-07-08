library(Seurat)
library(SeuratObject)
library(SeuratDisk)
library(RISC)

# Convert a Seurat object to a RISC object
# This could be augmented for more functionality at this point 
# it should only be used to convert QC filtered count matrices 
# to RISC for subsequent integration
SeuratToRisc <- function(seuratobj) {
  counts <- seuratobj@assays$RNA@counts
  cell <- seuratobj@meta.data
  gene <- data.frame(
    Symbol = rownames(counts),
    RNA = 'Gene Expression',
    row.names = rownames(counts)
  )
  riscobj <- readscdata(
    count = counts,
    cell = cell,
    gene = gene
  )
  return(riscobj)
}

# Convert integrated data from RISC object to Seurat assay and add it to an existing Seurat object
# This function can be augmented to work as a standalone converter but was developed
# to use Seurat for QC, RISC as data integration engine and Seurat for clustering etc.
# npcs is the number of precomputed PCs as used during RISC integration
AddRiscToSeurat <- function(seuratobj, riscobj, npcs = 50) {
  data <- riscobj@assay$logcount
  # get rid of the prefix RISC adds upon integration
  colnames(data) <- gsub(
    'Set[0-9]+_', 
    '', 
    colnames(data)
  )
  # reorder cells to comply to original order in Seurat object
  data <- data[,colnames(seuratobj@assays$RNA@counts)]
  obj[['integrated']] <- CreateAssayObject(
    data = data
  )
  rm(data)
  cell.embeddings <- riscobj@DimReduction$cell.pls
  # again get rid of the suffix
  rownames(cell.embeddings) <- gsub(
    'Set[0-9]+_', 
    '', 
    rownames(cell.embeddings)
  )
  colnames(cell.embeddings) <- paste('PC', 1:npcs, sep = '_')
  seuratobj@reductions$pca <- CreateDimReducObject(
    embeddings = cell.embeddings[colnames(seuratobj@assays$RNA@counts),],
    assay = 'integrated',
    key = 'PC_',
  )
  seuratobj@active.assay <- "integrated"
  return(seuratobj)
}
