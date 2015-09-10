##
##Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
##

library(ggplot2)

question4 <- function(NEI, SSC){
  
  #obtain coal combustion codes from SSC data source
  coalCombustion <- grepl("coal", SCC$Short.Name, ignore.case=TRUE)
  combustionSCC <- SCC[coalCombustion,]$SCC
  #filter NEI data source by coal combusitons code
  combustionDS <- NEI[NEI$SCC %in% combustionSCC,]
  
  ds <- aggregate(Emissions ~ year, combustionDS, sum)
  
  #build plot
  png("plot4.png")
  p <- ggplot(ds, aes(factor(year), Emissions/10^3))
  p <- p + geom_bar(stat="identity", fill="darkgreen", width=0.5) +
    ggtitle("Coal combustion emission in the United States")+
    xlab("Year") +
    ylab("Total PM2.5 emission (10^3 Tons)")
  print(p)
  dev.off()
}