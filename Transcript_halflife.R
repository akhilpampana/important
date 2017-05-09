timedata = read.delim(file.choose(), header = true, sep = "\t" )
timedata1 = read.table(file.choose(), sep="\t", skip = 2, header = FALSE, colClasses = c("character", rep("NULL",27)))


a <- timedata[,2:10]  
b <- timedata[,11:19] 
c <- timedata[,20:28]

a <- t(a) 
b <- t(b) 
c <- t(c) 


alog <- apply(a, 1, function(x) log(x) )
bclog <- apply(b, 1, function(x) log(x) )
clog <- apply(c, 1, function(x) log(x) )

count <- 0
count1 <- 0
reg1 <- 0

slope1 <- array(0, c(6184,1))
slope2 <- array(0, c(6184,1))
slope3 <- array(0, c(6184,1))

for (i in 2:6185)
{
  reg1 <- tryCatch(lm(alog[i,] ~ at[,1]), error = function(e){return(NULL)})
  if(is.null(record))
  {
    count <- count + 1
    next
  }
  else
  {
    slope <- tryCatch(summary(reg1)$coefficients[2,1], error = function(e){return(NULL)}) 
    if(is.null(slope))
    {
      count1 <- count1 + 1
      next	
    }
    else
    {
      slope1[i-1, 1] <- slope
      count1 <- count1 + 1
    }	
  }
}

print (count + count1)

count <- 0
count1 <- 0

for (i in 2:6185)
{
  reg1 <- tryCatch(lm(blog[i,] ~ bt[,1]), error = function(e){return(NULL)}) 
  if(is.null(record))
  {
    count <- count + 1
    next
  }
  else
  {
    slope <- tryCatch(summary(reg1)$coefficients[2,1], error = function(e){return(NULL)}) 
    if(is.null(slope))
    {
      count1 <- count1 + 1
      next	
    }
    else
    {
      slope2[i-1, 1] <- slope
      count1 <- count1 + 1
    }	
  }
}

print (count + count1)

count <- 0
count1 <- 0

for (i in 2:6185)
{
  reg1 <- tryCatch(lm(clog[i,] ~ ct[,1]), error = function(e){return(NULL)}) 
  if(is.null(record))
  {
    count <- count + 1
    next
  }
  else
  {
    slope <- tryCatch(summary(reg1)$coefficients[2,1], error = function(e){return(NULL)}) 
    if(is.null(slope))
    {
      count1 <- count1 + 1
      next	
    }
    else
    {
      slope3[i-1, 1] <- slope
      count1 <- count1 + 1
    }	
  }
}

print (count + count1)

average <- array(0, c(6184,2))
thalf1 <- array(0, c(6184,1))
thalf2 <- array(0, c(6184,1))
thalf3 <- array(0, c(6184,1))


for (i in 1:6184)
{
  number <- 0
  average[i,1] <- timedata1[i,1]
  if(abs(slope1[i,1]) > 0 )
  {
    number <- number + 1
    thalf1[i,1] <- 0.693/abs(slope1[i,1])
  }
  if(abs(slope2[i,1]) > 0 )
  {
    number <- number + 1
    thalf2[i,1] <- 0.693/abs(slope2[i,1])
  }
  if(abs(slope3[i,1]) > 0 )
  {
    number <- number + 1
    thalf3[i,1] <- 0.693/abs(slope3[i,1])
  }
  if(number>0)
  {
    average[i,2] <- (thalf1[i,1] + thalf2[i,1] + thalf3[i,1])/number		
  }
  
}

print (count + count1)

write(t(average), file = "average.txt", ncolumns = 2, sep = "\t")
write(t(thalf1), file = "thalf1.txt", ncolumns = 1)
write(t(thalf2), file = "thalf2.txt", ncolumns = 1)
write(t(thalf3), file = "thalf3.txt", ncolumns = 1)

increment <- average[order(as.numeric(average[,2]),decreasing=TRUE),]
decrement <- average[order(as.numeric(average[,2]),decreasing=FALSE),]

top <- head(increment, n = 620)
bottom <- head(decrement, n = 620)

write(t(top), file = "top.txt", ncolumns = 2, sep = "\t")
write(t(bottom), file = "bottom.txt", ncolumns = 2, sep = "\t")