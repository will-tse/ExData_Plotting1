rm(list=ls());

clc <- function() { 
        cat("\014");
}

# Clear R Studio Console
clc();

setwd('D:/Coursera/Johns Hopkins/Data Science/04 - Exploratory Data Analysis/Course Project/Course Project 1');

filename <- './Data/household_power_consumption.txt';

project_data <- read.table(filename, header = TRUE, sep = ';', na.strings = '?',
                   colClasses = c('character', 'character', rep('numeric', 7)));

project_data$Date <- as.Date(project_data$Date, format='%d/%m/%Y');

project_data <- project_data[project_data$Date == '2007-02-01' | project_data$Date == '2007-02-02',];

project_data$DateTime <- as.POSIXct(paste(project_data$Date, project_data$Time));

png(filename = 'plot1.png',
    width = 480, height = 480,
    units = 'px', bg = 'transparent');

hist(project_data$Global_active_power, main='Global Active Power', col='Red', 
     xlab='Global Active Power (kilowatts)', ylab='Frequency', ylim=c(0, 1200));

dev.off();