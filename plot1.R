household_power_consumption1 <- read.table("household_power_consumption.txt", 
                                           comment.char = "#",
                                           header = TRUE,
                                           sep=";",
                                           na.strings = "?")
hpc1 <- household_power_consumption1
d1 <- subset(hpc1, as.character(Date) == "1/2/2007"|as.character(Date) == "2/2/2007" )

png(filename ="plot1.png", width = 480, height = 480, bg = "transparent")
with(d1, hist(Global_active_power, col = "red", 
              main = "Global Active Power",
              xlab = 'Global Active Power (kilowatts)'))
dev.off()