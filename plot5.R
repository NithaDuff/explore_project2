png("plot5.png",width = 480,height = 480)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
motoCat <- grep("*Vehicles$",SCC$EI.Sector,value = T)
motoSources <- SCC[SCC$EI.Sector %in% unique(motoCat),1]
motoData <- NEI[NEI$SCC %in% motoSources & NEI$fips == "24510",]
totalEmissions = motoData %>% group_by(year) %>% summarise(pm2.5 = sum(Emissions))
g <- ggplot(totalEmissions, aes(x = year,y = pm2.5)) + geom_point() + geom_line() + labs(title = "PM2.5 - Motor Vehicles Across USA", x = "Year",y = "PM2.5")
print(g)
dev.off()