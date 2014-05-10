## Initialize input file
filename <- "./household_power_consumption.txt"
## Read header data
datah<-read.table(filename, nrows=4, sep=";", header=T, na.strings="?")
colNames<-names(datah)
## Read data only for the two day of interest
data<-read.table(filename, nrows=2880, sep=";", header=F, col.names = colNames, na.strings="?", skip=66637)
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

##Plot 2
## Combine time and date in a single value
png(file="plot2.png")
plot(data$DateTime, data$Global_active_power, type="n",xlab="", ylab="Global Active Power (kilowatts)")
lines(data$DateTime, data$Global_active_power)
dev.off()
