##
##How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City? 
##

question5 <- function(NEI){
  
  ##assuming that motor vehicles are obtain from ON-ROAD sensors
  baltimoreDS <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",]
  ds <- aggregate(Emissions ~ year, baltimoreDS, sum)
  
  png("plot5.png", width=640, height=480)
  barplot(ds$Emissions, names.arg = ds$year, ylim = c(0,400))
  title(main="Motor vehicle PM2.5 emission in the Baltimore City(Maryland)", xlab="Year", ylab="PM2.5 emission (Tons)")
  dev.off()
}