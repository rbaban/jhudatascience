source('plot_read_data.R')

drawPlot1 <- function(){
  #load data
  ds <- plot_read_data()
  
  png("plot1.png", width=480, height=480)
  hist(ds$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
  
  dev.off()
}