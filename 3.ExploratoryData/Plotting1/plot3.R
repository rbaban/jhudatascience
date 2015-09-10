
source('plot_read_data.R')

drawPlot3 <- function(){
  #load data
  ds <- plot_read_data()
  
  png("plot3.png", width=480, height=480)
  
  plot(data$Time, data$Sub_metering_1, type = "n", xlab="", ylab="Energy sub metering")
  lines(data$Time, data$Sub_metering_1, col="black")
  lines(data$Time, data$Sub_metering_2, col="red")
  lines(data$Time, data$Sub_metering_3, col="blue")
  
  legend("topright",
         col=c("black", "red", "blue"),
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lty=1)
  
  dev.off()
}