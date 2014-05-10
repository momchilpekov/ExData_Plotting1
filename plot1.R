## Initialize input file
filename <- "./household_power_consumption.txt"
## Read header data
datah<-read.table(filename, nrows=4, sep=";", header=T, na.strings="?")
colNames<-names(datah)
## Read data only for the two day of interest
data<-read.table(filename, nrows=2880, sep=";", header=F, col.names = colNames, na.strings="?", skip=66637)
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
## Plot 1
png(file="plot1.png")
hist(data$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.off()
