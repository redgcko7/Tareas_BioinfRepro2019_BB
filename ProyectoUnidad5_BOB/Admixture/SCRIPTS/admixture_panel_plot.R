# this R script plots the output from admixture into 9 different barplots
# 
# load a png file to save the plots to
png("FIGURES/structure_plots_panel.png", width = 6.5, height = 9, units = 'in', res = 300)

# create a panel, 5 rows by 2 columns
par(mfrow=c(5,2))

# loop for plotting the admixture barplots
for (i in 1:9){
  tab<-read.table(paste0("DATA/80missingdata.singleSNP.",i,".Q"))
  barplot(t(as.matrix(tab)), col=rainbow(i), xlab="Individual #", ylab = "Ancestry", border=NA, main=paste0("K = ",i))
}

# save the png file
dev.off()
 