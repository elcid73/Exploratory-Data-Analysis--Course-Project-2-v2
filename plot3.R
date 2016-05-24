NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

baltimore<-subset(NEI,fips=='24510')
baltimore$year <- factor(baltimore$year, levels=c('1999','2000','2001','2002','2003','2004','2005','2006','2007','2008'))

png('plot3.png', width=1500, height=600, units='px')

ggplot(data=baltimore, aes(x=year, y=log(Emissions))) + facet_grid(. ~ type) + guides(fill=F) +
  geom_boxplot(aes(fill=type)) + stat_boxplot(geom ='errorbar') + ylab(expression(paste('Log', ' of PM'[2.5], ' Emissions'))) + xlab('Year') + 
  ggtitle('Emissions per Type in Baltimore City, Maryland') + geom_jitter(alpha=0.10)

dev.off()
