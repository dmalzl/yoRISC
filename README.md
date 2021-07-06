# yoRISC
A bit of code to interconvert objects between the Seurat and RISC environments for scRNA-seq data analysis.
This source was mainly compiled by following the [RISC guide](https://github.com/bioinfoDZ/RISC/blob/master/Seurat_to_RISC.pdf) to convert Seurat object to RISC object and getting insight from looking at the source code of the [Seurat package](https://github.com/satijalab/seurat) (mainly on how their IntegrateData and RunPCA methods would work). The code was tested with the main functionality of Seurat for a generic scRNA-seq analysis. To run the conversion functions as presented in the `conversion.R` script you need the following packages

- [RISC 1.0.0](https://github.com/bioinfoDZ/RISC)
- [SeuratDisk 0.0.0.9019](https://github.com/mojaveazure/seurat-disk)    
- [SeuratObject 4.0.0](https://github.com/mojaveazure/seurat-object)
- [Seurat 4.0.1](https://satijalab.org/seurat/articles/install.html)

For any additonal code presented in the `risc_integration.Rmd` you also have to install
- [gridExtra 2.3](https://cran.r-project.org/web/packages/gridExtra/index.html)
- [ggplot2 3.3.3](https://ggplot2.tidyverse.org/)
- [dplyr 1.0.5](https://dplyr.tidyverse.org/)
- [tidyverse 1.3.1](https://www.tidyverse.org/)
- [BiocManager 1.30.12](https://www.bioconductor.org/install/)
- [celldex 1.0.0](https://bioconductor.org/packages/release/data/experiment/html/celldex.html)
- [pheatmap 1.0.12](https://cran.r-project.org/web/packages/pheatmap/index.html)
- [SingleR 1.4.1](https://www.bioconductor.org/packages/release/bioc/html/SingleR.html)
