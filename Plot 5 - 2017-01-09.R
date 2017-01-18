#################################################################################
# Title:    Plot 5                                                              #
# Purpose:  Plot 5 for Questions 5 in Project 2 in Explanatory Data Analysis    #
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

png(filename = paste(personal,"/Coursera/Exploratory Data Analysis/Week 4/Plots","/plot 5.png",sep=""),
    width = 840,
    height = 480)

barplot(height = baltimore$Emissions,
        names = baltimore$year,
        ylab = expression(paste("Total Emissions",sep = " ")),
        main = expression(paste("Total Motor Emissions in Baltimore, MD from 1999 to 2008")))

dev.off()