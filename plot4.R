png("plot4.png",width = 480,height = 480)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
coalCat <- grep("*Coal$",SCC$EI.Sector,value = T)
coalSources <- SCC[SCC$EI.Sector %in% unique(coalCat),1]
coalData <- NEI[NEI$SCC %in% coalSources,]
totalEmissions = coalData %>% group_by(year) %>% summarise(pm2.5 = sum(Emissions))
g <- ggplot(totalEmissions, aes(x = year,y = pm2.5)) + geom_point() + geom_line() + labs(title = "PM2.5 - Coal Combustion Across USA", x = "Year",y = "PM2.5")
print(g)
dev.off()