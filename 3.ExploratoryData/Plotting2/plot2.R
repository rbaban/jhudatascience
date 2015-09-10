##
##Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
##Use the base plotting system to make a plot answering this question.
##
question2 <- function(NEI){
  baltimoreDS <- NEI[NEI$fips=="24510",]
  ds <- aggregate(Emissions ~ year, baltimoreDS, sum)
  
  png("plot2.png")
  barplot(ds$Emissions, names.arg = ds$year)
  title(main="Total PM2.5 emission in the Baltimore City(Maryland) per year", xlab="Year", ylab="Total PM2.5 emission (Tons)")
  dev.off()
}