library(dplyr)

raw_data <- read.csv("household_power_consumption.txt", sep = ";")

two_days <- rbind(
                filter(raw_data, Date == "22/2/2007"), filter( raw_data, Date == "23/2/2007")
                )
global_active  <- na.omit(as.numeric(two_days$Global_active_power))
hist(global_active, col = "red", breaks = 14, 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "Plot3.png")#to export a plot
dev.off()