#READ AND TRANSFORM THE DATA
data <- read.csv('./household_power_consumption.txt', sep = ';', na.strings = '?')
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')
data$Time <- strptime(data$Time, format = '%H:%M:%S')
data <- data[data$Date >= '2007-02-01' & data$Date <= '2007-02-02',]

#PLOT1
png('plot1.png')
hist(data$Global_active_power, col = 'red', main = 'Global Active Power', ylab = 'Frequency', xlab = 'Global Active Power (Kilowatts)')
dev.off()