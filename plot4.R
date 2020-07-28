#READ AND TRANSFORM THE DATA
data <- read.csv('./household_power_consumption.txt', sep = ';', na.strings = '?')
data$Date <- paste(data$Date, data$Time, sep = '/')
library(dplyr)
data <- select(data, -Time)
data$Date <- strptime(data$Date, format = '%d/%m/%Y/%H:%M:%S')
data <- data[data$Date >= '2007-02-01' & data$Date < '2007-02-03',]

#PLOT4
png('plot4.png')
par(mfrow = c(2,2))
plot(data$Date, data$Global_active_power, type = 'l', xlab = '', ylab='Global Active Power (kilowatts)')
plot(data$Date, data$Voltage, type = 'l', xlab = 'datetime', ylab = 'Voltage')
plot(data$Date, data$Sub_metering_1, type = 'n', xlab = '', ylab='Energy sub metering')
lines(data$Date, data$Sub_metering_1)
lines(data$Date, data$Sub_metering_2, col = 'red')
lines(data$Date, data$Sub_metering_3, col ='blue')
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col = c('black', 'red', 'blue'), lty = 1)
plot(data$Date, data$Global_reactive_power, type = 'l', xlab='datetime', ylab='Global_reactive_power')
dev.off()