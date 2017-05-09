#input the argR-counts-matrix.txt file when asked
countmatrix <- read.table(file.choose(), header = FALSE , sep = "\t")
count <- countmatrix[,3:20]
column <- countmatrix[,1]
frequency <- (count+1)/31 
weight <- log10(frequency/0.25)
output <- cbind(column,weight) 
write.table(output,"weight.txt",sep = "\t")