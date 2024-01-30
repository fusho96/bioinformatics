# OPTIONAL
setwd("./alpha_div")

# LOAD
library("amplicon")
library("ggplot2")

# LOAD DATA
alpha = read.table("alpha.txt",header=T,row.names = 1,sep='\t')
metadata = read.table("metadata.txt",header=T,row.names = 1,sep='\t')

# PLOT
(p = alpha_boxplot(alpha, metadata,"shannon","cycle"))

# SAVE
ggsave(paste0("alpha_box_cycle.pdf"),p,width = 95,height=56,units = "mm")