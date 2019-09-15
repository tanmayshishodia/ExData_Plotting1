library(data.table)

#Load the file
dt <- fread("household_power_consumption.txt", na.strings = "?")

#Paste date and time and change char to date format
dt1 <- dt[, DateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

#Extract the required dates
dt1 <- dt[dt$DateTime >= "2007-02-01" & dt$DateTime <= "2007-02-03"]

#Create a png file to store the plot
png("plot4.png", width = 480, height = 480, units = "px")

#Plot the graphs
par(mfcol=c(2,2))

#Plot1
plot(x = dt1$DateTime, y= dt1$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

#Plot2
plot(x = dt1$DateTime, y = dt1$Sub_metering_1, xlab = "", ylab = "Energy Sub metering", type = "l")
lines(x = dt1$DateTime, y = dt1$Sub_metering_2, col = "red")
lines(x = dt1$DateTime, y = dt1$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

#Plot3
plot(x = dt1$DateTime, y = dt1$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

#Plot4
plot(x = dt1$DateTime, y = dt1$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")

#Switch off the graphic device
dev.off()