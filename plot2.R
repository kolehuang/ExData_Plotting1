hpdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
hpdata <- hpdata[hpdata$Date =="1/2/2007" | hpdata$Date == "2/2/2007", ]
Febdatetime <- paste(hpdata$Date, hpdata$Time)
Ftime<- strptime(Febdatetime, format = "%d/%m/%Y %H:%M:%S")

png(file = "plot2.png", bg = "transparent")
plot(Ftime, hpdata$Global_active_power, type="l", xlab = " ", ylab = "Global Active Power (kilowatts)")

dev.off()