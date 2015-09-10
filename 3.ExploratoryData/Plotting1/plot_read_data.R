plot_read_data <- function(){
  ds <- read.csv(file = "household_power_consumption.txt", 
                 header=TRUE,
                 sep=";", 
                 colClasses=c(rep("character",2), rep("numeric",7)),
                 na.strings = "?")
  
  ds$Time <- strptime(paste(ds$Date, ds$Time), format = "%d/%m/%Y %H:%M:%S")
  ds$Date <- as.Date(ds$Date, format="%d/%m/%Y")
  
  dateFilter <-  (ds$Date=="2007-02-01" | ds$Date=="2007-02-02")
  ds <- ds[dateFilter,]
  
  return(ds)
}
