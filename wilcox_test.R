
data1 <- read.table("wilcox1.txt", header = FALSE, colClasses = c(rep("character", 1)))
data2 <- read.table("wilcox2.txt", header = FALSE, colClasses = c(rep("character", 1)))
data1 <- t(data1)
data2 <- t(data2)
data1 <- as.numeric(data1[, 1])
data2 <- as.numeric(data2[, 1])
w=wilcox.test(data1, data2)
print (w)