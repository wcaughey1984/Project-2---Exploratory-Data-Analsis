#################################################################################
# Title:    Plot 6                                                              #
# Purpose:  Plot 6 for Questions 5 in Project 2 in Explanatory Data Analysis    #
# Author:   Billy Caughey                                                       #
# Date:     2016.12.26 - Initial Build                                          #
#################################################################################

##### Libraries #####
library(doBy)
library(ggplot2)

##### Set working directory #####
setwd(paste(personal,"/Coursera/Exploratory Data Analysis/Week 4/Data",sep=""))

##### Bring in Data #####
if(!exists("NEI")){
    NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SEI")){
    SCC <- readRDS("Source_Classification_Code.rds")
}

##### Clean data up #####

if(!exists("NEISCC")){
    NEISCC <- merge(x = NEI, y = SCC, by.x = "SCC", by.y = "SCC")
}


baltimore <- aggregate(Emissions ~ year, 
                       data = NEISCC[NEISCC$fips == "24510" & NEISCC$type == "ON-ROAD",], 
                       FUN = c("sum"), na.rm = TRUE, 
                       keep.names = TRUE)

baltimore$location = "Baltimore"

losangeles <- aggregate(Emissions ~ year,
                        data = NEISCC[NEISCC$fips == "06037" & NEISCC$type == "ON-ROAD",],
                        FUN = c("sum"), na.rm = TRUE,
                        keep.names = TRUE)

losangeles$location = "Los Angeles"

combined <- rbind(baltimore,losangeles)

png(filename = paste(personal,"/Coursera/Exploratory Data Analysis/Week 4/Plots","/plot 6.png",sep=""),
    width = 840,
    height = 480)

ggplot(combined, aes(factor(year), Emissions)) +
    facet_grid(. ~ location) +
    geom_bar(stat = "identity") +
    xlab("Year") + 
    ylab(expression(paste("Total", PM[2.5]," Emissions"))) +
    ggtitle("Total Emissions in Baltimore, MD and Los Angeles, CA")


dev.off()