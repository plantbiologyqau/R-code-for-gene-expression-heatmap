
library(psych)

Pheno = read.csv('Phenotypes_RNAseq_Root.csv', header = TRUE, row.names = 1)
RNA = read.csv('RNAseq_Leaf.csv', header = TRUE)
RNA_col = RNA[,1]
RNA = RNA[,2:ncol(RNA)]

P_table = data.frame(matrix(nrow = nrow(RNA), ncol = 66))
Corr_table = data.frame(matrix(nrow = nrow(RNA), ncol = 66))
P_table1 = matrix(nrow = 1, ncol = 66)
Corr_table1 = matrix(nrow = 1, ncol = 66)
colnames(P_table) = rownames(Pheno)
colnames(Corr_table) = rownames(Pheno)



for (i in 1:nrow(RNA)){
  for (j in 1:66) {
    tmp = corr.test(t(Pheno[j,]), t(RNA[i,]), use="pairwise.complete.obs",method = "pearson")
    Corr_table[i,j] = round(tmp$r,4)
    P_table[i,j] = round(tmp$p,4)
    print(c(i,j))
  }

}



write.csv(P_table, 'Pvalue_table.csv')
write.csv(Corr_table, 'Corr_table.csv')

