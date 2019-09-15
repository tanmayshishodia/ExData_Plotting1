library(data.table)

#Load the file
dt <- fread("household_power_consumption.txt", na.strings = "?")

#Paste date and time and change char to date format
dt1 <- dt[, DateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

#Extract the required dates
dt1 <- dt[dt$DateTime >= "2007-02-01" & dt$DateTime <= "2007-02-03"]

#Create a png file to store the plot
png("plot3.png", width = 480, height = 480, units = "px")

#Plot the graph
plot(x = dt1$DateTime, y = dt1$Sub_metering_1, xlab = "", ylab = "Energy Sub metering", type = "l")
lines(x = dt1$DateTime, y = dt1$Sub_metering_2, col = "red")
lines(x = dt1$DateTime, y = dt1$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

#Switch off the graphic device
dev.off()
