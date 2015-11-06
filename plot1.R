### Plot 1: a histogram of global active power

## read data

#read the first row to create a header
header <- read.table("household_power_consumption.txt", nrow = 1, header = FALSE, sep =';', stringsAsFactors = F, na.strings="?")

#read the rows of data we need
dat <- read.table("household_power_consumption.txt", skip=66636, nrow=2880, header=TRUE, sep=";", dec=".", stringsAsFactors=F)

#add the header
colnames(dat) <- unlist(header)

#change the variable of interest to numeric before plotting
GAP <- as.numeric(dat$Global_active_power)

#plot
png("plot1.png", width=480, height=480)
hist(GAP, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()


