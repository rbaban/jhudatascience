rankhospital <- function(state, outcome, num){

  ## read data
  hospitalData <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## check if outcome and state are valid
  uniqueStates <- unique(hospitalData$State)
  if (!(state %in% uniqueStates)){
    stop("invalid state")
  }
  
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
  sd <- hospitalData[hospitalData$State==state, c(hospitalNameIdx, outcomeColumnIdx)]
  sd <- na.omit(sd)
  ## order by deaths (second column) and by hospital name (first column)
  sd <- sd[ order( sd[,2], sd[,1], decreasing = c(FALSE, FALSE)), ]
  
  hospitalNames = sd[,1]
  if ("first" == num) {
    num = 1
  }else if ("worst" == num){
    num = length(hospitalNames)
  }
  return (hospitalNames[num])
}