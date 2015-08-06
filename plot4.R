#install.packages("lubridate")
#library(lubridate)

dat <- read.csv('household_power_consumption.txt', sep = ';', header = TRUE)
dat$Date1 <- as.Date(dat$Date, format = "%d/%m/%Y")
dat$Time1 <- strptime(paste(dat$Date, dat$Time), format = "%d/%m/%Y %H:%M:%S")
dat$Global_active_power <- as.numeric(as.character(dat$Global_active_power))
dat$Global_reactive_power <- as.numeric(as.character(dat$Global_reactive_power))
dat$Voltage <- as.numeric(as.character(dat$Voltage))
dat$Global_intensity <- as.numeric(as.character(dat$Global_intensity))
dat$Sub_metering_1 <- as.numeric(as.character(dat$Sub_metering_1))
dat$Sub_metering_2 <- as.numeric(as.character(dat$Sub_metering_2))

dat <- dat[which(dat$Date1 == as.Date("2007-02-01") | dat$Date1 == as.Date("2007-02-02")),]

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
#plot1
plot(dat$Time1, dat$Global_active_power, ylab="Global Active Power", xlab="", type="l")
#plot2
plot(dat$Time1, dat$Voltage, ylab="Voltage", xlab="datetime", type="l")
#plot3
plot(dat$Time1, dat$Sub_metering_1, ylab="Energy sub metering", xlab="", type="l", col="black")
lines(dat$Time1, dat$Sub_metering_2, col = "red")
lines(dat$Time1, dat$Sub_metering_3, col="blue")
legend(x = "topright", col = c("black", "red", "blue"), lty = 1, bty = "n",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch)
#plot4
plot(dat$Time1, dat$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l")



dev.off()
