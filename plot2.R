library(data.table)

#Load the file
dt <- fread("household_power_consumption.txt", na.strings = "?")

#Paste date and time and change char to date format
dt1 <- dt[, DateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

#Extract the required dates
dt1 <- dt[dt$DateTime >= "2007-02-01" & dt$DateTime <= "2007-02-03"]

#Create a png file to store the plot
png("plot2.png", width = 480, height = 480, units = "px")

#Create the plot
plot(x = dt1$DateTime, y= dt1$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#Switch off the graphic device
dev.off()