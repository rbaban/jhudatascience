##
##Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
##Which city has seen greater changes over time in motor vehicle emissions?
##

library(ggplot2)
question6 <- function(NEI){
  
  ##assuming that motor vehicles are obtain from ON-ROAD sensors
  baltimoreAndLosAngelesDS <- NEI[(NEI$fips=="24510" | NEI$fips=="06037") & NEI$type=="ON-ROAD",]
  ds <- aggregate(Emissions ~ year + fips, baltimoreAndLosAngelesDS, sum)
  
  # facets labels
  figs_labels <- list('06037'="Los Angeles",'24510'="Baltimore")
  p_labeler <- function(variable, value){
    if (variable == "fips"){
      return(figs_labels[value])
    }else {
      return(as.character(value))
    }
  }
  
  png("plot6.png", width=640, height=480)
  p <- ggplot(ds, aes(factor(year), Emissions, fill=year))
  p <- p + facet_grid(. ~ fips,labeller = p_labeler)
  p <- p + geom_bar(stat="identity") 
  p <- p + ggtitle("Motor vehicle PM2.5 emission comparison")
  p <- p + xlab("Year") + ylab("PM2.5 emission (Tons)")
  print(p)
  dev.off()
}