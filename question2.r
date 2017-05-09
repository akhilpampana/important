input <- read.csv(
  file.choose(),
  header = FALSE
)
print("input data is:")
data1
row1 <- as.numeric(input[1,])
print("row one:")
row1
row2 <- as.numeric(input[2,])
print("row two:")
row2
row3 <- as.numeric(input[3,])
print("row three:")
row3
test1 <- t.test(row1,row2)
print("t.test result for row1 and row2:")
test1
test2 <- t.test(row2,row3)
print("t.test result for row2 and row3:")
test2
test3 <- t.test(row3,row1)
print("t.test result for row3 and row1:")
test3
wil1 <- wilcox.test(row1,row2,exact = F)
print("wilcox test result for row1 and row2:")
wil1
wil2 <- wilcox.test(row2,row3,exact = F)
print("wilcox test result for row2 and row3:")
wil2
wil3 <- wilcox.test(row3,row1,exact = F)
print("wilcox test result for row3 and row1:")
wil3
boxplot(row1,row2,row3)
