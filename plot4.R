hpdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
hpdata <- hpdata[hpdata$Date =="1/2/2007" | hpdata$Date == "2/2/2007", ]
Febdatetime <- paste(hpdata$Date, hpdata$Time)
Ftime<- strptime(Febdatetime, format = "%d/%m/%Y %H:%M:%S")

png(file = "plot4.png", bg = "transparent")
par(mfcol = c(2, 2))

plot(Ftime, hpdata$Global_active_power, type="l", xlab = " ", ylab = "Global Active Power") #1st plot

plot(Ftime, hpdata$Sub_metering_1, type = "l", xlab = " ", ylab = "Engerging sub metering")
lines(Ftime, hpdata$Sub_metering_2, col = "red")
lines(Ftime, hpdata$Sub_metering_3, col = "blue")
legend("topright", bty = "n", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1, 1, 1), lwd=c(1, 1, 1), col=c("black", "blue", "red"))  #2nd plot

plot(Ftime, hpdata$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")  #3rd plot
plot(Ftime, hpdata$Global_active_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power") #4th plot

dev.off()