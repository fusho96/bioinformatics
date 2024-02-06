# SET 
setwd("./alpha_div")
.libPaths("./R/win-library/4.0")

# LOAD
library(reshape2)
library(ggplot2)
library(ggsci)

# IMPORT
taxa <- read.csv("taxa.csv")

data_plot<- melt(taxa)
x = unique(data_plot$variable)
y = unique(data_plot$index)
data_plot$variable = factor(data_plot$variable,levels = x)
data_plot$index = factor(data_plot$index,levels = y)

# PLOT
p<- ggplot(data_plot,aes(x=variable,weight=value,fill=index))+
    geom_bar(position='stack')+
    theme_bw()+
    scale_fill_d3("category20")+
    labs(x=paste("Sample", sep=""),
        y=paste("Percentage", sep=""))+
    theme(panel.grid = element_blank(),
        panel.border = element_blank(),
        axis.line = element_line(size=0.2,color="black"),
        axis.text=element_text(size=5),
        axis.title.x = element_text(size = 5),
        axis.title.y = element_text(size = 5),
        legend.title = element_text(size=5),
        legend.text = element_text(size=5))

# SAVE
ggsave("barplot_taxa.pdf",p,width=120, height=90, units="mm")