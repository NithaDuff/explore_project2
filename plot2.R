png("plot2.png",width = 480,height = 480)
NEI <- readRDS("summarySCC_PM25.rds")
totalEmissions = NEI[NEI$fips == "24510",] %>% group_by(year) %>% summarise(pm2.5 = sum(Emissions))
with(totalEmissions,plot(year,pm2.5,type = "o",pch = 20,ylab = "PM2.5",xlab = "Year",main = "PM2.5 Emissions in Baltimore City"))
dev.off()