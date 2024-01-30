
# LOAD DATA
metadata <- read.csv("metadata.csv", row.names=1)
pcoa_score <- read.csv("pcoa_score.csv", row.names=1)
points = cbind(pcoa_score,metadata)

# PERCENTAGE
pcoa1 = 46.4
pcoa2 = 31.1

# PLOT
p<- ggplot(points, aes(Axis.1, Axis.2, color=Location))+ 
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