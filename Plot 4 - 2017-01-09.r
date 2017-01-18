#####################################################################################################
# Title:    Plot 4                                                                                  #
# Purpose:  Plot 4 for Questions 4 in Project 2 in Explanatory Data Analysis                        #
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

##### Clean up data #####

## Merge SCC data and NEI data
NEISCC <- merge(x = NEI, y = SCC, by.x = "SCC", by.y = "SCC")
keepCoal <- grepl("coal",NEISCC$Short.Name)

coalSet <- NEISCC[keepCoal,]

coal1 <- aggregate(Emissions ~ year,
                   data = coalSet,
                   FUN = c("sum"),
                   na.rm = TRUE,
                   keep.names = TRUE)

##### Plot #####

png(filename = paste(personal,"/Coursera/Exploratory Data Analysis/Week 4/Plots","/plot 4.png",sep=""),
    width = 840,
    height = 480)

barplot(height = coal1$Emissions,
        names = coal1$year,
        ylab = expression(paste("Total Emission, ", PM[2.5], sep = " ")),
        main = expression(paste("Coal emissions from ", PM[2.5]," from 1999 to 2008")))

dev.off()