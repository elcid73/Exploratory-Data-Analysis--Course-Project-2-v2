NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

baltimore<-subset(NEI$fips=='24510'& type == 'ON-ROAD')


baltimore_motor<-aggregate(Emissions ~ year,baltimore,sum)


png('plot5.png')
ggplot(baltimore_motor, aes(factor(year), Emissions)) + geom_bar(stat="identity") + xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle in Baltimore, Maryland from 1999 to 2008')

dev.off()
