# OPTIONAL
setwd("./alpha_div")
.libPaths("./R/win-library/4.0")

# LOAD
if (!require(agricolae)) install.packages("agricolae")
library(agricolae)
if (!require(dunn.test)) install.packages("dunn.test")
library(dunn.test)

# METADATA
metadata = read.table("metadata.txt", header=T, row.names= 1, sep="\t")
alpha = read.table("alpha.txt", header=T, row.names= 1, sep="\t")
index = cbind(alpha, metadata[match(rownames(alpha), rownames(metadata)), ])

# ANOVA TEST
observed_otus_stats <- aov(observed_otus ~ cycle, data = index)

# TUKEY HSD TEST AFTER ANOVA
tukey_HSD_observed_otus <- TukeyHSD(observed_otus_stats, ordered = FALSE, conf.level = 0.95)

# SCHEFFE TEST AFTER ANOVA
scheffe_result <- scheffe.test(observed_otus_stats, "cycle", console = TRUE)

# KRUSKAL TEST
kruskal_result <- kruskal.test(observed_otus ~ cycle, data = index)

# DUNN TEST WITH BONFERRONI CORRECTION
dunn_result <- dunn.test(index$observed_otus, index$cycle, method="bonferroni")
