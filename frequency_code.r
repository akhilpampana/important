source("frequencypssm.r")
#input the argR-counts-matrix.txt file when asked
countmatrix <- read.table(file.choose(), header = FALSE , sep = "\t")
count <- countmatrix[,3:20]
column <- countmatrix[,1]
frequency <- (count+1)/31 
weight <- log10(frequency/0.25)
#input ecoli file
input <- read.table(file.choose(), sep=" ", header = FALSE, colClasses = c(rep("character", 4)))
result <- array(0, c(4319,2))
for (i in 1:(dim(input)[1]))
{  
  if (i %% 50 == 0)
  {
    print (i)
  }	
  score <- 0
  result[i,1] <- input[1][i,]
  for (j in 1:433)
  {
    th <- substr(input[3][i,], j, 17+j)
    thresult <- frequencypssm(threshold = th, weight = finalweight )
    if (j == 1)
    {
      score = thresult
    }
    else
    {
      if(thresult>score)
      {
        score = thresult
      }
    }
  }
  
  
  result[i,2] <- score
}

reduction <- result[order(as.numeric(result[,2]),decreasing=TRUE),]
highfrequency <- head(reduction, n = 30)
write.table(reduction, file = "scores.txt",  sep = "\t")
write.table(highfrequency, file = "topmost.txt", sep = "\t")

