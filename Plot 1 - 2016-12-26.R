#####################################################################################################
# Title:    Plot 1                                                                                  #
# Purpose:  Plot 1 for project 2 in Exploratory Data Analysis                                       #
# Author:   Billy Caughey                                                                           #
# Date:     2016.12.26 - Initial Build                                                              #
#####################################################################################################

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

##### Question 1 #####
years <- aggregate(Emissions ~ year, 
                   data = NEI, 
                   FUN = c("sum"), 
                   na.rm = TRUE, 
                   keep.names = TRUE)

png(filename = paste(personal,"/Coursera/Exploratory Data Analysis/Week 4/Plots","/plot 1.png",sep=""),
    width = 840,
    height = 480)
barplot(height = years$Emissions, 
        names = years$year,
        ylab = expression(paste("Total Emission, ",PM[2.5],sep = " ")),
        main = expression(paste("Emissions from ", PM[2.5]," in the United States from 1999 to 2008")))
dev.off()
