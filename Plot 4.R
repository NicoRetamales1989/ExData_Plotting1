library(dplyr)
library(lubridate)
par(mfrow = c(2,2))
raw_data <- read.csv("household_power_consumption.txt", sep = ";")#read data
colnames(raw_data)[1] <- "Date1"#change name to avoid confusion with R default variables
colnames(raw_data)[2] <- "Time1"
two_days <- na.omit(mutate(rbind(
        filter(raw_data, Date1 == "1/2/2007"), filter( raw_data, Date1 == "2/2/2007")
), final_Date = dmy_hms(paste(Date1, Time1)), Global_active_power = as.numeric(Global_active_power), Voltage = as.numeric(Voltage),
Global_reactive_power = as.numeric(Global_reactive_power), 
Sub_metering_1 = as.numeric(Sub_metering_1), Sub_metering_2 = as.numeric(Sub_metering_2), 
Sub_metering_3 = as.numeric(Sub_metering_3)))                                  #clean data

with(two_days, plot(final_Date, Global_active_power, type = "l", xlab = "" , ylab = "Global Active Power (kilowatts)" ))#make the plot
with(two_days, plot(final_Date, Voltage, type = "l", xlab = "datetime" , ylab = "Voltage" ))#make the plot


with(two_days, plot(final_Date, Sub_metering_1, type = "n", xlab = "" , ylab = "Energy sub metering"))#make the plot
lines(two_days$final_Date,two_days$Sub_metering_1, type = "l", col = "black")#add data lines
lines(two_days$final_Date, two_days$Sub_metering_2, type = "l", col = "red")
lines(two_days$final_Date, two_days$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"),  cex = 0.6, bty = "n",  lty = 1)# add legend

with(two_days, plot(final_Date, Global_reactive_power, type = "l", xlab = "" , ylab = "Global_reactive_power" ))#make the plot

dev.copy(png, file = "Plot5.png")#to export a plot
dev.off()




dev.copy(png, file = "Plot4.png")#to export a plot
dev.off()