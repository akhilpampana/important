#file input and columns used for analysis
matrix1 <- read.table(file.choose(),header = TRUE,sep = "\t")[,2:13]
View(matrix1)
matrix2 <- read.table(file.choose(),header = TRUE,sep = "\t")[,2:13]
View(matrix2)
#calculation of pearson correlation and construction of pearson correlation matrix for matrix1 
permat1 <- cor(matrix1,matrix1,method = c("pearson"))
#calculation of pearson correlation and construction of pearson correlation matrix for matrix2
permat2 <- cor(matrix2,matrix2,method = c("pearson"))
#calculation of pearson correlation and construction of pearson correlation matrix for matrix1 and matrix2
permat3 <- cor(matrix1,matrix2,method = c("pearson"))
#heatmap using normal heatmap command in r(basic plots)
heatmap(permat1)
heatmap(permat2)
heatmap(permat3)
#installing these packages for different types of heatmaps
install.packages("pheatmap")
pheatmap::pheatmap(permat1)
pheatmap::pheatmap(permat2)
pheatmap::pheatmap(permat3)
#installing these packages for different types of heatmaps
install.packages("heatmap.plus")
heatmap.plus::heatmap.plus(permat1)
heatmap.plus::heatmap.plus(permat2)
heatmap.plus::heatmap.plus(permat3)
