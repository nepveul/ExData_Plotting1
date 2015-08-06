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


png("plot1.png", width=480, height=480)
hist(dat$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
