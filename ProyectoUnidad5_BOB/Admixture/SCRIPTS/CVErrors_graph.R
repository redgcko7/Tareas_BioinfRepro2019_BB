# This R script plots the CV Error values of the admixture runs to determine optimal K value

# load library
library(ggplot2)

# load Admixture.CVerrors.txt
data<-read.delim("Admixture.CVerrors.txt", header = F)

# add K values
data<-cbind(data, 1:9)

# create pdf file to save graph to
pdf("CVerrors.pdf", height=3,width=3)

# plot
ggplot(data=data, aes(x=1:9, y=V1)) + geom_point() + ylim(.325,.425) + ylab("CV Error") + xlab("Populations (K)") + scale_x_continuous(breaks=seq(2,9,1)) + ggtitle("CV Errors of K Populations")+theme(plot.title = element_text(hjust = 0.5))

# save graph to CVerrors.pdf
dev.off()
