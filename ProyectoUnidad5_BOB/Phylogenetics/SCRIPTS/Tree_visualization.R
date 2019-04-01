# R script for visualizing the output RAxML tree "RAxML_bipartitions.50missing_reduced"

# load libraries
library(phytools)
library(ape)

# read tere
tree<-read.tree("../DATA/RAxML_bipartitions.50missing_reduced")

# read meta data for labeling purposes
colors<-read.delim("../DATA/reduced_taxa.txt")

# set palette colors to clade colors
palette(levels(colors$clade))

# midpoint root the tree
mid.tree<-midpoint.root(tree)

# set dimensions for plot
par(mar=c(5, 4, 8, 2), xpd=TRUE)

# create pdf file to save tree to
pdf("../FIGURES/RAxML_reduced_tree.pdf", width = 8.5, height = 11)

# plot midpoint tree with tip labels, node support labels, scale bar, title, and legend
plot(mid.tree, edge.width = 4, align.tip.label = T)
tiplabels(pch=15, col=colors$clade, adj = .5, offset = -0.00001)
nodelabels(mid.tree$node.label, adj = -.2, frame = "n", cex = 1)
add.scale.bar()
title("Major Clades within Foothill Yellow-Legged Frogs")
legend(x = "bottom",title = "Regions",ncol = 5,legend = levels(colors$region), col = palette(),pch=15)

# save the pdf file
dev.off()
