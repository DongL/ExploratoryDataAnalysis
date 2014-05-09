household_power_consumption1 <- read.table("household_power_consumption.txt", 
                                           comment.char = "#",
                                           header = TRUE,
                                           sep=";",
                                           na.strings = "?")

hpc1 <- household_power_consumption1
DT <- with(hpc1, paste(Date, Time, sep=","))
DT <- strptime(DT, "%d/%m/%Y,%H:%M:%S")
hpc1$DT <- DT

png(filename ="plot2.png", width = 480, height = 480, bg = "transparent")
plot(d1$DT, d1$Global_active_power, type = "n", 
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
lines(d1$DT, d1$Global_active_power)
dev.off()