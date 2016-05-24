NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

twocities<-NEI[((NEI$fips=='24510'|NEI$fips=='06037') & NEI$type =='ON-ROAD'),]


twocities_motor<-aggregate(Emissions ~ year+fips,twocities,sum)
twocities_motor$fips[twocities_motor$fips=="24510"] <- "Baltimore, MD"
twocities_motor$fips[twocities_motor$fips=="06037"] <- "Los Angeles, CA"


aggregatedTotalByYearAndFips <- aggregate(Emissions ~ year + fips, twocities_motor, sum)
aggregatedTotalByYearAndFips$fips[aggregatedTotalByYearAndFips$fips=="24510"] <- "Baltimore, MD"
aggregatedTotalByYearAndFips$fips[aggregatedTotalByYearAndFips$fips=="06037"] <- "Los Angeles, CA"

png('plot6.png')
ggplot(twocities_motor, aes(factor(year), Emissions)) + facet_grid(. ~ fips) + geom_bar(stat="identity")  + xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle('Total Emissions from motor vehicle in Baltimore, MD vs Los Angeles, CA during  1999-2008')
dev.off()
