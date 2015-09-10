rankall <- function(outcome, num = "best"){
  ## read data
  hospitalData <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## check if outcome and state are valid
  outcomeColumnIdx <- NULL;
  if ("heart attack" == outcome){
    outcomeColumnIdx <- 11
  }else if ("heart failure" == outcome){
    outcomeColumnIdx <- 17
  }else if ("pneumonia" == outcome){
    outcomeColumnIdx <- 23
  }else{
    stop("invalid outcome")
  }
  
  hospitalData[, outcomeColumnIdx] <- as.numeric(hospitalData[, outcomeColumnIdx])
  
  ## return hospital name in that state with lowest 30-days death rate
  hospitalNameIdx <- 2
  stateIdx <- 7
  sd <- hospitalData[c(hospitalNameIdx, stateIdx, outcomeColumnIdx)]
  sd <- na.omit(sd)
  ## order by state, deaths and hospital name
  sd <- sd[ order( sd[,2], sd[,3], sd[,1], decreasing = c(FALSE, FALSE, FALSE)), ]
  
  sd <- aggregate(sd, by=list(sd$State), function(x) {
      if ("best" == num) {
        num <- 1
      } else if ("worst" == num) {
        num <- length(x)
      } 
      x[num]
  })
  
  rez <- sd[, c(2,1)]
  names(rez) <- c("hospital","state")
  return(rez)
}