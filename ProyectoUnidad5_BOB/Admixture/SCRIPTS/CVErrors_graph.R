# This R script plots the CV Error values of the admixture runs to determine optimal K value
# If called from admixture.script, no need to worry about working directory
# if called outside of admixture.script, set working directory to Admixture/DATA

# load library
library(ggplot2)

# load Admixture.CVerrors.txt
data<-read.delim("Admixture.CVerrors.txt", header = F)

# add K values
data<-cbind(data, 1:9)

# create pdf file to save graph to
png("CVerrors.png")

# plot
ggplot(data=data, aes(x=1:9, y=V1)) + geom_point() + ylim(.325,.425) + ylab("CV Error") + xlab("Populations (K)") + scale_x_continuous(breaks=seq(2,9,1)) + ggtitle("CV Errors of K Populations")+theme(plot.title = element_text(hjust = 0.5))

# save graph to CVerrors.png
dev.off()
