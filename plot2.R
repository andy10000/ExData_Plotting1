# Read file into R
datafile <- "./household_power_consumption.txt"
data <- read.table(datafile, header=TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

# Subset data for specific dates
subsetdata <- data[data$Date %in% c("1/2/2007", "2,2,2007"), ]

# Line
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subsetdata$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

