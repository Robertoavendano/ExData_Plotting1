csv_file <- "household_power_consumption.txt" 
df <- read.csv(csv_file, header = TRUE, sep = ";", colClasses = "character")

date_as_Date <- as.Date(df$Date, format = "%d/%m/%Y")
df <- df[date_as_Date == "2007-02-01" | date_as_Date == "2007-02-02",]
 
active_power <- as.numeric(df$Global_active_power)

subMetering1 <- as.numeric(df$Sub_metering_1)
subMetering2 <- as.numeric(df$Sub_metering_2) 
subMetering3 <- as.numeric(df$Sub_metering_3) 

voltage <- as.numeric(df$Voltage)

reactive_power <- as.numeric(df$Global_reactive_power)

vDateTimeString <- paste(df$Date, df$Time)
vDateTime <- as.POSIXct(vDateTimeString, format = "%d/%m/%Y %H:%M:%S")

png(file = "plot4.png")
par(mfcol = c(2, 2))

#Upper left plot
plot(vDateTime, active_power, xlab = "", ylab = "Global Active Power", type = "l")

#Lower left plot
plot(vDateTime, subMetering1, xlab = "", ylab = "Energy sub metering", type = "n")
lines(vDateTime, subMetering1, col = "black")
lines(vDateTime, subMetering2, col = "red")
lines(vDateTime, subMetering3, col = "blue")
legend("topright", bty = "n", col = c("black", "red", "blue"), lty = "solid",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Upper right plot
plot(vDateTime, voltage, xlab = "datetime", ylab = "Voltage", type = "l")

#Lower right plot
plot(vDateTime, reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")

dev.off()