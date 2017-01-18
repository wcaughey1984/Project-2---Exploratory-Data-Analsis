#####################################################################################################
# Title:    Plot 2                                                                                  #
# Purpose:  Plot 2 for Questions 2 in Project 2 in Explanatory Data Analysis                        #
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

##### Question 2 #####
baltimore <- aggregate(Emissions ~ year, 
                       data = NEI[NEI$fips == "24510",], 
                       FUN = c("sum"), na.rm = TRUE, 
                       keep.names = TRUE)

png(filename = paste(personal,"/Coursera/Exploratory Data Analysis/Week 4/Plots","/plot 2.png",sep=""),
    width = 840,
    height = 480)
	
barplot(height = baltimore$Emissions,
        names = baltimore$year,
        ylab = expression(paste("Total Emission, ", PM[2.5], sep = " ")),
        main = expression(paste("Emissions from ", PM[2.5]," in Baltimore, MD from 1999 to 2008")))

dev.off()