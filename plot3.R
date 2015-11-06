### Plot 3: energy submetering
## read data
#read the first row to create a header
header <- read.table("household_power_consumption.txt", nrow = 1, header = FALSE, sep =';', stringsAsFactors = F, na.strings="?")
#read the rows of data we need
dat <- read.table("household_power_consumption.txt", skip=66636, nrow=2880, header=TRUE, sep=";", dec=".", stringsAsFactors=F)
#add the header
colnames(dat) <- unlist(header)

#convert date and time to datetime variable
datetime <- strptime(paste(dat$Date, dat$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#change the variables of interest to numeric before plotting
SM1 <- as.numeric(dat$Sub_metering_1)
SM2 <- as.numeric(dat$Sub_metering_2)
SM3 <- as.numeric(dat$Sub_metering_3)

#plot
png("plot3.png", width=480, height=480)
plot(datetime, SM1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, SM2, type="l", col="red")
lines(datetime, SM3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"))
dev.off()

