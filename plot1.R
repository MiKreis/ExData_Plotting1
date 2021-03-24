data <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, sep = ";")
mycols <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
names(data) <- mycols


png(file = "plot1.png")
hist(data$Global_active_power, col = "brown1", xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()


