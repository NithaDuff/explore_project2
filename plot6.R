png("plot6.png",width = 480,height = 480)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
motoCat <- grep("*Vehicles$",SCC$EI.Sector,value = T)
motoSources <- SCC[SCC$EI.Sector %in% unique(motoCat),1]
shortData <- NEI[NEI$fips %in% c("24510","06037"),]
shortData$fips <- factor(shortData$fips, labels = c("Baltimore","Los Angeles"))
motoData <- shortData[shortData$SCC %in% motoSources,]
totalEmissions = motoData %>% group_by(year,fips) %>% summarise(pm2.5 = sum(Emissions))
g <- ggplot(totalEmissions, aes(year, pm2.5,color = fips)) + geom_point() + geom_line() + labs(title = "PM2.5 - Motor Vehicles [Baltimore vs Los Angeles]", x = "Year",y = "PM2.5")
print(g)
dev.off()