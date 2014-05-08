household_power_consumption1 <- read.table("household_power_consumption.txt", 
                                           comment.char = "#",
                                           header = TRUE,
                                           sep=";",
                                           na.strings = "?")

hpc1 <- household_power_consumption1
DT <- with(hpc1, paste(Date, Time, sep=","))
DT <- strptime(DT, "%d/%m/%Y,%H:%M:%S")
hpc1$DT <- DT

d1 <- subset(hpc1, as.character(Date) == "1/2/2007"|as.character(Date) == "2/2/2007" )
quartz()
with(d1, hist(Global_active_power, col = "red", 
              main = "Global Active Power",
              xlab = 'Global Active Power (kilowatts)'))

