png("plot3.png",width = 480,height = 480)
NEI <- readRDS("summarySCC_PM25.rds")
totalEmissions = NEI[NEI$fips == "24510",] %>% group_by(year,type) %>% summarise(pm2.5 = sum(Emissions))
g <- ggplot(totalEmissions,aes(x = year,y = pm2.5, color = type)) + geom_line() + geom_point() + labs(x = "Year", y = "PM2.5", title = "Baltimore City Emissions by type of source.")
print(g)
dev.off()