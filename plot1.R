library(data.table)

#Load the file
dt <- fread("household_power_consumption.txt", na.strings = "?")

#Change char to date format
dt$Date <- as.Date(dt$Date, "%d/%m/%Y")

#Extract the required dates
dt1 <- dt[dt$Date >= "2007-02-01" & dt$Date <= "2007-02-02"]

#Create a png file to store the plot
png("plot1.png", width = 480, height = 480, units = "px")

#Create the plot
hist(x = dt1$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency",  col = "red", main = "Global Active Power")

#Switch off the graphic device
dev.off()
