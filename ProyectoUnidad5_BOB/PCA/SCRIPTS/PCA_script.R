## download SNPRelate
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("gdsfmt")
BiocManager::install("SNPRelate", version = "3.8")

library(SNPRelate)
library(gdsfmt)

# Convert the PLINK BED file to the GDS file
#
# PLINK BED files
bed.fn <- "80.bed"
fam.fn <- "80.fam"
bim.fn <- "80.bim"
# convert
snpgdsBED2GDS(bed.fn, fam.fn, bim.fn, "test.gds")

# Principal Component Analysis
#
# open
genofile <- snpgdsOpen("test.gds")
RV <- snpgdsPCA(genofile)
plot(RV$eigenvect[,2], RV$eigenvect[,1], xlab="PC 2", ylab="PC 1",
     col=rgb(0,0,150, 50, maxColorValue=255), pch=19)

# close the file
snpgdsClose(genofile)