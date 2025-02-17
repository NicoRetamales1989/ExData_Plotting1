library(dplyr)
library(lubridate)

raw_data <- read.csv("household_power_consumption.txt", sep = ";")#read data
colnames(raw_data)[1] <- "Date1"#change name to avoid confusion with R default variables
colnames(raw_data)[2] <- "Time1"
two_days <- na.omit(mutate(rbind(
        filter(raw_data, Date1 == "1/2/2007"), filter( raw_data, Date1 == "2/2/2007")
                ), final_Date = dmy_hms(paste(Date1, Time1)),
                Global_active_power = as.numeric(Global_active_power)))#clean data

with(two_days, plot(final_Date, Global_active_power, type = "l", xlab = "" , ylab = "Global Active Power (kilowatts)" ))#make the plot
dev.copy(png, file = "Plot2.png")#to export a plot
dev.off()