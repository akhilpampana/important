prediction <- function(input, output)
{
    for(filelength in 1: length(input)){
    
    file = read.table(input[[filelength]], sep="\t", skip = 2, header = TRUE, quote="", colClasses = c(rep("character", 9)))
    
   
    file.create(output[[filelength]])
    
    initiate <- 0
    
    operon <- 1
    
    j <- 1
    for (i in 1:(dim(file)[1] - 1))
    {
      
      char1 <- as.character(file[i,][1])
      char2 <- as.character(file[i+1,][1])
      
   
      code1 <- strsplit(char1, "..", fixed = TRUE)
      code2 <- strsplit(char2, "..", fixed = TRUE)
      
      numb1 <- as.numeric(code1[[1]][2])
      numb2 <- as.numeric(code2[[1]][1])
     
      sen1 <- as.character(file[i,][2])
      sen2 <- as.character(file[i+1,][2])
      
      difference <- numb2 - numb1
      
      
      if((difference < 50) & (sen1 == sen2))
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
result <- prediction(input = list("B_subtilis_168.ptt","E_coli_K12_MG1655.ptt","Halobacterium_NRC1.ptt","Synechocystis_PCC6803_uid159873.ptt"), output <- list("B_subtilis_168.txt","E_coli_K12_MG1655.txt","Halobacterium_NRC1.txt","Synechocystis_PCC6803_uid159873.txt"))