## SCRIPT TO MAKE A PDF OF 4 PCAs THAT COMPARE DIFFERENT PC VALUES

# set working directory to "PCA" directory

## download SNPRelate if needed (remove #'s)
# if (!requireNamespace("BiocManager", quietly = TRUE))
#  install.packages("BiocManager")
# BiocManager::install("gdsfmt")
# BiocManager::install("SNPRelate", version = "3.8")

library(SNPRelate)
library(gdsfmt)

## convert vcf to GDS file
vcf.fn <- "DATA/80missingdata.singleSNP.vcf"
snpgdsVCF2GDS(vcf.fn, "DATA/80.gds", method="biallelic.only")
# summary 
snpgdsSummary("DATA/80.gds")

# Principal Component Analysis
#
# open
genofile <- snpgdsOpen("DATA/80.gds")
RV <- snpgdsPCA(genofile)

pc.percent<-RV$varprop*100

##  plot PCAs in 2x2 panel
# create pdf file in FIGURES folder
pdf("FIGURES/PCA_panel.pdf")

# specify 2x2 panel for a total of 4 PCAs
par(mfrow=c(2,2))

# plot PC 1 vs. PC 2 with PC percents in labels
plot(RV$eigenvect[,1], RV$eigenvect[,2], xlab=(paste0("PC 1: ", round(pc.percent,2)[1],"%")),
     ylab=(paste0("PC 2: ", round(pc.percent,2)[2],"%")), pch=19)

# plot PC 3 vs. PC 4 with PC percents in labels
plot(RV$eigenvect[,3], RV$eigenvect[,4], xlab=(paste0("PC 3: ", round(pc.percent,2)[3],"%")),
     ylab=(paste0("PC 4: ", round(pc.percent,2)[4],"%")),
    pch=19)

# plot PC 5 vs. PC 6 with PC percents in labels
plot(RV$eigenvect[,5], RV$eigenvect[,6], xlab=(paste0("PC 5: ", round(pc.percent,2)[5],"%")),
     ylab=(paste0("PC 6: ", round(pc.percent,2)[6],"%")),
     pch=19)

# plot PC 7 vs. PC 8 with PC percents in labels
plot(RV$eigenvect[,7], RV$eigenvect[,8], xlab=(paste0("PC 7: ", round(pc.percent,2)[7],"%")),
     ylab=(paste0("PC 8: ", round(pc.percent,2)[8],"%")), pch=19)

# save graphs to pdf 'PCA_panel.pdf'
dev.off()

# close the file
snpgdsClose(genofile)
