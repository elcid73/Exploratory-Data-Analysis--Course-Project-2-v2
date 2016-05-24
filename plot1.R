NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


total_emissions <- aggregate(NEI[, 'Emissions'], by=list(NEI$year), FUN=sum)
total_emissions$PM <- round(total_emissions[,2]/1000,2)


png(filename='plot1.png')
barplot(total_emissions$PM, names.arg=total_emissions$Group.1, 
        main=expression('Total Emission of PM'[2.5]), xlab='Year', ylab=expression(paste('PM', ''[2.5], ' in Kilotons')))

dev.off()
