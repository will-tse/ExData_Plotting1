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

png(filename = 'plot3.png',
    width = 480, height = 480,
    units = 'px', bg = 'transparent');

with(project_data, {
        plot(Sub_metering_1~DateTime, type = 'l', 
             col = 'black', xlab = '', ylab = 'Energy sub metering')
        lines(Sub_metering_2~DateTime, col = 'red')
        lines(Sub_metering_3~DateTime, col = 'blue')
});

legend('topright', col = c('black', 'red', 'blue'),  
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty = 1, lwd = 1);

dev.off();