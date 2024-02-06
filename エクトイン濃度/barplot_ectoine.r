library(reshape2)
library(ggplot2)

# IMPORT
data <- read.csv("data.csv", row.names=1)

# STATISTIC
df_reshape <- melt(data, id.vars=c("Group"))
df_mean <- aggregate(df_reshape$value, list(Group=df_reshape$Group,
                        gene=df_reshape$variable), mean, na.rm=T)
df_sd <- aggregate(df_reshape$value, list(Group=df_reshape$Group,
                        gene=df_reshape$variable), sd, na.rm=T)

colnames(df_mean)[3] <- "mean"
colnames(df_sd)[3] <- "sd"
df_stat <- merge(df_mean, df_sd, by=c("Group", "gene"))

# PLOT
dodge <- position_dodge(width=.9)
p<-ggplot(data=df_stat) +
  geom_bar(aes(x=gene, y=mean, fill=Group), 
           stat="identity", position=dodge) +
  geom_errorbar(aes(x=gene, ymin=mean-sd, ymax=mean+sd, color=Group), 
                stat="identity", position=dodge, width=.3)+
                    theme(panel.grid = element_blank(),
        panel.border = element_blank(),
        axis.line = element_line(size=0.2,color="black"))