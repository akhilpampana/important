
data1 <- read.csv(
  file.choose(),
  header = FALSE
)
print("input data is:")
data1
result <- data1*5 
print("final resut is:")
result
write.table(result,"result.txt", sep="\t", row.name=F, col.name=F) 
