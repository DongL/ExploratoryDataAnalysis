household_power_consumption1 <- read.table("household_power_consumption.txt", 
                                           comment.char = "#",
                                           header = TRUE,
                                           sep=";",
                                           na.strings = "?")

hpc1 <- household_power_consumption1
DT <- with(hpc1, paste(Date, Time, sep=","))
DT <- strptime(DT, "%d/%m/%Y,%H:%M:%S")
hpc1$DT <- DT

png(filename ="plot4.png", width = 480, height = 480, bg = "transparent")
par(mfrow = c(2,2))
plot(d1$DT, d1$Global_active_power, type = "n", 
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
lines(d1$DT, d1$Global_active_power)

plot(d1$DT, d1$Voltage, type = "n", 
     xlab = "datetime",
     ylab = "Voltage")
lines(d1$DT, d1$Voltage)

plot(d1$DT, d1$Sub_metering_1, type = "n", 
     xlab = "",
     ylab = "Energy sub meeting")
lines(d1$DT, d1$Sub_metering_1)
lines(d1$DT, d1$Sub_metering_2, col = "red")
lines(d1$DT, d1$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black","red", "blue"),
       lty = c(1,1),
       bty="n")

plot(d1$DT, d1$Global_reactive_power, type = "n", 
     xlab = "datetime")
lines(d1$DT, d1$Global_reactive_power)
dev.off()