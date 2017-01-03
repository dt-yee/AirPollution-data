pollutantmean <-function( directory = "specdata", pollutant = "sulfate", id=1:332){
  TotalData <- NULL;
  for(i in id){
    filename <- as.character(i);
    if(i < 10){
      filename <- paste("00",filename,".csv", sep = "");
    }
    else if(i < 100){
      filename <- paste("0", filename,".csv", sep = "");
    }
    
    curpath <-paste(directory,"/",filename,sep = "");
    curfile <- read.csv(curpath);
    
    data <- curfile[pollutant];
    z <- is.na(data);
    data<-data[!z];
    TotalData <- c(TotalData, data);
  }
  mean(TotalData);
}