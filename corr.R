corr <- function(directory = "specdata", threshold = 0){
  filelist = Sys.glob(paste(directory,"*.csv", sep='/'));
  id = 1;
  res = c();
  for(f in filelist){
    #n = complete(directory, i);
    #i = i + 1;
    curfile = read.csv(f);
    z1 <- is.na(curfile$sulfate);
    z2 <- is.na(curfile$nitrate);
    z3 <- z1 | z2;
    n = length(curfile$sulfate[!z3]);
    if(n >= threshold){
      corre = cor(curfile$sulfate[!z3], curfile$nitrate[!z3]);
      res = c(res, corre);
    }
  }
  res;
}