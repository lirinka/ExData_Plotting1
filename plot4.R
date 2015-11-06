### Plot 4: global picture
## read data
#read the first row to create a header
header <- read.table("household_power_consumption.txt", nrow = 1, header = FALSE, sep =';', stringsAsFactors = F)
#read the rows of data we need
dat <- read.table("household_power_consumption.txt", skip=66636, nrow=2880, header=TRUE, sep=";", dec=".", stringsAsFactors=F)
#add the header
colnames(dat) <- unlist(header)

#convert date and time to datetime variable
datetime <- strptime(paste(dat$Date, dat$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#change the variables of interest to numeric before plotting
GAP <- as.numeric(dat$Global_active_power)
GRP <- as.numeric(dat$Global_reactive_power)
voltage <- as.numeric(dat$Voltage)
SM1 <- as.numeric(dat$Sub_metering_1)
SM2 <- as.numeric(dat$Sub_metering_2)
SM3 <- as.numeric(dat$Sub_metering_3)

#plot
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, SM1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, SM2, type="l", col="red")
lines(datetime, SM3, type="l", col="blue")
legend("topright", c("Sub_metering1", "Sub_metering2", "Sub_metering3"), lwd=1, col=c("black", "red", "blue"), bty="o")
plot(datetime, GRP, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()