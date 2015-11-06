### Plot 2: continuous lineplot of global active power

## read data
#read the first row to create a header
header <- read.table("household_power_consumption.txt", nrow = 1, header = FALSE, sep =';', stringsAsFactors = F)
#read the rows of data we need
dat <- read.table("household_power_consumption.txt", skip=66636, nrow=2880, header=TRUE, sep=";", dec=".", stringsAsFactors=F)
#add the header
colnames(dat) <- unlist(header)

#convert date and time to datetime variable
datetime <- strptime(paste(dat$Date, dat$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#change the variable of interest to numeric before plotting
GAP <- as.numeric(dat$Global_active_power, dec=".")

#plot
png("plot2.png", width=480, height=480)
plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

