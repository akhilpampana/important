prediction <- function(input, output)
{
  for(filelength in 1: length(input)){
   
    file = read.table(input[[filelength]], sep="\t", skip = 1, header = TRUE, quote="", colClasses = c(rep("character", 9)))
    
    file.create(output[[filelength]])
    
    initiate <- 0
    
    operon <- 1
    
    j <- 1
    
    for (i in 1:(dim(file)[1] - 1))
    {
      char1 <- as.character(file[i,][1])
      char2 <- as.character(file[i+1,][1])
      
      #code1 <- strsplit(char1, "..", fixed = TRUE)
      #code2 <- strsplit(char2, "..", fixed = TRUE)
      
      numb1 <- as.numeric(file[i,][5])
      numb2 <- as.numeric(file[i+1,][4])
      
      sen1 <- as.character(file[i,][7])
      sen2 <- as.character(file[i+1,][7])
      
      difference <- numb2 - numb1
      
      
      if((difference < 50) & (sen1 == sen2) & (char1 == char2))
      {
        
        if(j == i-1)
        {
          write(t(file[i+1,]), file = output[[filelength]], ncolumns = 9, append = TRUE)
        }
        
        else
        {	
          if(initiate == 1)
          {
            write("\n", file = output[[filelength]], append = TRUE)				
          }
          
          write(paste("Operon", operon), file = output[[filelength]], ncolumns = 1, append = TRUE)
          write(t(file[i,]), file = output[[filelength]], ncolumns = 9, append = TRUE)
          write(t(file[i+1,]), file = output[[filelength]], ncolumns = 9, append = TRUE)	
          initiate <- 1
          
          operon <- operon + 1
        }
        j <- i;		
      }
    }
  }
}

result <- prediction(input = "2088090036.gff", output = "2088090036.txt")
