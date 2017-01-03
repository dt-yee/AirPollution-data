complete <- function(directory, id = 1:332){
  idc = c();
  nobsc = c();
  for(i in id){
    filename <- as.character(i);
    if(i < 10){
      filename <- paste("00",filename, ".csv", sep = "");
    }
    else if(i < 100){
      filename <- paste("0", filename, ".csv", sep = "");
    }
    curpath <- paste(directory, "/", filename, sep = "");
    curfile <- read.csv(curpath);
    
    z1 <- is.na(curfile$sulfate);
    z2 <- is.na(curfile$nitrate);
    z3 <- z1 | z2;
    
    n = length(curfile$sulfate[!z3]);
    
    idc = c(idc, i);
    nobsc = c(nobsc, n);
    
  }
  mydataframe = data.frame(
    id = idc,
    nobs = nobsc
  );
  mydataframe;
}