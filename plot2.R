NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore<-subset(NEI$fips=='24510')

png(filename='plot2.png')

barplot(tapply(X=baltimore$Emissions, INDEX=baltimore$year, FUN=sum), main='Total Emission in Baltimore, MD',xlab='Year', ylab=expression('PM'[2.5]))

dev.off()
