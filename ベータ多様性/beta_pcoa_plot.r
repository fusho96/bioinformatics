library("ggplot2")
library("ggrepel")

# LOAD DATA
metadata = read.table("metadata.txt",header=T,row.names = 1,sep='\t')
pcoa_score <- read.csv("pcoa_score.csv", row.names=1)
points = cbind(pcoa_score,metadata)

# PERCENTAGE (EQUAL TO VALUES IN "PROPROTION")
pcoa1 = 47.5
pcoa2 = 33.0

# PLOT
p<- ggplot(points, aes(axis1, axis2, color=series))+ 
    geom_point(alpha=.7, size=3)+
    theme_bw()+
    labs(x=paste("PCoA 1 (", format(pcoa1, digits=3), "%)", sep=""),
        y=paste("PCoA 2 (", format(pcoa2, digits=3), "%)", sep=""))+
    theme(panel.grid = element_blank(),
        panel.border = element_blank(),
        axis.line = element_line(size=0.75,color="black"),
        axis.text=element_text(size=8),
        axis.title.x = element_text(size = 9),
        axis.title.y = element_text(size = 9),
        legend.title = element_text(size=9),
        legend.text = element_text(size=9))+
    geom_text_repel(label = paste(rownames(points)), colour="black", size=3)

# SAVE
ggsave("PCoA_bray.pdf",p,width=120, height=90, units="mm")
