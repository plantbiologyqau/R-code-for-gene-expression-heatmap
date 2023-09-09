library(pheatmap)
tpm <- read.table ("tpm-12.csv", header = TRUE, row.names = 1)
genes <- read.table("DRO1.txt", sep = ",")
genes <- t(genes)
tpm <- tpm[genes,]
png("DRO1 heatmap", res = 300, width = 4, height = 7, units = "in")
pheatmap(tpm,  scale = 'none', cellheight = 14, cellwidth = 13, main = " Heatmap", angle_col = c("315"),  cluster_rows = F, cluster_cols = F, fontsize_row = 8, fontsize_col = 8)
dev.off()
