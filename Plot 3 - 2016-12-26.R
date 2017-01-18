#####################################################################################################
# Title:    Plot 3                                                                                  #
# Purpose:  Plot 3 for Questions 3 in Project 2 in Explanatory Data Analysis                        #
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
MD <- subset(NEI, fips == 24510)
MD$year <- factor(MD$year, levels=c('1999', '2002', '2005', '2008'))

##### Plot #####

png(filename = paste(personal,"/Coursera/Exploratory Data Analysis/Week 4/Plots","/plot 3.png",sep=""),
    width = 840,
    height = 480)

ggplot(data=MD, aes(x=year, y=log(Emissions))) + facet_grid(. ~ type) + guides(fill=F) +
    geom_boxplot(aes(fill=type)) + stat_boxplot(geom ='errorbar') +
    ylab(expression(paste('Log', ' of PM'[2.5], ' Emissions'))) + xlab('Year') + 
    ggtitle('Emissions per Type in Baltimore City, Maryland') +
    geom_jitter(alpha=0.10)

dev.off()

