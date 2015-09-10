##
##Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
##which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
##Which have seen increases in emissions from 1999-2008? 
##Use the ggplot2 plotting system to make a plot answer this question
##

library(ggplot2)

question3 <- function(NEI){
  baltimoreDS <- NEI[NEI$fips=="24510",]
  ds <- aggregate(Emissions ~ year + type, baltimoreDS, sum)
  
  png("plot3.png", width=640,height=480)
  p <- qplot(year, Emissions, data=ds, fill=type, color=type, 
        geom="line",
    main="Total PM2.5 emission in the Baltimore City(Maryland) per Source Type", 
    xlab="Year", 
    ylab="Total PM2.5 emission (Tons)")
  print(p)
  dev.off()
}