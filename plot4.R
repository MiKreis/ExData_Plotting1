data <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, sep = ";")
mycols <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
names(data) <- mycols
library(lubridate)
data$datetime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

png(file = "plot4.png")
par(mfrow = c(2,2))
plot(data$datetime, data$Global_active_power, pch=".",ylab ="Global Active Power (kilowatts)", xlab ="")
lines(data$datetime, data$Global_active_power)

plot(data$datetime, data$Voltage, pch=".",ylab ="Voltage", xlab ="datetime")
lines(data$datetime, data$Voltage)

plot(data$datetime, data$Sub_metering_1, pch=".",ylab ="Energy sub metering", xlab ="")
lines(data$datetime, data$Sub_metering_1)
points(data$datetime, data$Sub_metering_2, pch=".", col ="brown1")
lines(data$datetime, data$Sub_metering_2, col = "brown1")
points(data$datetime, data$Sub_metering_3, pch=".", col ="blue")
lines(data$datetime, data$Sub_metering_3, col = "blue")
legend("topright", lty = c(1,1,1), col = c("black", "brown1", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


plot(data$datetime, data$Global_reactive_power, pch=".",ylab ="Global_reactive_power", xlab ="datetime")
lines(data$datetime, data$Global_reactive_power, lwd = 0.5)

dev.off()