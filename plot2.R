#READ AND TRANSFORM THE DATA
data <- read.csv('./household_power_consumption.txt', sep = ';', na.strings = '?')
data$Date <- paste(data$Date, data$Time, sep = '/')
library(dplyr)
data <- select(data, -Time)
data$Date <- strptime(data$Date, format = '%d/%m/%Y/%H:%M:%S')
data <- data[data$Date >= '2007-02-01' & data$Date < '2007-02-03',]

#PLOT2
png('plot2.png')
plot(data$Date, data$Global_active_power, type = 'l', xlab = '', ylab='Global Active Power (kilowatts)')
dev.off()

