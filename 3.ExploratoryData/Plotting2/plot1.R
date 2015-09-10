##
##Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
##Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
##for each of the years 1999, 2002, 2005, and 2008
##
question1 <- function(NEI){
  ds <- tapply(NEI$Emissions, NEI$year, sum, rm.na=TRUE)  
  
  png("plot1.png")
  barplot(height=ds, yaxt="n")
  axis(2, axTicks(2), format(axTicks(2), scientific = F))
  title(main="Total PM2.5 emission in the United States per year", xlab="Year", ylab="Total PM2.5 emission (Tons)")
  dev.off()
}



