data <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, sep = ";")
mycols <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
names(data) <- mycols
library(lubridate)
data$datetime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
png(file = "plot2.png")
plot(data$datetime, data$Global_active_power, pch=".",ylab ="Global Active Power (kilowatts)", xlab ="")
lines(data$datetime, data$Global_active_power)
dev.off()


