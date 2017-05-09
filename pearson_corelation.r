#file input and columns used for analysis
matrix1 <- read.table(file.choose(),header = TRUE,sep = "\t")[,2:13]
View(matrix1)
matrix2 <- read.table(file.choose(),header = TRUE,sep = "\t")[,2:13]
View(matrix2)
#calculation of pearson correlation and construction of pearson correlation matrix for matrix1 
permat1 <- cor(matrix1,matrix1,method = c("pearson"))
View(permat1)
write.table(permat1,"permat1.txt", sep="\t", row.name=T, col.names=NA)
#calculation of pearson correlation and construction of pearson correlation matrix for matrix2
permat2 <- cor(matrix2,matrix2,method = c("pearson"))
View(permat2)
write.table(permat2,"permat2.txt", sep="\t", row.name=T, col.names=NA)
#calculation of pearson correlation and construction of pearson correlation matrix for matrix1 and matrix2
permat3 <- cor(matrix1,matrix2,method = c("pearson"))
View(permat3)
write.table(permat3,"permat3.txt", sep="\t", row.name=T, col.names=NA)

