hpdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
hpdata <- hpdata[hpdata$Date =="1/2/2007" | hpdata$Date == "2/2/2007", ]
Febdatetime <- paste(hpdata$Date, hpdata$Time)
Ftime<- strptime(Febdatetime, format = "%d/%m/%Y %H:%M:%S")

png(file = "plot3.png", bg = "transparent")
plot(Ftime, hpdata$Sub_metering_1, type = "l", xlab = " ", ylab = "Energy sub metering")
lines(Ftime, hpdata$Sub_metering_2, col = "red")
lines(Ftime, hpdata$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1, 1, 1), lwd=c(1, 1, 1), col=c("black", "blue", "red")) 

dev.off()