
source('plot_read_data.R')

drawPlot2 <- function(){
  #load data
  ds <- plot_read_data()

  png("plot2.png", width=480, height=480)
  plot(ds$Time, ds$Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)")
  dev.off()
}