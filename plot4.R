
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

coal = SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]

combineddata<-merge(x=NEI, y=coal, by='SCC')
total_of_combineddata <- aggregate(combineddata[,'Emissions'], by=list(combineddata$year),sum)
colnames(total_of_combineddata)<-c('Year', 'Emissions')
png(filename='plot4.png')

ggplot(data=total_of_combineddata, aes(x=Year, y=Emissions/1000)) + geom_line(aes(group=1, col=Emissions)) + geom_point(aes(size=2, col=Emissions)) + 
  ggtitle(expression('Total Emissions of PM'[2.5])) + ylab(expression(paste('PM', ''[2.5], ' in kilotons'))) + geom_text(aes(label=round(Emissions/1000,digits=2), size=2, hjust=2, vjust=1.5)) + 
  theme(legend.position='none') + scale_colour_gradient(high='blue')

dev.off()
